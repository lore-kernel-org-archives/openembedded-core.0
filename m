Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8D1CD8C89
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6141.1780698868332087974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lRfBSYkN;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so14461405e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698867; x=1781303667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BI/0gehz+vMlLlM4Wa3QyA5nDLpJbb3Tmj+3BLe2+cg=;
        b=lRfBSYkNwAoJN9m2csTqkP1UvZnUOoEC3+UvkSiaOgSbYJIulhh2ytIlp4MCNykw2/
         B5AF3Jk0V6ifvZCXRVctDKg77P4a7O2c7JqacQNTZGmHVNcez0yCM9qhBXU2jYxSinoj
         ou8FMVOQa8uoaZmMncaXaBLxecZ2UxqihYWhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698867; x=1781303667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BI/0gehz+vMlLlM4Wa3QyA5nDLpJbb3Tmj+3BLe2+cg=;
        b=mWwQirxisHtYJ7IL41GIVm90p4WhVbIWzrcy3m97HmJyFwHGfHZrBVHK1PSq/pVVI4
         PvE4qOromYxEbypNY5Z8W4kT3skqVXP22VUmHYRN7yqhwi4p9eWasF0HTUgeK+LC3oZW
         T9CZ9gKNR2xEAvktVrBUM+VoADdz6tuOQReF0IeohuS7LqVn1dkkYjSMj5zP/1Ik45G/
         V+y/wCE/Blft3rgRI1aVcSKw6O+iIB3kiYn1/hs/D0N2A+8OiJ2p89VvoX/I3saxe64C
         1SdXLr+w5foJO8cp3a/RM3tcJ6W42lc5DYgyKNA8MY5npUh6rX5JN7Ek1V5SD0qwMntI
         MIjg==
X-Gm-Message-State: AOJu0YzFbdJlt0Jg4WeYl8qqqGac9tpmMl8lSGTYLYt5DiSxemR7L0ct
	qsYfIeQHuEmnDx9C/Yll17RvHjFyB3NVx8uI8SDsTNjilc0ervppHFOqObv8k9BMVEwBHp3XMcr
	v0CQi
X-Gm-Gg: Acq92OGRnz9WUNIgOE5TQkOfuYckQyh4s5ta7B5hFPWdOvO2EaDfIXFC7+bL/b2VAQU
	EVcemkTGL97T/aU/AJVsE/tDlTbfK+l23QGjJpLX2r1Fz64LWQKfWbH8DTFvq/kTUHNr0tOcdXu
	qiE/chLB7tVlxujmVPzVyMqK5XFiEGLTqLDBNxC+GeUpeY9YXUYjRBNR7gj/i1PZjni//OalXJD
	rzjYCoZo6Wo34pthnIzrKlMihxBhNRimGISsrLtUCPHklYtWMHLz9TLO1QaUSBG7tojN5+1D1Ol
	A4H6gmYW1IJfAuXMTcpprIGTGY6E477fjDpNMd6VQziNS8MrKsizbjiGb8v2eQzutoYTl9iJHHN
	j34RWGZvdIlT8udqYYLDC0Y7bc6wEmSr0Llygbs9WzgSqAw8raxJDYcDdPT9Jw1E+KXJqzllDtj
	8fVdvlWtxnakxqsAsUe+cY71gQ8q8mj5ELuTDXvJWVFpv5ZKcZaZoyJbLzKYLQn08GgVJYeDbm8
	M7wRzrWwilRiLWhOqRQJFBFZ70AfU4IbbAMdS0=
X-Received: by 2002:a05:600c:3e0c:b0:490:3fdd:d353 with SMTP id 5b1f17b1804b1-490c259e7f2mr96667805e9.8.1780698866594;
        Fri, 05 Jun 2026 15:34:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/25] pseudo: Upgrade to 1.9.4
Date: Sat,  6 Jun 2026 00:34:07 +0200
Message-ID: <9075b66e1f9161407056924954b3d5507f6d8384.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238208

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to pull in a full openat2 wrapper which works on Fedora 44.

This update includes the commits:
  * Makefile.in: Bump version to 1.9.4
  * test: Add renameat2 test cases
  * test: Add openat2 test cases
  * makewrappers/openat2: Add preserve_path option
  * openat2: Implement openat2 wrapper
  * ports/linux/guts/renameat2.c: Add comment why this isn't implemented
  * Add b4 configuration
  * pseudo_setupenvp: Handle malloc failure safely
  * pseudo_setupenvp: Allocate space for new env vars if needed

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b2bd1d114fafe1e797149e02e4c08194d529cfde)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 3ae560487bd..7cb221403fb 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
+SRCREV = "6c0d8c6b81ca7c2ef2b5a9a996605e1a51814442"
 S = "${WORKDIR}/git"
-PV = "1.9.3+git"
+PV = "1.9.4"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

