Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F0DC433EF
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 11:30:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.24198.1641036609123883201
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V8vafJGW;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id j18so60187186wrd.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AoIgEx5XRSDjgG2Ga85ex/+I8Nng8zG1zWPDhCUWKek=;
        b=V8vafJGW/z+YlvJpA6VVGIou47hf8PiHlhsQ4ZXD8/Moby9CQhom9PZmgxoSK426Za
         sOAxEG7GB6q47AWjzQ//TbAa5IMaAiP749SL5PetvI0oO8swUsBg3I3T7PE/pIjXFiGP
         bcfda3Qa6/VILhPcej4vNkbdvdajc6ALR1FvoRAJYYNLmnA3bvXDTrz3ymr5xY7SSsRu
         qlZ4t5tdctBNUvwhRveyP0/ufpFuhZAXOpQ1OHL8S4OrznCUDevFr25CwVHXg4p5bNA+
         rOt62ywMLnFlu2l3qX1r03/N5NrQHZSupSJNf/QABaZpLtok/qvV4tYaHpOkaKgwOgak
         c++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AoIgEx5XRSDjgG2Ga85ex/+I8Nng8zG1zWPDhCUWKek=;
        b=s0lI3XYiaZqgFXV83cy40qiLdHYXabhUFAGTjzW5rXlWgpsYQPJqaHb8YwmAq9LFSG
         uboeCs91bcBp3ep8EfIeIS/TDZcY82gnfFCknv2IXovnRNcM1mW89pCZhkg/TnYb9BIv
         3T+INv5NWLui8xZA0K0JdEphI9XksA9VvAdotA/0PRJgWZ76Lr5ckvqsetgxeuxoyOyk
         3Ve3Mj6FPRdXpzNsuHswM1KkXxiqV/9Eb/tDUGUAsMu3/4qRYf6lLYowamti5s2KPkkW
         cqwrs/daFEit5d8RCv0zP2UjWPfbxwL5Mhy2vyB0XE4gN7qZrSjfTDEtjTCCIVcg+4td
         ZUow==
X-Gm-Message-State: AOAM533fl6BieWxqspKkH96R2kNkcPLGVxRqwYCnOZRvFGyB4TBE+Url
	cKoxDI6sZL9H4j0f5i5k8B+3ciBZLb8=
X-Google-Smtp-Source: 
 ABdhPJxAfZb6yks0rz0Q3mVu27tR7nqlBFg+qZnukFTPAdVxU/jn5AnlQm2uXqiC2zepr9No7eY2EA==
X-Received: by 2002:a5d:4b0a:: with SMTP id
 v10mr31567061wrq.294.1641036607629;
        Sat, 01 Jan 2022 03:30:07 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j85sm44679935wmj.3.2022.01.01.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 03:30:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/6] selftest/reproducible: drop go items from exception list
Date: Sat,  1 Jan 2022 12:29:59 +0100
Message-Id: <20220101112959.1866747-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220101112959.1866747-1-alex@linutronix.de>
References: <20220101112959.1866747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jan 2022 11:30:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160099

With this changeset, go becomes reproducible \0/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 2e983d2f17..fce48a2943 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -17,24 +17,11 @@ import stat
 import os
 import datetime
 
-# For sample packages, see:
-# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-0t7wr_oo/
-# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-4s9ejwyp/
-# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-haiwdlbr/
-# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201127-hwds3mcl/
-# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201203-sua0pzvc/
-# (both packages/ and packages-excluded/)
-
 # ruby-ri-docs, meson:
 #https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210215-0_td9la2/packages/diff-html/
 # rust-llvm:
 #https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210825-kaihham6/
 exclude_packages = [
-	'glide',
-	'go-helloworld',
-	'go-runtime',
-	'go_',
-	'go-',
 	'ruby-ri-docs',
 	'rust-llvm-liblto',
 	'rust-llvm-staticdev'
-- 
2.20.1


