Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1469ECCFA06
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 04:34:30 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11042.1762230863202990687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 20:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q0/HxbFN;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2956d816c10so26041815ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762230862; x=1762835662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23j8EwX2PUcQ3OhBWZBMob7dlweJb8oEfFdu/xaKtdg=;
        b=Q0/HxbFN36KK+HaIlbIGD1lQE8ac9+hVXnAQETtBzK8GJ/cB+01KuKB9sJYEklEvRI
         prvaUF6/seQpTAkDtghE9B07KtL4LjBO0n9j1+nnDvJFskIW4dVC3K4CMw51o8WGg1Jb
         4ZrTFvaAfxyuxnayi2PWSdTiVjuaF069UzrDKaxx/6z/t7k2GcY/0X/hkwAqQn6xF1Js
         /fVntUgyCPkWXOzX353AoLaADO/gTqrNPIMk99gy13XbkGdEgRRsjcUWyJpXR2QiDuKx
         LZADXjl1Owv1WyMwlS/5MP2zwDI8By3mgqlE8bq3xoecZjOQsq4s+d0jM2N94xbxv42m
         p4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762230862; x=1762835662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23j8EwX2PUcQ3OhBWZBMob7dlweJb8oEfFdu/xaKtdg=;
        b=VdDXpro9xFCtmHHD/bUHaHQrzZNpXKAoN2XkXKTQ0+/C47BPWSJx1WGw/YVhia+sQo
         XNhaVSCLHOFaYTlL5Nre93WySVU3G+GM1THK4bH3BBCUDyvS+jFmZjRLQV9OQlyUxq7n
         bEx4gi22PmM+u1dCpn53dNstBdOLsce1ld7LT7RCq8S4vn1aEA6cQLhB67DZmmdJzUWJ
         b4SReF/JKCzKtk2GDNXxqDqunwdNz8KB2qkFL4aaNZCHzh/pY6x7F8I07lsCayUhAg2p
         BF+FtgK+nVrd2I7flcL7DHrBR7+zWZBZLzNH82VRMQx4Ngrh9+b7SOFkeO2E7Y9QMp92
         2WUw==
X-Gm-Message-State: AOJu0Yy2ubHYD0ULtpSbNrq5AG9YXlrKMoAB0SXZt3GNl6I6TVszf1yn
	Lxi4r0jWXwzAMDCkPX8u7e4WGiP6G/kb20tJsNw+PZxisFhKgxZC1NQtx2CVPzfe
X-Gm-Gg: ASbGncv7yUyA+V5Jeq0xnj6LMcUO65faedtnMH/UqKgmHKQ195P5mkUGTjxGof5uIJj
	s/caKTHiViahVG+WnTjl19BwVzj/Qd2xUUlN8DKN0y/rCkMZZItcl4KHFaXgPiCJ8liI2HXvVPO
	SSQLeQbR+36tnxPRDbriOJlx284jyYRIx0zIu7tvVFiqUw2nUZMFXlo81RwVDKlPquZjjKxpAGA
	/KtprGdZ4TYvx37BD3nvgSasgZjYXogC/gvXIaSRImG6efy3cIXKpIx5YTJmptWGiA+JQwE/MTo
	WYal0p5oOQk8mL/l4XXrMjhEz2yuY5EPhvTOBOb2syPFj+w7iM+4Iy8WjDfh2hBEk/yKlNEWWhV
	LhhWUXUJSiEQ9gT3U45ZsQmjZ0HTIhZGyLeNbZDb1V/A0bNDTGvvee1v4M6sVqkYyjNElbYUY+O
	S5OI7iogsuJolOVA==
X-Google-Smtp-Source: AGHT+IHinhvG9x3MuspP5eB589jwYknwfzkCS95jd2wag3P5JfJw7ugJst96IiNdfJVLnR2hPgfGtA==
X-Received: by 2002:a17:902:c408:b0:288:e46d:b32b with SMTP id d9443c01a7336-2951a3b7984mr236551965ad.17.1762230862367;
        Mon, 03 Nov 2025 20:34:22 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a74214sm9147025ad.97.2025.11.03.20.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:34:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2 4/4] harfbuzz: upgrade 11.4.5 -> 11.5.1
Date: Tue,  4 Nov 2025 17:34:06 +1300
Message-ID: <20251104043406.1086244-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
References: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 04:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225710

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.5.0
https://github.com/harfbuzz/harfbuzz/releases/tag/11.5.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../harfbuzz/{harfbuzz_11.4.5.bb => harfbuzz_11.5.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.4.5.bb => harfbuzz_11.5.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
index 9e0e42b717..08b72190ca 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa"
+SRC_URI[sha256sum] = "972a60a8d274d49e70361da6920c3a73dfb0fb4387f6c6811906a47ba634d8a1"
 
 DEPENDS += "glib-2.0-native"
 

