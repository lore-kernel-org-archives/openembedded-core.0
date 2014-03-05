Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 328ED6EEF3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 11:03:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2014 02:58:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="494402256"
Received: from maurorob-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.80])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2014 03:01:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 11:01:54 +0000
Message-Id: <6fa90294ec714a5128885b2a5bd5df9a9c92053c.1394017266.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394017266.git.paul.eggleton@linux.intel.com>
References: <cover.1394017266.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394017266.git.paul.eggleton@linux.intel.com>
References: <cover.1394017266.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 2/2] gnutls: Fixed bug that prevented the rejection of v1 intermediate CA certificates.
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

From 467478d8ff08a3cb4be3034ff04c9d08a0ceba3e
From: Nikos Mavrogiannopoulos <nmav@redhat.com>
Date: Wed, 12 Feb 2014 16:41:33 +0100

For more info see:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-1959
http://www.gnutls.org/security.html#GNUTLS-SA-2014-1
https://www.gitorious.org/gnutls/gnutls/commit/467478d8ff08a3cb4be3034ff04c9d08a0ceba3e

Signed-off-by: Karl Hiramoto <karl@hiramoto.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...14-1959-rejection-of-v1-intermediate-cert.patch | 33 ++++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch b/meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch
new file mode 100644
index 0000000..6567257
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch
@@ -0,0 +1,33 @@
+From 467478d8ff08a3cb4be3034ff04c9d08a0ceba3e Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@redhat.com>
+Date: Wed, 12 Feb 2014 16:41:33 +0100
+Subject: [PATCH 1/5] Fixed bug that prevented the rejection of v1 intermediate
+ CA certificates.
+
+Upstream-Status: Backport
+
+Signed-off-by: Karl Hiramoto <karl@hiramoto.org>
+
+---
+ lib/x509/verify.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/x509/verify.c b/lib/x509/verify.c
+index 2efcebf..c9a6b0d 100644
+--- a/lib/x509/verify.c
++++ b/lib/x509/verify.c
+@@ -645,7 +645,10 @@ _gnutls_x509_verify_certificate (const gnutls_x509_crt_t * certificate_list,
+        * certificates can exist in a supplied chain.
+        */
+       if (!(flags & GNUTLS_VERIFY_ALLOW_ANY_X509_V1_CA_CRT))
+-        flags &= ~(GNUTLS_VERIFY_ALLOW_X509_V1_CA_CRT);
++        {
++          flags &= ~(GNUTLS_VERIFY_ALLOW_X509_V1_CA_CRT);
++          flags |= GNUTLS_VERIFY_DO_NOT_ALLOW_X509_V1_CA_CRT;
++        }
+       if ((ret =
+            _gnutls_verify_certificate2 (certificate_list[i - 1],
+                                         &certificate_list[i], 1, flags,
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.23.bb b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
index e26b154..04605dd 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.23.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.23.bb
@@ -6,7 +6,8 @@ SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
             file://configure-fix.patch \
             file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch \
-	    file://CVE-2014-0092-corrected-return-codes.patch \
+            file://CVE-2014-1959-rejection-of-v1-intermediate-cert.patch \
+            file://CVE-2014-0092-corrected-return-codes.patch \
             ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
            "
 
-- 
1.8.5.3


