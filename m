Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0AB73190
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:40 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id 74so13363220qgh.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uEUEVwaZuSTU+q/U3jQ9s22+T9a8Q+NtR8LQH531I50=;
	b=Du+HBaSVyYLX7jCUoL7FQDvKqIj8hi2IaxGwr2cYvO6jc5+40mNzCdhcQgW9bHmyjx
	fQkRfLSbQrDZ6S5LGxCik1sCUYd22SMH3hduvyn2pdgOwwitEViWDait00HiJ1LRMwIl
	Daw9VUdt/MFH053GpA8SkDU0zG9FT7GSnLvN37I0a7QmbXwIaZmyNZBJxupx6hwmOQv4
	0wb/ys7yqtgTkzrvRAfS6ji0PDphuNda9cTrdrw1bDbRNYxekVt90FPFVAe3xKAgL0kF
	TG3dVDW3TltVONM2jCXEu/+U7k92q66/FtXGjplrfUB6rrMshmFZBGvmcH4VDWcGzrFm
	1TeQ==
X-Received: by 10.140.153.73 with SMTP id 70mr16523986qhz.30.1450569160982;
	Sat, 19 Dec 2015 15:52:40 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:23 +0000
Message-Id: <8bed4520e44b25b99e69ccb4752a98c326679f7e.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 14/17] gdk-pixbuf: Fix latent build issue exposed by musl
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch      | 25 ++++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
new file mode 100644
index 0000000..706debf
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
@@ -0,0 +1,25 @@
+__libc_malloc and family of functions are in glibc but not in musl e.g. so mark them as such
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gdk-pixbuf-2.32.1/tests/pixbuf-lowmem.c
+===================================================================
+--- gdk-pixbuf-2.32.1.orig/tests/pixbuf-lowmem.c
++++ gdk-pixbuf-2.32.1/tests/pixbuf-lowmem.c
+@@ -33,9 +33,15 @@ static int max_allocation = PRETEND_MEM_
+ 
+ #define HEADER_SPACE sizeof(gsize)
+ 
++#ifdef __GLIBC__
+ extern void *__libc_malloc (size_t size);
+ extern void *__libc_realloc (void *mem, size_t size);
+ extern void *__libc_free (void *mem);
++#else
++#define __libc_malloc  malloc
++#define __libc_realloc realloc
++#define __libc_free free
++#endif
+ 
+ static gpointer
+ record_bytes (gpointer mem, gsize bytes)
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
index 084fe36..104c743 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://fatal-loader.patch \
+           file://libc_memfuncs.patch \
            "
 
 SRC_URI[md5sum] = "b1590189a2e89fab9f871959c168508c"
-- 
2.6.4


