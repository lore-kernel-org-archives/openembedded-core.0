Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.13908.1629891494090867288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s2kpD1WG;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id k20-20020a05600c0b5400b002e87ad6956eso2687994wmr.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uz+6JvgIe9Ko71pTN7Wpb6pb3dv0/iF7Svx9IAuBZOQ=;
        b=s2kpD1WGXQPL0OOUZbLf5UCas7kDmcRwQBLQVVcsGE5j1QQgDcVFCrOJCohVAjvm2H
         1e5XqiPasxTtWMc7Q6CjJhXfy2t6rNGJ8YxWOuEGl5KQ+dXK6pgWwqzIHNtxGozXp1Iu
         1AqJoE4iVtgvkFYGN4cbYalIcOutFnP8fdc12kxBwL9HqSLNxi1xdw6BZSs44YVBXQ23
         WNH7BTXmtz5njkJ/NnOP8KnxnsVTiPCchQJPwvASQg36TAEzt0FNnBOZLnVBK9Klp4FQ
         2NWMa5CVHt6DaoJyXwKci8nKuvO5P21HfYGOTJIoKuqbWW35Ymyw2mE+0SRsMIONwJZ/
         AicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uz+6JvgIe9Ko71pTN7Wpb6pb3dv0/iF7Svx9IAuBZOQ=;
        b=KLon3DrzW8WkiG150q8USFK8UsWoyOMb/C+nlfCE82Qkr/9kHdOYhdUpECZardwV6s
         JyQDB6Z6hxCc9W4Lhmgf+0fAWyBRxVO1zv4PRpAeJnNLHOlTXE165J65j1e45Hih+3s8
         h7kKuYKssTvNdLl+DeCB6bfw2Z624CmZH8JZ0CwbUIejTmeVEJEC8FjnX72BGoOnt2bh
         RZ77XPsxu+6Ph5eGjvIcmo0Ei13fgotrgwR6krEvH+luHCrocpsrqVDeU6/qSwVQRG/o
         jdnAzu3gFRe3CT0RBZNd5fZL2LAXcZpiSqtom7NtTFZl524ugDvY0egmu1Oybv0lB1zp
         CoOQ==
X-Gm-Message-State: AOAM5321FJgtxdELdEXcw1zJrZ2ANEKcBN1pOh+R5S0kaq3o/9uhT6zn
	IHoccBPEdcKYXh0z+6rmSH/3iN/GPRAE9A==
X-Google-Smtp-Source: ABdhPJyIMydkCr+kdS2D0kGTZ0F+glwjwcGE8HvNxBL2bes20mO3QqE7HEfQ9yNH1TZpjo9M75ZvHw==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr8786483wmk.97.1629891492386;
        Wed, 25 Aug 2021 04:38:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/16] binutils: drop target flex/bison from build dependencies
Date: Wed, 25 Aug 2021 13:37:49 +0200
Message-Id: <20210825113804.779395-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This lengthens dependency chains unnecessarily;
also -native versions are already included in DEPENDS via binutils.inc:

DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-native"

I have also checked that nothing in binutils needs anything from target
sysroots of flex/bison:
https://lists.openembedded.org/g/openembedded-core/message/155131

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.37.bb b/meta/recipes-devtools/binutils/binutils_2.37.bb
index ff9377049b..7430bf1342 100644
--- a/meta/recipes-devtools/binutils/binutils_2.37.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.37.bb
@@ -1,7 +1,7 @@
 require binutils.inc
 require binutils-${PV}.inc
 
-DEPENDS += "flex bison zlib"
+DEPENDS += "zlib"
 
 EXTRA_OECONF += "--with-sysroot=/ \
                 --enable-install-libbfd \
-- 
2.31.1

