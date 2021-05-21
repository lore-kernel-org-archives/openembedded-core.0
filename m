Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.10045.1621607627787250495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 07:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uaKqS2PF;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id r5so29994712lfr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 07:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VNTiW+43M/5kgtzgZKF32KBayqKs3VZesZ154Bn8Y8c=;
        b=uaKqS2PFy14dBhto0zpnrd49tiWMI9PsRr8ZInWu/jtM7TKHM8XnOTtsI45gs52hHj
         qqsDXX1jXUhIDrFeatL57O6IMwyyz9HCN4YPHHljPvYJTMnJpYMKXGrYGdo0NhEAiXvq
         sVrylv6K1bGX8O+TL/5NAIf0XQzrdD3DaSrn5c2uzXWzw4Lj/3Lb/RqmwtwDhsteRC1L
         05yy0Fo+8B9IzJe/stjKF53uejKVnHhegTtinhaXHePhpAVlIMvAUGgWgibYmEA6Qaxr
         C9k2sOkq/Bsseesq4tUdD71ghdI9dTi//ReafLfgGohy/5qGwogFWb3n2swugsa5R3K6
         ibKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VNTiW+43M/5kgtzgZKF32KBayqKs3VZesZ154Bn8Y8c=;
        b=gI76lzU5VNlGXHHNj+l1n4KtpRH59cyouZpNtccnvndCeKvlNe11CB/8htktYlOGJn
         jezBBunOFdsSfWHCM8OOs/Dp28H1jRRBnKP40BsjNbz1OvvGCftauiHe+0jIqrXaYKUR
         rLUMqfXahXqUD3CJGwJM6CyVasbtsfawTgFQpe1sKL5pjCcxjhsio4bG8GhtI6k2EDfO
         IESoSiaKyQQ3My7PuTsolg4CARSZDzIs55RgrPs6N5bj9yGo1Ktl8/hh1rIcrZS7eHsV
         nh0u1G++Ih+gICgSa9H8k1opbHLHapqOLRnfFTvY7vWENRN8NVA0N0yLa8WHkgcKhFVE
         XAfQ==
X-Gm-Message-State: AOAM530z2vjHsPcZQfVTKyM8Gq+xQImIx+ywWy4HEIN/oIr/cbZNsIzv
	3W8BTk4bN/CDFIx/k79bfeB6rDi9Rxl/EkeB
X-Google-Smtp-Source: ABdhPJz1vS7Z4g1oW+qHD4Sy09YeM+4Yp7RsLiVX3lhTM+jE8RownZJ+8ZBlortNoYeCj2bEU60sLw==
X-Received: by 2002:a05:6512:21d:: with SMTP id a29mr2431566lfo.391.1621607625518;
        Fri, 21 May 2021 07:33:45 -0700 (PDT)
Return-Path: <samuli.piippo@gmail.com>
Received: from munkone.intra.qt.io (62-183-187-94.co.dnainternet.fi. [62.183.187.94])
        by smtp.gmail.com with ESMTPSA id m5sm646791ljc.120.2021.05.21.07.33.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 07:33:45 -0700 (PDT)
From: "Samuli Piippo" <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-cross-canadian: add symlinks for ld.bfd and ld.gold
Date: Fri, 21 May 2021 17:33:42 +0300
Message-Id: <20210521143342.3369089-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When -fuse-ld gcc option is used, missing ld.bfd or ld.gold symlinks
can lead to linker error:

collect2: fatal error: cannot find 'ld'

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index e8fbb6186b..2d025b54ca 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -124,7 +124,7 @@ do_install () {
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
 	install -d $dest
 	suffix=${EXEEXT}
-	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+	for t in ar as ld ld.bfd ld.gold nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
 		if [ "$t" = "g77" -o "$t" = "gfortran" ] && [ ! -e ${D}${bindir}/${TARGET_PREFIX}$t$suffix ]; then
 			continue
 		fi
-- 
2.25.1

