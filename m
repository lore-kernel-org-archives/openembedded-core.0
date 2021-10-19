Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CC8C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.15294.1634673326518181193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wfcvPeL4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id m21so20332924pgu.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KFEzwoB1E6Wms85s9DyOmWmkKNHOaNBD/Z9WGhCfNac=;
        b=wfcvPeL4fexYEwxXLr8ZBQaqCGw/sc5WVTNkFj0yv4rNX3Wh3syKDgk6PmE14QGUFP
         2a66rPZiP50n+PIvAETaSBk+13P7sAACIQSHIptidq8Hwh/ix/wtM8fI5XgOUtnyGMfm
         wAt2vWpyIzuOOeSOAgb9tp8HO8ldmkmCVXmeXvy4pU3iwAB/4v15OkdzdcKqUMrOCbzp
         PGCJg+1B4q3jZ4BtZBiPy68QDpuKTutqJ3kCdcvjGcecycIcntn/O9vOjGU8fB3msedt
         Ru6cXj98iaMx78+bJBcVefgmVR4Rf5Jpf1Ph5hXeykE+DBKcwgNB1R2k6zwl1tCQ6Ccn
         qF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFEzwoB1E6Wms85s9DyOmWmkKNHOaNBD/Z9WGhCfNac=;
        b=0V0C58Lrb6wcRFf3us/WQP3Jfzpk+NOzw5QVA5yAJrOncEm8+OeZkpvT2qxtxRHsFD
         00QPN+FMY9YnMDEDFAMuWl6UGYteAAgOpFSFsRlQ4XqxZFKMSENH+36GP/2MyoLeNOT4
         ua2sAMY4io6+MpEchPDJ/eWrfUeJVV4w5PPUMNRQvxm6jNNZp95lGJOmsNDZpcVUKe90
         7sZniEO9ezaMOtWua92khpNJ/MCjZ8p7aqplDIRgCFt1+lVj654uhNkEmrnw/fPpjuAu
         c0OuhnIvHit2e1EsmUvrpIMDI/PIu6q1AgoHWLQEqOIaXxZwtQLVeDon9cquwIw9NDIZ
         L8lw==
X-Gm-Message-State: AOAM532wBSNm7YAUREZaCxVFI0p7GFDi/wh4bfbnt/ZNxmiD90dS1nx9
	oB2gOQDU33Ec7T385djiclwGGdTcaembWcDUfFc=
X-Google-Smtp-Source: 
 ABdhPJwJgYK6DX4yHQIr6K29zqmn0NST9og00CnIGHW3DGXj67v6Mp34tDTgkBE+sJ33tDr+AayFrA==
X-Received: by 2002:a63:3d4a:: with SMTP id
 k71mr30395871pga.276.1634673325567;
        Tue, 19 Oct 2021 12:55:25 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/38] externalsrc: Work with reproducible_build
Date: Tue, 19 Oct 2021 09:53:44 -1000
Message-Id: 
 <badef50c6c9821f1975483de0ba50a75f2eda52c.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157238

From: Mark Hatle <mark.hatle@xilinx.com>

Externalsrc removes do_fetch, do_unpack, and do_patch.  The system normally
discovers the correct reproducible date as a postfuncs of do_unpack, so this
date is never found, so it falls back to the default epoch.

Instead we can move the discovery function to a prefuncs on the epoch
deploy task.  This task will run before do_configure, and since the source
is already available can run safely at anytime.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b7dd711a54e92ce54abe99f59fc67e683d52dfe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index c7fcdca6ef..e94a5cc2af 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -109,6 +109,16 @@ python () {
                 continue
             bb.build.deltask(task, d)
 
+        if bb.data.inherits_class('reproducible_build', d) and 'do_unpack' in d.getVar("SRCTREECOVEREDTASKS").split():
+            # The reproducible_build's create_source_date_epoch_stamp function must
+            # be run after the source is available and before the
+            # do_deploy_source_date_epoch task.  In the normal case, it's attached
+            # to do_unpack as a postfuncs, but since we removed do_unpack (above)
+            # we need to move the function elsewhere.  The easiest thing to do is
+            # move it into the prefuncs of the do_deploy_source_date_epoch task.
+            # This is safe, as externalsrc runs with the source already unpacked.
+            d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
+
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
 
-- 
2.25.1


