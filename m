Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0967ACD3436
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9472.1777739385406535727
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G0P4TZcd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfd832155so1708276f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739383; x=1778344183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47S0I+9gQmRvBkmvy15DZdf9WakbiTre/OTn1qW2mGo=;
        b=G0P4TZcdfQjYROvVvvhAhtFFm+5tJ3lxEzC1oOS7bOYzwhKC5lOBV11IcMpvgAmLMT
         MmdM3m/BFBEnUf6tuH9UCZ6A/PyLbeG349EKaHPYL89sl36z+qnbFpsuvrU+J4/ipGYp
         MGN4MAZKribMPokYNJ97APHQqzTtWz6g+Q1II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739383; x=1778344183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47S0I+9gQmRvBkmvy15DZdf9WakbiTre/OTn1qW2mGo=;
        b=X+M4epSRIIMI1Zq6oZnn6tsFsBIy6rF8NQ8ohtlGDuxt3Vdk1p5aAah7N8++7CtPq3
         /IMhgGQydsAFqtY1Y+FoXJDvMJhgd3KgXYte47j0ehSiA9xFfj5xWPNZlQKjmxagKk3j
         7wwz5vf3FZt5OAjnST4JWQ0BUtOYq3ZDqX/ZGPIscVeV5q7zRdieLz4ThXblPrhb2sHB
         QDnIT9RY1mIzEPz5E8hEqyumpk99OCTQXWMRlrOgnZC+lPhn9e2mfzyCXvmFT5YVrFOY
         pU4WD+zoWOgIMrybP9guTS70Hbg3+vLEymz8JrbkIu7Zkfw5zFr9d4FVgHyYPbQkrVK+
         oc/g==
X-Gm-Message-State: AOJu0YxIOifBeFO/PCzBDOP93+RRUAT0kslams/qqH4tUNfrhrEc+BWR
	igo8/TPJFEK4x1vY5Hk4nXAPdMOIfo3Fs3uNuoDCDqq7PqbODYpszeSeDwxBSHK39jZ0E/OBk4z
	hhZKKHBLfHEE+dDGiXmBalSXe2ok90W4Vr82YM8X+qcI3y2IEAW4GhS4842cflVy6K5AIweimFm
	CQVFKVMbtGr6jgFlE=
X-Gm-Gg: AeBDietLLnmQjYK83ArwraxiJfaLIc8Z3spjanWH25nzqFVi2QSzwzDAMh1J7V88qV+
	1Q6ETCmfWW3aNEoFD3hlko3aUstgWCJ0vJ643YOfK5uziF8evNLRmMVPJ+yh9APxGiOf34j+x29
	3QczRzzeiGgVQXnRjEw743AmNRL5YncV9BmaCbUdBm3I5Anv1Q7WIxjyNw5wKYdqLIW9GYT3X/i
	QrBMXiZCFyUuvVbH1EhHxIhCYdnPm9fBctMWNhTp2A9AspQrS9Fhu3M/s/cNE+vFuCgW4TMyEmr
	t097uvW5KiDMMT8hY+vtN+5tT1viPXf5O73w5EBYw4fHg1butOotAL4slVkrhhGAJ1HFoIGM51V
	L+fDCGkSFuIKLlC86N92SbiUTBUH5fMLHdihXwx2Dgp3OLwaInE1OcK9UKk0mLfvCdZf7GlQ/1W
	3UCN9VD4+XfI7F+bxp3KV6Gtv9sgPIkXKFmEZPC0tsC9DVeZL+MzmLGssUcMjJFFI=
X-Received: by 2002:a05:6000:1a89:b0:446:96b1:f51 with SMTP id ffacd0b85a97d-44bb52abc94mr5640779f8f.22.1777739383341;
        Sat, 02 May 2026 09:29:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/62] font-util: upgrade 1.4.1 -> 1.4.2
Date: Sat,  2 May 2026 17:28:28 +0100
Message-ID: <20260502162929.1377831-8-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236317

Licence-Update: Removal of a trailing whitespace

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-font/{font-util_1.4.1.bb => font-util_1.4.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.4.1.bb => font-util_1.4.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb b/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.4.2.bb
index 6ad112aca7f..2b38c10ad3f 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb
@@ -3,7 +3,7 @@ SUMMARY = "X.Org font package creation/installation utilities"
 require xorg-font-common.inc
 
 LICENSE = "Unicode-TOU & MIT & X11 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2a9e705c00e463c8d294f90486852e06 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=756e7412ee04c80f5833cd2f35242f7a \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
                     file://map-ISO8859-1;beginline=1;endline=4;md5=9c9c1d525d29c0e82b5c99edbb8e71c1 \
@@ -16,7 +16,7 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "5c9f64123c194b150fee89049991687386e6ff36ef2af7b80ba53efaf368cc95"
+SRC_URI[sha256sum] = "02e4f8afdcf03cc8372ca9c37aa104b1e36b47722dbc79531be08f0a4c622999"
 
 SYSROOT_DIRS_IGNORE:remove = "${datadir}/fonts"
 

