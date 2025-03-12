Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E845C28B30
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 13:01:09 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.36252.1741784465244051944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 06:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MGnW91yF;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25313ea37so1023379866b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741784464; x=1742389264; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKDXA3Gz2QUeQHr3MtOfjOZAhKqrCh7kQwTK3mqZZH0=;
        b=MGnW91yFXked2tgk0Bfs2Wj9/kbh1zBK3o622TlaUuUvOTU4+Cb8YSrfa0LKbhWYc3
         AUKbSAIcIG9+dFKHliIjWIkfQ34/pIpkIFWhl4pjn2hpufyvvwm4mSOi/9jOHDx+8jwX
         iMPhK4cX2Riu/f1NqQKPMRRts25xMsc5I2cyj65W/Nm8fpQiKfTXm7iNbu7NV6AeshRS
         gI2AcgZr0IiE5ejnQTX00snnnT7DwZGkZq4/wXh9FIy9EcIKXLbibibuamMMTlw6RSaK
         muhLIXiqhDupd8zgiI/iwQXtqUtzJENlkzRhHPfx1lBTkYKoHq7BY47GOdpuCQIp6Tv3
         FfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784464; x=1742389264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKDXA3Gz2QUeQHr3MtOfjOZAhKqrCh7kQwTK3mqZZH0=;
        b=j7xshRt2dyPEl6jt1353tIe6x/q0vXh2SwJ1rPWVZFJgx1XPef+M+yc5Nwf4/McbVz
         pVCojcCQMTUbKwtN8/5NRPr9PtCgB01p3/Bt3zOhmF99l9tB9UKUfuvd9U44TFlLQ8Qi
         5TJPM/NIf6yL7+CSXBy2bBVJOTWf1ksSeKH+g193Uo2Ml2r38FqMSBqCExFW7K/1txfW
         9M+5+YudNsLKZiwRNqdHJqZBy035JIGYvy6F8RLRgkrbbxXVjBEWSSd7r2lyl/HYsZey
         q9SxkcZaObjpmghx46ykViUpDWWWF0bBYZ3Grp7DKxaEDXYYFJc25UU5E9Bl/atJkKUC
         mMKg==
X-Gm-Message-State: AOJu0YwZv9dCfm5Q6mk2jNvN+34/sf5cXPePlIO2sEDU3dIM4joqw3di
	Kzv47zqejt+ruzZ5vWIAiqgpfYxGBV5v2tGWCLA1HSXGtbQPvd+ciXK+tdBs
X-Gm-Gg: ASbGncuzsPXhZAkP6GHCQtdjFK5VE5e9cntoL0sR5PuXXOB+8eUK5cgAfMryUs+kOca
	Ix2cIhwTGfu+v0U59zrTl0rn0aZsnMdSyj2LH9/i9c6UmgTt3gTbKxtiJRKH+d7j/xaqWdkX+dG
	BO0pbL4SKZbl8aUharGFhwmnQYGXKujC3SXGnHt5PLz1PsXgUTn2nbNY+wu0d/pA/y5TdK60puy
	JVtWCtGC35JjjgVkMtFiY/qet5xILquhPlm3stJ8WBx1BIaesbk94Uw3e25oLIxzVxKibz0OS8o
	66/8Af6D5+1EjyEVe2cqYZOQuiV6Ilc8Efn8n4ZnFo6RUauyacA1q8ca8ph4pagBBlYSUuK6o15
	n0QQWHZL6Ucs=
X-Google-Smtp-Source: AGHT+IHIgqJLlf5IyDpcO4eScR/iqqy5WK06GjZTNIrwOi7ST3TlceDmLqtKSnsWjvj7Uk4+kNflfA==
X-Received: by 2002:a17:906:1c4a:b0:ac2:7cf9:71a0 with SMTP id a640c23a62f3a-ac27cf9740dmr1797680266b.48.1741784462983;
        Wed, 12 Mar 2025 06:01:02 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988b64asm1068306266b.155.2025.03.12.06.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:01:02 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Mar 2025 13:00:44 +0000
Subject: [PATCH OE-Core 1/4] scdoc: Import from meta-wayland
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250312-upgrade-kmod-v1-1-4de94f131b64@gmail.com>
References: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
In-Reply-To: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 13:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212651

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


