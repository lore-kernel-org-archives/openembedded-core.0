Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web09.9975.1614349606229847791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2Os18I1T;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.42, mailfrom: steve@sakoman.com)
Received: by mail-io1-f42.google.com with SMTP id o11so1862282iob.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kk+dJo0TiHgWNqO65mH9haLOXK+GUZ1vDOvcBUcPamU=;
        b=2Os18I1T0+K3McmuTeSFmm2kR2UFTHijIcbq4bxlABWrwDGng7rxaIaFkJzcDzq4M3
         lTiFnBqb0fa0OoHH5FLofsnEnKGmfzVGcRpBg+njShusIpG/1UHksambKYKckJPP5wdb
         yRZ/8DFLRGFKFBdONvvCuELBQoUKEeyXjYyCnLnfbz0zdsbUlaEbFho6BVVh2D9hxPTi
         On5MibJgu3q0cXWfyy64KRMt/4YztELhxr4gaaMkTj8Ubvd+hGUE00NH4Frj/fh5JLRC
         XUcVlk/4BwzXrZ2Sa/z7L5tf0Rq2m4yzM1zp0zbTDepxg1YkuNB5ztWWvWKjLXFX2Ob5
         SRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kk+dJo0TiHgWNqO65mH9haLOXK+GUZ1vDOvcBUcPamU=;
        b=Ru4gY8uu/bE9vOgV4Xw/G7rDiUjZGxtEc3ENzJAw17pag9UinahKDz6Vg1rC/BMvow
         XJy5ipWlOOZmsZ2Y6E6GIvW/UtsbVi/T0q6F6N+nfc7bYvmkGBzxti5+28zWJS5gWjoo
         ukG/GOOH1sEY+vfETyHlfJ/JCpXd+mnv/v2Lq+uikAd5iS8z83YHZxyLbrIirwQNWuJh
         X68MhpjHaAoNUexvGfX8ZLzQ4IW0qSF9fjj4QunXval8XwTFf/xaR2tYVnk839H/vMra
         PLE+h0NV2+E0Mu+SFXbB9UQyuUzUWX3dhpjXB34uuHblXlGeqeO+DmbsZwvnt4+ctaYL
         EcUQ==
X-Gm-Message-State: AOAM531I87KtSafzPIz3bSVnjJnE/bl2NEF+WuAMwvZUGyOwW23iYzDn
	8w+CmXvUX+EUZcQbrX6Z0qrtA/60dauUWkRI
X-Google-Smtp-Source: ABdhPJxHaqylNu9iNfhA9/lSzzR7sW95FYL/iGcriZMYtNm/90qcSZBoul2WlDiMLgMivaTzh44mlw==
X-Received: by 2002:a5d:818f:: with SMTP id u15mr2921265ion.95.1614349605097;
        Fri, 26 Feb 2021 06:26:45 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/40] vim: Fix a race over creation of the desktop files
Date: Fri, 26 Feb 2021 04:24:04 -1000
Message-Id: <de62852fc07e4f99c026cca3d186e03334b133f3.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The LINGUAS file can be written by two different Makefile targets
and if they race, the desktop file contents isn't deterministic.

Fix the makfile to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 416bc7b697764075fbf73683cd8bddf36d839244)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/files/racefix.patch | 33 ++++++++++++++++++++
 meta/recipes-support/vim/vim.inc             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/racefix.patch

diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
new file mode 100644
index 0000000000..48dca44cad
--- /dev/null
+++ b/meta/recipes-support/vim/files/racefix.patch
@@ -0,0 +1,33 @@
+The creation of the LINGUAS file is duplicated for each desktop file
+which can lead the commands to race against each other. Rework
+the makefile to avoid this as the expense of leaving the file on disk.
+
+Upstream-Status: Pending
+RP 2021/2/15
+
+Index: git/src/po/Makefile
+===================================================================
+--- git.orig/src/po/Makefile
++++ git/src/po/Makefile
+@@ -165,17 +165,16 @@ $(PACKAGE).pot: ../*.c ../if_perl.xs ../
+ 		po/gvim.desktop.in po/vim.desktop.in
+ 	mv -f ../$(PACKAGE).po $(PACKAGE).pot
+ 
+-vim.desktop: vim.desktop.in $(POFILES)
++LINGUAS:
+ 	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
++
++vim.desktop: vim.desktop.in $(POFILES) LINGUAS
+ 	$(MSGFMT) --desktop -d . --template vim.desktop.in -o tmp_vim.desktop
+-	rm -f LINGUAS
+ 	if command -v desktop-file-validate; then desktop-file-validate tmp_vim.desktop; fi
+ 	mv tmp_vim.desktop vim.desktop
+ 
+-gvim.desktop: gvim.desktop.in $(POFILES)
+-	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
++gvim.desktop: gvim.desktop.in $(POFILES) LINGUAS
+ 	$(MSGFMT) --desktop -d . --template gvim.desktop.in -o tmp_gvim.desktop
+-	rm -f LINGUAS
+ 	if command -v desktop-file-validate; then desktop-file-validate tmp_gvim.desktop; fi
+ 	mv tmp_gvim.desktop gvim.desktop
+ 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1ea40e5e7f..d57f784da5 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://racefix.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
-- 
2.25.1

