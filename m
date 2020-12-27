Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.32648.1609077185783546237
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 05:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=atcv1RAV;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id qw4so11127652ejb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Dec 2020 05:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rr5PD4Bz9xDrgJHdIFiEeQd/FHmdpUvF+q6bkHbjoUk=;
        b=atcv1RAV3H57znjn5muJLkL4SKTb7b/gBXTa/a8Uko7f5f5FGdvCsXxJDVOYMvdcgp
         Q99kNwYBFpqyAwvx2v1isEDXFbTz4nuZX8MrLsj1oPHmDsP8oQ+xbWzVyWaDz7XJ3vl3
         3KzUrP32CP3DtZxdb8UpTcCQM6kDR5aRhaaorfHvZUYlcp0AL7MukZctCcjf7Is04EfP
         KS79pKkj0Gh3RMhvWuSU+Dcf5dlFvr9sxG9FJufhM/tl1r05Wh3/WXJVs+XPUU2ujfsC
         EML/hTng4JLx34P1BVszGqFpREmASsgOucKEYepHXS+LLw7o/PItcCVZRw9yoBy6OP6c
         OByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rr5PD4Bz9xDrgJHdIFiEeQd/FHmdpUvF+q6bkHbjoUk=;
        b=c7vGKSV5okKiz9t5Hq9vsW7Z8WzPp/NgjTxDVbpmMWI3MTF6/LN+Mn95evjzdTWQ2N
         NpTfbl9Rrtof2gpmyo39s7FJcTDkbupHU/fCiweUmXp+KKtrqa4HSi1h3Up2cj1iRstP
         oB9dY8qHmXt2JMwaz1+eRFRuR0xX5osf+tXXFMnDuTY6ec9aZjv/Ys3rD1yRDtaBFirq
         DHj4wwrQjzcs+8rhikxHVP/AJOCAYTr+bkyuI3NZy2RlA6fvyh08YFCPa2g8KlJKIZdd
         DmQa6ugnRqcP38MzQnv8LIINqAF8VhU7LQ4qYPTvywazAJNXF6wKDVXzc9Te1Zi1iMg3
         m3+g==
X-Gm-Message-State: AOAM532eH5PhlkI/5WPeO2O/TM8HqwtyFfNhZzA4tGWTyOXcBy7sL8jp
	VdDh9ecTOacEPpTShBbcSqLhd+b9Jv0=
X-Google-Smtp-Source: ABdhPJwo7Q2jtmEa5Pp7SDofkC3WFebOZzvKL5RRGDcyyI74aaxTohG+qV8OXG1tgOZ36wowYddYDw==
X-Received: by 2002:a17:906:60c3:: with SMTP id f3mr38031235ejk.65.1609077184145;
        Sun, 27 Dec 2020 05:53:04 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a23sm8647933ejg.7.2020.12.27.05.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 05:53:03 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] busybox.inc: install rcS, rcK and rcS.default only with busybox in VIRTUAL-RUNTIME_init_manager
Date: Sun, 27 Dec 2020 14:53:01 +0100
Message-Id: <20201227135301.1488648-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* since
  https://git.openembedded.org/openembedded-core/commit/?id=991394be9e695f9ddb5e2fca167c06f7a56a7449
  the rcS.default is in SRC_URI only when VIRTUAL-RUNTIME_init_manager is 'busybox'
  but this section in do_install was controlled by
  CONFIG_INIT=y in /.config which for busybox-initrd from meta-virtualization
  caused:

  ERROR: busybox-initrd-1.32.0-r0 do_install: Execution of '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/busybox-initrd/1.32.0-r0/temp/run.do_install.1481880' failed with exit code 1:
  CONFIG_FEATURE_MDEV_CONF=y
  install: cannot stat '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/busybox-initrd/1.32.0-r0/rcS.default': No such file or directory
  WARNING: exit code 1 from a shell command.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c3a97261d5..47fcb59302 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -309,7 +309,7 @@ do_install () {
 			install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev
 		fi
 	fi
-	if grep -q "CONFIG_INIT=y" ${B}/.config; then
+	if grep -q "CONFIG_INIT=y" ${B}/.config && ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','busybox','true','false',d)}; then
 		install -D -m 0755 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
 		install -D -m 0755 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
 		install -D -m 0755 ${WORKDIR}/rcS.default ${D}${sysconfdir}/default/rcS
-- 
2.27.0

