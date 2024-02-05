Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB36C48297
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:12:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.64872.1707145942579467179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 07:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AmGYU/re;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51142b5b76dso3117691e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 07:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707145941; x=1707750741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAtfyH7WYSJFsq7ayVl0wx7lY2OmQX+GvDdrCwUtRsQ=;
        b=AmGYU/reVvdaVCnop2L2UTWaYVVkhFERUVtZl8uhaVzddsr04evls5WMhNWn9HPRQA
         uOQW+Im/PwhkXSyRIISwk3jydNsOL4W0ipGLzmkRuqHRiH+9DlKCSkPQFUktlIKcztQF
         XxZdCk1YXPNxeHiMxP305zFsNKcejhOiuA1eES7In/6v/6AvRDUhA5waI/MGq1yZ8OzX
         X1cGQcaq3b8/qg5OV4NkrK63loynUdrP+MZP8tFmH6FgTgJWbtt19ZuyvbaXa7EvFmtO
         VRi8GpJ3JxeccoN0rE4UhiDYFuE0nky2yeWHeowwrst3xcK8cuF1DuRzP4S2oeZnyx53
         w8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707145941; x=1707750741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAtfyH7WYSJFsq7ayVl0wx7lY2OmQX+GvDdrCwUtRsQ=;
        b=BXmrCd8hMTu3Qbyc9/Hrz4QrrGkaIkMnF5RtvCKBvjsygUy5myTDJug8BYWVydXX+u
         1XUJb2zkqgVxI2FfoGqXv2nKrYzz+e9pmH1PS3PrG3aVzuhHHIsR4vK0In4BdhaEFBui
         KoxCa4GPZPLFx9stCC/wRuCiqJVzOooiENFrPvfitGGl8wnyKWu4nw6/s8kccjpBeCEt
         ZIze/Rskghp/yu3dG5kDlLYucBioK+Dv+1zQ5yVggmWz1+UQIfUQQF/zdNKrxP4ESXzG
         4QX9S1RSbcKG+OzIYomDmyqQO8UPornmHjC7o6+Sp5Yt+qcfoPXUeNnp7E8mqzHNpQaW
         IISQ==
X-Gm-Message-State: AOJu0Yz5c/azvYmUUTAr1L425qPQ26pKtvmtu/3Y0ucVWhvxLG87ynAW
	tyTjVaLa4XiM4/fhh8v4/pY0IksCyFS2Tdt5kq5XqNBXq+zBRDh8oynzp+1J
X-Google-Smtp-Source: AGHT+IH8y1SHcGFG/Wa3uTvWidGUze4Gb5qCaldVDittp7BxuA2MKMYZM/ioarywwZq7XPOFfryFhA==
X-Received: by 2002:a05:6512:4011:b0:511:4995:c196 with SMTP id br17-20020a056512401100b005114995c196mr5238955lfb.59.1707145940511;
        Mon, 05 Feb 2024 07:12:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id hw16-20020a170907a0d000b00a372330e834sm3792170ejc.102.2024.02.05.07.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 07:12:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] file: enable additional internal compressor support
Date: Mon,  5 Feb 2024 16:11:02 +0100
Message-Id: <20240205151102.512785-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205151102.512785-1-alex@linutronix.de>
References: <20240205151102.512785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 15:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194948

This is an extension of
https://git.yoctoproject.org/poky/commit/meta/recipes-devtools/file?h=master&id=52a31bd5ba90713af82822047c3813afc31421f8
and the rationale is the same.

The issue was exposed by recent ptest support in xz, which packages .lz files
into the xz-ptest package which resulted in reproducibility fails:
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240203-fdpg888c/packages/diff-html/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/file/file_5.45.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtools/file/file_5.45.bb
index 8477668658d..fa8dc576dcc 100644
--- a/meta/recipes-devtools/file/file_5.45.bb
+++ b/meta/recipes-devtools/file/file_5.45.bb
@@ -20,12 +20,12 @@ S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
 
-PACKAGECONFIG ??= "bz2 lzma zlib"
+PACKAGECONFIG ??= "bz2 lzma zlib zstdlib lzlib"
 PACKAGECONFIG[bz2] = "--enable-bzlib, --disable-bzlib, bzip2"
 PACKAGECONFIG[lzma] = "--enable-xzlib, --disable-xzlib, xz"
 PACKAGECONFIG[zlib] = "--enable-zlib, --disable-zlib, zlib"
 PACKAGECONFIG[zstdlib] = "--enable-zstdlib, --disable-zstdlib, zstd"
-PACKAGECONFIG[lzlib] = "--enable-lzlib, --disable-lzlib, lzip"
+PACKAGECONFIG[lzlib] = "--enable-lzlib, --disable-lzlib, lzlib"
 PACKAGECONFIG[seccomp] = "--enable-libseccomp, --disable-libseccomp, libseccomp"
 
 ALTERNATIVE:${PN} = "file"
-- 
2.39.2


