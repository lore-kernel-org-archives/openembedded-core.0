Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61884C35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2962.1742372199289927414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jeoRZkYd;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224191d92e4so126431585ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372198; x=1742976998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLLvqlax8u+s860s0BUwlOwVbZ4U2+vsW9ruPWvozjY=;
        b=jeoRZkYdNqDH53/IDw5U8GC13+EsbrR1RGo9K52bUpAcYNIyBTj+KBzxMpwJsm+Ogi
         gcQJ6Vvo6Q3wqSOme+g+49OPO3/DfsHA9xm9C7ZPjuKYTeVU8AJRn0eCRvXdpFvxKfZN
         tJyYu+wQJ2NioWWDvThg9aDaIgmKESbdE7KsSZ4nrEs8riM2FP/FvH4VekS6Xh9bj2bb
         lC7Jzx2bgCUmhwcWdKoEDDyi4IelVjojzX5s9g/hGrvU4ozlj0BoZ+oE48CHr2Byyy8P
         mb5SnB3ATzbj1VXVPSVrPDLXuUMJTnB9R+D4uGW/2RlevQ82NMwt9Pk4lnCApSoq2psU
         Kmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372198; x=1742976998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLLvqlax8u+s860s0BUwlOwVbZ4U2+vsW9ruPWvozjY=;
        b=Lol27i4Irl2BvfQ335yrgE7bziQ/vibgnI4fIK6vcgIRnKJ1/FTNTbwZ6jUSG0uJsf
         HSwKIVr8qYcDXa+ecZk7ouYwSigZq3tSglixUmtxkgl7PCUENatjfSrevgaxkyVRNC3j
         w13XlJUPbSr/dSpGAoPNFFyH5qxzU1GgDJGuV/rrHNnzIla+LPnOR8gl34ERO+klCDwL
         X8FXIdp92xY+YZeAwYIWz0xUHdhxsm0IK+B/qo/1E46w6DB6oBOgu+ZkylIfuuQuPXw8
         9bXpaMEu65dTKj124zxQfWNmW4ZVHzDFe0CpJV7D8escH2VyXb9kvMAjOqms35gw7pS6
         EGLg==
X-Gm-Message-State: AOJu0YyOysQGIjWygK03aZHU2TqMz+KOCxJ4vArUn4SrAKZzKiVx1PPD
	TSkQt3RA2wnIQcQV9ujr3k88Jy5QownnKUWdtkOWhNE15dCulSo/R94mklle
X-Gm-Gg: ASbGncs07LwUsq45TYUPF4XccTV5EBsXg+buiOvV9dyVeaCcvbq2juSatOXl/5fZ6cs
	2uETlubM3ewcV5mXmTgRBHz4SoBpNPJ3RAu/Nv3unPvTD6ZLCSjQd8z0w4AlF0BLoJhwgtER4Mo
	WfkX1zEF6WHQmoI18i2eg89t+9CHlbxKnr0jF4RO9yLDi+srOud21wNB5KMSIjJFadnGvaN5iYe
	RfoVcvCCTr5cVe1O5oznLJIvw4cmmMDo+b4d2LXEsUJalXzsGFIMWj1yog7QnmuhKNbJV5TLTcv
	wHbBHQ5h5bw9pOa1Q8eSY8FFr3klpVuapny6
X-Google-Smtp-Source: AGHT+IHJUjlzDwp40lkEyM/VhPNbEaQbUdG1epRVqY8BNR9fiA/0jVuKwtoR3MBgEB/jnzFb1Ixp/Q==
X-Received: by 2002:a05:6a00:849:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-7376d70c894mr3284202b3a.21.1742372198498;
        Wed, 19 Mar 2025 01:16:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 21/27] psplash: Fix build with GCC 15
Date: Wed, 19 Mar 2025 01:15:58 -0700
Message-ID: <20250319081610.3536475-30-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213296

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-bool-if-using-C-standard-older-t.patch | 32 +++++++++++++++++++
 meta/recipes-core/psplash/psplash_git.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch

diff --git a/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch b/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch
new file mode 100644
index 00000000000..cc5f2e02e65
--- /dev/null
+++ b/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch
@@ -0,0 +1,32 @@
+From eab6948cd8eba493f2af7533a931df5ef1d30715 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 20:31:19 -0700
+Subject: [PATCH] psplash: Only define bool if using C standard older than C23
+
+gcc-15 switched to -std=c23 by default:
+
+https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+only typedef int bool for __STDC_VERSION__ <= 201710L (C17)
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/yocto-patches/message/1213]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ psplash.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/psplash.h b/psplash.h
+index 1c42ec7..138e49d 100644
+--- a/psplash.h
++++ b/psplash.h
+@@ -37,7 +37,10 @@
+ 
+ typedef uint8_t  uint8;
+ typedef uint16_t uint16;
++
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef int            bool;
++#endif
+ 
+ #ifndef FALSE
+ #define FALSE 0
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 233c07a380c..e47c9b408dc 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -10,6 +10,7 @@ SRCREV = "5a32cf6392c784a7ae1983a354cf07b024625cd2"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
+           file://0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch \
            file://psplash-init \
            file://psplash-start@.service \
            file://psplash-systemd.service \

