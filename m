Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id CE7BA600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 11:15:28 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id i26so15233732lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=w8AgZU/QxKquG/aMU+lSLRj2GtkKUhADix3IePYKxHI=;
	b=PYKLoY6obJynad1sNTePoV0laIvEfZPUmrarbeJLMBJRbbQTVZtcxgvDgvThSjIuoo
	CWJjLe46pbyPaR1Sqo7nInJCDehAbN/o6YgpU2xQ0XqC0d/htxSFffjewetbTRkZjv1L
	4mepCrx2Xd4WSTDOPQHwxq8VoezY2q+/7XJIDNPT1jQF9t1+KkWDPmKPtRwvZ4y+X22M
	yYwpc6DOdBfBh9izgcM4WWltbqZVjVf52zQZ34E0WOv6P6Mc+hAeYYNRY5m/Hlkp+mbd
	5trfuLvkn62QKqzgP1ibLl8aM8UtdIfxWsokodWvJ25k4u3+H9uQG3rTstFj+f/TbV2t
	NE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w8AgZU/QxKquG/aMU+lSLRj2GtkKUhADix3IePYKxHI=;
	b=Slyr4TumEC0dThsDiTzfbkwmqXWqXZFd2/GJ+XM/HyOHGJrcScuBxwBCrd8oi9GfH/
	0GQ9eqrO9nVDQcFlKcH+wIhaOzbUF/bK5ENmETIFhzm/tddJns2+F7jFLUTMw/xCXmnV
	qlIonhFjBJ2BqXjqeEqHbw2fE3ZeWbHk7Ox7d/av9dFcU4P99k5j0ysV+GCtuxjky4Wf
	X2DJQCrN/1zHDbnT+yrfW38cukJ3SU0DKbs1VZOEqOlwkRcwugAqLfkRJlDBm5HhEvzD
	UeQYf93cdvQYLF/Z1BZVqNZvcsTquJUZPPIY93HARWfo+gVx39RpkDYjiQGbbFT4n0Li
	bb5A==
X-Gm-Message-State: AJcUukfdCCTAg0hc1rkVExZtaziOKZJZqYAeyKGHCiNgGGAA4fzB3G0e
	qFFSJhtUdOHJgArwaY8Y1E/m4tHw
X-Google-Smtp-Source: ALg8bN4S9pzGVwaEHuY/63JzujXcljb1ftjs9bPYu6aD5NMXVVg/QSlukKI9F4KCsmm4SWYuaei2Gg==
X-Received: by 2002:a19:4ed9:: with SMTP id u86mr17262876lfk.78.1548069328942; 
	Mon, 21 Jan 2019 03:15:28 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	p10-v6sm2191393ljh.59.2019.01.21.03.15.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 03:15:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2019 12:15:19 +0100
Message-Id: <20190121111519.109947-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] perl: fix a race issue during 'make install'
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
X-List-Received-Date: Mon, 21 Jan 2019 11:15:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...install.perl-runs-before-install.man.patch | 27 +++++++++++++++++++
 .../perl-sanity/perl_5.28.1.bb                |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Make-sure-install.perl-runs-before-install.man.patch

diff --git a/meta/recipes-devtools/perl-sanity/files/0001-Make-sure-install.perl-runs-before-install.man.patch b/meta/recipes-devtools/perl-sanity/files/0001-Make-sure-install.perl-runs-before-install.man.patch
new file mode 100644
index 00000000000..26590f59088
--- /dev/null
+++ b/meta/recipes-devtools/perl-sanity/files/0001-Make-sure-install.perl-runs-before-install.man.patch
@@ -0,0 +1,27 @@
+From 965adc80636e24e9608ca983c18c95cae08de021 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 21 Jan 2019 12:09:13 +0100
+Subject: [PATCH] Make sure install.perl runs before install.man
+
+Otherwise, install.man may attempt to write to non-existing directory:
+|   Can't open file /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/perl/5.28.1-r0/image/usr/libx32/perl5/5.28.1/x86_64-linux/.packlist: No such file or directory at installman line 183.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/issues/72]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index cd8d75f..82bdc1d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -410,7 +410,7 @@ install.perl: installperl | miniperl$X
+ 	./miniperl_top installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
+ 	-@test ! -s extras.lst || $(MAKE) extras.install
+ 
+-install.man: installman pod/perltoc.pod | miniperl$X
++install.man: install.perl installman pod/perltoc.pod | miniperl$X
+ 	./miniperl_top installman --destdir=$(DESTDIR) $(INSTALLFLAGS)
+ 
+ ifneq ($(perlname),perl)
diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 71892a2436c..949758c4d49 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://fix-race-failures.patch \
            file://fix-race-failures-2.patch \
            file://0001-Also-build-dynaloader-separately-as-race-failures-ha.patch \
+           file://0001-Make-sure-install.perl-runs-before-install.man.patch \
            "
 
 SRC_URI[perl.md5sum] = "838198c43d4f39d7af797e2f59c2bee5"
-- 
2.17.1


