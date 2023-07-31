Return-Path: <peter.suti@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033B3C001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:34:26 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.3667.1690796062205974143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 02:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=ZAuJquuo;
 spf=pass (domain: streamunlimited.com, ip: 209.85.219.52, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-63cf9eddbc6so24787576d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1690796061; x=1691400861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgFEiviRKKgQJxug4sHm8qy9N0Erfk/SypYpnE2K7rs=;
        b=ZAuJquuoEp1WIPZ5QOEAoAJheaIMQEHmCLPdUwWi6nzFOTs1uVDowMqiRAlOwu8d3e
         3ZLCUkjXlBMYMIzG1WPqqqQRWgKce6BfNcmwTMkBnAa1DK5/kWDr1AvwMHnIcUI7lzJe
         5TziVuqKeG/mHqRwNR49xFjVKnPDxS15mSEDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796061; x=1691400861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgFEiviRKKgQJxug4sHm8qy9N0Erfk/SypYpnE2K7rs=;
        b=h1G39z5ytux1B0LT7GvYJyFwasx+0hhxGNGILflp2ExkYcf2md2MegbPj8LKWfid12
         JrO4A5SMc5b+pedAeEwLgqB4bH2Ad8WFfF/wF/ACjdUCO17DG7KXNM8GSyyQMff1bzUy
         vhN1elGvA7bWmMQGSdoXSnGSGv5X/4Rt9XiPRy3O+4XzFhfPZ6eS2jGJjHgL0QjHG5mr
         G8P4zAEdTkXYaynBK3gDMfbbGtMcBqQuU14zIW+RIth7f5wiAPr4WTa1QI6E2o1i2ARB
         KN03+LTvhq9aFdqcq0Df83fLRi8VGutrnm3HygIkclW+mDSQKho4hyMS0Ryb6+TsyNUh
         eo6g==
X-Gm-Message-State: ABy/qLb5fcoJ60HTLwo1AaKTl3jJd6xXWpNd0FJCOsYAS/TG3N2wRkc2
	NOF7uzvFdJyIMffzs8MRH3kmyORIPLuKhroX8uF0gw==
X-Google-Smtp-Source: APBJJlE4lKqQ6zL9GNS0XTH7otzXUDcGV65rfEzFCa7albdDMDPMZG1ajaI+5ganDAJknyv9D4P7tw==
X-Received: by 2002:a0c:8c48:0:b0:63d:30a:d9ea with SMTP id o8-20020a0c8c48000000b0063d030ad9eamr10638808qvb.18.1690796060955;
        Mon, 31 Jul 2023 02:34:20 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id k6-20020a0cf286000000b0063d5c9de720sm1813214qvl.80.2023.07.31.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:34:20 -0700 (PDT)
From: Peter Suti <peter.suti@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Suti <peter.suti@streamunlimited.com>
Subject: [PATCH] externalsrc: fix dependency chain issues
Date: Mon, 31 Jul 2023 11:34:15 +0200
Message-Id: <20230731093415.261532-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 09:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185127

Fixes [YOCTO #15164]

Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is set instead.

This seems to fix the compile issues where the populate_sysroot task was
not run when an externalsrc recipe was built as a dependency.

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
 meta/classes/externalsrc.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index a649bcdff8..12f2718850 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -76,6 +76,8 @@ python () {
 
         # Dummy value because the default function can't be called with blank SRC_URI
         d.setVar('SRCPV', '999')
+        # sstate is never going to work for external source trees, disable it
+        d.setVar('SSTATE_SKIP_CREATION', '1')
 
         if d.getVar('CONFIGUREOPT_DEPTRACK') == '--disable-dependency-tracking':
             d.setVar('CONFIGUREOPT_DEPTRACK', '')
@@ -83,10 +85,7 @@ python () {
         tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
 
         for task in tasks:
-            if task.endswith("_setscene"):
-                # sstate is never going to work for external source trees, disable it
-                bb.build.deltask(task, d)
-            elif os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
+            if os.path.realpath(d.getVar('S')) == os.path.realpath(d.getVar('B')):
                 # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")
 
-- 
2.34.1


