Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.3192.1588661901199587822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: t7GUn1gWXoDqAfmPP5NZgEQVACB1TdN//5VltA328/IZBfJ6tYvA7X2psI9yueqhwhBYnWfvmC
 igWXbcBoubpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:18 -0700
IronPort-SDR: +7yDHomrM9vvCrPc8E1ljPdjy8Sv8EIkKvvKYhQWHG01DSU46vnxmeDuwCpScswWSBdRAdazWd
 PM7YNPC09s3w==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144787"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 06/18] git: Security Advisory - git - CVE-2020-5260
Date: Tue,  5 May 2020 14:56:41 +0800
Message-Id: <e4c3adbaae41147f921dde638b25911d1f5422e1.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhou <li.zhou@windriver.com>

Backport patch from <https://github.com/git/git/commit/
9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b> to solve CVE-2020-5260.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/git/git.inc             |  4 +-
 .../git/git/CVE-2020-5260.patch               | 65 +++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-5260.patch

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 6e137432f0..176423e972 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -7,7 +7,9 @@ DEPENDS = "openssl curl zlib expat"
 PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
+           file://CVE-2020-5260.patch \
+          "
 
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/meta/recipes-devtools/git/git/CVE-2020-5260.patch b/meta/recipes-devtools/git/git/CVE-2020-5260.patch
new file mode 100644
index 0000000000..d03e701a8f
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-5260.patch
@@ -0,0 +1,65 @@
+From 9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b Mon Sep 17 00:00:00 2001
+From: Jeff King <peff@peff.net>
+Date: Wed, 11 Mar 2020 17:53:41 -0400
+Subject: [PATCH] credential: avoid writing values with newlines
+
+The credential protocol that we use to speak to helpers can't represent
+values with newlines in them. This was an intentional design choice to
+keep the protocol simple, since none of the values we pass should
+generally have newlines.
+
+However, if we _do_ encounter a newline in a value, we blindly transmit
+it in credential_write(). Such values may break the protocol syntax, or
+worse, inject new valid lines into the protocol stream.
+
+The most likely way for a newline to end up in a credential struct is by
+decoding a URL with a percent-encoded newline. However, since the bug
+occurs at the moment we write the value to the protocol, we'll catch it
+there. That should leave no possibility of accidentally missing a code
+path that can trigger the problem.
+
+At this level of the code we have little choice but to die(). However,
+since we'd not ever expect to see this case outside of a malicious URL,
+that's an acceptable outcome.
+
+Reported-by: Felix Wilhelm <fwilhelm@google.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-5260
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ credential.c           | 2 ++
+ t/t0300-credentials.sh | 6 ++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/credential.c b/credential.c
+index 9747f47..00ee4d6 100644
+--- a/credential.c
++++ b/credential.c
+@@ -194,6 +194,8 @@ static void credential_write_item(FILE *fp, const char *key, const char *value)
+ {
+ 	if (!value)
+ 		return;
++	if (strchr(value, '\n'))
++		die("credential value for %s contains newline", key);
+ 	fprintf(fp, "%s=%s\n", key, value);
+ }
+ 
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index 03bd31e..15cc3c5 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -309,4 +309,10 @@ test_expect_success 'empty helper spec resets helper list' '
+ 	EOF
+ '
+ 
++test_expect_success 'url parser rejects embedded newlines' '
++	test_must_fail git credential fill <<-\EOF
++	url=https://one.example.com?%0ahost=two.example.com/
++	EOF
++'
++
+ test_done
+-- 
+1.9.1
+
-- 
2.25.4

