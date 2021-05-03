Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.34639.1620052602095814023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: FlyUQGIiGfj4pxeqatRVGRbweTsWv0PYkvfcm7MlPwWEjfeZZ+y3CEkXj38hbYJ0c0C2RfyCk7
 qWeCHFt2rhIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197849510"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="197849510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:42 -0700
IronPort-SDR: P1Gih/2XzVuygswnqFvGYHhpjABg/qkVWPctOs2CK/EWeuEmplZZfsZAgYGm1sxsIvb1JGU60X
 SYw6c4VLkrdQ==
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="405697109"
Received: from semohdyu-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.72.206])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 1/6] rsync: fix CVE-2020-14387
Date: Mon,  3 May 2021 22:36:29 +0800
Message-Id: <fd18be85b77488cfac72e9703940764615e37e98.1620052258.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620052258.git.anuj.mittal@intel.com>
References: <cover.1620052258.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2020-14387.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13f331436747ebb8e9211feee3aa774f1acd0fee)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-the-hostname-in-the-certificate-whe.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch b/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
new file mode 100644
index 0000000000..2d51ddf965
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
@@ -0,0 +1,31 @@
+From fbe85634d88e82fbb439ae2a5d1aca8b8c309bea Mon Sep 17 00:00:00 2001
+From: Matt McCutchen <matt@mattmccutchen.net>
+Date: Wed, 26 Aug 2020 12:16:08 -0400
+Subject: [PATCH] rsync-ssl: Verify the hostname in the certificate when using
+ openssl.
+
+CVE: CVE-2020-14387
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=c3f7414]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ rsync-ssl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rsync-ssl b/rsync-ssl
+index 8101975..46701af 100755
+--- a/rsync-ssl
++++ b/rsync-ssl
+@@ -129,7 +129,7 @@ function rsync_ssl_helper {
+     fi
+ 
+     if [[ $RSYNC_SSL_TYPE == openssl ]]; then
+-	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -connect $hostname:$port
++	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -verify_hostname $hostname -connect $hostname:$port
+     elif [[ $RSYNC_SSL_TYPE == gnutls ]]; then
+ 	exec $RSYNC_SSL_GNUTLS --logfile=/dev/null $gnutls_cert_opt $gnutls_opts $hostname:$port
+     else
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index e6a3a67881..df4fbbd0d2 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
+           file://0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch \
            "
 
 SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
-- 
2.30.2

