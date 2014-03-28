Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 110166BFF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 16:53:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2014 09:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,751,1389772800"; d="scan'208";a="509112234"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2014 09:53:32 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 28 Mar 2014 16:52:17 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX151.ger.corp.intel.com ([163.33.192.59]) with mapi id
	14.03.0123.003; Fri, 28 Mar 2014 16:52:17 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Jia, Hongxu (Wind River)" <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/6] initscripts: Avoid restarting rpcbind
	daemon
Thread-Index: AQHPSmo1n+bMo/wXoka+vFMjUDf/75r2tpiQ
Date: Fri, 28 Mar 2014 16:52:16 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CE744CF@IRSMSX105.ger.corp.intel.com>
References: <cover.1395996041.git.hongxu.jia@windriver.com>
	<a2ac209bcc377adfdf62d90d7f3b09cec817d1cc.1395996041.git.hongxu.jia@windriver.com>
In-Reply-To: <a2ac209bcc377adfdf62d90d7f3b09cec817d1cc.1395996041.git.hongxu.jia@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 3/6] initscripts: Avoid restarting rpcbind daemon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2014 16:53:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Hongxu,
Does this change fix a bug or an inappropriate system behavior?

Thanks,
Cristian Iorga
YP
Intel Corporation

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Hongxu Jia
Sent: Friday, March 28, 2014 11:43 AM
To: openembedded-core@lists.openembedded.org
Cc: Wold, Saul
Subject: [OE-core] [PATCH 3/6] initscripts: Avoid restarting rpcbind daemon

From: Yue Tao <Yue.Tao@windriver.com>

Check whether rpcbind daemon already run before starting it.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh b/me=
ta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
index fe6c196..be9f597 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh
@@ -67,9 +67,12 @@ if test "$rpcbind" =3D yes  then
 	if test -x /usr/sbin/rpcbind
 	then
-		echo -n "Starting rpcbind... "
-		start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
-		sleep 2
+		service rpcbind status > /dev/null
+		if [ $? !=3D 0 ]; then
+			echo -n "Starting rpcbind..."
+			start-stop-daemon --start --quiet --exec /usr/sbin/rpcbind
+			sleep 2
+		fi
 	fi
 fi
=20
--
1.8.1.2

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

