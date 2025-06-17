Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C352C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:43 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.23243.1750176277946726471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GQqIS32a;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b170c99aa49so4028157a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176277; x=1750781077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ID+hUlpX2z068ZnmgM2QXwCZntNcEfBsWS/ijpL3ug=;
        b=GQqIS32ab2SP5Ub3uR34VTqWUH4VJsiPwbNeHjwjkzcMqdzW6JbDUaUPmhXFC1gghv
         9y4dRtKxqTmkqd5TeJB6XloemaCAe2AskLR92UOrC9GP9gDAegX86JoUXEggEQ+BYAJi
         juYJGyLyB8x1ARDNfhaTkDdEQfwTDhg6qJaxNQJZf5E0ZlHa35dDg0fWFJ6zfOdv5efs
         w3xwMRpuMaMcLeJHeoOAIq9bI6giaW4W7n9K7eStck59jb3W2nF7sqiXb54Hc/7Qa6jh
         Kf1aM/3WbTfZ9lDZPGXyQ/CYLFRozfe2l9VstzsRwKpVWkXewK14pnPPml3HuPoPQL8D
         B1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176277; x=1750781077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ID+hUlpX2z068ZnmgM2QXwCZntNcEfBsWS/ijpL3ug=;
        b=oPccGaBuC/wOCzL+meGUvOSBsw4VKrUjJwZBzcvvXmPzHA6sNJ2YfW7kyFrLzwPsfA
         OLePWnV+5ki3kEFueyHkGSFt9KeUwLSmVgqalo1b1eZxe4qrJwBdyTeDPgCROu4N349H
         +EIiw0y/lo2tp66EZWNtGcbUnZ9qCcpI8Pzt71b1sF47FrP52B/ZrjLxs9WIJJvsPkCB
         TGVz291lMx6LWQGH55vBUGLKibalV0xl4xL+Dg8+wQ5Mq4tY8ueYnGtU+zgawBAC5P8d
         hX+t+SrE6fYR8P8njbl/KwKTWZr5DQVyxnFHjNAiM4NpBfPgofGOAutQReoIuatWbOMN
         bUdw==
X-Gm-Message-State: AOJu0YwTLpyScAvnqbnwkEXEUCFKwQ4dcIZ3cXwVWEucO90u+dGdQcw6
	8sdnVKUOgFKdmEYcucQJRzVKseJl8h7ektzO9viIQQLsz+z8gg2Run2Tg97Mm7SjTk7B6GbvafW
	7w4in
X-Gm-Gg: ASbGncs2p5FENvvw10153+gfEpAIINjNrfNocJZq+Vk5j6zaOxsVNaQH77CCnGkZCdb
	OvoENmzlzdCvwPC+J29xnzM4x2jnYZyXygRDpKT+HJ0nXhynHgc5o52SPkz/29NDzudP5nH511e
	BSmDbhPnQthlCtsy5m+LPF6fjJ1HdJkLFSJyRAblxA1ho+qi7aktYJWi4AHjTS3i76GC3OmmtNs
	WmflF623IwPn/5opm3VygQyLQCKciqcauccFPST6tfX3pAlHkDCfUoFkZyHhSmVz9B/GYDkxms6
	4icmIjz3AtpIE4y8VdZ6b4Db4mU2ZdgWMAWI2weeHlHyNCosZzlUrg==
X-Google-Smtp-Source: AGHT+IH8goKKvmc2BFapZ86tG3ov/4SSZOpMu1DglAL+ZGEggvV+kYDL0sTpJJ7ZsjzoXFZVBqd9Uw==
X-Received: by 2002:a17:90b:586b:b0:312:39c1:c9cf with SMTP id 98e67ed59e1d1-313f1be1c89mr23189303a91.7.1750176276826;
        Tue, 17 Jun 2025 09:04:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/8] ffmpeg: fix CVE-2025-1373
Date: Tue, 17 Jun 2025 09:04:20 -0700
Message-ID: <0ffe159d9a4ee434b4c995e1ca9a85b01e0a5d05.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750176125.git.steve@sakoman.com>
References: <cover.1750176125.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218903

From: Colin Pinnell McAllister <colin.mcallister@garmin.com>

CVE-2025-1373 does not appear to affect ffmpeg 5.0.3. The CVE has been
marked as "fixed-version".

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
index 04356b9932..a789980dde 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
@@ -55,6 +55,10 @@ SRC_URI[sha256sum] = "3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63d
 CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wrapper \
 (Java wrapper around the FFmpeg CLI) and not ffmepg itself."
 
+# Introduced: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/19f7dae81ab2c19643b97da7556383ee3f721e78
+# Fixed: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/43be8d07281caca2e88bfd8ee2333633e1fb1a13
+CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.43.0


