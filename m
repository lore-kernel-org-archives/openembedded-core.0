Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12CDE78D7C
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43994.1770629375580962415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FX5l/Qwp;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43767807da6so799418f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629374; x=1771234174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4EP/9HXbj5RlxSqggAV/KV/48k+3gH8qf9ermQljI8=;
        b=FX5l/QwpgqF5i2FJ0YGckFIVCgqreChvpZG+KC5xIq4KRHOdaDv4WKiM3fFmdrg6oF
         /+w9XBt0a2RHDASXSH6C0OPkzyN2M2MizJkIk332w50gB+ZqApZwc3PFtB8xqtZt+8/g
         67OifeOnhCJmOcWdoY8FLqzoDi2hplHRz4Tq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629374; x=1771234174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4EP/9HXbj5RlxSqggAV/KV/48k+3gH8qf9ermQljI8=;
        b=XXvCt0s3ijpk2LIGg4oepKDix74GqtoDJmGymsNezL/N41QDb9NpuTJ64z+wKQ/o2n
         N9PMtj2Ysj/xJwt9Cj89vN4aMwsJKNSbcfy3KI6D0EUJwZUPQl6OiYOa1/DqhESnDHgq
         zAbOjVGgjCw3MuLIdui+fAqdpKzq/1gFrG6dhyMazC2FG9kjJnFn3EBUlJQ2rYFI+Id7
         HOX/tcWSc1ZDJgmmlT/TiqyugyN9/vydYafUxBXpCH4Ez9cxqbeaSc7rXZcf/04F8b2D
         CCZ3l67J3UAqySGXP3bIZggxD7g7E7g0Ebf/DsmNB+RqdBe7RZkw39yjQTA33CiG9pI0
         2gLQ==
X-Gm-Message-State: AOJu0YweReKftHD66y+/N6mVvwxZt82e7Kl9veiiS5M/1vbf4WXXYsDS
	T687HZn6jZxa2SxuYf0Zppilz5zlUwcqDz2haUq2hWlp+uDBXhheP5IxbgXB0W3Y6+p/0DfK1er
	JKLoZ8D8=
X-Gm-Gg: AZuq6aKDi1HWAYHbrKcT0lMqX3wTg55jR02qHi1cCqEE/3G895MGWfw4zUHLsuHl0g6
	TCbzrRNBeaV9slcGheg1qsF7UMig460rEQ1tu3r9K4b9H4O+inegmGwKXADXAxlXSNuYweoXczf
	YdP7Yf1bRQGVBnTFKdbmBqmLnRAf0syUpO3CAtZBnzyW7OS32ACa/UkMit1omLmFZJ0qAaTFe1V
	6YaNC/yMPgJdoKYWxki6kWC/eTazmnhHEF0XfOQDJj6Zjo6HGjh6CWyy9WHzRRMYEH9bLuAHs00
	vsba6zEsWWWXQxlgyBdLubm9Qs9ilPUG1qEYsBj3eVU/fuw3Y2LNdUxFyI7FdmjNwIX7UcNm6IJ
	mcfVW1sHn4yJnEl9qZlPu94cgufccsumLnhcLrXGxYD2ETvtEvePjjAO1AnNu3dD4b/UGUtIAf7
	W7Csi85GtJaNQ4rizDoSlaNM2w99jtkeyU5ca/vv2babCkpeR9AwG3enA9DJINQbPTy8a8pZBAx
	8wo+E5JjgHqunU=
X-Received: by 2002:a5d:5e01:0:b0:436:1a4b:de36 with SMTP id ffacd0b85a97d-4362923f28bmr16935816f8f.22.1770629373537;
        Mon, 09 Feb 2026 01:29:33 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/25] ffmpeg: ignore CVE-2025-25469
Date: Mon,  9 Feb 2026 10:29:01 +0100
Message-ID: <33f0c3a70be9bc4a885622b8c033f9fe1bfeba3e.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230769

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-25469

This vulnerability exists in IAMF (Immersive Audio Model and Formats demuxer)
which was introduced in version 7.0 [1]

$ git tag --contains 4ee05182b7cccfa6928dcb0a45c2b50b7d9ea39b
n7.0
n7.0.1
n7.0.2
n7.0.3
n7.1
n7.1-dev
n7.1.1
n7.1.2
n7.1.3
n7.2-dev
n8.0
n8.0.1
n8.1-dev

[1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/4ee05182b7cccfa6928dcb0a45c2b50b7d9ea39b

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 8b0b7cfd6e9..c1536015d98 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -51,6 +51,8 @@ CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
 CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
+CVE_STATUS[CVE-2025-25469] = "cpe-incorrect: Current version (6.1.4) is not impacted."
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"

