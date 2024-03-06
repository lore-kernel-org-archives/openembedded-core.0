Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960B8C54E55
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.14887.1709739746699377342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nv5puH/O;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-567fbbd7658so593314a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739745; x=1710344545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slA9ga1Dygg/p1syaP7rrjSdDu2DR+OFPtUOI2/6xj0=;
        b=Nv5puH/OqnQ9jxyXr3yjFFvA5zUPOUQS2XFL9ZHW/1SBMM62/5grdjopLrNuQuuP6x
         aJ1/jiYzEEC+pEIVlo20e39j+6nshbttqQxkg3qUzkooK7L4P80y1OPikrhNippSGwgm
         yR9k9oEOOXBeTLbUQjdEqq54NWpmpYLoah7uTnZKHlizJMITTdHvVxqiuCzvLOkUFzFv
         2Gz3CP4PFGdnaG2HYTWdlq73cLZFGkybn+XHhGuEgpvYzMinfUmi1/8PXDcSci01OJ0G
         bpngbGthO0WDmG/smAszO0KsVELM1UEhcTGsocXHjPdet7MX7UOgDMAL/mLLR8M7D+Ku
         0NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739745; x=1710344545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slA9ga1Dygg/p1syaP7rrjSdDu2DR+OFPtUOI2/6xj0=;
        b=C8sH4zZerWZRFR3vIlT/pmv+cN6rEs2efR8/745M2Uq52mFNvr1Pxw1/UN871g59Jk
         iW8Xny+Nv6LX2+yn2ToKJqwq4YhDizxcYjy7Jn3/y5h27ANRmPFE5KsKZVw6n1YbtUWb
         blYGJ+LXwMEcYmLTfiskUypkYhoG70eglH2tJoz55bGGgsnFoKCFi6Lg2giNrWruJOXq
         hG1Ere/q/pyA4IZEfGz8dyqcOkvjdqpMXu07uynOo7r39+UwlKJ98nQYYVpvJPTD5c38
         VHPx9WWHtV63tvjKaYpnDA7UV0zWTIC9JwgR0qjzSlHJPCnCpg5we7vIFMJ+z8tDC24g
         dB6Q==
X-Gm-Message-State: AOJu0YxH9+oQX9Q9ER5fOmFmCbHcq7yoI6mXae2elt8I1ovyL7S2hxv3
	nMl2PpF/7zXLsE/Ns7Y1fg+J/J57IXog/lyp0QJmnQcO+vCeD+7cjcvHHhu3
X-Google-Smtp-Source: AGHT+IGWkr1yhjr/cNmk+AXmG6QkQTp+YAhOfIv46/Cly3Di4EQ9wwGKn2V6CV1MAu1Lq5fha7db4g==
X-Received: by 2002:a17:906:a411:b0:a45:89d1:3a with SMTP id l17-20020a170906a41100b00a4589d1003amr4689309ejz.41.1709739745125;
        Wed, 06 Mar 2024 07:42:25 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/47] vala: upgrade 0.56.13 -> 0.56.15
Date: Wed,  6 Mar 2024 16:41:49 +0100
Message-Id: <20240306154151.3741709-45-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196728

gobject-introspection is added as configure checks for its pkg-config file.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/vala/vala.inc        | 2 +-
 meta/recipes-devtools/vala/vala_0.56.13.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.15.bb | 3 +++
 3 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.13.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.15.bb

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 162e99bb038..0177e86240f 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://vala-project.org"
 DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
-DEPENDS = "bison-native flex-native glib-2.0"
+DEPENDS = "bison-native flex-native glib-2.0 gobject-introspection"
 
 # Appending libxslt-native to dependencies has an effect
 # of rebuilding the manual, which is very slow. Let's do this
diff --git a/meta/recipes-devtools/vala/vala_0.56.13.bb b/meta/recipes-devtools/vala/vala_0.56.13.bb
deleted file mode 100644
index 0d43ac59a0c..00000000000
--- a/meta/recipes-devtools/vala/vala_0.56.13.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "4988223036c7e1e4874c476d0de8bd9cbe500ee25ef19a76e560dc0b6d56ae07"
diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-devtools/vala/vala_0.56.15.bb
new file mode 100644
index 00000000000..dc483b12bab
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.15.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff3173741ec2cb3f2b"
-- 
2.39.2


