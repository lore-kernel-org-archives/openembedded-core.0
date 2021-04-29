Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SSDalm8kwMBcmPodKaiCp3AK0Ho/aSVdXWmZ2SucfNiW4oX86cXUsZ90+XpLBlpSVwzPMzO07h
 hkMPMFzPH6Mg==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258355"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258355"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:35 -0700
IronPort-SDR: edNwBFioXPXbqm+y33vxksJtIol2x490HKaJ9FzrY9mR1vUhMXnpe3+TpsDvCWjx+rDCLIKWwR
 nuUE4+cU7sIg==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883694"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:34 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/10] rsync: fix CVE-2020-14387
Date: Thu, 29 Apr 2021 12:41:07 +0800
Message-Id: <940111cefa459bc7a5fd9de1cf70b2040ffb5229.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2020-14387.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e7a536d07856630e4eb421614c8d823c67e0294)
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
index 8b36a8ebde..cb18667755 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
+           file://0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch \
            "
 
 SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
-- 
2.30.2

