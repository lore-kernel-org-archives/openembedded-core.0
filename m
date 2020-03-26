Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.33062.1585212881028453058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mTDUJMBs;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id a25so6743469wrd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aE09TlcBq55W4EIrxA4YPq7uxgXBjOatVFJ4OrUSlWo=;
        b=mTDUJMBsN81h+pXjzDoi8IfchQWahPUvxEJ+nTsTwFOLb9MIW4TOFYn4Mu7W4Uf7Fs
         qSnR+TxFgFiaGPC0Whw3HomQPQhW3IL1fEk3ZY4HaPbPwJ0TYOJQtPpTFeH9dAaJ1bP+
         vLCMSEX4oteXeCQzCeNp7na7TqD8ct35GG3SEAdg2GXa8WcxqAWFZLmDJRDg4IYwxGqi
         NXGARfrAJLH8RDekmkwRL+VIsuI/g5/aSeNUOplvYg+wN63fE7gTJw+WDBZk+9KtXM9n
         fv2MRnvsCcKe02vOxbQq6dzmA96rf9N3CNVQTjCPvD5MTY25V0nBC+ET1qUmFcPU1xcp
         cZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aE09TlcBq55W4EIrxA4YPq7uxgXBjOatVFJ4OrUSlWo=;
        b=GIrosifyXnLCUJL00fIoxK3Ie5DtkVj1yarng4NgLtxnEIxd+6WR7a8w/lhdC5YEJj
         HS26tT7yZHC/Ri36/soPe4/BYQ8nKM8XMVfxfc1z6MoCzM/lTOltyG+uEo0iSjQtyxBK
         TmNsxvwQa+aB079G+QcRTa9oWawGULU/7SCxsU7VI9aUQHqtzxrlH+rvHR3mN+e2Oxjo
         ZlQqQu5/nKJ9BVwa4plG0O0JIz5yABhCKrD8C9XkZPLapIrWbabmBI4RqaUEnwhIZsUo
         a0C2TIQkHOctWsKoeyWPRWvoYO+4KsBPStiskBMKn3acmC8gIKQUUGp9rlwGmcDZj33D
         b6Qw==
X-Gm-Message-State: ANhLgQ33aa9b4JrC3F+5cVQEiLHIDnKZaeKIltl+yihGT/Dbft2nSF6L
	k2ezYjb80NUOGBAjakn1bzKJ4a67
X-Google-Smtp-Source: ADFU+vsOKxsuNpJSrq8IZ72ZFejBvwlJJs/CO6XszZDcOJy3CaVLIBkaCS0UeMlOzciLoYNoDKbP+g==
X-Received: by 2002:adf:d088:: with SMTP id y8mr7944398wrh.36.1585212879407;
        Thu, 26 Mar 2020 01:54:39 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:38 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 10/13] systemd: Enable acl based on DISTRO_FEATURES
Date: Thu, 26 Mar 2020 08:54:23 +0000
Message-Id: <20200326085426.117209-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 2031f5d592df..ad148628715a 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -56,10 +56,9 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'audit efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-    acl \
     backlight \
     binfmt \
     gshadow \
-- 
2.17.1

