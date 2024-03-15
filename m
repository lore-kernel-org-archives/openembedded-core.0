Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F307CC54E6E
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 14:37:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23978.1710513461500340617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 07:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16977C15
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:38:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DF6F3F73F
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:37:40 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] curl: improve run-ptest
Date: Fri, 15 Mar 2024 14:37:36 +0000
Message-Id: <20240315143738.1234858-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 14:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197133

From: Ross Burton <ross.burton@arm.com>

There's no need to run the output of runtests.pl through a sed to get
automake-style output, as you can pass -am to get this formatting.

Don't run timing dependent tests, as the ptests can run on loaded
systems.

Add a dependency on the en_US locale because some of the tests require
this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/curl/curl/run-ptest | 13 +++++++++----
 meta/recipes-support/curl/curl_8.6.0.bb  |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-supp=
ort/curl/curl/run-ptest
index 8f9c20f34df..acd2892f80e 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -1,6 +1,11 @@
 #!/bin/sh
+
 cd tests
-{ ./runtests.pl -a -n -s -j4 !flaky || echo "FAIL: curl" ; } | sed \
-     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
-     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
-     -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc=
//'
+
+# Run all tests, don't stop on first failure
+# Don't use valgrind if it is found
+# Use automake-style output
+# Run four tests in parallel
+# Print log output on failure
+# Don't run the flaky or timing dependent tests
+./runtests.pl -a -n -am -j4 -p '!flaky !timing-dependent'
diff --git a/meta/recipes-support/curl/curl_8.6.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.6.0.bb
index b01f4542a22..d4473d868e2 100644
--- a/meta/recipes-support/curl/curl_8.6.0.bb
+++ b/meta/recipes-support/curl/curl_8.6.0.bb
@@ -125,6 +125,7 @@ RDEPENDS:${PN}-ptest +=3D " \
 	perl-module-storable \
 	perl-module-time-hires \
 "
+RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-en-us"
=20
 PACKAGES =3D+ "lib${BPN}"
=20
--=20
2.34.1


