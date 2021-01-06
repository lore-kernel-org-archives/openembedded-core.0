Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.210.1609972592232612751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eVif3g9/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id w5so3768784wrm.11
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 14:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SKuq7p4EQzdt4eST40J6LqXRT95tLK4DYIJIDjAjVuY=;
        b=eVif3g9/De4rJYup9/bmdDSkWBphIgTHfY2xXfEqPKk1DMjByWEDm5s+9dqUqKLq2V
         /jJmBrb+T2RSkOvfboWbyFIhy4e6Az/684zniwY6+uK4a8rP09q9LE7Upw5cNSra4f6u
         VNn5vsDhV9+ei/q6u3kmyOZ1FVEXSNF/M7oto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SKuq7p4EQzdt4eST40J6LqXRT95tLK4DYIJIDjAjVuY=;
        b=EZ0kzLmMcbyXeg/wJYPPuJ9z2Zgz8T8QheB3xaco0rWTmczotsdM0ipYk7Z+3zqGvw
         rKC8ZC5poBZZM39a4lUIZ/hNYvuRbtfis4Sx8pD9Y4dsF9CvFVHfSYbf6OJHTNapaFpn
         KZ0GrfXMC6UFfD8SyQasKFkwqRUFBmFegqrSAYa0yiS6gAIRAekDFj3h1KyOwLAoi89i
         QUMfcQIm45sLnHooiU8iZ6LhklIY18YtlkmU5z0b7f4wYCocCikhH7yPKcJ6Z1iYbK6h
         ncHDmYCXrCnw0LX/yNsugD5VM+xexL8IDt9P98Trul8LPfPFgmJjsioXB+MHJwDzgLOw
         0kVg==
X-Gm-Message-State: AOAM532B2/mIS09/Na1mfoaPxMUyhEUSJ03EdUn16rnmP2ZD0XHxouqA
	x/xFs50gHFnMv39iMGcQAmPYQwbNT4DETw==
X-Google-Smtp-Source: ABdhPJw94aw44RJJCi3BKSSib+x+rtnDBrc4j75SVLdXiaVFmwryZttnnp+yDVunYgxzVraR/66GxQ==
X-Received: by 2002:a5d:43c3:: with SMTP id v3mr6062358wrr.184.1609972590751;
        Wed, 06 Jan 2021 14:36:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id o8sm4765510wrm.17.2021.01.06.14.36.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 14:36:30 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] pseudo: Add lchmod wrapper
Date: Wed,  6 Jan 2021 22:36:28 +0000
Message-Id: <20210106223628.561432-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
References: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New versions of glibc have an lchmod function so we need to wrap it.

Identified through a reproducibility issue in initramfs-base where
/dev/console created by mknod from coreutils changed permissions
depending on the host distro (mknod used the gnulib wrapper on most
hosts but newer ones used the libc call).

[YOCTO #14162]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 78c6b01f094..c7c5e615329 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "6fd57da7b1de1a2b6cf530e336d58bb5f8bdd015"
+SRCREV = "1ee9a1e05e200f189f6644411ba9304e8a479b0"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.27.0

