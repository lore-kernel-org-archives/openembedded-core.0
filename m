Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379E9CCD184
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:21 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.2348.1760064671335248290
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E7uJbTGh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f605f22easo1474199b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064670; x=1760669470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb3qiW23ytEPxNJjRB5+xtaHjIT86yyqkGn260gGNOU=;
        b=E7uJbTGhQsIe9HAq1R/4nYZmFxomN2qzbFVon70gjGugBz4iBT721VhmPkNRdyAiWS
         YoPusd92yWywuOCLMei+7p1L/ZUWNGSJDacj0kBd26m2gKfUB0djxZ1MZSPBrYWIj/oC
         uh7a85DuPvZSfN0a4/2+gx8Kvk9L9//N1s0h2xS2zgAMg98a77c0bGPFbX0pmkjadDO2
         K2RJ8aYc+uu5ueHngKmKkekRySrLGzt9wElzoUAxYifHxg8eyOr4VwfzjTvpEkOm4CMj
         +XnLl9RJPH8NvIKb9im+m0XFfM6eI+1NctL0cRM1hjMXqtFlTgBeAi0IyQmlQm5ucuZ+
         4cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064670; x=1760669470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb3qiW23ytEPxNJjRB5+xtaHjIT86yyqkGn260gGNOU=;
        b=oBNZMSxkSXUd/7Qca5cy9LrTNFLliJlXl1QcLxfUk7jsh5kwvPoend4tOHMHvKfcQn
         heF34glLQ4lvwrfVnjYF2hJkH3SVbj0IbDnP6hoJ2pkvTs99ABn9ntZ9pRuwcpZYQyyO
         s7Cw7WtvR7pSBxd/9KtL+yCd+0OSavzIEjuTt8OQTV+L24T5cCwhq1v5+i9F72d9IFX0
         Je0ZfF0OaUbeu28aMFoKeVepdyknB7KMb4f+Pvv9jRjR+i1WuFo8F8CqastHAEhJuwJH
         sYpllf3D6JimgKPBHlZUsm4T2CL/Hkpf+CTDbIhlqROwxMZaGwFfdf8d5ZNFbJzzEuWY
         fEcg==
X-Gm-Message-State: AOJu0YwIcMpzA6TP4jxX3cYpxtLe9XipKDlyFAls5oY5lLleDSnQ49bL
	K4Q6c0Y+70rEudeJ2ck6vZkLdPVad7PuNpA9bJrXVsJhYACveqM9VD2Zf57JJHvgzxhZfLjghf3
	XlYXv
X-Gm-Gg: ASbGncszpzijxQcfuuP3dVlrxqw8SFl87srV1E0M4KaWTEd5b9d6gsap99QaYpRnD0t
	Kz6rzITmbgCuHHD4V/IzHJoHyiVAYyPoemXjidkfvYNu1e9pX8FnbsuMYU5YmVJV7JyCaIPUpHa
	EUP9STohbrT3v2wsRXe61S/ll7mFAsfPJOj/5coNGlehrF36vmUT15nFFVWFrn/Lnt2nky4zdWI
	XFRCn7Mjgh5MIoXcKwZcbcxzmSr4Mw0qw49buDRX7933MIcfvG17guugw+Bya5TUbBH/7OMNj9+
	LkoG/kHHyx88NTAWSQnsAmbvJMzshw/4rSUxwXbkPPYYcpDFvRIzDj2DoYAStChnr/58PXVtIAK
	/AhXAb4lOACySgKptjN8nf6A3w01nMTW1Jar2iA==
X-Google-Smtp-Source: AGHT+IG9flEE2qwRURs6lRTaNhhTp4+xobPpKcw04s9jGxM1i4TixG0tQm6LfRwRI3k4gA5JfeGWwQ==
X-Received: by 2002:a05:6a20:914c:b0:243:a2fa:e526 with SMTP id adf61e73a8af0-32da81521cdmr13324431637.25.1760064670580;
        Thu, 09 Oct 2025 19:51:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.51.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:51:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/18] conf/bitbake.conf: use gnu mirror instead of main server
Date: Thu,  9 Oct 2025 19:50:35 -0700
Message-ID: <6f936359ac954e35fee968af8206334d03cb32e4.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224660

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
index acf4e2d153..e20b17fad6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -703,7 +703,7 @@ DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
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


