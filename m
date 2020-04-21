Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.4694.1587457142592079407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 01:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03L8J1Aj022590
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 01:19:01 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 21 Apr
 2020 01:18:42 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe][zeus][PATCH] git: Security Advisory - git - CVE-2020-5260
Date: Tue, 21 Apr 2020 16:18:04 +0800
Message-ID: <1587457084-159482-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

Backport patch from <https://github.com/git/git/commit/
9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b> to solve CVE-2020-5260.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/git/git.inc                 |  4 +-
 meta/recipes-devtools/git/git/CVE-2020-5260.patch | 65 +++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-5260.patch

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 6e13743..176423e 100644
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
index 0000000..d03e701
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
1.9.1

