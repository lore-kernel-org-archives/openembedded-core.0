Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6O-0006Mz-K7
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4swl009105; Thu, 21 Mar 2013 16:04:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kcPUc+i1t+AA; Thu, 21 Mar 2013 16:04:56 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4n2S009086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:50 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpn-0006MN-OH; Thu, 21 Mar 2013 15:55:19 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:10 +0000
Message-Id: <1363881315-24352-11-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/16] pth: Fix case where ${B} != ${S}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

Ensure the autotools commands are executed in ${S} to allow out of tree
builds to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/pth/pth_2.0.7.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index fc9ed16..8cbab7d 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -23,7 +23,7 @@ PARALLEL_MAKE=""
 inherit autotools binconfig pkgconfig
 
 do_configure() {
-	gnu-configize
-	autoconf
+	( cd ${S}; gnu-configize )
+	( cd ${S}; autoconf )
 	oe_runconf
 }
-- 
1.7.10.4



