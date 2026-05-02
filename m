Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC51CD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9488.1777739420165465864
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hfji+Aac;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d77f60944so1715512f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739418; x=1778344218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Abrv3SWHUDcOEVbcwqgJsDbHHDIHxFtkGQfXLozK/8Y=;
        b=hfji+AaclXYB0B6pKZ79tLlReaNyI/P9tM4DStfcSRE9mXQlpKM4i2dS5jwBRWSH/a
         oKS+MN2MiYMxOLoyOqoHAZTrvVyPvlveDKjrEcE3iKJt2aYqlyQdK04bTJnxUJjo8atA
         4r3GGGoysXYrSIBMCuntECklIWD70Mb97brDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739418; x=1778344218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Abrv3SWHUDcOEVbcwqgJsDbHHDIHxFtkGQfXLozK/8Y=;
        b=EOCAnIDef8yQzY3dIgspoQVA2O4Y+PzbJGxFBQBMGL59hZ2SRQjL7Fsy4bo6rnKH4q
         lD83+3BNfe4A5cvnyk23P3ks4a7tNTZn77lR5OO9MV8VRbNG8xnyIg+xU8QYOhaiZiq7
         zr5pNrmOuguaCYLsxm5z0JS7PWMotjQJnsXLoA1TV3KEJBzBcrrVayiOVBwj4rYyd48Y
         EF2b9WdOevFd8ZKhgT2+nMTzlCTHUMMac6I2UgAodrbkjt3J/4OkGHibtV42M6kAT/68
         ywGRXrzD013URZieHE9Vc0YPk7DLmbQ2qfQ+Qq38zE6EycjpNwshjYpHDHkkaCDlUnNv
         0iOQ==
X-Gm-Message-State: AOJu0YwEEVV7XVRafvS3HXEH1dR11aqQUj7eevFWAv9aRHzW82+Q9JWx
	p0TfygJ7T+GNcEDCa/gIisNMCPG/XyjEqZeJMnhok4SITfYqJ55+/S3mi0ITrR2lR0j2pfAd6C8
	cO+9zdJjdhYn80ktLzyLQWSi+5Klw7tQtsv4AurANDbmZPpdD2Mj6cFGpsc6DXGHvs80YafXjvq
	69Ib2BPJYrjJrmaDU=
X-Gm-Gg: AeBDieuOPvC8qv70MfYYBDZC/wAaxOTZNC2MVd8wf8z//tQ0n8JoXS54auCAfnm0Xyy
	PKefx/xOmouRZbiox7cIZd4COVK1JiLbwKQA3MBOfdc63XyDq/ip29cUMdwDPX3XBqZexY2K9LE
	pnk2yEwasoZoLRSbt23Ufjc+yenSI2f0Hae50la0SHUgb8JP87Cq+zXYatgZ8AQBjUSMX61Pw1M
	QN4Wix1dMR+NdDTC1QgHew5ry3aILujXhw1zmcvePyLnmNRCee5fseC8uK9WKRUIR1/3OIWO5+n
	+BDUGuT3kx9rNeqw5vXHnYXDNdqDPZJaromdo/sNfJWDLrMaRbF9gtlw8ezmveS/qAyIUMQbVaR
	q/6mlXeSGKQwZApgr/3874al0JLYxge3ChGpUjNA8r3HH01cxYIyO57lNJauS2gyX083Ph0cNw4
	nEDMXWBZ5VeXKUwY2f0reGl4g1ut90BIqIbx4dE7YEHERZdlOD8lDX7IL5zeSDwdw=
X-Received: by 2002:a05:6000:24c9:b0:43d:7d24:b510 with SMTP id ffacd0b85a97d-44bb5b4cdedmr6504208f8f.22.1777739418046;
        Sat, 02 May 2026 09:30:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/62] makedumpfile: upgrade 1.7.8 -> 1.7.9
Date: Sat,  2 May 2026 17:28:45 +0100
Message-ID: <20260502162929.1377831-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236334

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-makedumpfile-replace-hardcode-CFLAGS.patch           | 4 ++--
 .../{makedumpfile_1.7.8.bb => makedumpfile_1.7.9.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.8.bb => makedumpfile_1.7.9.bb} (96%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 554402454fa..9b527cfb992 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From bb16dc839a8a45cc7d2e271ebbe41d7e39a799bd Mon Sep 17 00:00:00 2001
+From 8d200d7cd700f93333353632e7dce48cf4b871fe Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Sun, 24 Apr 2022 17:25:33 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -24,7 +24,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 21 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 05ab5f2..57328f8 100644
+index b2ffcec..e416f4e 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
similarity index 96%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
index 6b582729a11..8704481da78 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "65e0b5488ffe840035c6e165a5149dc5da769d97"
+SRCREV = "eb42d6330b275ba344ca170286480917450d7f73"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"

