Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.17503.1585329935312304528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VB29/2OJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id m17so12311101wrw.11
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tltVV2SkMZ495JtbnqcKJynmbdo2S+Nnn5su7bPpgaQ=;
        b=VB29/2OJSaIYzNXeBr75H7kgyr1UGlq85M9qdlI/0458PQvF3mFvcPdin+iecELiE2
         PSTfNpqK4TLCUvvmFjoyxUWaRa0kLGwnxd2M1syMCAzlSvJts/M2veaph9FtmwxxkUC/
         1m6Ba4ww3wxldtOLHyhaQCezwi1z6LbsSwN/OKk9FJvEDSOCI3zK/qKjjOcOaQnk6Uqr
         VjfTlyDFwiZJ2pg19MeRv8Qvl0ZoEjAJ5aYWEF8GSocwRlRGe3ttiNNpRpk/mUBbQzqd
         Rx227mf3jPnmOxm0E3oPbgpT0KhFXS0OKdPDVezC32GFONxnS+5ZglG3a/hsLe9lGzm5
         ynfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tltVV2SkMZ495JtbnqcKJynmbdo2S+Nnn5su7bPpgaQ=;
        b=CkAhYH+Q0OH/ohsxHfyP0lUU6Q4SCxVlFazBbEA2bNZToTYDwmB/82g32nvmecLRMM
         6FChgu0Fi2WLt5zWBIj00Y9pEUDre7SSVeOtR2qJPVpghXSlqsCaBOk/6p4TSNBvGpKn
         FiePfsN3pWjFu2vPE3z7GFpoxiViRA2WIt8QF4yYQQroHdBICmnEZ04LG6tmLgvTfRtg
         TR+4i79ESXKmik6V5WC5okjcOvraYqtC7cn5ERPNJTs8T5/U3yf5tTCmwIIiYoR+CxGj
         IeidM73snfL42SDsMjiNRx6EC+6Pyv9kFiyr1c4z8NPgYfrueYgVEkCtm7XMUrlfAeJW
         LKZQ==
X-Gm-Message-State: ANhLgQ05Ice+WAHGog+6KZpKTOjBr2NAeb1i1+8rCRpU0HrS6J8TPCX3
	XfjqHGzjtiaodc7hyKS7TyPbA65L
X-Google-Smtp-Source: ADFU+vsmkWEL8v0fekoYjZk4XdknPbvoSLo9wsQ+crbpi4FSTgKZ22dwy+xmEuPuwN1xN/inO6GCwA==
X-Received: by 2002:adf:e942:: with SMTP id m2mr464545wrn.364.1585329933662;
        Fri, 27 Mar 2020 10:25:33 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:33 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 09/13] systemd: Enable audit based on DISTRO_FEATURES
Date: Fri, 27 Mar 2020 17:25:16 +0000
Message-Id: <20200327172520.62888-10-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 38c5b9ed9127..8283f2cdc65f 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -56,7 +56,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux smack usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'audit efi ldconfig pam selinux smack usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
-- 
2.17.1

