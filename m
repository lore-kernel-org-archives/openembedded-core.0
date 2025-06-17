Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A43C77B73
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.31266.1750195254546609458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T5aXIZrl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74877ac9d42so3880369b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195254; x=1750800054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHGSg8qpJVlw3moiuxMKsz+F6xBZ/WFNzgXiZWZ73oY=;
        b=T5aXIZrlDSrqAjJM7ClZ7l2tFlroPqMoF9jdp/SJPvPuJkKxtnJbpWXfJR+iGUGfJp
         Plb02pBKm7lVS1YhniwhlrG9GyipkMn/W/OhD4v/qhZTOXA6oKQ0IKZ+gIFCOdxb0HIK
         0Y5Y+lJF3oXW9ixiDk2v3QXFi1sGVzGrI5888kqTu6QWdq5cwqEhWWpcLALvfh2WLgsG
         y20WnbA8dWBeH3GnxMf5nrBalTAVGvLk/Rts5ipQ20RVUf4Kn5g3SJpYYhmjmVM9a+iv
         LnBQqqGdrNWDBJK4TtT2COrGZP82+4qNmAf5mvUBtccXvGCVr2/Dn7jNpmzvA4SorjKt
         Rolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195254; x=1750800054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHGSg8qpJVlw3moiuxMKsz+F6xBZ/WFNzgXiZWZ73oY=;
        b=t8SrhIjc6gqsuM3Wj7hetzAnerUKGO3ZEaBUhslbEzkVIkYkLXL67DyipDxh0hGpvp
         /mfmc+8VQSIiqV1OI1OzuoCwasC31zzH+L6vfwkNMBnlgh7YcQ24ue1DZew3sMHCOYUf
         wno4ybxVI2r32/U0FMecczz2TtUGfq//GrnLGakEl5klZNgQyrFrlx3+ZFCHPMDatTop
         RakIqc4Ck5R/KYEEYfOow9P97uvp4NntIIkZ467MWkawmG1h0YnQeM41gisonMQ4+icN
         bzu1XNPF7LwYe1EzQPd/d7ae9pQSWjnJTb6utE20LzSN19l/x7VlB6jRFifabx7E7vc8
         IrMA==
X-Gm-Message-State: AOJu0Yz52xJxDj0Eiql0BkcMas1xsIh3BjgZHxDNsFKgbYJnsIxRuHka
	TdNOZIhRK5gajs3PoIYcejPpSeo6D+6n26OUsTBfXBzzB1/bdtzlLtXupNb/NC5WAvNt1xHbIwN
	Olm/P
X-Gm-Gg: ASbGncuoe4IbgJcJy6RMS4TfyLXoswzgfgORfGiCFGZCkjoTZljPys6/rEMEUVMoR4n
	0XtdY5Eu+brQB30imvec1tTtfy3hhW2dBk+EdoyzhG5xlh1BY6hC/LcfS5ORCyRVisA8dRxC+J4
	bIEzh8MjAGoGteng+z/OGQTy1coty7jdjmvo2OtIZK0+mQudKaNjqn5FKmdtDmPe1rR3vpvukq2
	XvzHFQ4swMy3FQNY4MY0UhGKGgHprF7C4Ts+Um7GLaDZCu9kfttpOdgLbf8zQBmWFGTzb8f0uGj
	Mca9ICt64qk532mgufJX+AOhWpiShPqWIAkgh54yF2aiiB0iFdVqbQ==
X-Google-Smtp-Source: AGHT+IG3tPcYdzCqTJ9Njrz4uJ7OurXoHGjbwJDUKifhATbIFlBh7AA6h5ZSL+FOqo5DZQ46DPDCRQ==
X-Received: by 2002:a05:6a00:22cd:b0:740:afda:a742 with SMTP id d2e1a72fcca58-7489ccee906mr19901423b3a.0.1750195253736;
        Tue, 17 Jun 2025 14:20:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/27] ffmpeg: fix CVE-2025-1373
Date: Tue, 17 Jun 2025 14:20:10 -0700
Message-ID: <99cda92e387ca071c4235c14a137510a4fb481c2.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218930

From: Colin Pinnell McAllister <colin.mcallister@garmin.com>

CVE-2025-1373 does not appear to affect ffmpeg 5.0.3. The CVE has been
added to the ignore list.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 4ae444258f..ae257a3926 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -81,6 +81,11 @@ CVE_CHECK_IGNORE += "CVE-2024-22862"
 # bugfix: https://github.com/FFmpeg/FFmpeg/commit/9903ba28c28ab18dc7b7b6fb8571cc8b5caae1a6
 CVE_CHECK_IGNORE += "CVE-2024-7272"
 
+# Vulnerable code not present in any release
+# introduced: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/19f7dae81ab2c19643b97da7556383ee3f721e78
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/43be8d07281caca2e88bfd8ee2333633e1fb1a13
+CVE_CHECK_IGNORE += "CVE-2025-1373"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.43.0


