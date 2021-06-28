Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10795.1624885291833561590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 06:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4814E1042
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 06:01:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E41883F718
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 06:01:20 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] util-linux: use the system binaries when running ptest
Date: Mon, 28 Jun 2021 14:01:19 +0100
Message-Id: <20210628130119.926307-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Unless told otherwise, the util-linux test suite assumes that it is
running in a build tree and looks for binaries to run.

In ptest we're on the target, so it needs to run the system binaries
instead.

This reduces ~180 skipped test cases down to tens, and should fix weird
behaviour. There are some new failures that were previously skipped
which will be investigated shortly.

Also pass --parsable to reduce the amount of noise in the log ouput.

[ YOCTO #14244 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/util-linux/util-linux/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/rec=
ipes-core/util-linux/util-linux/run-ptest
index e135ee583bd..86f9fef24bd 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -29,7 +29,7 @@ res=3D0
 count=3D0
 for ts in $comps;=20
 do=20
-   $ts | sed -u '{       =20
+   $ts --use-system-commands --parsable | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                          =
   =20
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/            =
   =20
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/           =
   =20
--=20
2.25.1

