Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 77D66771EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 15:31:09 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so228095926wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rbUunlRakvSoApjjGw0+PuosxcmkXf2P0QJNgCs887U=;
	b=kXnMgubV5a57agqdr7wicmO150v8N5T+E+bVjSxj8mBXft5AGJH2O3ncCH2Glj4hkw
	V/C5B/MWU3cLNDiz7plJiBf7n2cUslbdZAN2YXRWAUzNNhhhTcHO98WNnDDoWSTAI2mS
	C/dodIZ0li7V289wfNMaFRnK0hixIWHHaekZCfvzCDT2FAUGLKnv1znxrfbZ0P2FisAV
	ZuNYScxCDKBcpY59Nm0F2wDXTHxyOg2yuFM4rRY2lSDFhZDHEn/s1n/ZiqQF87jZRjNC
	8O2l2iugvOa8dTqC9brZD3IFjbzWSi/TQ5mxfMEYX6L+tv3t/J/wnym4ggshA4ySseVo
	QrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rbUunlRakvSoApjjGw0+PuosxcmkXf2P0QJNgCs887U=;
	b=EFsGYJKY/wVHYtKuaYnmZL65bbnT8Fth7hju4JNXje7YQ6BXIuoaBVmJYsiOBv7Y36
	5HhoRq2Q+oG5uTIDn6wNsoVfHHniz7woWEWKPy8qtd2lBDMLX4OXq95EfYQwFQQQ9kwA
	8puZtMoejlK2LwNORSbIjVTRo3z7TvfO/nDYmzCzZ6MVW5ig+cSFtRls7gxyVhKO1BCK
	scXfzxRZfweROFw/4myMEKw5U4QKRNidV/9anxsdP6MCmRz2YQr1xXICkZsmlpuEWipv
	0UwFt0G72JrOujMz1TQIrB7NMSmAxILAA23IlINuro/zs1KWc2tydSEUUETutFe1eivc
	g7Pw==
X-Gm-Message-State: AG10YORVR9S26ORWx2DCe6SV1SC8Nun8S71zriwTXyBrJDlF6/QN6XK+63N3OiqMWx90Rg==
X-Received: by 10.194.77.167 with SMTP id t7mr33247501wjw.90.1456241469538;
	Tue, 23 Feb 2016 07:31:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h132sm26595296wmf.9.2016.02.23.07.31.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 07:31:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:32:07 +0100
Message-Id: <1456241527-14445-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] fontconfig: Don't add font directories from host
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Feb 2016 15:31:10 -0000

* when enabled, configure check for "fonts" directory existence in following directories:
  /usr/X11R6/lib/X11 /usr/X11/lib/X11 /usr/lib/X11
  on _host_ system and if it exists it adds <dir> element to
  /etc/fonts/fonts.conf
* update_font_cache postinst will then fail if host system has e.g.
  /usr/lib/X11/fonts while the rootfs doesn't have it
* if you're installing fonts to other directories, you'll need to adapt
  this EXTRA_OECONF to find them that's why it's in separate variable

[YOCTO #9155] - update_font_cache postinst failing with read-only filesystem

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
index 9bbff20..b3bc7eb 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
@@ -40,6 +40,10 @@ inherit autotools pkgconfig
 
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 
-EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts --with-cache-dir=${FONTCONFIG_CACHE_DIR}"
+# comma separated list of additional directories
+# /usr/share/fonts is already included by default (you can change it with --with-default-fonts)
+FONTCONFIG_FONT_DIRS ?= "no"
+
+EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts --with-cache-dir=${FONTCONFIG_CACHE_DIR} --with-add-fonts=${FONTCONFIG_FONT_DIRS}"
 
 BBCLASSEXTEND = "native"
-- 
2.7.1


