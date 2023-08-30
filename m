Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AA9C83F17
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:19 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.1298.1693417752979201147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mxj8AUyw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68c0d4cc3a4so3692107b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417752; x=1694022552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jovab6O9bHRdG/jrZ8CfeyL/GQP6xacx6NNB0eDfzhA=;
        b=mxj8AUyw1ZI9clZ4VJF+LPlPYhG9Rg7MxMQoaqgVkAfScnysRIfTHhb/wXbUYsBEXk
         GQI1ZAAmbzoRVXM5KOYKrcC8znp4esC1SwlQHj/q9/5XtHR8l+fsPm/q2foCtIiHeRCE
         tyBmcAQrAT6ZvWOsce7iuCM7G5xAYPecoT0s3+SgEiqtcCntS+Q1TzVbBXab6+pqYd0e
         LukYwXaunFuJB39+98Ee265wceii/EMraeO2WOjwhbIP6jW24OyS3MMwoXaXErt0agkJ
         CdDM6lBEmhu4wiYUivN13gUalZ2Z0UeAVhxYQzrn6m+2y92XZYaHbbmQmgDjBY9Wymjr
         C1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417752; x=1694022552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jovab6O9bHRdG/jrZ8CfeyL/GQP6xacx6NNB0eDfzhA=;
        b=QuFMB6LYNZ+Vv3Rz7l3nEqTilt+hgArOtL8+zglzfoTcqbP0ebW4dff1g+DA+VxZN7
         z1O06IwzxeGCgHybbk+U8P92BjN1qyGUXKtN06li1ZniOmyPyVkS3yn6BnwdGd/Yz6vy
         7QGtS5okwx+vNcOM0h4saVXWoRI2HfFv0E2fYH82RYk8h13Xac8Vh8w83eQkyEboxhNo
         ePnnwIYoTpcKSL4UEtOWxfMaZwHT5PUjGfuvtXifLp7GOCbHsXCodhW+1QigGihlS4bg
         PURBDzlH4ew/E0Dr2LlUV7SzP6bi4VyEYxirmhvhKLAA/EmxXuoCOKWG3cCLCdbMrU3g
         /efQ==
X-Gm-Message-State: AOJu0Yz8KyNE1Z9/uNtciK27hXZD4hct4ugbKy2i54panN1Hh3tK35v3
	wyQ8ppoZsGZvNd2Rl9U8RLCbJEs89k2bOMfpwOw=
X-Google-Smtp-Source: AGHT+IGo9Oou0EZBS49WMUPHphFWCcuwyEvELgf/RF68I99Z3b9RrZ+qpc/GDZOeeKVVX9tAAun5hw==
X-Received: by 2002:a05:6a20:3d8e:b0:14c:69f4:723 with SMTP id s14-20020a056a203d8e00b0014c69f40723mr3247421pzi.42.1693417752037;
        Wed, 30 Aug 2023 10:49:12 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:49:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/20] build-sysroots: Ensure dependency chains are minimal
Date: Wed, 30 Aug 2023 07:48:23 -1000
Message-Id: <a3e2e156c602e7fabf0024a6c9dc4603d327f08b.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186921

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need to ensure this recipe doesn't have dependencies on others. The SPDX
classes/tasks introduce dependenies quilt-native and patch-native which can
introduce races on files in the sysroots. Avoid the races by removing the
tasks we don't need.

[YOCTO #15186]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5dc278b077edba8f4099f0f6dfb97e97f680320)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/build-sysroots.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index 72da88921a..1a3b692a1b 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -17,6 +17,10 @@ deltask configure
 deltask compile
 deltask install
 deltask populate_sysroot
+deltask create_spdx
+deltask collect_spdx_deps
+deltask create_runtime_spdx
+deltask recipe_qa
 
 python do_build_native_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
-- 
2.34.1


