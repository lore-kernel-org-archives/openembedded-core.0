Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F8FCFB446
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:19 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.43997.1728266112363634206
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bwwvTbKr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e18856feb4so3306320a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266111; x=1728870911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUQ8sKNcr6J51EFWhugj2oz3Pfp1r7WuR2oYFbwpgY8=;
        b=bwwvTbKrmtRDX58pUydclvPbIWLOKIwO20vt5gIyrP8bPIVBi2Hg8QsinT27XXel6N
         Dz7/Ol+DDWq0bkO9MSsXNjL737UdjQY6Di9l3r7hR4CmmqqfMK4Bh1VbAH7bFK4s+ta0
         6088bX5Oe9yw7PT+tygYkItrou9XCmTJuR7vvJwfbgofjTEmeaB5vLhdZ29NHOlEWsDR
         lEf3MIp2IBNTHpABBHCffjjTZKN2hrssv562KDbqywM++pSpnGw0qBHb/IEmgAIeZARC
         DM/jITjyR7s5heQ/awWX2ICI2dEG3vUv4r0f64RQDhTqoAR17Vn2DWTa0kgfmuBPMTTQ
         hbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266111; x=1728870911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUQ8sKNcr6J51EFWhugj2oz3Pfp1r7WuR2oYFbwpgY8=;
        b=uPgyuJjLzHpvSQjqJ3fsqQQVaHMa708xXbjlamIjgoEE5dtoqN6s2irMJHFtgzBc57
         Ovl0eOFZPp7Z/kMDJxKRWn4Ma2i086q/FaJ9MMK9fkhDjMtXf5QR32DoWcHz8P6KW6cZ
         btd8mfD4aqdj9Q4j7liea+Bceh8Em5LdaLJXrrNPd5osNw3aH7n4kN8tYlJ5c8fcw6bw
         VkwSov2d0zDqV6bSfr/gyRs6z0tHFuQyuFw0LmRpSrQf9UCF/urv9EHwCbIV0m5odfi+
         4m2hQJIHpAcAG6DvyfW02GftqpryIEGiquREeAB/Wati3Ez5XLQ9gRXSmQ9eMq+/nAYS
         ycFA==
X-Gm-Message-State: AOJu0YwZPWP7TVVJKysq2CqRKYwz0VBWfqt8rCDOkRDYnLfjF/ICmg/4
	OA6fZ8BLdZpuvOmV4LioKvoQct6bzonUPz8RSmp/I3yhYrHwwnlOvEaD9Kt8QnbEz5zY4SyZqEh
	qCuk=
X-Google-Smtp-Source: AGHT+IH7pXMmBgBzJyybdMUmxfQwP5HCXmT4+zY/+rHkDltqBFT9gzU3hfuEe7rUp2FmYo112krGQw==
X-Received: by 2002:a17:90a:ff14:b0:2e0:875a:f72d with SMTP id 98e67ed59e1d1-2e1e5dc6231mr12038816a91.0.1728266111594;
        Sun, 06 Oct 2024 18:55:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/10] gnupg: Document CVE-2022-3219 and mark wontfix
Date: Sun,  6 Oct 2024 18:54:54 -0700
Message-Id: <1bce8a63edd93070bdd8e8a518a6d359e3fbf0ba.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205249

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: f10f9c3a8d2c17d5a6c3f0b00749e5b34a66e090)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/gnupg_2.4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.4.bb b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
index fff7d8c6da..ec75960235 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.4.bb
@@ -88,3 +88,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 lcl_maybe_fortify:mipsarch = ""
 
+CVE_STATUS[CVE-2022-3219] = "upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993"
-- 
2.34.1


