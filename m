Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F5DC02193
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:36 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.7729.1738205495359698798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aLOj5CA3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21654fdd5daso4500395ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205495; x=1738810295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suqRx0QmP0olUg42W/3rUoJz+0dDu63k1QA5/RiTXzs=;
        b=aLOj5CA3J4c4vma8bGy1ASY98M9PEeVSEIrOaUG3iyxzWsnHQdBqMvBzi0N+C5QyyZ
         kK3U/UWIGIVLjlLPRd3dciLeBijf2BAx7XxiKvBI1py/9L1L2bc134t90yHyxCcdPSVZ
         NZf4bIbutbobihal0i9Aq1mopTRsaEayB/bUhthE5uVbDGBr2ESs3l3Tmbu1sziz1uv2
         oALAlWh2d/mPXIjo7AcCEzkgHPP3hVh7l6zqZafTD1v1DW0FZl8jP6PiyvHzl6U7RQod
         lJfeXo1/JwMqptOwd/6stLjb+u8rOXEl5uHaqo1OWdcvKBRKZ0oKnTOOKa26ciAYFhfD
         rXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205495; x=1738810295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suqRx0QmP0olUg42W/3rUoJz+0dDu63k1QA5/RiTXzs=;
        b=JjuwIOw8JFK1hbE8VaLeZ5nUe2RHvIBtkuJO6L4PQUdPbZi/OpBSQIH36eqlSfxnTU
         k+qz250uoakakp4edevj4ihb4Xa7e6372YvXdjSdT0OWuKDLANT2ToXOSZ8JtCfJD/fs
         dqRVb3+y2eJ9I69AfKIkGMrNcJAKBxnleNzCv/pNJKOpGyZqCptH6ye29L9OLWEsFDiw
         Uke3AZNEC9zJrnJMmZCkYZyKberftHG2XI+9OvbmcC602XviXm4OjVB2UjtSr1LDTsZu
         V1bn6ySyWhPvJr6/ZFNz5Zm+xPFWzl2VRdUX0TL90SSVu9fpfCOZL5EUVZyYvs+bksL1
         x5SQ==
X-Gm-Message-State: AOJu0YwvoSRdNIbXLYu26r6uwRnH8IWnV9OmgxFmjmz77Vec+gHKuqVe
	tN9LrNkJOO3Ehn4Jh05X2Ow2wRcf0DPqUuBKr+5HK2hJE4QhWrrmwLhOn7IPHO9sikU+6cdZ9CV
	SZp4=
X-Gm-Gg: ASbGncs23slRMHlPZei0qSPduQujttFl6wV0DoqOeMpp0iAKlXIDjf7tcX3y70wTe/E
	QhX4RjuqswutrE208Nf95A3zuTaAASJGnDmNgLxJnNrKDCij7jVdEvt2+nxiD7/vkFoqFKkJZAw
	1GGKE2iaQLAPlMl/+PaUaCfg3clfbydXWPBO0apWJM7vWiZw7OmXYZtdQimlOtrYSS/QoSjMV0w
	qoseIBTcUXUHZqGEluhwsD/VC4PwJ5PgxDJNrpaAj4l+7rn7L0imsn0KoTrFcfOxLvVWHd1/RH+
	wFfc
X-Google-Smtp-Source: AGHT+IHVIo0tv4gQdx24cACPXLMRtfOLrU+ChuHCOYAVgHEbZPdfzLLSpblFVLDtmCsTyPJ40RKitQ==
X-Received: by 2002:a05:6a21:516:b0:1e1:9f57:eab4 with SMTP id adf61e73a8af0-1ed7a5f9036mr8967928637.16.1738205494736;
        Wed, 29 Jan 2025 18:51:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/12] devtool: ide-sdk sort cmake preset
Date: Wed, 29 Jan 2025 18:51:09 -0800
Message-ID: <b12dbde1ea30dd0fc1dd9352de948b8377c347fa.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210429

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Sort the keys of the generated CMakeUserPreset.json file to make it
easier to search and compare.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/ide_sdk.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 65873b088d..eee5425aa7 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -493,7 +493,7 @@ class RecipeModified:
 
         vars = (key for key in d.keys() if not key.startswith(
             "__") and not d.getVarFlag(key, "func", False))
-        for var in vars:
+        for var in sorted(vars):
             func = d.getVarFlag(var, "func", False)
             if d.getVarFlag(var, 'python', False) and func:
                 continue
@@ -545,7 +545,7 @@ class RecipeModified:
         cache_vars = {}
         oecmake_args = d.getVar('OECMAKE_ARGS').split()
         extra_oecmake = d.getVar('EXTRA_OECMAKE').split()
-        for param in oecmake_args + extra_oecmake:
+        for param in sorted(oecmake_args + extra_oecmake):
             d_pref = "-D"
             if param.startswith(d_pref):
                 param = param[len(d_pref):]
-- 
2.43.0


