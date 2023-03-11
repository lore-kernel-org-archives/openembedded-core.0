Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E10AC76195
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 22:42:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.55951.1678574522030343246
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 14:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fbQIi71Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso5580875wms.5
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 14:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678574520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70cldgrl/0BrrQunPOXVGXkQVvOsQ8bUiXNfs3gIk2A=;
        b=fbQIi71QXtCtBmE+nClV5xl+THHymxMHKKjlIT55WyZqIJuJsVOIxkCsH0JOwcE0fV
         n8RxT5a2wS/iJSZK+5HNdOFyzv6IIgBVSmWwa+F3bvIXgjCq60nStjvgwnz4EUqzSAeg
         q1Vbnxu/fMUtoRaZYuYHiIyOvMqFDcx+oWIw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70cldgrl/0BrrQunPOXVGXkQVvOsQ8bUiXNfs3gIk2A=;
        b=hu9R1k3NtGFx0fkG+ehVIZVxdZrpGvnK1c4nELgCfRuaz/2PMyzGQNSaJCbIJgRhQA
         iOOIL2pgPJFWlT/qF3q2yA8U1cLUVkM+hMBI0DIkLEgqRNOiXCCvjSSUWdd9bq64nWC+
         AkNo6ovMqo1uVWaEO6ThghX8punt0DjKuujbUtyK7VNAB2DTXWyBF5xw7vgFM+Ki9BqJ
         55m8rkYFAzzs/1PzWtSiQToFT1uO8uD4LwVYle/CtgeJMmk+772VhRkcmiQjzBJec/ij
         b042PZRZK4Gd1QZqqMOmLczsOKyVsjmMg4PspGetjjbA/STBf31UGJ+P3iDPQ4YStZFw
         XHsQ==
X-Gm-Message-State: AO0yUKWIbGBqyOeRqL7UtggvjQjpmfJNzgwgjbOkXcgfdjyWOcu/T694
	VC7iWtbkQA7hNSweQkC3kjy7Gm7OwQW5LW3eqTA=
X-Google-Smtp-Source: AK7set9uxnkEfh7x2lXvlU0fksb4WCWW+yJyxX9sHHpINEiC02wfxLajOb3qosjytVWr+CdTghl0BA==
X-Received: by 2002:a05:600c:458e:b0:3eb:37ce:4c3d with SMTP id r14-20020a05600c458e00b003eb37ce4c3dmr6540377wmo.38.1678574520342;
        Sat, 11 Mar 2023 14:42:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003dc5b59ed7asm3933164wmz.11.2023.03.11.14.41.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 14:42:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] core-image-ptest: Switch to BBCLASSEXTEND parallel execution
Date: Sat, 11 Mar 2023 22:41:54 +0000
Message-Id: <20230311224155.3442306-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178373

Replace the two images where tests are run serially with an image
per ptest in the form core-image-ptest-XXX using class extensions.

The original two images are then replaced with dependencies on these
images. This allows parallel execution of the tests.

The downside to this approach is the parsing time of an image generating
this number of class extensions is slow but making it easier to execute
and collect test data should outweigh that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../images/core-image-ptest-all.bb            | 29 ++++++--------
 .../images/core-image-ptest-fast.bb           | 24 ++----------
 meta/recipes-core/images/core-image-ptest.bb  | 39 +++++++++++++++++++
 3 files changed, 53 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-core/images/core-image-ptest.bb

diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
index 1472451675e..1a3e979d7e3 100644
--- a/meta/recipes-core/images/core-image-ptest-all.bb
+++ b/meta/recipes-core/images/core-image-ptest-all.bb
@@ -1,25 +1,18 @@
-inherit features_check
+DESCRIPTION = "Recipe to trigger execution of all ptest images."
+HOMEPAGE = "https://www.yoctoproject.org/"
+
+LICENSE = "MIT"
+
+inherit features_check nopackages
 REQUIRED_DISTRO_FEATURES = "ptest"
 
-require core-image-minimal.bb
 require conf/distro/include/ptest-packagelists.inc
 
-DESCRIPTION += "Also includes ptest packages."
-HOMEPAGE = "https://www.yoctoproject.org/"
-
 # Include the full set of ptests
-IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
-
-# This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
-# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1100MB.
-# strace-ptest in particular needs more than 500MB
-IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
+PTESTS = "${PTESTS_FAST} ${PTESTS_SLOW}"
 
-# ptests need more memory than standard to avoid the OOM killer
-# also lttng-tools needs /tmp that has at least 2G
-QB_MEM = "-m 4096"
+addtask do_testimage
+do_testimage[noexec] = "1"
+do_testimage[depends] = "${@' '.join(['core-image-ptest-'+x.replace('-ptest', '')+':do_testimage' for x in d.getVar('PTESTS').split()])}"
 
-# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
-PTEST_EXPECT_FAILURE = "1"
+do_build[depends] = "${@' '.join(['core-image-ptest-'+x.replace('-ptest', '')+':do_build' for x in d.getVar('PTESTS').split()])}"
diff --git a/meta/recipes-core/images/core-image-ptest-fast.bb b/meta/recipes-core/images/core-image-ptest-fast.bb
index 40df274c4c1..e768afb302b 100644
--- a/meta/recipes-core/images/core-image-ptest-fast.bb
+++ b/meta/recipes-core/images/core-image-ptest-fast.bb
@@ -1,24 +1,6 @@
-inherit features_check
-REQUIRED_DISTRO_FEATURES = "ptest"
+require core-image-ptest-all.bb
 
-require core-image-minimal.bb
-require conf/distro/include/ptest-packagelists.inc
+DESCRIPTION = "Recipe to trigger execution of all fast ptest images."
 
-# Include only fast (< 30 sec) ptests
-IMAGE_INSTALL += "${PTESTS_FAST}"
+PTESTS = "${PTESTS_FAST}"
 
-DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
-HOMEPAGE = "https://www.yoctoproject.org/"
-
-# This image is sufficiently large (~1.8GB) that it can't actually fit in a live
-# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1500MB.
-# strace-ptest in particular needs more than 500MB
-IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
-
-# ptests need more memory than standard to avoid the OOM killer
-QB_MEM = "-m 1024"
-
-# Sadly at the moment the fast set of ptests is not robust enough and sporadically fails in a couple of places
-PTEST_EXPECT_FAILURE = "1"
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
new file mode 100644
index 00000000000..0c67943b057
--- /dev/null
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -0,0 +1,39 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require core-image-minimal.bb
+require conf/distro/include/ptest-packagelists.inc
+
+DESCRIPTION += "Also including the ${MCNAME} ptest package."
+HOMEPAGE = "https://www.yoctoproject.org/"
+
+PTESTS = "${PTESTS_SLOW} ${PTESTS_FAST}"
+
+IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x.replace('-ptest', '') for x in d.getVar('PTESTS').split()])}"
+
+# The image can sufficiently large (~1.8GB) that we need to be careful that it fits in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add up to 1500MB.
+# strace-ptest in particular needs more than 500MB
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "324288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
+
+# ptests need more memory than standard to avoid the OOM killer
+QB_MEM = "-m 1024"
+QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
+QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
+
+TEST_SUITES = "ping ssh parselogs ptest"
+
+# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
+PTEST_EXPECT_FAILURE = "1"
+
+python () {
+    if not d.getVar("MCNAME"):
+        raise bb.parse.SkipRecipe("No class extension set")
+}
+
-- 
2.38.1


