Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id D95187835B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 00:48:00 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id g14so1077173pgu.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=83NhVOs+pgeXCHqChsSIWSNRS4CeMC8iqFrGRr66zcQ=;
	b=ShXCaUB3vAfQZmGNpKStplGZ/jEqL51E9QDN2RGiCBh/YkTx3/uE/KoOEn74DL0IJR
	pQvu42YolA45vNy+Vl+X3jJiFlZNCkHevoLqGyTw59SQa2+PZfMU5x9duVlWisR6y4f0
	rfXFdrLDfCslUSIrvO8AvFUx4DAKQ1gSQyBAMuhqXOVniJ0xBFPgaUr0TzRARiYncCmq
	Py2HDuA0T+9oKJuEz5DaqlB2YkhV54Rod00wG3AmXr+MdCBFfzq/xbbUu+sKTm1XoGXd
	fBfsu2st/jFQoSXINxxj5CAnv0AFFkXQHXtMMbNhIbWTc1q1yBmkG/c6CkE75mOu/D+s
	mygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=83NhVOs+pgeXCHqChsSIWSNRS4CeMC8iqFrGRr66zcQ=;
	b=boBShtdDpsX+rC/MwtICEtkyIcbQ5BEx1vTAWINfd9+t5Yy/JUiPOvifVuILj+KEQO
	Lr62grDWF9T+O+68B8jznnsIeoEudl3tBPTvQlo0zr5y81IGrh69JwEBKENjLoIyw+RF
	YOES3/No0fq5u0gxa6uaOX3FsZSFW/TLPKx78b+7K04RDT9f0k5/Q+7uTK/u8K2SPaCy
	Hdi8RQaLyp0MzNN3Jfpbw8SXfnnK9B55Sux5S0T5WwfE9YTIMtBdKP+7tVpcza1YlO+2
	mQNR1oP7RXWVg5f3zjTqQCYKzwx+mHxibFiI4otZWoCP+osLbTgk8I345+56EcNjF3dp
	Du2g==
X-Gm-Message-State: AIVw112uoIuuIAHZjUF/E7gLlE9OiOJDRQspdFcm8xYXS3TOShXnpsiC
	rO5r70LL3AA+8ai8
X-Received: by 10.99.155.10 with SMTP id r10mr14616098pgd.123.1500857282114;
	Sun, 23 Jul 2017 17:48:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s3sm18228742pgn.70.2017.07.23.17.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Jul 2017 17:48:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jul 2017 17:47:46 -0700
Message-Id: <20170724004748.14778-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724004748.14778-1-raj.khem@gmail.com>
References: <20170724004748.14778-1-raj.khem@gmail.com>
Subject: [PATCH 4/6] libsdl: Pass --tag option to libtool invocation
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
X-List-Received-Date: Mon, 24 Jul 2017 00:48:01 -0000

Helps in fixing errors when using external toolchain
and hardening flags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Pass-tag-CC-explictly-when-using-libtool.patch | 73 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/0001-build-Pass-tag-CC-explictly-when-using-libtool.patch

diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.15/0001-build-Pass-tag-CC-explictly-when-using-libtool.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.15/0001-build-Pass-tag-CC-explictly-when-using-libtool.patch
new file mode 100644
index 0000000000..ec8c0fd4fb
--- /dev/null
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.15/0001-build-Pass-tag-CC-explictly-when-using-libtool.patch
@@ -0,0 +1,73 @@
+From 44e4bb4cfb81024c8f5fd2e179e8a32c42756a2f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Jul 2017 16:52:43 -0700
+Subject: [PATCH] build: Pass --tag=CC explictly when using libtool
+
+Do not depend solely on libtool heuristics which fail
+in OE case when building with external compiler and
+hardening flags
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in              | 4 ++--
+ build-scripts/makedep.sh | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ab51035..743ce30 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -72,10 +72,10 @@ depend:
+ include $(depend)
+ 
+ $(objects)/$(TARGET): $(OBJECTS)
+-	$(LIBTOOL) --mode=link $(CC) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
++	$(LIBTOOL) --tag=CC --mode=link $(CC) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS)
+ 
+ $(objects)/$(SDLMAIN_TARGET): $(SDLMAIN_OBJECTS)
+-	$(LIBTOOL) --mode=link $(CC) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS) $(SDLMAIN_LDFLAGS)
++	$(LIBTOOL) --tag=CC --mode=link $(CC) -o $@ $^ $(LDFLAGS) $(EXTRA_LDFLAGS) $(LT_LDFLAGS) $(SDLMAIN_LDFLAGS)
+ 
+ 
+ install: all install-bin install-hdrs install-lib install-data install-man
+diff --git a/build-scripts/makedep.sh b/build-scripts/makedep.sh
+index 3b3863b..dba28f2 100755
+--- a/build-scripts/makedep.sh
++++ b/build-scripts/makedep.sh
+@@ -51,19 +51,19 @@ do  echo "Generating dependencies for $src"
+     case $ext in
+         c) cat >>${output}.new <<__EOF__
+ 
+-	\$(LIBTOOL) --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
++	\$(LIBTOOL) --tag=CC --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
+ 
+ __EOF__
+         ;;
+         cc) cat >>${output}.new <<__EOF__
+ 
+-	\$(LIBTOOL) --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
++	\$(LIBTOOL) --tag=CC --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
+ 
+ __EOF__
+         ;;
+         m) cat >>${output}.new <<__EOF__
+ 
+-	\$(LIBTOOL) --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
++	\$(LIBTOOL) --tag=CC --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
+ 
+ __EOF__
+         ;;
+@@ -75,7 +75,7 @@ __EOF__
+         ;;
+         S) cat >>${output}.new <<__EOF__
+ 
+-	\$(LIBTOOL)  --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
++	\$(LIBTOOL) --tag=CC --mode=compile \$(CC) \$(CFLAGS) \$(EXTRA_CFLAGS) -c $src  -o \$@
+ 
+ __EOF__
+         ;;
+-- 
+2.13.3
+
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index c802a6f692..b0d70a656b 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -17,6 +17,7 @@ PR = "r3"
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://libsdl-1.2.15-xdata32.patch \
            file://pkgconfig.patch \
+           file://0001-build-Pass-tag-CC-explictly-when-using-libtool.patch \
           "
 
 UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.13.3


