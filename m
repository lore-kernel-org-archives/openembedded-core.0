Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA27C43217
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:10:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.8579.1634213431455936729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bZAd4NrJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id g25so18763793wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=atdx68VNuClYxS8vA/v93HeY/nqUiShi4kAIpD0rErM=;
        b=bZAd4NrJWVRHhzSqT4FbUjfPG7zCDc+10YaNf++q8C4+nbilza1IzqajcVSpb5lZwA
         izcoC3bpeYaX7RP2H8ILNUKgC9CoEl5wOkI9nAuKz0Q7XveKvBSYXkni0ghN9njNzv6g
         iBZn2Ybv+ZIa4O8eKlLQNxHVVtqjJNtJWyNSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=atdx68VNuClYxS8vA/v93HeY/nqUiShi4kAIpD0rErM=;
        b=etwEV+mxhGvNFMfcVppFOucn49jD/sL8b2Xa3jxKbaPxBJVYGU9NGU7Nkx832Diq+h
         LlcBW5M73ngywO0QQMMmE4F0r7qiAQbmHdCFFkG4xGHml8xuDWK5iXGWk/HzlFLVaLdU
         EfWU+XzOFNeDLGp8tjFlUqjVKqji3YoBLM0leiH/Imj1Ltde5C/HiWa1QnTUQcLOhKSH
         QbARD9b9vxMB7gSL6jy2DX19VhjU3tjw6s5KvaoIsYjt68Wxh264w2llOT1wVVKqa70C
         c9xc+eoEMeEqd+CdWpUuUKGt1YwA3sNBpdxHz6eB980FRryK/2uhhYSPpiLpvDVmG6M7
         L4pQ==
X-Gm-Message-State: AOAM530vvvvcyZ1dg8xijdnpHI+iEOnYY7Fp5tuFH1qcoCExtMhsOfGq
	o4akItEKmtOiRVENANHhSrqAzAORvt60IQ==
X-Google-Smtp-Source: 
 ABdhPJyB9AA+EM7MgF0atDoH+oVOm0puqSbTThIII6x+eXJEYgmuL+DopdqpXEAPFNEZi11rsrD6dw==
X-Received: by 2002:a1c:14b:: with SMTP id 72mr5267355wmb.158.1634213428050;
        Thu, 14 Oct 2021 05:10:28 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 10sm4296152wme.27.2021.10.14.05.10.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:10:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] reproducible: Move variable definitions to bitbake.conf
Date: Thu, 14 Oct 2021 13:10:22 +0100
Message-Id: <20211014121025.2913401-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:10:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156942

The reproducibility code was originally developed as separate
standalone class but development is no longer experimental and
the code is widely tested and used by default for poky. Reproducible
builds are the direction we need to take as a project.

Transition the core variable definitions to bitbake.conf as part of
a move to make these part of the default workflow.

This also helps reduce test matrix complexity as there is now one
code path.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/reproducible_build.bbclass       | 11 -----------
 .../classes/reproducible_build_simple.bbclass |  9 ---------
 meta/conf/bitbake.conf                        | 19 ++++++++++++++++++-
 3 files changed, 18 insertions(+), 21 deletions(-)
 delete mode 100644 meta/classes/reproducible_build_simple.bbclass

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 0f45b782e5d..f38be1a7654 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -51,15 +51,6 @@
 #
 # Once the value is determined, it is stored in the recipe's SDE_FILE.
 
-BUILD_REPRODUCIBLE_BINARIES ??= '1'
-inherit reproducible_build_simple
-
-SDE_DIR = "${WORKDIR}/source-date-epoch"
-SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
-SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
-
-# A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
-export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
 
 SSTATETASKS += "do_deploy_source_date_epoch"
 
@@ -103,5 +94,3 @@ do_unpack[postfuncs] += "create_source_date_epoch_stamp"
 def get_source_date_epoch_value(d):
     return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
 
-export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
-BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
deleted file mode 100644
index 393372993d0..00000000000
--- a/meta/classes/reproducible_build_simple.bbclass
+++ /dev/null
@@ -1,9 +0,0 @@
-# Setup default environment for reproducible builds.
-
-BUILD_REPRODUCIBLE_BINARIES = "1"
-
-export PYTHONHASHSEED = "0"
-export PERL_HASH_SEED = "0"
-export SOURCE_DATE_EPOCH ??= "1520598896"
-
-REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cd828251b9b..1db9b3fc051 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -628,6 +628,22 @@ SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BU
 BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g -feliminate-unused-debug-types', '-O2', d)} -pipe"
 BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 
+##################################################################
+# Reproducibility
+##################################################################
+
+SDE_DIR = "${WORKDIR}/source-date-epoch"
+SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
+SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
+
+BUILD_REPRODUCIBLE_BINARIES = "1"
+export PYTHONHASHSEED = "0"
+export PERL_HASH_SEED = "0"
+export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
+# A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
+export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
+
 ##################################################################
 # Settings used by bitbake-layers.
 ##################################################################
@@ -908,7 +924,8 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"
-BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR SSTATE_DIR "
+BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
+    SSTATE_DIR SOURCE_DATE_EPOCH"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
-- 
2.32.0


