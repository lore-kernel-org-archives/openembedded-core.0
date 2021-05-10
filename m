Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.31266.1620651681773021492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cgFHspX8;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id m12so24400473eja.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 06:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mk7fuDwUT5BkWvuAz59YJU82iH9PQNrGFPlaUgoil/4=;
        b=cgFHspX8boIdGMRAoopzDpp5HGCYeO3GswkQQCxNpAvHi1ZEEnF3kLoxrWW0HbPxYJ
         nnB+g6aOsYgUQ83ADgEqMM1xokN4ohZbtslFUC1zn4sS+hHypLnk/q88L6EvIq74RdZU
         +f5Hg5rsO60tk8M08K1BONLgVK9165alpkrj4hZpVqN3fTfmcRBx0UA/5EJfe0yyhjFb
         wbiGkEeGbh/S+GAOEb2hypJkmHglqAEIgJm7UkaOTVwkTG8rctFfxNz5rYWI5+uZ/Cao
         Lhu9uPUKD2bxMjYoonc7Zhlc/uEsH5w4Ta4BjwpDadTy1SLIWRKtWoOwia5rB/LPmrfY
         4buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mk7fuDwUT5BkWvuAz59YJU82iH9PQNrGFPlaUgoil/4=;
        b=El9r2bNNhRNmPjxICYvvoIVqL/o8miT3/4NZDxUkwJ6sjBZhQuFqFVe9Ys1geO8fpS
         2dg4FRegOtMBaEJgVZzQU75U3cOTd0z/dDBJRxxjozC814K/tlgiESCFhjAWawCQArZy
         1y5Gul1OEbNNqD1lFUHaxOIyWG25AT0Qo18eHHXnj01xAB77nOpXrRLPgB6nXc7Duzz8
         gGdMIjMTgfw2CC3g96Mmo37wGYJh9RPkIAY5yKF8gK+f0nxGCKknYJ2tEKbLGrqa3NCg
         I4W8FtjUdQ/YOi/h927HEygp0XhwJUgOnZP5gyfEWRrl4j5ZDvzYSVdhVfDeV6Ijp1yw
         Fs7g==
X-Gm-Message-State: AOAM530qiUbzwb2sP+3XQr5RV2VAXFCyv3bJQMfSu3HaM9z0T8c9BW1c
	mLWADAbKQ0iLdaBZcBIu6im6fOGGuY4=
X-Google-Smtp-Source: ABdhPJxpLRwvwn9dyr54yAE4LalpvLypCgi1KMfLVtFsWPAAUw4LZAoZrbEvecLcGfu+vZ8N00ec1g==
X-Received: by 2002:a17:906:82c9:: with SMTP id a9mr26510407ejy.58.1620651680364;
        Mon, 10 May 2021 06:01:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id pw11sm9057361ejb.88.2021.05.10.06.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:01:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/8] powertop: update 2.13 -> 2.14
Date: Mon, 10 May 2021 15:01:07 +0200
Message-Id: <20210510130110.939820-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510130110.939820-1-alex.kanavin@gmail.com>
References: <20210510130110.939820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop configure() tweaks, none of them are needed anymore, and particularly
the ncurses tweak was changing the build in a way that is not clear
(and no one remembers why it was there in the first place).

Adjust LDFLAGS as somehow -pthread isn't there --> link failures.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{powertop_2.13.bb => powertop_2.14.bb}         | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.13.bb => powertop_2.14.bb} (64%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.13.bb b/meta/recipes-kernel/powertop/powertop_2.14.bb
similarity index 64%
rename from meta/recipes-kernel/powertop/powertop_2.13.bb
rename to meta/recipes-kernel/powertop/powertop_2.14.bb
index 8c7e78fd94..cb7f3c4dc1 100644
--- a/meta/recipes-kernel/powertop/powertop_2.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.14.bb
@@ -9,21 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
     file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
-SRCREV = "184cee06b2d64679bae5f806fe0a218827fdde99"
+SRCREV = "52f022f9bbe6e060fba11701d657a8d9762702ba"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext pkgconfig bash-completion
+LDFLAGS_append = " -pthread"
 
-# we do not want libncursesw if we can
-do_configure_prepend() {
-    # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
-    sed -i -e "s/ncursesw//g" ${S}/configure.ac
-    mkdir -p ${B}/src/tuning/
-    echo "${PV}" > ${S}/version-long
-    echo "${PV}" > ${S}/version-short
-    cp ${STAGING_DATADIR}/aclocal/ax_require_defined.m4 ${S}/m4/
-}
+inherit autotools gettext pkgconfig bash-completion
 
 inherit update-alternatives
 ALTERNATIVE_${PN} = "powertop"
-- 
2.31.1

