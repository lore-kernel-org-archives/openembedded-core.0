Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED525ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 11:01:41 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.8616.1663239692396289118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fSMx+K05;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so21975136pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ljDS5WcC5ts4d3WUT3enAHHK6gh/D6/ru2CwVpEWq0E=;
        b=fSMx+K05UVXPQdv7ECAHbcBX9QvuqWQgsmvr6v5NAEDICADncddKISFD/Y/bGfdLKE
         lwSfXjqU4cqExwxoag0F6xHgrFB0sO96PFzRX3/MgIZqaM02qQEIbCceohkllYV87gJv
         +h2DtvKuCPhbdnBTU5/iwtE68Jg3PpqYliMcmyiXQNXMfgmDQ/s5uUxOb1ObVhchjPjd
         Cii4qwF5Y5YhTqoO3yMmVbOAHlNKk0RNUkPk5V06iAGweRX8vvTfRFzVCVh+fdANfaRm
         U7IX/QzM18v+VlU7ZFN7FlPyJpivglHa5q45BuMTbnOasiEqNilxVqffdpY/Zjjzqu05
         dS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ljDS5WcC5ts4d3WUT3enAHHK6gh/D6/ru2CwVpEWq0E=;
        b=MkIjyfg06mwtq6wAdhozBFtREWFSaFLHqVk52lPdrm27HQhurTDKsd/rOWjRVBDSn4
         DKPdzq9A44wAmxg2eaIPmxk5lczFOSGKELLJJwWFFtc0vF1KFivdqKVGq9PzKzBQeN7o
         Wl3A1ZdhqiGqwNek07H+keVs8/k6ANqr5bmV4MR3thVRb3HEQUk4P0mfBCyD9kb8lisG
         gdIpdJAcvSOKLcKYWaaVFrq/qR647DDIn/4RUlUR3py5bxdROKaT6PoeFimd7rqawCGx
         fYhbU0Air0WDkOs9JJydWp3NPFbq2DkNF/qpcJbI4LGZbj5+if5IOclVVc+czkNWwMSr
         PL1w==
X-Gm-Message-State: ACrzQf0ux/XVhQDaj+7Yrmk/lNenFTly/wPtCVY/mVlK1mVrI89fgj7e
	51FkQhHpEyZ34KKeuw5myG+iccxELHM=
X-Google-Smtp-Source: 
 AMsMyM7QsrMPc0KSqgplwrPQ83ReUYHt2LPBMXz/K6Vj1ZdO4wvQZxr9fl6Cgh+PddHrjnrWpbuMLg==
X-Received: by 2002:a17:90a:a088:b0:1fb:6f0a:96bb with SMTP id
 r8-20020a17090aa08800b001fb6f0a96bbmr10026102pjp.190.1663239691491;
        Thu, 15 Sep 2022 04:01:31 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 x1-20020aa79a41000000b00536b2483aedsm10377881pfj.199.2022.09.15.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 04:01:31 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [kirkstone][PATCH] binutils - CVE-2022-38126
Date: Thu, 15 Sep 2022 16:31:25 +0530
Message-Id: <20220915110125.2121125-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 11:01:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170686

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e3e5ae049371a27fd1737aba946fe26d06e029b5]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0016-CVE-2022-38126.patch        | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 8aa8295881..2ddeb0ed39 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -34,5 +34,6 @@ SRC_URI = "\
      file://0013-Avoid-as-info-race-condition.patch \
      file://0014-CVE-2019-1010204.patch \
      file://0015-CVE-2022-38533.patch \
+     file://0016-CVE-2022-38126.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
new file mode 100644
index 0000000000..8200e28a81
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
@@ -0,0 +1,34 @@
+From e3e5ae049371a27fd1737aba946fe26d06e029b5 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 27 Jun 2022 13:43:02 +0100
+Subject: [PATCH] Replace a run-time assertion failure with a warning message
+ when parsing corrupt DWARF data.
+
+	PR 29289
+	* dwarf.c (display_debug_names): Replace assert with a warning
+	message.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e3e5ae049371a27fd1737aba946fe26d06e029b5]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ binutils/dwarf.c   | 7 ++++++-
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 37b477b886d..b99c56987da 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -9802,7 +9802,12 @@ display_debug_names (struct dwarf_sectio
+       printf (_("Out of %lu items there are %zu bucket clashes"
+ 		" (longest of %zu entries).\n"),
+ 	      (unsigned long) name_count, hash_clash_count, longest_clash);
+-      assert (name_count == buckets_filled + hash_clash_count);
++
++      if (name_count != buckets_filled + hash_clash_count)
++	warn (_("The name_count (%lu) is not the same as the used bucket_count (%lu) + the hash clash count (%lu)"),
++	      (unsigned long) name_count,
++	      (unsigned long) buckets_filled,
++	      (unsigned long) hash_clash_count);
+ 
+       struct abbrev_lookup_entry
+       {
-- 
2.25.1


