Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 720F66EF79
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 11:03:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2014 02:58:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="494402240"
Received: from maurorob-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.80])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2014 03:01:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 11:01:53 +0000
Message-Id: <b494db92e19300c889d61b287004f1eb11215a21.1394017266.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394017266.git.paul.eggleton@linux.intel.com>
References: <cover.1394017266.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394017266.git.paul.eggleton@linux.intel.com>
References: <cover.1394017266.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/2] gnutls: CVE-2014-0092 correct return codes
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
X-List-Received-Date: Wed, 05 Mar 2014 11:03:10 -0000

From: Karl Hiramoto <karl@hiramoto.org>

This patch is for the OE-Core dylan branch - it comes from upstream:

git://gitorious.org/gnutls/gnutls.git
branch: gnutls_2_12_x
commit: 6aa26f78150ccbdf0aec1878a41c17c41d358a3b
Author: Nikos Mavrogiannopoulos <nmav@gnutls.org>
Date:   Thu Feb 27 19:42:26 2014 +0100

For more info see:
http://www.gnutls.org/security.html#GNUTLS-SA-2014-2
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-0092
https://www.gitorious.org/gnutls/gnutls/commit/6aa26f78150ccbdf0aec1878a41c17c41d358a3b

Signed-off-by: Karl Hiramoto <karl@hiramoto.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../CVE-2014-0092-corrected-return-codes.patch     | 106 +++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch b/meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
new file mode 100644
index 0000000..68ee5bc
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
@@ -0,0 +1,106 @@
+From 6aa26f78150ccbdf0aec1878a41c17c41d358a3b Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
+Date: Thu, 27 Feb 2014 19:42:26 +0100
+Subject: [PATCH 1/3] corrected return codes
+
+Upstream-Status: Backport
+
+Signed-off-by: Karl Hiramoto <karl@hiramoto.org>
+
+---
+ lib/x509/verify.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/lib/x509/verify.c b/lib/x509/verify.c
+index c9a6b0d..eef85a8 100644
+--- a/lib/x509/verify.c
++++ b/lib/x509/verify.c
+@@ -141,7 +141,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
+   if (result < 0)
+     {
+       gnutls_assert ();
+-      goto cleanup;
++      goto fail;
+     }
+ 
+   result =
+@@ -150,7 +150,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
+   if (result < 0)
+     {
+       gnutls_assert ();
+-      goto cleanup;
++      goto fail;
+     }
+ 
+   result =
+@@ -158,7 +158,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
+   if (result < 0)
+     {
+       gnutls_assert ();
+-      goto cleanup;
++      goto fail;
+     }
+ 
+   result =
+@@ -166,7 +166,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
+   if (result < 0)
+     {
+       gnutls_assert ();
+-      goto cleanup;
++      goto fail;
+     }
+ 
+   /* If the subject certificate is the same as the issuer
+@@ -206,6 +206,7 @@ check_if_ca (gnutls_x509_crt_t cert, gnutls_x509_crt_t issuer,
+   else
+     gnutls_assert ();
+ 
++fail:
+   result = 0;
+ 
+ cleanup:
+@@ -330,7 +331,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
+   gnutls_datum_t cert_signed_data = { NULL, 0 };
+   gnutls_datum_t cert_signature = { NULL, 0 };
+   gnutls_x509_crt_t issuer = NULL;
+-  int issuer_version, result;
++  int issuer_version, result = 0;
+ 
+   if (output)
+     *output = 0;
+@@ -363,7 +364,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
+   if (issuer_version < 0)
+     {
+       gnutls_assert ();
+-      return issuer_version;
++      return 0;
+     }
+ 
+   if (!(flags & GNUTLS_VERIFY_DISABLE_CA_SIGN) &&
+@@ -385,6 +386,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
+   if (result < 0)
+     {
+       gnutls_assert ();
++      result = 0;
+       goto cleanup;
+     }
+ 
+@@ -393,6 +395,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
+   if (result < 0)
+     {
+       gnutls_assert ();
++      result = 0;
+       goto cleanup;
+     }
+ 
+@@ -410,6 +413,7 @@ _gnutls_verify_certificate2 (gnutls_x509_crt_t cert,
+   else if (result < 0)
+     {
+       gnutls_assert();
++      result = 0;
+       goto cleanup;
+     }
+ 
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.23.bb b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
index 1575d2c..e26b154 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.23.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
             file://configure-fix.patch \
             file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
+	    file://CVE-2014-0092-corrected-return-codes.patch \
             ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
            "
 
-- 
1.8.5.3


