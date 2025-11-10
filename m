Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8F6CCFA1E
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:22:03 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45176.1762770117385761815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iws4by8+;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3434700be69so3809987a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770117; x=1763374917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSk/bfdjoJ+b5Q8OfGPSU6sG60n7E0badv9NIkBErcA=;
        b=iws4by8+2GcDuPyiJVK+mm3QMCbnIKm+DYJ86Ln0pf544oI1XTxj8GQmx25jd4KqRs
         OFya1pe3cbAc+f4PiwAC3hWhtpHWYnazNkbKUx5K7HVYtjX1AbEZMKy4nR7EG8VWqHbM
         lW3uYnbgPXEXrT4F96BZkty70BUDpUANljDMNM4oGIQCr4Yd5pppq4of/FO0B9hEV9xG
         jdAtHTIqdetfPG99gSWDLiHBEG/qrZRNGsCYKuy7rx+UiedSyDPxO44BBHs3Lr8wXPD+
         p7mrnvTOhhh4qA/vPrdeIoBqXpfFtN6bLem8qSirlmSXKW5xax6f3rO/Cfg2+WSrbYvP
         lfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770117; x=1763374917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSk/bfdjoJ+b5Q8OfGPSU6sG60n7E0badv9NIkBErcA=;
        b=iY5OYw3UOlkeUlXDO5RqEoJ+0wJLw0LcYTkDhYab2sHizC87yS9GV4weR7SNKpWka2
         UKNCwBcJqMqIDs047h0GImgCN0c//mD9sfxhHbnP3urflvFqwFMwqO7DfEdGqUXVYZja
         bhp27CwZ1TzRJnKd1w1j/RW189lNfVTQuJqIvldZRG2dc6FmVT+/M+osgVCsFCq9c6es
         DfW3yNcK/e4BSmc7QAONcyE0MCba4I6ZdSkDPP82sya6yF29Xx0HY0Zk0wnNbo5wAUPE
         edXUXEMsY8T90q4pBNyYFPhd4za+J9fs2YSvWdg0RkbC07/1Hl7HGLqts5yGAVpcIzdF
         o75A==
X-Gm-Message-State: AOJu0YwWv0v61DpRGERfL/OG/lCrVMjwnxl8jWekRkpIeFXjbnExhHxe
	jbXBWeUE1RPjE8c9octyp2rn2iI/3efzBaSgK+LuDAzi5QBjw1KkaLmAx3zMXA==
X-Gm-Gg: ASbGncvMZ4dWNhbvV9ypn8jkv5lH/MalHYOcqx1bA09GY6148VaryLKt0fZyluWumuP
	eLIxr8EhlPBMt0Tv/UO+emilM9TbZzsH7mSDc8FDZxZYMr49uR7aft4XxMfD9AoSwIGc4o/aqqp
	9dwjMY3FYsiHH272o5pYAFJ7LUcyQmny0KB0HqzQrarL/S0kL1eP1RZZuaCrEwl4MOk8J+2dhvP
	e1JeZ35IMTsW6cEGAlMP2QroSno0DntGo/PqVoPopEbavsJG5eBzfEGF2KS/hAbZ/OJo6UVIyuV
	yJkyksGSy0bFwMRSBfGxlqdhiL1KwmzbQp6khTlX5DLYVsnYuL3uyY7Ndkub3uFAuGY906XYXIV
	I3GqDfIO0c8gWuNTMpLwVaJ3yOMvZQWdvclKgO8N1g4tEvS3Vg2zOmEt8ZyPOYDzooHgqm1n/Vv
	jZxouz/RyiBR2uTH0qHZWL32S0
X-Google-Smtp-Source: AGHT+IGV9wSOrQrN7Gf4yFRMkzlQTXzmdvkeW9zicSmB25dXwvhSGiq4gA8LsFgzBqaGN0lgDjR8BQ==
X-Received: by 2002:a17:90b:270a:b0:340:ff89:8b62 with SMTP id 98e67ed59e1d1-3436cbb4076mr9256519a91.21.1762770116631;
        Mon, 10 Nov 2025 02:21:56 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm6999894a91.18.2025.11.10.02.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:21:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 1/9] webkitgtk: upgrade 2.44.3 -> 2.44.4
Date: Mon, 10 Nov 2025 23:21:39 +1300
Message-ID: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226104

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Bug fixes only:
https://www.webkitgtk.org/release/webkitgtk-2.44.4.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webkit/{webkitgtk_2.44.3.bb => webkitgtk_2.44.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.3.bb => webkitgtk_2.44.4.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.4.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.44.4.bb
index a8f825e164..ac9ff41c91 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            "
-SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
+SRC_URI[sha256sum] = "2ce4ec1b78413035037aba8326b31ed72696626b7bea7bace5e46ac0d8cbe796"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

