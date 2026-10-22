Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21980.1792673298605622140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 05:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 22 Oct 2026 21:48:16 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.159.40.114)
	by 156.147.1.121 with ESMTP; 22 Oct 2026 21:48:16 +0900
X-Original-SENDERIP: 10.159.40.114
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] musl: build the fallback search path from base_libdir
Date: Thu, 22 Oct 2026 21:48:15 +0900
Message-ID: <20261022124815.1618494-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 12:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248444
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Build the fallback search path of patch 0002 from base_libdir instead
of syslibdir.

We are working towards musl with multilib. There a 64-bit program can
load the lib32 copy of a library and fail with "Exec format error".

ld-musl-$ARCH.path is the musl counterpart of ld.so.conf. When the file
does not exist, the dynamic linker uses a fallback search path built
into musl. Upstream musl hardcodes /lib:/usr/local/lib:/usr/lib.

With usrmerge musl looks for the file in /usr/etc for programs built by
gcc, while the recipe installs it in /etc. The dynamic linker then uses
the fallback search path.

2da79f021b ("musl: Create default library search path based on
configuration") added patch 0002 to build it from syslibdir:libdir.
syslibdir was base_libdir then, so both parts followed the variant.

bfa1ea82bb ("musl: Add support for multilib") moved syslibdir to /lib,
later nonarch_base_libdir, so every variant puts its dynamic linker
there. The fallback search path moved with it.

With usrmerge a 64-bit multilib build therefore searches /usr/lib
first, where the lib32 libraries are.

Patch 0002 now takes base_libdir as a separate baselibdir make
variable. The dynamic linker stays in syslibdir.

The fallback search path then lists the same directories as the .path
file. glibc builds its default search path the same way, from slibdir
and libdir, and OE sets slibdir to base_libdir.

  64-bit fallback search path with usrmerge
  before    /usr/lib:/usr/lib64
  after     /usr/lib64:/usr/lib64

Non-multilib builds do not change, as base_libdir equals syslibdir
there.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2:
- Drop the v1 change to the dynamic linker. Take the fallback search
  path in patch 0002 from base_libdir instead, as Khem suggested.

v1: https://patchwork.yoctoproject.org/project/oe-core/patch/20261022025520.234942-2-mark.yang@lge.com/

The .path file with usrmerge:

musl derives the location of the file from the PT_INTERP string, not
from where the dynamic linker is installed.

With usrmerge gcc writes /usr/lib/ld-musl-$ARCH.so.1 into PT_INTERP,
so musl opens /usr/etc/ld-musl-$ARCH.path. Edits to
/etc/ld-musl-$ARCH.path have no effect.

With this patch the fallback search path is right, so programs run
when musl does not find the file.

I asked on the musl list whether the dynamic linker could read the file
from a configured sysconfdir [1]. Szabolcs Nagy replied that /usr/lib
in PT_INTERP is an unusual setup and suggested a symlink from /usr/etc
to /etc instead [2]. I withdrew the musl patch.

I checked two musl distros with a merged /usr, Void and Gentoo. Both
keep /lib/ld-musl-$ARCH.so.1 in PT_INTERP, while the dynamic linker
itself lives in /usr/lib. musl therefore reads /etc/ld-musl-$ARCH.path
there.

OE cannot simply do the same. Only the image rootfs and the SDK get the
merged /usr symlinks, so the recipe sysroot has no /lib and qemu-user
fails to start a target binary at build time:

  qemu-aarch64: Could not open '/lib/ld-musl-aarch64.so.1': No such file or directory

[YOCTO #14977] hit the same error on arm when gcc still wrote /lib
there.

If the .path file should take effect, a /usr/etc symlink in the musl
recipe looks like the better option. I can send it as a follow-up.

[1] https://www.openwall.com/lists/musl/2026/10/22/1
[2] https://www.openwall.com/lists/musl/2026/10/22/2

 ...ir-and-libdir-as-default-pathes-to-l.patch | 35 +++++++++++++------
 meta/recipes-core/musl/musl_git.bb            |  4 +++
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
index 04630b32ee..1eb236b315 100644
--- a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
+++ b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
@@ -1,4 +1,4 @@
-From e27de983ef70257ca1fd7f5096eea41613612ecf Mon Sep 17 00:00:00 2001
+From 4c5bc7ad461e4a0ddb81511d3f6e1f25d369436d Mon Sep 17 00:00:00 2001
 From: Serhey Popovych <serhe.popovych@gmail.com>
 Date: Tue, 11 Dec 2018 05:44:20 -0500
 Subject: [PATCH 2/2] ldso: Use syslibdir and libdir as default pathes to
@@ -10,45 +10,58 @@ libraries /lib:/usr/local/lib:/usr/lib.
 However this path isn't relevant in case when library is put in dirs
 like lib64 or libx32.
 
-Adjust CFLAGS_ALL to pass syslibdir as SYSLIBDIR and libdir as LIBDIR
+Adjust CFLAGS_ALL to pass baselibdir as BASELIBDIR and libdir as LIBDIR
 preprocessor macroses to construct default ldso library search path
 in ldso/dynlink.c::SYS_PATH_DFLT.
 
+baselibdir defaults to syslibdir. OE sets it to base_libdir, because
+syslibdir is where the dynamic linker goes, and multilib can put the
+libraries in another directory.
+
 Upstream-Status: Pending
 Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
+Signed-off-by: mark.yang <mark.yang@lge.com>
 ---
- Makefile       | 3 ++-
+ Makefile       | 4 +++-
  ldso/dynlink.c | 4 +++-
- 2 files changed, 5 insertions(+), 2 deletions(-)
+ 2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 466d9afd..d2f458fa 100644
+index f10f0d6c..27c08fe0 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -47,7 +47,8 @@ CFLAGS_AUTO = -Os -pipe
+@@ -16,6 +16,7 @@ prefix = /usr/local/musl
+ includedir = $(prefix)/include
+ libdir = $(prefix)/lib
+ syslibdir = /lib
++baselibdir = $(syslibdir)
+ 
+ MALLOC_DIR = mallocng
+ SRC_DIRS = $(addprefix $(srcdir)/,src/* src/malloc/$(MALLOC_DIR) crt ldso $(COMPAT_SRC_DIRS))
+@@ -47,7 +48,8 @@ CFLAGS_AUTO = -Os -pipe
  CFLAGS_C99FSE = -std=c99 -ffreestanding -nostdinc 
  
  CFLAGS_ALL = $(CFLAGS_C99FSE)
 -CFLAGS_ALL += -D_XOPEN_SOURCE=700 -I$(srcdir)/arch/$(ARCH) -I$(srcdir)/arch/generic -Iobj/src/internal -I$(srcdir)/src/include -I$(srcdir)/src/internal -Iobj/include -I$(srcdir)/include
-+CFLAGS_ALL += -D_XOPEN_SOURCE=700 -DSYSLIBDIR='"$(syslibdir)"' -DLIBDIR='"$(libdir)"'
++CFLAGS_ALL += -D_XOPEN_SOURCE=700 -DBASELIBDIR='"$(baselibdir)"' -DLIBDIR='"$(libdir)"'
 +CFLAGS_ALL += -I$(srcdir)/arch/$(ARCH) -I$(srcdir)/arch/generic -Iobj/src/internal -I$(srcdir)/src/include -I$(srcdir)/src/internal -Iobj/include -I$(srcdir)/include
  CFLAGS_ALL += $(CPPFLAGS) $(CFLAGS_AUTO) $(CFLAGS)
  
  LDFLAGS_ALL = $(LDFLAGS_AUTO) $(LDFLAGS)
 diff --git a/ldso/dynlink.c b/ldso/dynlink.c
-index 324aa859..7d3ab44c 100644
+index 10471b23..e2f1e01d 100644
 --- a/ldso/dynlink.c
 +++ b/ldso/dynlink.c
-@@ -35,6 +35,8 @@ static size_t ldso_page_size;
+@@ -37,6 +37,8 @@ static size_t ldso_page_size;
  #define realloc __libc_realloc
  #define free __libc_free
  
-+#define SYS_PATH_DFLT SYSLIBDIR ":" LIBDIR
++#define SYS_PATH_DFLT BASELIBDIR ":" LIBDIR
 +
  static void error_impl(const char *, ...);
  static void error_noop(const char *, ...);
  static void (*error)(const char *, ...) = error_noop;
-@@ -1159,7 +1161,7 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
+@@ -1161,7 +1163,7 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
  					sys_path = "";
  				}
  			}
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 212bda1f29..c81178c15a 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -49,6 +49,10 @@ CONFIGUREOPTS = " \
     --syslibdir=${nonarch_base_libdir} \
 "
 
+# The fallback search path of patch 0002 follows base_libdir, as the .path
+# file does. --syslibdir only says where the dynamic linker goes.
+EXTRA_OEMAKE += "baselibdir=${base_libdir}"
+
 do_configure() {
 	${S}/configure ${CONFIGUREOPTS}
 }
