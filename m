Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F8ACAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:41:15 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.34452.1758141674636331614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQmhO7wu;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32dc6616f7dso133270a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758141674; x=1758746474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MO9iRLXWuW/udp4dnYlkvuanReZHcOPdNfa+DT7G9yo=;
        b=VQmhO7wuE9tMXAEYXDHt1gQma3vd+hjJH596u0oJpsAOXWHCE10xKiM3chUd+IZMmv
         DZymFt9ysCsKIlnOxLP4gyF2Dwy4y796yhPF3MTkDkQt3HegRg0HIUv9y7ss2P4nF6t1
         JFTvbvNZjHDRunOqGTejz04L1i2ZSwLxW+jjlddt2J8PBj2LddtJt+UILDADCQNr4XXm
         GXEpUKrPrVsYA3zYaBy5Nd0VxSFuXzyF7nOGVvZRTL9bTZ+w10dwATPMrRypg77QxZPJ
         GAvgdpl8oQI01f306ZfIWd3EdMHlavgMZxTScBnUx5MPeNF1P6+BhULrckqVjW1g5oIE
         9a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758141674; x=1758746474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MO9iRLXWuW/udp4dnYlkvuanReZHcOPdNfa+DT7G9yo=;
        b=RbkVWapHRuhpiyn6A6OSK5nUAkoDb/VnIOB7OIZkRQisHzSp91XOjqfwVl2nFU3r8f
         7NnptcLRf2d1QK+yTZq2wpq3dn/rbO9YA5lQqvCx66M7Hdm+NSRW+FZBdUBS93cOTsLG
         BX7aF9iYrY8PikYWHhgF88qkp4xTnA4HsU7Iw1mBmuPP+ODSuaouNNbEcSzx9VmtLYFS
         mv6K2JkPhw1DPnv9PmiLIa0CEmdch2ehlYZAMA8p1q9T5QSKofNj4RS0iiIfFNhyA0om
         bIpVfS7BnEyp0xYCP3m+9z/5JCADI5KUDbnbI47yWOhpTXSKy62o/1FsxvaksYVTSM3v
         HqzQ==
X-Gm-Message-State: AOJu0YzwqOGZBnCm5ToVq9HQUEQ1Lz9kHTQcSDa/PW5HixQw+qTkXOLF
	4Gp0I4D/sLvr7DmOxdLMpWME7Hog0g3l8N4D0rKuZRLRaNNnOaED/JaPreJ8jaHOzH8=
X-Gm-Gg: ASbGncsqEwmRp/zpSpnW53/UDCXs3wQFaAZA0xAi3HFhVZQFGlEDe22svxs+oFEdtnq
	TTnPk0vOUIu40Fe+GYPwm3gaU7t7IVaYr8EZDAkVCMBL4YBAHZxm1GnfBSGNsaoKsL/G6Vx/63Y
	Oz6swh/ASkhXOtKO2KBQ0bnELxinvAC0mvGCNwoQnh6YeKSJhskP0DvcneJ2TEQM2a/e1ARRKVA
	G+x4stBCBVS4NQlKslrEFIM+b744ysxLGUP973J5cf/rjFoTaC52jy4ktc9PA29f/FlYV1dJg62
	qpyz9FDpACAI6U2nYoRd/YmMCrnMHyYq1RFORl7NjCrsTQVi22qiM9jqtQK1dNsEwioTtxY9s1v
	/DMwk4vs/wjwadN7KsxPMU95p0f19F3ozp9qNxXR5TgBBREuUzOQoa0IqA/dyFJtYbqEDLRh2r+
	uuPXwEzz7zu+110zj34SMP/fW3eywaHNz8b/jB9Zk4UWD7hueZq8DzfYvhcYc=
X-Google-Smtp-Source: AGHT+IGe5+9dcrqhVwMvPTvtAjryVZO1l8ZMibZ2jAvftob0rwLvgjEi199JC6x1H0ja58xaE3h5Jg==
X-Received: by 2002:a17:90b:57c6:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-32ee3e8f8ffmr4458991a91.6.1758141673652;
        Wed, 17 Sep 2025 13:41:13 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed257bb5asm3221665a91.0.2025.09.17.13.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:41:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] xkeyboard-config: Turn absolute symlinks into relative
Date: Wed, 17 Sep 2025 13:41:10 -0700
Message-ID: <20250917204110.3420962-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223624

Native builds encode symlinks pointing to absolute paths into
build native sysroot which gets into sstate artifacts and an error
is rightly generated

ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: sstate found an absolute path symlink /mnt/b/yoe/master/build/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/sysroot-destdir/mnt/b/yoe/master/build/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sysroot-native/usr/share/X11/xkb pointing at /mnt/b/yoe/master/build/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sysroot-native/usr/share/xkeyboard-config-2. Please replace this with a relative link.
ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: Failing task due to absolute path symlinks

Turn these symlinks to be relative inside D which will reflect
correclty without need for absolute path prefix

Suggested-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
index 857ccc75160..5153b76d98b 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
@@ -20,7 +20,7 @@ DEPENDS = "util-macros libxslt-native"
 
 FILES:${PN} += "${datadir}/X11/xkb ${datadir}/xkeyboard-config-2"
 
-inherit meson pkgconfig gettext python3native
+inherit meson pkgconfig gettext python3native relative_symlinks
 
 EXTRA_OEMESON += "-Dxorg-rules-symlinks=true"
 

