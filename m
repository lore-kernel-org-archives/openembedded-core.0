Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5B08D7D9E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 02:41:51 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id e5so3774963iok.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 19:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CqboeExu+TdO0AxbcI73IDs6LqeJsMEufnhVdUjy1g4=;
	b=TvklaNnifByK3ecYXSz5kgdPBC2K5RSY8+jkX4YMJ0S1y0DZvkqZL+OujowvBeEiJN
	ivMAMGKeJwmv1rf/23QEoGWgSmyrNBpdp0dkXfmfH34k51gaUaWxVwn2XRwwZj7zRAJM
	2bS4YfYwKxCjca8MPLlQ+WjKVhxHh3trPB5UGMzr68NaIjPPYU8Nc4SIlJRB0gX9j2XC
	FDZgowZPKVqZhEHtkc0GGgllm7Y43a3JZWrMt+07oAB6tCDEmxch/3GWQhW4/VHEz2Ge
	x+iPYSZP0XAGiFTA9dvf/U/GExvn9cOyK4qXFn6Lp4O1V16W+o9kg63iyfkKC7WYQnp+
	edDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CqboeExu+TdO0AxbcI73IDs6LqeJsMEufnhVdUjy1g4=;
	b=OQqBgr9r3JQTW9pCx0yhCLWLT+i7qamLcM0//GsOIhz49IbivxiOKTV2cCQgRxrAg6
	hMvrrbGmV2KcsJiZMRxk1UG/+TRs1PZ7p9ZViSEb2ZV/0BPgYosmPCSSr0ZNobWAVxCy
	QSi1AWbqlnzu7vcRvAdOiaXVXxvom2z3Dr9hjR4JsXok6ZBWkNvxeQpQgcdzQr1uEcZU
	sNySgogQxGjFiogh0yavQUb1KeP9SXc74dhun0cFKzYNDyBwKm99U9T2VlcusFlnyJLH
	V2Z0NGz1BWG+Of9FdhE3f1ZUX+fmzT/hVqg4cAf5xrMdBagmqiW7oNotzkWCpti56nBW
	J7Hw==
X-Gm-Message-State: APjAAAWamMzFvJHfohIbnLzTi1CbEudN5kHAACmDX3sP5EULnajQEqZO
	mdDfQIFwUM5fLPMT33HZPX+kjjhG
X-Google-Smtp-Source: APXvYqwGFOYWeKwVN1yGe3hZ9hYEJCgJRX94USrqrdZp96xtDp3BcKd3OikxDi4Vepmv3ry+zmjF2g==
X-Received: by 2002:a6b:740a:: with SMTP id s10mr860843iog.99.1559184111917;
	Wed, 29 May 2019 19:41:51 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id c94sm612947itd.13.2019.05.29.19.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 19:41:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 21:41:09 -0500
Message-Id: <20190530024109.24629-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529144250.419-1-JPEWhacker@gmail.com>
References: <20190529144250.419-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] btrfs-tools: Pass DEBUG_MAP_PREFIX flags to Python
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
X-List-Received-Date: Thu, 30 May 2019 02:41:51 -0000
Content-Transfer-Encoding: 8bit

The DEBUG_MAP_PREFIX flags need to be passed when building the Python
library to prevent these non-reproducible paths from being encoded into
the library. The patch that does this was accepted upstream and
supersedes part of a previous patch that passed LDFLAGS to the Python
library in favor of passing EXTRA_PYTHON_LDFLAGS, so the patch and
recipe has been updated to reflect this.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...DFLAGS-when-building-libbtrfsutil.so.patch | 19 +++-----
 ...gs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch | 43 +++++++++++++++++++
 .../btrfs-tools/btrfs-tools_5.1.bb            |  6 ++-
 3 files changed, 53 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
index a8fcfc0f73c..e23be32599b 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch
@@ -1,4 +1,4 @@
-From eecc48ecad359cd4fab650ce49cfe57e99d1859d Mon Sep 17 00:00:00 2001
+From c384fa875c5128009ac8b6ba11a54a6bd4de575a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 17 May 2018 12:21:31 +0300
 Subject: [PATCH] Add LDFLAGS when building libbtrfsutil.so and python
@@ -8,14 +8,14 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 10f0e3b0..1697794c 100644
+index e25e256f..6df00186 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -402,7 +402,7 @@ libbtrfsutil/%.o: libbtrfsutil/%.c
+@@ -424,7 +424,7 @@ libbtrfsutil/%.o: libbtrfsutil/%.c
  
  libbtrfsutil.so.$(libbtrfsutil_version): $(libbtrfsutil_objects)
  	@echo "    [LD]     $@"
@@ -24,12 +24,3 @@ index 10f0e3b0..1697794c 100644
  		-shared -Wl,-soname,libbtrfsutil.so.$(libbtrfsutil_major) -o $@
  
  libbtrfsutil.a: $(libbtrfsutil_objects)
-@@ -417,7 +417,7 @@ ifeq ($(PYTHON_BINDINGS),1)
- libbtrfsutil_python: libbtrfsutil.so.$(libbtrfsutil_major) libbtrfsutil.so libbtrfsutil/btrfsutil.h
- 	@echo "    [PY]     libbtrfsutil"
- 	$(Q)cd libbtrfsutil/python; \
--		CFLAGS= LDFLAGS= $(PYTHON) setup.py $(SETUP_PY_Q) build_ext -i build
-+		CFLAGS= $(PYTHON) setup.py $(SETUP_PY_Q) build_ext -i build
- 
- .PHONY: libbtrfsutil_python
- endif
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch
new file mode 100644
index 00000000000..f69507164c6
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch
@@ -0,0 +1,43 @@
+From 730fe2ee2fb9e08cbe885f370afe83fecb18d048 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Sun, 26 May 2019 21:26:04 -0500
+Subject: [PATCH] btrfs-progs: Pass CFLAGS and LDFLAGS to Python
+
+Adds Make variables EXTRA_PYTHON_CFLAGS and EXTRA_PYTHON_LDFLAGS which
+can be used to pass CFLAGS and LDFLAGS respectively when building the
+Python library.
+
+This is required to support reproducible builds, as there are often
+compiler and linker flags that must be passed in order to generate
+reproducible output (e.g. -fdebug-prefix-map)
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-Status: Accepted [https://github.com/kdave/btrfs-progs/pull/176]
+---
+ Makefile | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 505bd9c1..814767a8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -24,6 +24,10 @@
+ #   DEBUG_CFLAGS   additional compiler flags for debugging build
+ #   EXTRA_CFLAGS   additional compiler flags
+ #   EXTRA_LDFLAGS  additional linker flags
++#   EXTRA_PYTHON_CFLAGS  additional compiler flags to pass when building Python
++#                        library
++#   EXTRA_PYTHON_LDFLAGS additional linker flags to pass when building Python
++#                        library
+ #
+ # Testing-specific options (see also tests/README.md):
+ #   TEST=GLOB      run test(s) from directories matching GLOB
+@@ -439,7 +443,7 @@ ifeq ($(PYTHON_BINDINGS),1)
+ libbtrfsutil_python: libbtrfsutil.so.$(libbtrfsutil_major) libbtrfsutil.so libbtrfsutil/btrfsutil.h
+ 	@echo "    [PY]     libbtrfsutil"
+ 	$(Q)cd libbtrfsutil/python; \
+-		CFLAGS= LDFLAGS= $(PYTHON) setup.py $(SETUP_PY_Q) build_ext -i build
++		CFLAGS="$(EXTRA_PYTHON_CFLAGS)" LDFLAGS="$(EXTRA_PYTHON_LDFLAGS)" $(PYTHON) setup.py $(SETUP_PY_Q) build_ext -i build
+ 
+ .PHONY: libbtrfsutil_python
+ endif
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb
index 8b4178d6dec..89cc1bfe20b 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.1.bb
@@ -18,6 +18,7 @@ SRCREV = "43013422dbce4bcc9ed77cfe65b294caa0985ec8"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
+           file://0003-btrfs-progs-Pass-CFLAGS-and-LDFLAGS-to-Python.patch \
            "
 
 inherit autotools-brokensep pkgconfig manpages distutils3-base
@@ -27,7 +28,10 @@ CLEANBROKEN = "1"
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
 EXTRA_OECONF = " --disable-zstd"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
-EXTRA_OEMAKE = "V=1"
+EXTRA_PYTHON_CFLAGS = "${DEBUG_PREFIX_MAP}"
+EXTRA_PYTHON_CFLAGS_class-native = ""
+EXTRA_PYTHON_LDFLAGS = "${LDFLAGS}"
+EXTRA_OEMAKE = "V=1 'EXTRA_PYTHON_CFLAGS=${EXTRA_PYTHON_CFLAGS}' 'EXTRA_PYTHON_LDFLAGS=${EXTRA_PYTHON_LDFLAGS}'"
 
 do_configure_prepend() {
 	# Upstream doesn't ship this and autoreconf won't install it as automake isn't used.
-- 
2.21.0


