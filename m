Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.1486.1587016258368772391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 22:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: nmpeHOPbbPl4Io3hgqvY0Pklw1/9yO41OIzYZEwerkxSZQXoQjp+87eA3bksLdw0KSA02sZZsp
 od0DusQtBrSQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 22:50:57 -0700
IronPort-SDR: CFc205CFInpQfYMw3MA+Y9WSNHws5R54NQIhUfsso7cjNzugtdkoQKO9yViOrKkPavbkv8/hLv
 NXv/F6j7P76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; 
   d="scan'208";a="277871039"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2020 22:50:56 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] git: fix CVE-2020-5260
Date: Thu, 16 Apr 2020 13:50:55 +0800
Message-Id: <1587016255-41789-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../recipes-devtools/git/files/CVE-2020-5260.patch | 63 ++++++++++++++++++++++
 meta/recipes-devtools/git/git.inc                  |  4 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2020-5260.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2020-5260.patch b/meta/recipes-devtools/git/files/CVE-2020-5260.patch
new file mode 100644
index 0000000..9b09ef6
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2020-5260.patch
@@ -0,0 +1,63 @@
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
+[https://github.com/git/git/commit/9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b]
+CVE: CVE-2020-5260
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ credential.c           | 2 ++
+ t/t0300-credentials.sh | 6 ++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/credential.c b/credential.c
+index 9747f47b18bf2..00ee4d62db121 100644
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
+index 03bd31e9f22a1..15cc3c5abb5b1 100755
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
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 4131c98..cd0bd1a 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -7,7 +7,9 @@ DEPENDS = "openssl curl zlib expat"
 PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
+           file://CVE-2020-5260.patch \
+"
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.7.4

