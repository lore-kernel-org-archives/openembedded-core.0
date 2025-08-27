Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D16DCA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.6596.1756330201446399299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j8/Fi4R7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24457f581aeso2594635ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330201; x=1756935001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjyCOYNDpKAmj+xl0UqvdmT5VX+iXJn3K4VkoZifoNY=;
        b=j8/Fi4R780oRSl0fX4KkOJvCaOvov+jjp7iXS8Isq1/IbzHqtuSzzIKfWaSseIhdYp
         wBtqjXuZk3QME8t8+4NXICNux0TL6ZwoYCVNc6CEGIvDCIqYYQns3w1Wel3hW8mvEJVc
         qGXibYIfPLAD0L5RLT31XkIF6AUwHSQNvq/rhvUKrGL2iQSwahdBAqzhOXDX+ja2lyeQ
         YycSxeWn/FgEVQou/leRxPDF+Jsxbxs+833Zc3ahYiqxza0jmJFca+U4qP4XTNv/AFVX
         3KzwR+SHD+xGsTFriIyOVsgaK1QKPDfXrlDY8NgNxLrVpZKl2CSu3aHaVl0gH+plU0UH
         R66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330201; x=1756935001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjyCOYNDpKAmj+xl0UqvdmT5VX+iXJn3K4VkoZifoNY=;
        b=vnI4Js64EmJPWiC/9h5XKqW88vzNHjvhRz/b7SG+W4q5Ux6l3VYS8B2MSqfq7Ua2+L
         wdjdzngjbIXcI03zz935bG7PwEZttLAYLV6+BcMzWgZo/Q4a9591Jtf0uEE1Mc8KP+jo
         2S4Q5LWjTnkiQxUwtk1Qs+GVNDq3SnQeJocfufdKfxVWCCEMeQWRJXBG1bCrziUbANOf
         w56sI+nTurV/JKWZbuTl7QNbcaEO7l2Svot0w9OcAYRkNh+Awx60LARFihlMxYJpVNMa
         pQLHd+3/xICazaVAr3pJZ50AX+DQH8FDswjIxHd1W1SDceB+ZWhBMahP/NqLT8SLepe5
         Nnxw==
X-Gm-Message-State: AOJu0YwqVtU1eSiXl5fa8dUEaqJrjF4utFXBQ2N52tWDkSmUDDUKIFXo
	F/j6M5uBJxnfsxjL+q2wEnsmLf6+pdRiZfs9pzVjdi2LyPuMR2xtRtyDosdlGTJovDireKRFTWq
	lfusx
X-Gm-Gg: ASbGncuosawg8PEU1qNWKcpdvKPYb/mW9j6U7a7jFTOh6Zlbic8hJipIEL2WGspBCVN
	6RyS/pBBaj7KM/yvQVsqSpE6lZjhL3pP4m9bpDr7KO8B8G9KVX0pxQLfhJgkPc1E7EWVQ3c+Y0V
	rpVQcX3MM6WOof0G5VbPFkO32DDTFthHQd3Tu/BF5SWMjAn97ydCphk0mJ2mNV7hq3/qRxfpuss
	mM5nMFbRV87wimpWwraKoWyIwKM+0KibKfUJzqTTSInKBVZ8xf4fp5eo5T2IbL/+iThFfDGq6Rb
	iCV9zlYWHq+zHGiXJTti9Iq2VtkSJupp4itSrxIiGqMS1HTUq9M78wUKahYr2rR1AojR6Uw7oIA
	HcIJYNorqXBfM5A==
X-Google-Smtp-Source: AGHT+IGsGhKsffz1nyf0jpq7G/rNVIH/WINLlDmeYaGd9d8AIvQIBSrmwdMWtOorjXA3Qku+/E50eg==
X-Received: by 2002:a17:903:11c9:b0:235:f143:9b16 with SMTP id d9443c01a7336-2462ef73b86mr278770565ad.41.1756330200716;
        Wed, 27 Aug 2025 14:30:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/33] qemu: set status of CVE-2024-7730 to fixed
Date: Wed, 27 Aug 2025 14:29:14 -0700
Message-ID: <d05df779286288d1f8b69159ebcfc45a853bd23b.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222515

From: Peter Marko <peter.marko@siemens.com>

This was backported to v8.2.7 and also it is mentioned in commit
upgrading qemu in oe-core.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 38ed637b93..220f0a161c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -84,6 +84,8 @@ CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
 
 CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
 
+CVE_STATUS[CVE-2024-7730] = "fixed-version: this is fixed in v8.2.7"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.43.0


