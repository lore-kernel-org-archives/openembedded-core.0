Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.9779.1620227947014299252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GqfYmg70;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id u21so3414648ejo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T7AvumahgHglonlkes/2vX3CGr3U/W+I63+flkAsz54=;
        b=GqfYmg708DnQN4WjPtDZqBhVfYaszlha34auQwSmu5XxbEMEExMBM7Q04luwdMwcV+
         OQMytMeiAnn61wZUqyrv7v7g9NvULYBbT15cdZvaA6MnZWFGf4rW+CCUJSE942I7ccQy
         e6aBamolSgqRelz2k9/E7yL0YO8kQ5dwCqE8vAtrhNVdiv4QlzqlFsZyN4ZciSyyHU47
         BqLo6T68I87E5R7B2NfPTtKPrOZAH3Lm+y0ISx4+sNXo8ascd4K6FYIo+EZnRqQQ8ZzA
         tgvPSPKB22ozKlt3JjP+HuMAdzuYt5g2g3pAXP7U0dgAyAPqbbkETwgcxNTq5A5mMcRg
         xJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T7AvumahgHglonlkes/2vX3CGr3U/W+I63+flkAsz54=;
        b=DjUgc7/hHdHUQJOul++s1q13zGx7QFxMW2aMEE29uLjFR9miwY6vRw7ajfLxAEwzX+
         X2QthTsq/2Uv3A88GRIspTctCVc9tEE2qgIBY9CSZu1I7FwdZYlYjyf9JF2VAgPwuprJ
         bgOdWE2fWGKFfAJCenBBPxzGp54yjB2vpsd54YuKzB/a5gNECDFNN1iWbwjewl4I3IF9
         u+p3SeQsaqARvWvNACAv5gHwqRibqlkHnPQH39y4jFrm/ZAQ8jF3vDHIAQfWCvRCbi/S
         b2u769Rtzzdfp8EIvT+IBCX4Bw3oEgxssRWpSWvm/fJ+iER/n/kofMnV00kyoURqt7kH
         /htQ==
X-Gm-Message-State: AOAM530HCwi054nV7XhsUrJ7Ryjn5UTgH410uRrj70HIBgVOdjz9xV77
	UlOiICH0Geb3NUJ4TjesLRTZ/41NG7eumg==
X-Google-Smtp-Source: ABdhPJxHKnnRZBGqH48UZR0X4UPDvxbwSyNyTlv47w6MwCz8TI5B11R4b2FpSVUa3zHkXNh1vbF67g==
X-Received: by 2002:a17:906:22cf:: with SMTP id q15mr28840233eja.474.1620227945652;
        Wed, 05 May 2021 08:19:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/61] systemd: backport a patch to avoid unnecessary rsync dependency with latest meson
Date: Wed,  5 May 2021 17:18:01 +0200
Message-Id: <20210505151850.660512-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...d25119a495009ea62f79e5daec34cc464628.patch | 53 +++++++++++++++++++
 meta/recipes-core/systemd/systemd.inc         |  4 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch

diff --git a/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch b/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
new file mode 100644
index 0000000000..ae449791f1
--- /dev/null
+++ b/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
@@ -0,0 +1,53 @@
+From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 12 Apr 2021 14:03:32 +0200
+Subject: [PATCH] meson: do not fail if rsync is not installed with meson
+ 0.57.2
+
+https://github.com/mesonbuild/meson/issues/8641
+
+Our CI started to fail. Even if the change is reverted in meson,
+we need a quick workaround here.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ man/meson.build | 25 ++++++++++++++-----------
+ 1 file changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/man/meson.build b/man/meson.build
+index 3cae8446cda..f9c4b83dc81 100644
+--- a/man/meson.build
++++ b/man/meson.build
+@@ -184,17 +184,20 @@ html = custom_target(
+         depends : html_pages,
+         command : ['echo'])
+ 
+-run_target(
+-        'doc-sync',
+-        depends : man_pages + html_pages,
+-        command : ['rsync', '-rlv',
+-                   '--delete-excluded',
+-                   '--include=man',
+-                   '--include=*.html',
+-                   '--exclude=*',
+-                   '--omit-dir-times',
+-                   meson.current_build_dir(),
+-                   get_option('www-target')])
++rsync = find_program('rsync', required : false)
++if rsync.found()
++        run_target(
++                'doc-sync',
++                depends : man_pages + html_pages,
++                command : [rsync, '-rlv',
++                           '--delete-excluded',
++                           '--include=man',
++                           '--include=*.html',
++                           '--exclude=*',
++                           '--omit-dir-times',
++                           meson.current_build_dir(),
++                           get_option('www-target')])
++endif
+ 
+ ############################################################
+ 
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 7d3b3064ba..3a919fd82b 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -16,6 +16,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "17472dca0160cbe7b807ca648475fd70d0d62fe5"
 SRCBRANCH = "v247-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
+           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
+"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

