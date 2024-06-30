Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E4DC3065E
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4379.1719778122321576450
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sQpm5D2z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70698bcd19eso1324467b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778121; x=1720382921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EO56Dc3wj3gJgQn6WxesXvSBpjaBUVtXn37P8p3skY8=;
        b=sQpm5D2zEra8mOSki98Y2/YLvNUCD6CVEWX17Lrlbx/vz6zo3DaBOvIrsgqteOnc4M
         zcGk+9xpnF7nxIlp6u26y/IYoR+4OfuTiMYmY+92PdWU+XLkj0fVvSfN/ySYVKPH8Pw1
         A0UHawJHwOtnT/PQyo2goQv3xnUwf4XBgVNCIxmCjB7VwRJNR44UiKpUfpx43Km0ws1E
         NczoZdwomuCxj1yX/bpi6zzPDw/mBXDbNTmXqa3M5UZsqz7/E8vVaUPkCCQfz9qlRqjC
         SvcX+20Yh0a6HjCrFNkYY7Q6seV5202ns7tKAvoplrV02H29xX/hlzFmskGtnF4tskmT
         si9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778121; x=1720382921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EO56Dc3wj3gJgQn6WxesXvSBpjaBUVtXn37P8p3skY8=;
        b=LRWqihOKcWelsiH2GN5ESy8C3K1tbE98l18Z731O4BzAdDca59pzjD6tgaiamYYOPc
         XIjLwcTqGJoD4t+nWaOp6dbZv+f4AXM4w0XxQhWVuO29QTez1KzaxTwo7JLd3AjEIJtE
         QBvAoaVEPUh2R/Pg3ughveG4Q6jFz4QOiv0MU5pVWm1KFLFqhmAhMbpyUDwHbpd1xWV2
         i3AxBWXRZLKTFZP/bL4CarzFFDlBjH0+o4CRXcSlJbm+Wy95JkviWzYynFrw5r/LUZRZ
         R621nKhK0Y1GSFk6PZTWz4AfPm0wLmDo06wzuY50FXKbTufuitOkB6UbqEeZ+1AZZYu5
         sO2A==
X-Gm-Message-State: AOJu0YxxJcKyaw05jWDYyy6crXgWP+AugelFlfwCSPekQhYr6Vt1ghoO
	Tc3kVrG8HGe3EnZOW8E1igjgfHserBtpvoLka6zhnPllrdgtpjtoWabwk0sHZy3TP/XfwkCSG7v
	b3g4=
X-Google-Smtp-Source: AGHT+IHPC3DCmO6XuKNa5+MdMLzvOfnYtjxqXj8rsfiTAwFgi76Zl5Zz18cyMTjUeYuhcQt+HcO7+w==
X-Received: by 2002:a05:6a00:3e0a:b0:706:72d9:f704 with SMTP id d2e1a72fcca58-70aaad6a197mr2811479b3a.18.1719778121617;
        Sun, 30 Jun 2024 13:08:41 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/35] linux-yocto/6.6: cfg: introduce Intel NPU fragment
Date: Sun, 30 Jun 2024 13:07:38 -0700
Message-Id: <d1810436ef70a5b0a011c53eb99735d8adb7a6e9.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201263

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Naveen Saini
    Email: naveen.kumar.saini@intel.com
    Subject: features/intel-npu: introduce Intel NPU fragment
    Date: Wed, 15 May 2024 13:44:57 +0800

    Add config fragment for the  system with an 14th generation
    Intel CPU (Meteor Lake) or newer. It will allow users to
    enable Intel NPU (formerly called Intel VPU)
    which is a CPU-integrated inference accelerator for
    Computer Vision and Deep Learning applications.

    Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d01f4d2d7b95d6e8c65e5c9c5cef4b69cb079859)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index ea4360215d..f8d47a9dba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "59b2635b04e2ef8162e52f82e848b81073cea708"
-SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
+SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 10a8ec0656..7378a37521 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
+SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index eab33b3a97..b64ac78fd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
 SRCREV_machine:qemux86-64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
 SRCREV_machine:qemumips64 ?= "aa0c0197b3a0628992e959708a2ad015603e93ad"
 SRCREV_machine ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_meta ?= "5114225a4b9ca817be4456f43e26963005955e13"
+SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


