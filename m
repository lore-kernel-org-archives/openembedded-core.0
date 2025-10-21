Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3769CCD1A5
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 23:20:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.639.1761088829924221159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 16:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AsHxu5z2;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29292eca5dbso36184735ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 16:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761088829; x=1761693629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1UVlbqo0YMUFIDzwARbZj2X9thRaXo91xRb6/zy9JTE=;
        b=AsHxu5z2HmmoQ0kOyOGMBKYgNBMR38J5xnXQKjDL6NkhtAwANmICCa8qnKOwhgNzko
         YhzJeC2DsF/BRiueHTn63+yE0/+NCkR4D/bhC0PuXF+uD60cLDCxQWKi6WLnWrEaFQsW
         W2j4gqyDy4XGI78MRLXq3Dzu7Y3kU/NzfItCQKKBVTseqUkiFxB03aVPjD9ZQiSTtU0q
         aconYMoKI10a6gnv7AvoSZbXLgWkjvx9KqYfweyHqBRes8AK7K9FYZFdQjQomMBLZi7Q
         pFToarG7xKhv9kFIuP6sUJFu5laNNOfdKNxD7M5ZyAwVo+KCEqkr9H5k70v5EbLYMGbL
         fSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761088829; x=1761693629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UVlbqo0YMUFIDzwARbZj2X9thRaXo91xRb6/zy9JTE=;
        b=DS58Me1BTTVyvhm6Abt2mMC0ZostarNNvIYPJ0OFF145plsRzFYbq+TLx5fiaOEcOu
         LJURULMv6Qit6pFBhSXQxFHBguEQASdyXUUSuHhSpcmwbnKz722TLKiPuhQGMRgT6dE7
         j6d5gfE8yo5OqcwgHYmlB3OgOU/VvdexXWq2opxjiCdIh5QsH54BUxqceshsCKxWBWXv
         G5MhebwwkdIfMoyrkbzHyW/kyUw3JAnLq1i/JGOXayJ4ZCaD6QDxhwxjmEaGmK76Q2aE
         7Ll0wRGEDyM+gDaEBZqUgmPsI4NQ7d3lFcrPNcyBfnwMvEwY3o7vA7gVxW7GhdRKr+k7
         WIQg==
X-Gm-Message-State: AOJu0YznG4Txeh6bcgqRh7Axp7IgA3kGmFWxiz3jz47A8A5cIzmm7mpb
	zrLlzbg4tC96ku2/mS1TOXzUbQFVYCbHc7FQu6yoLVjjJzPNxBNFOMIMnijggw==
X-Gm-Gg: ASbGncuAf8qkgJ+5d4s/gFCrMnZOX2g2h/PPztn8HcFEUNGxdKW3MxqUbrHZoRO4P19
	AIJ+95GR0mkUw1MgHAAl2HOs05qV+m7wvrmt5TQiZt1y4aDVSLif22gu+hYKvrxMZbIOjWEfKBW
	DR5kJKZnhX00dN0lp2z+NuFgqLRe6lKs5z2WXcqc79LPdzLpy5zReai1kO3/eiY5PoMC7lNKeM8
	97wmLBYM7c/rQaJ3uTym14HlLUVtzUlW+dmkV+7yJS13GIHuBx7Fx4GczkuAzZk/pU+f2TFRHfZ
	sOJbQCG/+0/IV6QZu7evWnx1jSMH5mQy7rpFFrJD6Ej9wMhGoCVdSNc/cxsunIq5yeWetVsuejs
	Zha2/XsR+1QUiahu7EJ2YQrGi+kCXNyw4gQlOpasOJsRZMY/aTHol5F8MEZE8zhvU/QzZzfT8Dz
	2RI5tCS/VU2a99cg==
X-Google-Smtp-Source: AGHT+IFU/vpgdkoasnvMwHdjUAO2R8L2PwzyTYJFPSKeKbatbM3mMFFe58hnmlwy7Adw4hNnmWdvyA==
X-Received: by 2002:a17:903:15ce:b0:290:b53b:7456 with SMTP id d9443c01a7336-290c9c93d46mr220746805ad.5.1761088829079;
        Tue, 21 Oct 2025 16:20:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5995sm121153865ad.70.2025.10.21.16.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:20:28 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH] ssh-pregen-hostkeys: Limit to qemu machines by default
Date: Wed, 22 Oct 2025 12:20:16 +1300
Message-ID: <20251021232016.585950-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 23:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225165

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are potential security issues from using pre-generated host keys. We made
the recipe available for autobuilder testing purposes but concerns remain about
how easily this could end up in production.

I thought we'd already done this, but limit the recipe to qemu* machines,
which means any real hardware trying to use it will need to be a bit more
explicit about it and specifically enable it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0405972d4fd6fa12f90afea5ecb9a50c01c21c6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
index ddd10e6eeb..e6863d9bd8 100644
--- a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+COMPATIBLE_MACHINE = "^qemu.*$"
+
 do_install () {
 	install -d ${D}${sysconfdir}/dropbear
 	install ${WORKDIR}/dropbear_rsa_host_key -m 0600 ${D}${sysconfdir}/dropbear/
@@ -16,4 +18,4 @@ do_install () {
 	install ${WORKDIR}/openssh/* ${D}${sysconfdir}/ssh/
 	chmod 0600 ${D}${sysconfdir}/ssh/*
 	chmod 0644 ${D}${sysconfdir}/ssh/*.pub
-}
\ No newline at end of file
+}

