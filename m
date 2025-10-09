Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AE6CCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:59 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.9220.1760038311704927795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gI5kxKih;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-782bfd0a977so1196578b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038311; x=1760643111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kE/0gKB6HCzCXW4fYE/jjoez5i4aEj1oHD0XShhDf20=;
        b=gI5kxKihv++Njmq8qnGpp309e1XqDWCBXpaR28w0xJhG2EwjOk1Mki/hzD4osfhyko
         nLXTWv2IuM9toT3hZFw3Bdkdj4N9k6zTATumSCy++fNt3yThQ4lFI67zUCFMqD5t5huL
         oHOe+b+Nb+LQwLOgXUFK5M89xo8YwE9FPn9kxbfaPXMEwDqimxAURiI3AlmDZw+ya/KR
         rZ874F94NQv0pGbcYcLnjSpwIH55a8WKL5kCyW+LIAzAq65LR0u0TZjcvRmzwsxDwttc
         K8aZu0+b8vzEzrKfH6nMHiZ18crElGe3Que66EXzRHgYniRZyscA39EG7dsUkIl7iBeF
         eakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038311; x=1760643111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE/0gKB6HCzCXW4fYE/jjoez5i4aEj1oHD0XShhDf20=;
        b=eYIcCJOBigam2zGLVFBtaxRsbzWE72MUCspAOZ+eiV8uRCLk6hb1jvWOS0nXPpA8+u
         jMJO7BZ7O4DluPNyA9QOKSKSUwFpBV4mDZ1Z5fc+k/+ifFVa6azU3X4QsWFrZ7Rp9wBJ
         HpBhNUqpjVGXAVKilvmpg7raMcZ5nADY+JBcyly+xlM9B1Gju9CRlifhX7TFpylvN6e6
         WBSxlcN/msrXHY+OJIGB8MEYbTdykviGHspvjBWx/9+933RkGG5DlV8+cmBaeccAyzGM
         1trwc1HQj/zMKXFX9f3gGzVPksWmz+KpO9elmZK0q4UxpSbozQoZPhaxRSUDRKBLLDBR
         dNXQ==
X-Gm-Message-State: AOJu0YzRz5+i0CryPXy0Ar9j7814Y5w8nRUd6Esu8oTgF6LbQDEAFxif
	6fPKnQ0xtj2D/s+MRNMoYoNKYpz+bxvpeMzvngEmXuBdEeY7E6kXqCOTPFIjJ+jRUIWCkjhUbQp
	Ff2Jx
X-Gm-Gg: ASbGnctwcXKr386/s0JlWOa9dQQ1TfGQ5MfK7OvBiEUzWGf7/ua3twIYcBwzgSDRtz+
	eH8bgofXXYBA0OPnh7UKctWTN1oih0PiFwjwVWTHozXFskQSx7E+2JK8NisrN5Sgv5LsiB58+XK
	lq89lZyogl+CmOHaiWwMwFEe/BWpL3q8qqRBqczA1Z8I0QdmcMkAGeQxYqqdP7bBSo2vqYWrikl
	74NvOTPd54VFp1062Ob6n9jXDElkix7PqW28ZC2S6E8OtQFrb/RnXcner0i/4qX88tCU4Ipm0uJ
	TLZMmFL2wq0gGsJ26jspKs37evFxz2Vvvd0xXizlbwU8cowZMXQuDmIG6ZjztUfFbM3AFbh3Wmq
	mjSj2fQgKrhDf1fOho2iQD1KQgPVOGBt/xxfbRw==
X-Google-Smtp-Source: AGHT+IF+bbVrIiLCR7r6POtpCNwFTzPYyS+dlWs7JsMaRwhZrk7T524OABv/o1bJiQeQ30S77+rnXg==
X-Received: by 2002:a05:6a00:2d28:b0:78c:9c91:678c with SMTP id d2e1a72fcca58-793859f3161mr9113746b3a.4.1760038310673;
        Thu, 09 Oct 2025 12:31:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/24] conf/bitbake.conf: use gnu mirror instead of main server
Date: Thu,  9 Oct 2025 12:31:06 -0700
Message-ID: <8418289277056d582d88916b524b920a2e005c75.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224641

From: Gyorgy Sarvari <skandigraun@gmail.com>

ftp.gnu.org is the main server of the GNU project, however download speed
can vary greatly based on one's location.

Using ftpmirror.gnu.org should redirect the request to the closest up-to-date mirror,
which should result sometimes in significantly faster download speed, depending
on one's location. This should also distribute the traffic more across the mirrors.

This information was sourced from https://www.gnu.org/prep/ftp.html .

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8c6f01d7467e018aa0ed27a87850d9e4434a47a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 290dfda6c8..01baccec41 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -690,7 +690,7 @@ DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
 GNOME_MIRROR = "https://download.gnome.org/sources/"
-GNU_MIRROR = "https://ftp.gnu.org/gnu"
+GNU_MIRROR = "https://ftpmirror.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
 KERNELORG_MIRROR = "https://cdn.kernel.org/pub"
-- 
2.43.0


