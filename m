Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 992DA71BF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:48 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v1-v6so5658158ljd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HXM/4pUfCBpsAUZGomwpWANeS7v+b+o1AkGKtp5GLAA=;
	b=SXYcaEBOmPMfm1hriMdhRnbAm21G0WgBOAoEqY9e5V33LmVd6JVJqev7JYxCu17SKC
	KX6iltTbpa/mNXXln0B4gbUju9ecHJdfBeckRtUe77ciwnqlLP01dB1n/E699mPu2lxl
	WvPkZMWCmUB+ZtLaEx0CUW+q6s1GLcvDC9rR5QGK2iMB/Zg7Ywo+2ny1ORxy1warW9s1
	+kBIG77FfzuDlpLIDD3bpIQOnY5dQHGQC0ekGMV8uEfuJxzj72pY5wsAw05PdAfvrCWM
	bFdqcNs6SBthrpOmCdaef946Ex3IJfAjcM9PkGfI7XaG4dNzFmMN8qHPIB9SjjBgYwWt
	/yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HXM/4pUfCBpsAUZGomwpWANeS7v+b+o1AkGKtp5GLAA=;
	b=s+U0DOu5K0uCaZVar6jRUx5Y06hWzsaCzUw6+QAEOs2AGNJSsfs2U3VQDC5JRTP0eE
	I3XdvshbHN+cA083zUYoEpNV+FyF6RHvYnNJMj62oWhK236WfCUn2CL8pMJ/f0FPAj2u
	bl3hMAngYQYN1YZJwfigtRL00r0zlMKY01FDdPg3PfFMGR1LPIoOkr70MQjJIbiWXws9
	71/g1PouH9brEbT2Blc4GyUKgK4AHKqxRQGixIepezmk3UXb3OngYYiY7Uuq9meMVeOM
	EMQFsGZvYNpC2DnIq/eDtcECexDxGxcm9oHDBAn4eAfgI3Y/mabgThYb1WZj0/oAQLO+
	XqyA==
X-Gm-Message-State: AA+aEWbFmjAcsNaKFYL3g6Ap7+SIOjUaPPapyrnEirE9Ym2uqvoIgkuq
	YMSLmMya9TTpYo3IaCzEAqf57JYF
X-Google-Smtp-Source: AFSGD/Xh8wSAUEqNNJd3DaBX/YS2wky1dobbgXb2ytrs20Z/HPztvjmBXUXGBQQTp8sw5lxJ+Jt2yQ==
X-Received: by 2002:a2e:9d17:: with SMTP id
	t23-v6mr2382441lji.57.1544810149005; 
	Fri, 14 Dec 2018 09:55:49 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:48 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:35 +0200
Message-Id: <1544810082-22164-7-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 06/13] musl: Create default library search path based on configuration
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:49 -0000

In absence of /etc/ld-musl-$(ARCH).path file musl uses hardcoded default
search path "/lib:/usr/local/lib:/usr/lib". This works for cases when
system libraries installed in one of these pathes.

However if lib64 or libx32 used as system library directories and no
usr merge functionality enabled for distro musl dynamic loader cannot
find libraries and finally execute binaries.

Found while working on support for musl on powerpc64 builds where
lib64 variant is used regardless of multilib being on or off.

Fix by creating default search path based on configuration time values
for syslibdir and libdir.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 ...slibdir-and-libdir-as-default-pathes-to-l.patch | 61 ++++++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb                 |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch

diff --git a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
new file mode 100644
index 0000000..6a875a7
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
@@ -0,0 +1,61 @@
+From 5a2886f81dbca3f2ed28eebe7d27d471da278db8 Mon Sep 17 00:00:00 2001
+From: Serhey Popovych <serhe.popovych@gmail.com>
+Date: Tue, 11 Dec 2018 05:44:20 -0500
+Subject: [PATCH] ldso: Use syslibdir and libdir as default pathes to libdirs
+
+In absence of /etc/ld-musl-$(ARCH).path ldso uses default path to search
+libraries /lib:/usr/local/lib:/usr/lib.
+
+However this path isn't relevant in case when library is put in dirs
+like lib64 or libx32.
+
+Adjust CFLAGS_ALL to pass syslibdir as SYSLIBDIR and libdir as LIBDIR
+preprocessor macroses to construct default ldso library search path
+in ldso/dynlink.c::SYS_PATH_DFLT.
+
+Upstream-Status: Pending
+Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
+---
+ Makefile       | 3 ++-
+ ldso/dynlink.c | 4 +++-
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index b46f8ca4..c07e4ae8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -46,7 +46,8 @@ CFLAGS_AUTO = -Os -pipe
+ CFLAGS_C99FSE = -std=c99 -ffreestanding -nostdinc 
+ 
+ CFLAGS_ALL = $(CFLAGS_C99FSE)
+-CFLAGS_ALL += -D_XOPEN_SOURCE=700 -I$(srcdir)/arch/$(ARCH) -I$(srcdir)/arch/generic -Iobj/src/internal -I$(srcdir)/src/include -I$(srcdir)/src/internal -Iobj/include -I$(srcdir)/include
++CFLAGS_ALL += -D_XOPEN_SOURCE=700 -DSYSLIBDIR='"$(syslibdir)"' -DLIBDIR='"$(libdir)"'
++CFLAGS_ALL += -I$(srcdir)/arch/$(ARCH) -I$(srcdir)/arch/generic -Iobj/src/internal -I$(srcdir)/src/include -I$(srcdir)/src/internal -Iobj/include -I$(srcdir)/include
+ CFLAGS_ALL += $(CPPFLAGS) $(CFLAGS_AUTO) $(CFLAGS)
+ 
+ LDFLAGS_ALL = $(LDFLAGS_AUTO) $(LDFLAGS)
+diff --git a/ldso/dynlink.c b/ldso/dynlink.c
+index ec921dfd..7c119c55 100644
+--- a/ldso/dynlink.c
++++ b/ldso/dynlink.c
+@@ -22,6 +22,8 @@
+ #include "dynlink.h"
+ #include "malloc_impl.h"
+ 
++#define SYS_PATH_DFLT SYSLIBDIR ":" LIBDIR
++
+ static void error(const char *, ...);
+ 
+ #define MAXP2(a,b) (-(-(a)&-(b)))
+@@ -1038,7 +1040,7 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
+ 					sys_path = "";
+ 				}
+ 			}
+-			if (!sys_path) sys_path = "/lib:/usr/local/lib:/usr/lib";
++			if (!sys_path) sys_path = SYS_PATH_DFLT;
+ 			fd = path_open(name, sys_path, buf, sizeof buf);
+ 		}
+ 		pathname = buf;
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b416ec4..9cc875c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -12,6 +12,7 @@ PV = "1.1.20+git${SRCPV}"
 
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
+           file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


