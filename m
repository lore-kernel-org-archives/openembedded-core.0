Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CAAC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:49:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.22529.1752673738945899302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 06:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NxeQdBQ+;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e33d36491dso205525285a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752673738; x=1753278538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyKZuOH/Eddx8cn+h7SPSmsBPDwwopXmmx/O8Xy5Xpk=;
        b=NxeQdBQ+E/oafy+2Jxi9Oet6dW31EGveVzKNcWgHhmzHWbj3LnzGfdCf4KnwPpNhiq
         jyRdph8tQWg7LQ96TyuOv760aQ+fsZZzkfDfKKEjHzVtV7LxEiq7kmRAN/TpLvNIKF9+
         H4ToH4pvyKZbTyYVykjYbH7RsnwPl+6Fs7PVxfT2FG9C3Qvr4DIWQ+49BWcxqsZlu1mj
         WllaTZLifXmYQ3zZZ4+PtqbChy9GrWKk2GGsRZfc7Ui6vxHVuA3qsvUIieQsTqQDneCR
         CVGMWBbygCo5L5mxpzi1sMwP24DUuOGzNcAXXhQzCCFvpoSqsHJwl2yPDRCMlSazNYns
         wRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752673738; x=1753278538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IyKZuOH/Eddx8cn+h7SPSmsBPDwwopXmmx/O8Xy5Xpk=;
        b=CkpwPtpu87Yh6ZfyrxdSkJDmutiS2TTxKvalGSlNFD3m5NVyKuNXZw1e3vjg4Ru27x
         xQkNIbc/Bc31kNxkOG/YEDLOBTMhhgzqSo2LT82aW1L5S/ZfHX/djnVw/5m875D+eU8Y
         WrfvyPWkPFjW5TV0BqrUFjWZW/T9SGdmsqptoWhgKHjed44105+mt3IXLnKDJ78XccMZ
         OXfgph52nyElbV9YV/VA8iwvllCm00UrqGFVh8mrtOm7YEtuBAbdIl8IOPMyzzmq7mXp
         /mt/yowb38xLVGoBoTam5RH3K9ElZoeoGXx0n3tM5g6U/jN6Euq42R5EVgOrtNan0KKg
         l7Mw==
X-Gm-Message-State: AOJu0YxjFRCEz7VWTdmncIW9V4M0aVgQKm3ILO87drDAL8GcgRJ6vAoR
	AGZYWrMVStxp65DqqZUGU6h8ee/7GZ53PfAgsCzZt4a85vbEqXGiaVoZcjayEnI2
X-Gm-Gg: ASbGncvzvKtTo8R2sZHBG7IgjEtzN8Q6ki9nsDMCa/87WdD/aF1T4bPxonQ5+u3WMzb
	ffDf5y8/EAJn2DnRMJIq/7h0Wywt0UppYJjJcb7DdndHlQCZl1wjI7GkMg/7e0k+WG6ynUtCLBg
	xT9mol/Xg8QVy9CAlSF000+ZwTE8Jp/MoznSLobDW12237P7KnRKZsoQXbgI/2yx+VL4Eoltz+5
	rsyQAs+QvNgW5n9IJMuM6dwTZQ6MmaKbZ137VG8v4YfZlk9b3Ce1T0j7chCzih0vY4ghJ6HCW6B
	IsUbOedfaKc7gaoauJ47xfPSMuWujjkRNLOULSP1ikPBR3YxYG2/L4mIdhoWYs3JwK9Yueq0vLm
	JLDjsnJPnyschij5FavTmec5+fw05p9hoOHJItwAVd3j9hujLlaPbJBuTKYfYbl8unJOMXiAsBg
	NHKEVwTtKKKZ0QuRngjP0z5SlkDTScoSwbvg==
X-Google-Smtp-Source: AGHT+IHSiVCeRfShBbrRxeqwsgcHeZcvJFDhK/WbZYErfuJtdHVUF1bve0tKXLpKgj1+0IT6k4zNkg==
X-Received: by 2002:a05:620a:400e:b0:7ca:cd16:b433 with SMTP id af79cd13be357-7e342b509dcmr418048985a.31.1752673737830;
        Wed, 16 Jul 2025 06:48:57 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3443d830bsm84245085a.25.2025.07.16.06.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:48:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] kernel-devsrc/x86: add v6.16+ build requirements
Date: Wed, 16 Jul 2025 09:48:51 -0400
Message-Id: <2b9e0ef1d143967102ba79647cbe2e865f95dbf0.1752673419.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1752673419.git.bruce.ashfield@gmail.com>
References: <cover.1752673419.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220457

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We require cpufeaturemasks.awk to create the build components
for x86.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 3d2eb3929e..0dc9772429 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -294,6 +294,7 @@ do_install() {
             cp -a --parents arch/x86/tools/relocs_common.c $kerneldir/build/
             cp -a --parents arch/x86/tools/relocs.h $kerneldir/build/
             cp -a --parents arch/x86/tools/gen-insn-attr-x86.awk $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/x86/tools/cpufeaturemasks.awk $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/x86/purgatory/purgatory.c $kerneldir/build/
 
             # 4.18 + have unified the purgatory files, so we ignore any errors if
-- 
2.39.2


