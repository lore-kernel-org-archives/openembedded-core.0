Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8E9E64025
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:55:11 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.10499.1732226102407745681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R3ZxTrpl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7f8cc29aaf2so1114612a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226102; x=1732830902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2adbw+gKSp180Hz+msll9gYej7+3qi0wvJxkBBiLkoI=;
        b=R3ZxTrplriI/MDYf6ldflrQ5gjmCBC83zautqLJmPoDWqnSNYTKeuX9XJkmJTK+uBc
         1RSgBvFo1ug5kjux52hEkpcmIThlfEl0t5GUH6w/qQ3wy1ujTjt3wk5aIq6ysDE2yIxK
         rdGRLT1r2uacOYXxz5++D0XigdxmrsNVCm0fv7VPEqJCQgvi70c9zLrgQNDEm7J+AbqC
         ghJaroBzOUUokTk7mu7tbyp+IVt7CwTRKZjUsTRhqJG3JPvf25oUuFJe7p6Q5JEQLtDH
         KSf9nWDK3pv3FemqVjTZN3QPUB1oZdJbaG6PijzwFsA4YCwngmbIBVgkkUjlaGq70nIc
         Qrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226102; x=1732830902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2adbw+gKSp180Hz+msll9gYej7+3qi0wvJxkBBiLkoI=;
        b=dcm1cYxLrgq9TebDtRjRWjKvDaLXuTLatO3i6HeaGyHWrPPBG3K8hbSUeU5kco1t6O
         ZBM9CRycuo1Ywavr8vX8eRJBlaVR4CWTS40BXxRy+C3yQCpWt5jgG9OLRZkHRufO4aTS
         98v9WTTC78CUXHgZfdVrO6DAtLhzujEShQCDW0ME/oCtxG8pImhnC0D3w1KOUqRcDRl5
         HU9qEa9/Rh2/WESHkABuNH8QfzfQLmP3g7eY6LcwcCTTDNFQF7W4aixiiDRukBdFSzgA
         gYAo1FXymgUbSGHvZFd4VOH82+pP5X6zhKE/cFXuITtALDILRJCyui7CX9qDWdBA0eNX
         eMHA==
X-Gm-Message-State: AOJu0YxWFx7UPkVoxXnaC9Vbx9NbsGQox4wafPOQ2HfX3uRCMhkFCKAf
	tZhv3+sVTOXGyuRp74uO18QDee6SvgzXNeT6x+/taiX/IV2FTxlofPwkCoE3SSkyyBBlAUeCil2
	N
X-Gm-Gg: ASbGncvEgK5D0Hzy5Ucq0t/eVb7i9/XmAvpQmd1rZS41WXOcWN5TmM2u6ZznQz9Hlzd
	vgRIK7+0hwlPuNtp+vLrcMQw6O9lw4zBpA2Np3wlhwfHcii6sa1FlJTUMsxl+AL2lPd6vhb/kWS
	RgWz9+kqG0VmHR7MGiNJXKinp9UYerRSLsQGnk3ihNwpAH1wqJzjfyEcXleVw7AIoxKg1zELlQC
	EmAsq53E52TSvwr9Uh6Sp7QkgHqxamN20CCeCM=
X-Google-Smtp-Source: AGHT+IEWCQ9GwM9kCWHdDL6BnVH6gx6LVEp0kiwGZkCcBv+7F5CA/69YvYbra1a3pGKLGvmAzYeTig==
X-Received: by 2002:a05:6a21:998f:b0:1d9:2b51:3ccd with SMTP id adf61e73a8af0-1e09e3f5399mr863526637.7.1732226101675;
        Thu, 21 Nov 2024 13:55:01 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.55.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:55:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/27] webkitgtk: fix erroneous use of unsuported DEBUG_LEVELFLAG variable
Date: Thu, 21 Nov 2024 13:54:16 -0800
Message-Id: <274319d476d7b4e83c6cfc27e8cd87ab019b66e6.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207581

The version bump to 2.44.3 mistakenly changed the recipe to use
DEBUG_LEVELFLAG, which is unsupported in scarthgap.

Restore the original use of DEBUG_FLAGS

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.44.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
index 90fb7a1d42..a8f825e164 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
@@ -93,7 +93,7 @@ EXTRA_OECMAKE = " \
 
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
 # debug symbols (4.3GB to 700M at time of writing)
-DEBUG_LEVELFLAG = "-g1"
+DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
-- 
2.34.1


