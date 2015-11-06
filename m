Return-Path: <amarnath.valluri@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A21A7770F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:17:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2015 05:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="679715278"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 06 Nov 2015 05:16:25 -0800
Received: from avalluri-GigaByte.fi.intel.com (avalluri-gigabyte.fi.intel.com
	[10.237.68.36]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D731E2E055B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 05:15:21 -0800 (PST)
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 15:18:33 +0200
Message-Id: <1446815913-9343-2-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446815913-9343-1-git-send-email-amarnath.valluri@intel.com>
References: <1446815913-9343-1-git-send-email-amarnath.valluri@intel.com>
Subject: [oe][PATCH 2/2] nginx: Fix systemd service file
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
X-List-Received-Date: Fri, 06 Nov 2015 13:17:00 -0000

systemd service file expects full path of the executatbles.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
index 705450e..9926a4b 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -4,7 +4,7 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=@SYSCONFDIR@/nginx/run/nginx.pid
-ExecStartPre=mkdir -p @LOCALSTATEDIR@/log/nginx
+ExecStartPre=@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/log/nginx
 ExecStart=@SYSCONFDIR@/init.d/nginx start
 ExecStop=@SYSCONFDIR@/init.d/nginx stop
 [Install]
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
index 1c9bff7..87c953b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.5.bb
@@ -94,6 +94,7 @@ do_install () {
             install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/system/
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


