Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.1463.1622054023904622842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 11:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QZ9yIhi9;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id v8so2041556qkv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ZhY2yaza5CrVMoHw617z0Dn9GsxabURbWkhN3snZL0=;
        b=QZ9yIhi9cnhxNoXi5x44EHE+l/D2YHO1lGCAYePDpKYHhf1pViw5/De4L0WhP6e5fG
         yM/1/DefCJZJHYmLDd1VKkJKWHtKC+koyBQC0gCruWo4BmvzAkOWMjsNHXoKDm7oed7B
         IJ6mTiIBflyfULxmTxm+163EBQ3LsdpjlJLYR2jgJ1P+b3B/bi6m235bR3pmeGz7ZtGW
         aMwpMv6lh2cOvhqUwWQsyOhZZkkuP4sFSSIqg528m5GtoWO8nBe3Nms7F1nAdfmSHefl
         jxl4WpwNuyFXlIEtjkTHq+xB8eutZeWEYOZ6L6h9BZIhXD4zmGgl4LycGPUEYhVe7sT5
         RGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ZhY2yaza5CrVMoHw617z0Dn9GsxabURbWkhN3snZL0=;
        b=OM7era0fR+HZPNrMoTv7CNVuA08H4ufhDYOIKf4toF+dldYuQxLSNL8l8uiYvinsPR
         L/N5SOEgOoFsRRNixbfXtRgDYjGv+Yfn10vwaePWxxGsPHe0qn56LWIvUEwBxOteBDlK
         cmQMi0pYa/hUhrkonvjt+9XAd4HZRpA0Kcm6hNmH3/0/yjrDoiVVP3qiIhJs7BLwYYs8
         NQkwljKWlBX6WJoZvZH/Y7wtfSp82ewqNPZs8JHgtDC9Kj14ibSZE4FPACISX9liNsNq
         nlFP2mKv0Jtq+Q2K/LSLck43tAE/irhHnQGhPZxc5tQppsVqDiMhoBwYrtzOAGNvXB7T
         laBg==
X-Gm-Message-State: AOAM532cPZPcKR5tCVSXIHXaFUW+q3XcamndVJm5Q0QCmyFj91TYcNls
	9JqypMx7s8YB9n+2nu5r6KLF0KaIsDGP+xfx
X-Google-Smtp-Source: ABdhPJwdd/KMIrroYvzMAuSAQa/r1/DQYeOaCIhoU97vcmh09uVKYHe3C+j+LIUtr6nXaf2i68ecYg==
X-Received: by 2002:a05:620a:165a:: with SMTP id c26mr43040898qko.259.1622054023003;
        Wed, 26 May 2021 11:33:43 -0700 (PDT)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id h12sm2022688qkj.52.2021.05.26.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:33:42 -0700 (PDT)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: openembedded-core@lists.openembedded.org,
	fntoth@gmail.com
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [RFC PATCH 1/1] image-live.bbclass: order do_bootimg after do_rootfs
Date: Wed, 26 May 2021 14:32:50 -0400
Message-Id: <20210526183250.27433-2-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210526183250.27433-1-champagne.guillaume.c@gmail.com>
References: <20210526183250.27433-1-champagne.guillaume.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_bootimg expects IMGDEPLOYDIR to exist, since it stores its artifacts
there. Therefore, do_bootimg should run after do_rootfs because
IMGDEPLOYDIR is created before do_rootfs runs since IMGDEPLOYDIR is
contained in do_rootfs' [cleandirs] varflag.

When do_bootimg depends on ${PN}:do_image_${LIVE_ROOTFS_TYPE},
do_bootimg is correctly ordered after do_rootfs because
do_image_${FSTYPE} tasks are added after do_image and do_image itself is
added after do_rootfs.

However, when do_bootimg doesn't depend on
${PN}:do_image_${LIVE_ROOTFS_TYPE}
(introduced by: 96f47c39f1d17f073243913d524bde84add41d8f), do_bootimg
can run before do_rootfs, thus before IMGDEPLOYDIR is created. To
avoid this situation, do_bootimg is now explicitly ordered after
do_rootfs.

Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 8b08305cdb..fd876ed8e1 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -261,4 +261,4 @@ python do_bootimg() {
 do_bootimg[subimages] = "hddimg iso"
 do_bootimg[imgsuffix] = "."
 
-addtask bootimg before do_image_complete
+addtask bootimg before do_image_complete after do_rootfs
-- 
2.20.1

