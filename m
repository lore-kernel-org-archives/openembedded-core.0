Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1C5CA0FE9
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.715.1755790825390204373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fAW4bPzu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244582738b5so10543055ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790825; x=1756395625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo24Wo9EgjIluUSwNzrvBwc3hT0vZa5ULujJymc2DMU=;
        b=fAW4bPzu4FufYMagnsPOszoIjz6FM+MLYI2HuJRdkyWvqA3tfz6na20NsYmAolqHYV
         nq169q5rMbTFuBoSo5yeRpOt1KGDNtIA5EKZqIb4LlEVqylNCQqbrJqczHNSPVFwKHwN
         sxZ8mFTCmfa1HBbFzbyTyfB2M8VwygiQvEXyseIOvtcOseEehUq3IuraII2u/akGYBde
         mU6/iShHc88QoLHpjILwE55VCfAnq5jD4pfoYcTcfeQdkeuyedmS4cTIBw8amzuV7Sla
         0WbRmTS51XGA7CDQEmH/HewOSMgvRkGIBoGv39FeGMZ7162YPgDxJdO0K2ozj+iR3Cim
         kmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790825; x=1756395625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fo24Wo9EgjIluUSwNzrvBwc3hT0vZa5ULujJymc2DMU=;
        b=PJ5rH6oCkzWbLCbhSEFg0egRSLMZCF2786OfGNcEMgg5+xXvMwot6HovZpegojOhQe
         mxvCHKtjpyK3IMrvA3OXSkVAn+BZ7a1R4ffuMwGX27Ud+UqBZ4T/Ne5H3GhnVJV8kGng
         EOO/fJA5o2xqkcwifW/RYqCfiZxcQ7lpanVe4KkX2KW2ATJ/sP8dMudlqjBfzDRGp8XE
         mnGfZDRfTj7IKOpdDdJuoO+QiIsgbvbKuVrGMMieYug6LD71TedQAN1hdVpUtj8NEm6p
         k2bi6Ve1lFlS/wSctedC+DK490mJTb52Jsglfal0PPggCCuL342W9ch82m3l0D1pSaMc
         zUmg==
X-Gm-Message-State: AOJu0YyXDYKkFP7PsaaZusGRhNBj7kCDTjD7xhFg2Y9jdJrfcPPtEZ2H
	/xove1c+Blgf/6MMTXsOlERKqhOQ6QjKYk70mLF/6l/jHQw0TwFNfB+GHPCS4a47dKjy8Rln96Y
	Tjy3E
X-Gm-Gg: ASbGnctg+q/l8nFmRbNbHWW6d2pfdqTDHzpIYr60xT3bs/d201mdl3PKsNr242Pj3dL
	mWyQKRiQGIu+WmUddDsjnaLbIdv1fW4WfQIQuqbyXKxm7S16ZCpz1XWiENSMCqfzGzacjn5MBp5
	6LXF3cWmxmKBKnsMpaFodpae35r+DmnFTGKUyhIQN3DnHN+9uwOjDCQhOT7LYE2mdnf2XJNPZXt
	77u7PGV8JvHP7SIGwzDc+j/7WTeyl4v5759gyPLwzXk7u8y5FIZaQYJRyv3OZEnh5A3dyVTGZLV
	zJGHeaLClBUvtDIm0g4dwGPNzoezHcG93uuGzFc7N/uwOjmkgn4SaVMSmNzpQbi/6brML9XBfAn
	kYVgy54xDtokF0mo6Dgt76xkK
X-Google-Smtp-Source: AGHT+IGrdtgMiV/VctZq/nhZy00CaxlICyLV3HZUg/TxE3y8MNqsTS2gVql4AGIR29uJxa1j4P+7bA==
X-Received: by 2002:a17:903:2a8f:b0:242:9bbc:3644 with SMTP id d9443c01a7336-245ff878970mr46533065ad.54.1755790824047;
        Thu, 21 Aug 2025 08:40:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/15] binutils: Fix gprofng broken symbolic link with gp-*
Date: Thu, 21 Aug 2025 08:39:53 -0700
Message-ID: <55684a63904365d8a6ab2a8ce9e091f29b0b7df5.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222261

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In binutils 2.44, application names were changed from the gp- prefix
(e.g., gp-display-text, gp-archive) to the gprofng- prefix
(e.g., gprofng-display-text, gprofng-archive). Temporary gp-*
symlinks were added to maintain compatibility with the older
gprofng-gui.

However, these compatibility symlinks did not support cross-platform
toolchain prefixes, which resulted in broken gp-* symbolic links.

Support for cross-platform prefixes are added upstream in binutils 2.45,
so this change backports that fix to resolve broken symlinks issue.

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=90803ffdcc4d8c3d17566bf8dccadbad312f07a9]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../0020-Fix-for-borken-symlinks.patch        | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 32928ee167..26c2a413b8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -45,5 +45,6 @@ SRC_URI = "\
      file://0018-CVE-2025-5245.patch \
      file://0019-CVE-2025-7545.patch \
      file://0018-CVE-2025-7546.patch \
+     file://0020-Fix-for-borken-symlinks.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch b/meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch
new file mode 100644
index 0000000000..b26cf8a83a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch
@@ -0,0 +1,62 @@
+From 90803ffdcc4d8c3d17566bf8dccadbad312f07a9 Mon Sep 17 00:00:00 2001
+From: Zheng Junjie <zhengjunjie@iscas.ac.cn>
+Date: Mon, 10 Feb 2025 17:04:55 +0800
+Subject: [PATCH] gprofng: Fix cross-compilation binary name.
+
+commit d25ba4596e85da6d8af78c88b5917e14763afbe1 create symbolic link
+no care cross-compilation prefix.
+
+(cherry picked from commit:90803ffdcc4d8c3d17566bf8dccadbad312f07a9)
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=90803ffdcc4d8c3d17566bf8dccadbad312f07a9]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ gprofng/src/Makefile.am | 12 +++++-------
+ gprofng/src/Makefile.in | 12 +++++-------
+ 2 files changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/gprofng/src/Makefile.am b/gprofng/src/Makefile.am
+index a132a9ddb05..0465cdb06e3 100644
+--- a/gprofng/src/Makefile.am
++++ b/gprofng/src/Makefile.am
+@@ -179,10 +179,8 @@ $(srcdir)/DbeSession.cc: QLParser.tab.hh
+ .PHONY: install-exec-local
+ install-exec-local:
+ 	$(mkinstalldirs) $(DESTDIR)$(bindir)
+-	rm -f $(DESTDIR)$(bindir)/gp-{archive,collect-app,display-html,display-src,display-text}
+-	ln -s gprofng-archive $(DESTDIR)$(bindir)/gp-archive
+-	ln -s gprofng-collect-app $(DESTDIR)$(bindir)/gp-collect-app
+-	ln -s gprofng-display-html $(DESTDIR)$(bindir)/gp-display-html
+-	ln -s gprofng-display-src $(DESTDIR)$(bindir)/gp-display-src
+-	ln -s gprofng-display-text $(DESTDIR)$(bindir)/gp-display-text
+-
++	for i in gp-{archive,collect-app,display-html,display-src,display-text}; do \
++		oldname=`echo $$i | sed '$(transform)'`; \
++		rm -f $(DESTDIR)$(bindir)/$$oldname ; \
++		ln -s `echo $$oldname | sed 's&gp-&gprofng-&'` $(DESTDIR)$(bindir)/$$oldname; \
++	done
+diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
+index d0dec12e244..d6f1f9438b6 100644
+--- a/gprofng/src/Makefile.in
++++ b/gprofng/src/Makefile.in
+@@ -1119,13 +1119,11 @@ $(srcdir)/DbeSession.cc: QLParser.tab.hh
+ .PHONY: install-exec-local
+ install-exec-local:
+ 	$(mkinstalldirs) $(DESTDIR)$(bindir)
+-	rm -f $(DESTDIR)$(bindir)/gp-{archive,collect-app,display-html,display-src,display-text}
+-	ln -s gprofng-archive $(DESTDIR)$(bindir)/gp-archive
+-	ln -s gprofng-collect-app $(DESTDIR)$(bindir)/gp-collect-app
+-	ln -s gprofng-display-html $(DESTDIR)$(bindir)/gp-display-html
+-	ln -s gprofng-display-src $(DESTDIR)$(bindir)/gp-display-src
+-	ln -s gprofng-display-text $(DESTDIR)$(bindir)/gp-display-text
+-
++	for i in gp-{archive,collect-app,display-html,display-src,display-text}; do \
++		oldname=`echo $$i | sed '$(transform)'`; \
++		rm -f $(DESTDIR)$(bindir)/$$oldname ; \
++		ln -s `echo $$oldname | sed 's&gp-&gprofng-&'` $(DESTDIR)$(bindir)/$$oldname; \
++	done
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+ .NOEXPORT:
+-- 
+2.43.7
-- 
2.43.0


