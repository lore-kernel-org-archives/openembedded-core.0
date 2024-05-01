Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2942AC41513
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 21:56:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.9383.1714600606985993770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 14:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hl2593pa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41b79451128so41846205e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 14:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714600605; x=1715205405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/g90iL/lLTCx2K/gCLYIKOLjXwxrr60gORcKjlk5Ju8=;
        b=Hl2593pa6UcjkL1bSrihGuVa8PGBfqVleDd6mBuzX7wWrTQG8z6xbDbFoFqMYelbTW
         LZmlm88uVjR6t3MavYk9zm5A+SWJen8JKzrVWi50t4Yl7CqyLKmUcnb5rnkUPZJvZYGY
         HmLj3EHTkUKLdWurF9EAwdB/I1PMNCTXJwXV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714600605; x=1715205405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/g90iL/lLTCx2K/gCLYIKOLjXwxrr60gORcKjlk5Ju8=;
        b=gu+acvPKRvLqDtqHk7WMaKLe9g/IaL5WLH0FW810W2AGB5DeaPFy3uTKKsiBH7/Fxm
         reG2bL+6s+vHmFp11au8cw157W4nEpCEUBmk/3CfSPttIJeuVgsbg/S71c7ckhAF53ct
         yL8fIKr38SiYy507juYliJMCJvzbKgARnlChfU5CNFGUsmproNDr54AIeqxlXSpMbb46
         +wJeoGheQzmH6Lt3bcKmM+JB/uAniVHM1Ol6b7dEz3QLh9uq2722S4j1M7uAz54EnGvP
         KP5wL2UTYpJhcGkU5WiZ22+AgBFG0pRcr8P7HjFeg3XLg1uAcSBY4bRU6U8jxnnRid8v
         MGrg==
X-Gm-Message-State: AOJu0Yy55hSyYLuSnDgUnpVTRz+xcjlXmfSQbQKckheRJCdiXHS3geCK
	X7t0WG/QnO43Bz7V9/TN8piOFapxNpWbY+PcsC2wBgFTqNepR+p6DBUxlNfLOpivqUwPs+Kh8Xe
	mU0U=
X-Google-Smtp-Source: AGHT+IG33qeCrzHrkT06s7J5FwegRS5outTUZAurnmtdxwGyjOiRcfQAPKY0UewG0F8QplJotCMAlg==
X-Received: by 2002:a05:600c:54f2:b0:41a:a08f:2696 with SMTP id jb18-20020a05600c54f200b0041aa08f2696mr3006889wmb.12.1714600604480;
        Wed, 01 May 2024 14:56:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e92c:f8cd:59ee:48e5])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b0041a49b10a13sm3406986wmo.11.2024.05.01.14.56.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 14:56:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] base/bitbake.conf: Introduce UNPACKDIR
Date: Wed,  1 May 2024 22:56:40 +0100
Message-Id: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 21:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198890

Having the unpack directory hardcoded to WORKDIR makes it really hard to
make any changes to the unpack process to try and allow for cleanup for example.

As a first step toward unraveling the intertwined location usages, add a
variable, UNPACKDIR which is where the fetcher is asked to unpack fetched
sources. It defaults to the existing value of WORKDIR at this point.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 4 ++--
 meta/conf/bitbake.conf           | 1 +
 meta/lib/oe/reproducible.py      | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 0999b42daaa..066f3848f7c 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -153,7 +153,7 @@ python base_do_fetch() {
 }
 
 addtask unpack after do_fetch
-do_unpack[dirs] = "${WORKDIR}"
+do_unpack[dirs] = "${UNPACKDIR}"
 
 do_unpack[cleandirs] = "${@d.getVar('S') if os.path.normpath(d.getVar('S')) != os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S}', 'patches')}"
 
@@ -164,7 +164,7 @@ python base_do_unpack() {
 
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
-        fetcher.unpack(d.getVar('WORKDIR'))
+        fetcher.unpack(d.getVar('UNPACKDIR'))
     except bb.fetch2.BBFetchException as e:
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
 }
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ba8bd5f975f..b2c500d8739 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -405,6 +405,7 @@ STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
 BASE_WORKDIR ?= "${TMPDIR}/work"
 WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${PV}"
+UNPACKDIR ??= "${WORKDIR}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 448befce332..a9f717159e3 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -120,7 +120,7 @@ def get_source_date_epoch_from_git(d, sourcedir):
     return int(p.stdout.decode('utf-8'))
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
-    if sourcedir == d.getVar('WORKDIR'):
+    if sourcedir == d.getVar('UNPACKDIR'):
        # These sources are almost certainly not from a tarball
        return None
 
-- 
2.40.1


