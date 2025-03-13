Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6121BC35FF1
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 08:58:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9959.1741856325244604336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 01:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rx7HNOrB;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso1108632f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741856323; x=1742461123; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKDXA3Gz2QUeQHr3MtOfjOZAhKqrCh7kQwTK3mqZZH0=;
        b=Rx7HNOrB97xn4kIid1EfKKHZ85KMBgyN0bIVR4EP0dezxW+c9XQdrwg2wP51jdSGRg
         Zo60CO0up+Ms5MKnZZcgf735uPpBXneTFcQoohG1caEU17kZ7cFeSVxA8lM/99lRmN3c
         Q96rsI2EjG5cprRouib1pbzFCqIhLac2x+agb3x8yMPI4NNrsUCmhRbNUw6afRe9s+3w
         hqVaMerFyJoytNRhqsaYWLqvtq9aQnswGjysBjJS/zQsHqBaBdG+dEoi5wE1+VC579w4
         jNuXZ5IqTAAqD4hV2sp2F/0/cTamSbjr/8+XDJVis7AEaQM3QTNl3VjPvDvCLBvekTJM
         m7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856323; x=1742461123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKDXA3Gz2QUeQHr3MtOfjOZAhKqrCh7kQwTK3mqZZH0=;
        b=U4oWOnOvJgHTjuSR9gxMekYreqmG9t4A9VWZlsVlgUNufkv9+UPNpUmBzj+MlXs2j2
         007fe6s/V4kj0xf/eu4KGv/CixrfY5M5j2wGGPFYQK7yg7rybSuYMKZEgD7PfgccVtz2
         hn2bX18msxxNk3ZJ/off5G5NEKQrWyMDa6eYgAYBhU6cSeVkdD7D+IKHVNzexXyxiRPT
         XHfRIiHGx8cPAncBbuj6XHzxveBR97NCQ0PPkrd6IVyWhkPVsrqqgSbnFcB4FW7B7UuS
         yG9f0Chm3oydBeQHU5J71OUk4iAeW9LULiHb4ulNraW2FGcw2NFvVcoWk1b0/7yv1KMK
         hdBQ==
X-Gm-Message-State: AOJu0YwuIlrijZoTkN31puRFLOzGXpgdgL+yxSu+D3Zjx7fFTHZA15+9
	0V8jewWaGC3ErZltN+tVHqM3WhfsA+ZZ/EL0jKg4vJ+s9Bm7SrhBJcaOBJRx
X-Gm-Gg: ASbGncuq/0nQKX+P5n53AwkbnQRj6cEJ+SfPAneSPV33vSx5BepqYSO2qkkuqdNJ4YP
	C9a5sohl20s8tKHdxXYX0s9XbIDoO9GzcjdJUsDDsShTN0uSw3A1Z84/QfwzhaqUuA8FJc4U5o/
	yFuHPT7lCpzzCqvDL7PczpmxwDmtUuQJ0xoWPFlzlYjtzw6PfTQ1xo5dWQUUoO2xagEvn0TXo8B
	8+oUwgAAb2pQe6Xl+k8T71iTE8YzPISK19QTav2FOlRJEv5dqszrs/k/nmDPuK/ZuYOpAGDQJXn
	B0bpvD4DrS6ATChDMfdZyXTRkp0qvJupLPrzv/ru3LCnYMun35N8jWF11e+5ycMF1dSmq9Vw4wC
	9yl2nQh+gGRw=
X-Google-Smtp-Source: AGHT+IEFGMRNhVufrCgOQqeo7Fb2f6dNGcVer42xH2rYeJquv6mvX9ynTHQEAkxNLhhTrhVaRMfjOQ==
X-Received: by 2002:a5d:648f:0:b0:391:2e6a:30fa with SMTP id ffacd0b85a97d-395b9b10d54mr1106054f8f.27.1741856323111;
        Thu, 13 Mar 2025 01:58:43 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c2dasm12978845e9.33.2025.03.13.01.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:58:42 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Mar 2025 08:58:33 +0000
Subject: [PATCH OE-Core v2 1/4] scdoc: Import from meta-wayland
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-upgrade-kmod-v2-1-2103ca9a26ad@gmail.com>
References: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
In-Reply-To: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212750

scdoc is a simple man page generator for POSIX systems written in C99.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../0001-Makefile-dont-add-static-to-LDFLAGS.patch | 27 ++++++++++++++++++++++
 meta/recipes-extended/scdoc/scdoc_git.bb           | 25 ++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5515d46ca5b1aad22c46665c78e4707bc22e3a0a..df7480d51301b4203c703a420e1522e221f77048 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -761,6 +761,7 @@ RECIPE_MAINTAINER:pn-sassc = "Simone Weiß <simone.p.weiss@posteo.com>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-scdoc = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-seatd = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
new file mode 100644
index 0000000000000000000000000000000000000000..b520e949c0b31c0908118cba4f6c2b6ea26f5a26
--- /dev/null
+++ b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
@@ -0,0 +1,27 @@
+From 2cac433806d9622dbc005fe5738f1ae8c33a98cb Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 13 Jul 2023 19:26:40 +0200
+Subject: [PATCH] Makefile: dont add -static to LDFLAGS
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 60a80b8..49021fa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,6 @@
+ VERSION=1.11.2
+ CFLAGS?=-g
+ MAINFLAGS:=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
+-LDFLAGS+=-static
+ INCLUDE+=-Iinclude
+ PREFIX?=/usr/local
+ BINDIR?=$(PREFIX)/bin
+-- 
+2.39.3
+
diff --git a/meta/recipes-extended/scdoc/scdoc_git.bb b/meta/recipes-extended/scdoc/scdoc_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..224e5417342e9db820456ec54476a1e3cac0e4e4
--- /dev/null
+++ b/meta/recipes-extended/scdoc/scdoc_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "scdoc is a simple man page generator for POSIX systems written in C99."
+HOMEPAGE = "https://github.com/ddevault/scdoc"
+BUGTRACKER = "https://github.com/ddevault/scdoc/issues"
+SECTION = "base/doc"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
+
+SRC_URI = " \
+	git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
+	file://0001-Makefile-dont-add-static-to-LDFLAGS.patch \
+"
+
+DEPENDS = "scdoc-native"
+
+S = "${WORKDIR}/git"
+PV = "1.11.2"
+SRCREV = "afeda241f3f9b2c27e461f32d9c2a704ab82ef61"
+
+EXTRA_OEMAKE:class-native = "PREFIX=${prefix}"
+EXTRA_OEMAKE:class-target = "PREFIX=${prefix} HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
+
+inherit autotools-brokensep
+	
+BBCLASSEXTEND = "native"
+

-- 
2.25.1


