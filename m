Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE3575C51
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:51 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id yy13so325932046pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O4Pr6qAMnpIAwUqq3SHxGm4/qAlzPgl838HHWz9/AH0=;
	b=tC32s3TLAwkd3g7fjq7dhaHH1X1M6jbdcTU3yRVR+1EleE1rpw1NrWhXrjrBtycTpM
	blfX05LJOBKJIlgrER9993fUlgfDCvmWx4kAWqki6aBR9P/w1kvokcvQLNueaMcx73Tm
	hzkQlU8wri0qpghW6luQxgwgV1VPlKpOql+hwcYKYOpmCPoe6ttxeUwYJMRmSm7eAUqv
	6EfePl1uuTfedL/UnVqIhSzABc5lSIwS0GAbyVgZ0M/q8DAoFaRnA3OjGRDVo/mJJJdJ
	IZo7pSNatJteVK26LbgonwoQwPeSEMROfVlVOvvb0Jf5E4KW9+6fvU6Lp++YnK3zmXBV
	0dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=O4Pr6qAMnpIAwUqq3SHxGm4/qAlzPgl838HHWz9/AH0=;
	b=QuPWAhbcYMKvcgEdtYnjx1Etn/LkzeeqwvVGWHY6JaCJyu46IGk56Z1At8QZ3HeGXq
	Ta1H/XUze4C/rfOhffQ2AmYYK3J9TRVsaAkmiexHoEvbB+ZetHUBTeW0ZkqaeleGMS3t
	tda+2GzPLYunhr5fIqf5chq6w7UfspeM7oM6xM3b06XEbwe2MuUhdBGf9z/syxzVvoXX
	1JcLAb9b2cOpgwhLfi7IMtk+yEyY3ShQpWdDQC6RG5SXRdsxQpU64W1uAbMZsp4h6WiZ
	+IXZsJxIAJ2VPzwjGZ1dZ4Rdmysk4JDp/T9W21GpxNS93KBUTYJd1rAYl4jtnyLf1KgL
	dTmA==
X-Gm-Message-State: ALoCoQmzXE1+YeiiXtM2zqBAes4jqBaXLqRDa0C0e4R5CN+LFuecleHaBJRi0lCNaPJlNKPBeMV8/2shR10s/KjHRfuTe16NVQ==
X-Received: by 10.66.232.170 with SMTP id tp10mr28683815pac.38.1453030672625; 
	Sun, 17 Jan 2016 03:37:52 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:32 -0800
Message-Id: <2486e241a5d48095ad59d1c220a59f63638e8f2f.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 59/73] musl: Create ld.so as a relative symlink
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:52 -0000

We have rootfs intercepts which fail on musl because ld.so on musl is an
absolute symlink to /usr/lib/libc.so and then it fails to load when run
with qemu user mode.

Fixes rootfs failures like

WARNING: The postinstall intercept hook 'update_pixbuf_cache' failed
(exit code: 255)! See log for details!
WARNING: The postinstalls for the following packages will be postponed
for first boot: libgdk-pixbuf-2.0-loader-jpeg li
bgdk-pixbuf-2.0-loader-png libgdk-pixbuf-2.0-loader-gif
libgdk-pixbuf-2.0-loader-xpm
WARNING: [log_check] core-image-sato: found a warning message in the
logfile (keyword 'WARNING:'):
[log_check] WARNING: The postinstall intercept hook
'update_pixbuf_cache' failed (exit code: 255)! See log for details!

WARNING: [log_check] core-image-sato: found a warning message in the
logfile (keyword 'WARNING:'):
[log_check] WARNING: The postinstalls for the following packages will be
postponed for first boot: libgdk-pixbuf-2.0-lo
ader-jpeg libgdk-pixbuf-2.0-loader-png libgdk-pixbuf-2.0-loader-gif
libgdk-pixbuf-2.0-loader-xpm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dynamic-linker-a-relative-symlink-to-libc.patch | 34 ++++++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb                 |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch

diff --git a/meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch b/meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
new file mode 100644
index 0000000..5490b1c
--- /dev/null
+++ b/meta/recipes-core/musl/files/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
@@ -0,0 +1,34 @@
+From 94c0b97b62125d8bbc92dce0694e387d5b2ad181 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 10 Jan 2016 12:14:02 -0800
+Subject: [PATCH] Make dynamic linker a relative symlink to libc
+
+absolute symlink into $(libdir) fails to load in a cross build
+environment, especially when executing qemu in usermode to run target
+applications, which cross build systems often do, since not everything
+can be computed during cross builds, qemu in usermode often comes to aid
+in such situations to feed into cross builds.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b2226fa..0d71f7f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -189,7 +189,7 @@ $(DESTDIR)$(includedir)/%: include/%
+ 	$(INSTALL) -D -m 644 $< $@
+ 
+ $(DESTDIR)$(LDSO_PATHNAME): $(DESTDIR)$(libdir)/libc.so
+-	$(INSTALL) -D -l $(libdir)/libc.so $@ || true
++	$(INSTALL) -D -l ..$(libdir)/libc.so $@ || true
+ 
+ install-libs: $(ALL_LIBS:lib/%=$(DESTDIR)$(libdir)/%) $(if $(SHARED_LIBS),$(DESTDIR)$(LDSO_PATHNAME),)
+ 
+-- 
+2.7.0
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 5b94d1f..8970307 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -10,6 +10,7 @@ PV = "1.1.12+git${SRCPV}"
 # mirror is at git://github.com/kraj/musl.git
 
 SRC_URI = "git://git.musl-libc.org/musl \
+           file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -49,7 +50,7 @@ do_install() {
 	oe_runmake install DESTDIR='${D}'
 
 	install -d ${D}${bindir}
-	ln -s ${libdir}/libc.so ${D}${bindir}/ldd
+	ln -s ../../${libdir}/libc.so ${D}${bindir}/ldd
 }
 
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
-- 
2.7.0


