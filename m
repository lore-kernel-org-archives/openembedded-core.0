Return-Path: <amarnath.valluri@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 58ABF75EE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:20:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 06 Nov 2015 05:20:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="679717702"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
	by orsmga003.jf.intel.com with ESMTP; 06 Nov 2015 05:20:52 -0800
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.151]) by
	irsmsx105.ger.corp.intel.com ([169.254.7.75]) with mapi id
	14.03.0248.002; Fri, 6 Nov 2015 13:18:19 +0000
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe][PATCH 2/2] nginx: Fix systemd service file
Thread-Index: AQHRGJV14TuBQlo/n0K03LNGqeNE1p6O+eMt
Date: Fri, 6 Nov 2015 13:18:19 +0000
Message-ID: <D3C33C4430ACA6488F343D1125FCCECC3803394C@irsmsx110.ger.corp.intel.com>
References: <1446815913-9343-1-git-send-email-amarnath.valluri@intel.com>,
	<1446815913-9343-2-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1446815913-9343-2-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.135]
MIME-Version: 1.0
Subject: Re: [oe][PATCH 2/2] nginx: Fix systemd service file
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
X-List-Received-Date: Fri, 06 Nov 2015 13:21:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

sorry for noice: please ignore these patches. Wrong list
________________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Amarnath Valluri [amarnath.vall=
uri@intel.com]
Sent: Friday, November 06, 2015 3:18 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [oe][PATCH 2/2] nginx: Fix systemd service file

systemd service file expects full path of the executatbles.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-=
webserver/recipes-httpd/nginx/files/nginx.service
index 705450e..9926a4b 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -4,7 +4,7 @@ After=3Dnetwork.target
 [Service]
 Type=3Dforking
 PIDFile=3D@SYSCONFDIR@/nginx/run/nginx.pid
-ExecStartPre=3Dmkdir -p @LOCALSTATEDIR@/log/nginx
+ExecStartPre=3D@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/log/nginx
 ExecStart=3D@SYSCONFDIR@/init.d/nginx start
 ExecStop=3D@SYSCONFDIR@/init.d/nginx stop
 [Install]
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb b/meta-webse=
rver/recipes-httpd/nginx/nginx_1.9.5.bb
index 1c9bff7..87c953b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
@@ -94,6 +94,7 @@ do_install () {
             install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir=
}/system/
             sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
                     -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
+                    -e 's,@BASEBINDIR@,${base_bindir},g' \
                     ${D}${systemd_unitdir}/system/nginx.service
         fi
 }
--
1.9.1

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki
Business Identity Code: 0357606 - 4
Domiciled in Helsinki

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


