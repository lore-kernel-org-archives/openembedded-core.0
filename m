Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397A6C3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.43306.1744018857096023742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/mgfszs;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so3801158f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018855; x=1744623655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OVd2enGqLzlh6UWUEavy6qFZnTaQGKKdAwr2RRWDEY=;
        b=D/mgfszsc2RsoOWnnshReOE85YXXtGKkDJWvGnI+VN4dnjAjYhI4tf08WuDq5t+P6Y
         EA9g1qUHFdaPCD7EG4dgNC1m6WTuuyZHlIHRJ722aUr3Hasim7ZMlfMT/LoB/FEenj5O
         xu5UpmcwkI++lX+J75+DMFpEUQjlJopBiChNQ8WY23BLeW68LqYMU3dNYpl0GTxSEEkS
         Urly59LHv0ZYL8nCoImWd2oRdYymPpeAlZFFo8TjWixLFeK3NCvNo25LvPCYuGcwnCkU
         iJjd6zdpo8acNCHEvNO5IW6gZDSBbzTpS8qrZ0bGtxU5gnXrSzU/Iuyd4vV1qZzTp33B
         QBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018855; x=1744623655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OVd2enGqLzlh6UWUEavy6qFZnTaQGKKdAwr2RRWDEY=;
        b=dLn66TPucggiTe7y6332vxh99rytdmcV9KZGpM97QjZKHYCx8lRT3zgLB8x2Yo40DS
         ineN2MU2P+JVesZPJYb2pw/YiARVWI+k1qaBLKuZlnVFRZkmkdnbRr3J9l5uteNLIaCO
         T6ljd7rPjqTxUd6NmqWY66vam/INQalH7CRdUYgFE/TvIJulAJDJTB7DfReLyplnu6bs
         /y7uyOS7ktVXi1Mso1nq6wSuDFxkdgeCmW5WOoWKdzscRAuE51Pg8/xGpcgklVB0wtGk
         S1AR4jGnW0isyJv18Y+Xlie8yStzHEwVhi+Yn78UZ4E01MNJyUr4M5Do8AMpTp6me+yj
         tH8w==
X-Gm-Message-State: AOJu0YzwrnF7coswvF68R/fycJHT29fHFdHJfMqK0f1lBBYqYwMaiXcs
	xRhP3h4H2OUeGiEFWjUVGHu158l+U64dKLZjfijUckcueNQZ7VY8WmlvHQ==
X-Gm-Gg: ASbGncuXcJWOFWTfyut1JxizNSwrabbP6nghtv+p8mkhp7z2uFscNy8Qs7sVHgehAyY
	Y+z5AZz56DHFtP1AyU0u+pVBFxn2BTtdifl/PxAsQyU0ArQlPWjz/QU42zZpjcK1K4qN/iEeR4U
	xUcjXh7P8JvPNg/ZaRm5km8lf2sPYEYsvo9hdizch1f8VmfHqaed6hCCLvDjCr/l+l4qbSlSK+a
	HxShMoLKI+WZt4KZ7fCYUhOEZ3yQZGA/g148U2+T4xKz/W4Y9MSpxCiiDuD69EkncF4KEvsgP43
	2YZ8lH35maZgmGPE/u3rzRi+es+gTuq2eVQ6XpfVdomW6Bd1DeF2+bzXPWIAK8AhfoO/Ooo4/HI
	l32CgCU1vbsX/qKYK
X-Google-Smtp-Source: AGHT+IFfBczxbBh2MLTeC5ZmdACBoUb3UC3zRCz2TjZcAeUeBlKJs2qy8c9TT65exmLEQJ771IZPIQ==
X-Received: by 2002:a5d:5988:0:b0:39c:2c38:4599 with SMTP id ffacd0b85a97d-39d6fd35821mr6835126f8f.48.1744018855181;
        Mon, 07 Apr 2025 02:40:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/18] xserver-xorg: submit 0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch upstream
Date: Mon,  7 Apr 2025 11:40:36 +0200
Message-Id: <20250407094045.753021-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214418

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...6pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index d1516c2f524..a196e507518 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -11,8 +11,11 @@ default it for older hardware for which it has shown to be better for.
 
 Others fall through to the -modesetting default.
 
-Upstream-Status: Pending [Debian/Fedora patch
-https://src.fedoraproject.org/rpms/xorg-x11-server/c/ee515e44b07e37689abf48cf2fffb41578f3bc1d]
+Patch taken from:
+https://src.fedoraproject.org/rpms/xorg-x11-server/c/ee515e44b07e37689abf48cf2fffb41578f3bc1d
+https://salsa.debian.org/xorg-team/xserver/xorg-server/-/commit/192254841ab79e102c18fc299f18af0e27d5b517
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1887]
 
 Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
 ---
-- 
2.39.5


