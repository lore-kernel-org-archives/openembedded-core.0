Return-Path: <mr.name@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B72C52D7C
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 09:45:19 +0000 (UTC)
Subject: Re: [PATCH] sysvinit: upgrade 3.04 -> 3.10
To: openembedded-core@lists.openembedded.org
From: "Sven Reschke" <mr.name@web.de>
X-Originating-Location: Leichlingen, North Rhine-Westphalia, DE (93.244.214.241)
X-Originating-Platform: Linux Firefox 128
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 18 Aug 2024 02:45:09 -0700
References: <20240818093913.43520-1-mr.name@web.de>
In-Reply-To: <20240818093913.43520-1-mr.name@web.de>
Message-ID: <23984.1723974309437068882@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="YVyVfXXZKqs608Rhhrl8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Aug 2024 09:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203477

--YVyVfXXZKqs608Rhhrl8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hmm... I used git send-email to send the email. Still seems to be strangly =
formatted.
Here's another try from the web reply:

From cc397d48b4b8dad419cd4790601b07bc71aa0976 Mon Sep 17 00:00:00 2001
From: Sven Reschke <mr.name@web.de>
Date: Sun, 18 Aug 2024 10:46:34 +0200
Subject: [PATCH] sysvinit: upgrade 3.04 -> 3.10
Upgrade =C2=A0 =C2=A0of sysvinit to version 3.10. The upstream moved =C2=A0=
 =C2=A0in between to github.
Removed =C2=A0 =C2=A0the following patches:
1. 0001-hddown-include-libgen.h-for-basename-API.patch
Is already included in upstream
2. install.patch
Referenced PR is already merged in upstream
3. sysvinit_remove_linux_fs.patch
Is already included in upstream
The remaining patches were mostly just updated, with exception to the realp=
ath.patch
Here the changes to the killall5.c source file couldn't be merged anymore.
My guess is, that the changes are already done someway in the upstream.
At least the file is now using realpath(). I didn't touch the remaining add=
itional includes,
as I don't know if they are still needed.
Signed-off-by: Sven Reschke <mr.name@web.de>
---
...wn-include-libgen.h-for-basename-API.patch | 38 --------
...acros.h-for-major-minor-defines-in-g.patch | =C2=A06 +-
.../sysvinit/sysvinit/crypt-lib.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A06=
 +-
.../sysvinit/sysvinit/install.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 97=
 -------------------
.../sysvinit/pidof-add-m-option.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 ++--=
-
.../sysvinit/sysvinit/realpath.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23=
 +----
.../sysvinit/sysvinit_remove_linux_fs.patch =C2=A0 | 17 ----
.../{sysvinit_3.04.bb =3D> sysvinit_3.10.bb} =C2=A0 =C2=A0| =C2=A07 +-
8 files changed, 23 insertions(+), 195 deletions(-)
delete mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-=
libgen.h-for-basename-API.patch
delete mode 100644 meta/recipes-core/sysvinit/sysvinit/install.patch
delete mode 100644 meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linu=
x_fs.patch
rename meta/recipes-core/sysvinit/{sysvinit_3.04.bb =3D> sysvinit_3.10.bb} =
(93%)
diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen=
.h-for-basename-API.patch b/meta/recipes-core/sysvinit/sysvinit/0001-hddown=
-include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 5e4053bad1..0000000000
--- a/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-=
basename-API.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a07c1d94e79840c59563741b45e690e77d4f3dfa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Dec 2023 20:09:30 -0800
-Subject: [PATCH] hddown: include libgen.h for basename API
-
-musl has removed the non-prototype declaration of basename from string.h [=
1] which now results in build errors with clang-17+ compiler
-
-include libgen.h for using the posix declaration of the funciton.
-
-Fixes
-
-hddown.c:135:8: error: incompatible integer to pointer conversion assignin=
g to 'char *' from 'int' [-Wint-conversion]
- =C2=A0135 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D basename(lnk);
- =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ ~~~~~~~~~~~~~
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd2248=
7bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/21]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/hddown.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/hddown.c b/src/hddown.c
-index 7a2cf28..3b31bc0 100644
---- a/src/hddown.c
-+++ b/src/hddown.c
-@@ -24,6 +24,7 @@ char *v_hddown =3D "@(#)hddown.c =C2=A01.02 =C2=A022-Apr=
-2003 =C2=A0miquels@cistron.nl";
- #ifndef _GNU_SOURCE
- #define _GNU_SOURCE
- #endif
-+#include <libgen.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
---
-2.43.0
-
diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros=
.h-for-major-minor-defines-in-g.patch b/meta/recipes-core/sysvinit/sysvinit=
/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
index 60fbd87534..2c29fd81d9 100644
--- a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-=
major-minor-defines-in-g.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-=
major-minor-defines-in-g.patch
@@ -13,7 +13,7 @@ Upstream-Status: Pending
3 files changed, 3 insertions(+)

diff --git a/src/bootlogd.c b/src/bootlogd.c
-index 787db87..8b07903 100644
+index a323a76..343cbbe 100644
--- a/src/bootlogd.c
+++ b/src/bootlogd.c
@@ -29,6 +29,7 @@
@@ -25,7 +25,7 @@ index 787db87..8b07903 100644
#include <sys/utsname.h>
#include <time.h>
diff --git a/src/mountpoint.c b/src/mountpoint.c
-index 5f20522..94df7a1 100644
+index c55b0df..5920e13 100644
--- a/src/mountpoint.c
+++ b/src/mountpoint.c
@@ -25,6 +25,7 @@
@@ -37,7 +37,7 @@ index 5f20522..94df7a1 100644
#include <stdlib.h>
#include <string.h>
diff --git a/src/shutdown.c b/src/shutdown.c
-index b744a2c..40b7faf 100644
+index 89b63a5..7730e53 100644
--- a/src/shutdown.c
+++ b/src/shutdown.c
@@ -40,6 +40,7 @@
diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/rec=
ipes-core/sysvinit/sysvinit/crypt-lib.patch
index 5c39fb001b..cc3df8887b 100644
--- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [configuration]
1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/src/Makefile b/src/Makefile
-index 5b1a5a2..b686394 100644
+index 21cbb2e..a2c103c 100644
--- a/src/Makefile
+++ b/src/Makefile
-@@ -97,15 +97,8 @@ else
- endif
+@@ -95,15 +95,8 @@ endif
+ ROOT =C2=A0 =C2=A0?=3D $(DESTDIR)

# Additional libs for GNU libc.
-ifneq ($(wildcard $(ROOT)/usr/lib*/libcrypt.*),)
diff --git a/meta/recipes-core/sysvinit/sysvinit/install.patch b/meta/recip=
es-core/sysvinit/sysvinit/install.patch
deleted file mode 100644
index bc6d493c2b..0000000000
--- a/meta/recipes-core/sysvinit/sysvinit/install.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 5e35aa105e7a2e85db2a89fee4114090b1ac55be Mon Sep 17 00:00:00 2001
-From: Qing He <qing.he@intel.com>
-Date: Fri, 18 Jun 2010 09:40:30 +0800
-Subject: [PATCH] sysvinit: upgrade to version 2.88dsf
-
-Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/13]
-
----
- src/Makefile | 53 +++++++++++++++++++++++++++++-----------------------
- 1 file changed, 30 insertions(+), 23 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 1b368dc..5b1a5a2 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -77,7 +77,14 @@ else
- =C2=A0 INSTALL_DATA =C2=A0 =C2=A0=3D install -m 644
- endif
- INSTALL_DIR =C2=A0 =C2=A0=3D install -m 755 -d
--MANDIR =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D /usr/share/man
-+
-+ROOT =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D
-+base_bindir =C2=A0?=3D /bin
-+base_sbindir ?=3D /sbin
-+bindir =C2=A0 =C2=A0 =C2=A0 ?=3D /usr/bin
-+sysconfdir =C2=A0 ?=3D /etc
-+includedir =C2=A0 ?=3D /usr/include
-+mandir =C2=A0 =C2=A0 =C2=A0 ?=3D /usr/share/man
-
- ifeq ($(WITH_SELINUX),yes)
- =C2=A0 SELINUX_DEF =C2=A0 =C2=A0=3D =C2=A0-DWITH_SELINUX
-@@ -191,43 +198,43 @@ clobber: =C2=A0 =C2=A0cleanobjs
- distclean: =C2=A0 =C2=A0clobber
-
- install: =C2=A0 =C2=A0all
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)/bin/ $(ROOT)/sbin/
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)/usr/bin/
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(base_bindir)/ $(ROOT)=
$(base_sbindir)/
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(bindir)/
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in $(BIN); do \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_EXEC) $$i $(ROOT)/bin=
/ ; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_EXEC) $$i $(ROOT)$(ba=
se_bindir)/ ; \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in $(SBIN); do \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_EXEC) $$i $(ROOT)/sbi=
n/ ; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_EXEC) $$i $(ROOT)$(ba=
se_sbindir)/ ; \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in $(USRBIN); do \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_EXEC) $$i $(ROOT)/usr=
/bin/ ; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_EXEC) $$i $(ROOT)$(bi=
ndir)/ ; \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 # $(INSTALL_DIR) $(ROOT)/etc/
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL_DIR) $(ROOT)/etc/inittab.d
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 # $(INSTALL_EXEC) ../doc/initscript.sample $(=
ROOT)/etc/
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf halt $(ROOT)/sbin/reboot
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf halt $(ROOT)/sbin/poweroff
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf init $(ROOT)/sbin/telinit
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf /sbin/killall5 $(ROOT)/bin/pidof
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -f $(ROOT)/usr/bin/lastb ]; then \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf last $(ROOT)/usr/bin/las=
tb; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf halt $(ROOT)$(base_sbindir)/reboot
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf halt $(ROOT)$(base_sbindir)/poweroff
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf init $(ROOT)$(base_sbindir)/telinit
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $(base_sbindir)/killall5 $(ROOT)$(base=
_bindir)/pidof
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -f $(ROOT)$(bindir)/lastb ]; then \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf last $(ROOT)$(bindir)/la=
stb; \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)/usr/include/
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) initreq.h $(ROOT)/usr/include=
/
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(MANDIR)/man1/
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(MANDIR)/man5/
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(MANDIR)/man8/
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(includedir)/
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) initreq.h $(ROOT)$(includedir=
)/
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(mandir)/man1/
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(mandir)/man5/
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DIR) $(ROOT)$(mandir)/man8/
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 for man in $(MAN1); do \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) ../man/$$man $(=
ROOT)$(MANDIR)/man1/; \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "1{ $(MANDB); }" $(ROOT)=
$(MANDIR)/man1/$$man ; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) ../man/$$man $(=
ROOT)$(mandir)/man1/; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "1{ $(MANDB); }" $(ROOT)=
$(mandir)/man1/$$man ; \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 for man in $(MAN5); do \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) ../man/$$man $(=
ROOT)$(MANDIR)/man5/; \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "1{ $(MANDB); }" $(ROOT)=
$(MANDIR)/man5/$$man ; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) ../man/$$man $(=
ROOT)$(mandir)/man5/; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "1{ $(MANDB); }" $(ROOT)=
$(mandir)/man5/$$man ; \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 for man in $(MAN8); do \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) ../man/$$man $(=
ROOT)$(MANDIR)/man8/; \
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "1{ $(MANDB); }" $(ROOT)=
$(MANDIR)/man8/$$man ; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) ../man/$$man $(=
ROOT)$(mandir)/man8/; \
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i "1{ $(MANDB); }" $(ROOT)=
$(mandir)/man8/$$man ; \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
- ifeq ($(ROOT),)
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 #
diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b=
/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 8ef292ed12..01df5e6ee4 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -45,17 +45,17 @@ index 6866cb3..a87d878 100644
.TP
.B 0
diff --git a/src/killall5.c b/src/killall5.c
-index b0728fa..72289e3 100644
+index 6f7528a..34d656b 100644
--- a/src/killall5.c
+++ b/src/killall5.c
@@ -121,6 +121,7 @@ typedef struct _s_nfs

/* List of processes. */
- PROC *plist;
-+PROC *olist;
+ PROC *plist =3D NULL;
++PROC *olist =3D NULL;

/* List of processes to omit. */
- OMIT *omit;
+ OMIT *omit =3D NULL;
@@ -356,6 +357,20 @@ static void clear_mnt(void)
}
}
@@ -85,7 +85,7 @@ index b0728fa..72289e3 100644
struct dirent =C2=A0 =C2=A0*d;
char =C2=A0 =C2=A0 =C2=A0 =C2=A0path[PATH_MAX+1];
char =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[PATH_MAX+1];
-@@ -670,6 +686,17 @@ int readproc()
+@@ -671,6 +687,17 @@ int readproc()
p->next =3D plist;
plist =3D p;
p->pid =3D pid;
@@ -103,7 +103,7 @@ index b0728fa..72289e3 100644
}
closedir(dir);

-@@ -870,6 +897,26 @@ PIDQ_HEAD *pidof(char *prog)
+@@ -877,6 +904,26 @@ PIDQ_HEAD *pidof(char *prog)
return q;
}

@@ -130,7 +130,7 @@ index b0728fa..72289e3 100644
/* Give usage message and exit. */
void usage(void)
{
-@@ -920,6 +967,7 @@ void nsyslog(int pri, char *fmt, ...)
+@@ -927,6 +974,7 @@ void nsyslog(int pri, char *fmt, ...)
#define PIDOF_OMIT =C2=A0 =C2=A00x02
#define PIDOF_NETFS =C2=A0 =C2=A00x04
#define PIDOF_QUIET =C2=A0 =C2=A0 0x08
@@ -138,7 +138,7 @@ index b0728fa..72289e3 100644

/*
* =C2=A0 =C2=A0Pidof functionality.
-@@ -937,6 +985,7 @@ int main_pidof(int argc, char **argv)
+@@ -944,6 +992,7 @@ int main_pidof(int argc, char **argv)
char =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp[512];
char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sep =3D ' ';

@@ -146,7 +146,7 @@ index b0728fa..72289e3 100644
omit =3D (OMIT*)0;
nlist =3D (NFS*)0;
opterr =3D 0;
-@@ -944,7 +993,7 @@ int main_pidof(int argc, char **argv)
+@@ -951,7 +1000,7 @@ int main_pidof(int argc, char **argv)
if ((token =3D getenv("PIDOF_NETFS")) && (strcmp(token,"no") !=3D 0))
flags |=3D PIDOF_NETFS;

@@ -155,7 +155,7 @@ index b0728fa..72289e3 100644
case '?':
nsyslog(LOG_ERR,"invalid options on command line!\n");
closelog();
-@@ -995,6 +1044,9 @@ int main_pidof(int argc, char **argv)
+@@ -1002,6 +1051,9 @@ int main_pidof(int argc, char **argv)
case 'z':
list_dz_processes =3D TRUE;
break;
@@ -165,7 +165,7 @@ index b0728fa..72289e3 100644
case 'n':
flags |=3D PIDOF_NETFS;
break;
-@@ -1026,10 +1078,13 @@ int main_pidof(int argc, char **argv)
+@@ -1033,10 +1085,13 @@ int main_pidof(int argc, char **argv)
pid_t spid =3D 0;
while ((p =3D get_next_from_pid_q(q))) {
if ((flags & PIDOF_OMIT) && omit) {
@@ -181,7 +181,7 @@ index b0728fa..72289e3 100644
}

/*
-@@ -1071,6 +1126,7 @@ int main_pidof(int argc, char **argv)
+@@ -1078,6 +1133,7 @@ int main_pidof(int argc, char **argv)
printf("\n");
}

diff --git a/meta/recipes-core/sysvinit/sysvinit/realpath.patch b/meta/reci=
pes-core/sysvinit/sysvinit/realpath.patch
index b559aa3b49..78bf870612 100644
--- a/meta/recipes-core/sysvinit/sysvinit/realpath.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
@@ -12,29 +12,12 @@ Upstream-Status: Inappropriate [Linux specific]
Signed-off-by: Khem Raj <raj.khem@gmail.com>

---
- src/killall5.c =C2=A0 | 4 ++--
src/mountpoint.c | 1 +
src/wall.c =C2=A0 =C2=A0 =C2=A0 | 1 +
- 3 files changed, 4 insertions(+), 2 deletions(-)
+ 2 files changed, 2 insertions(+)

-diff --git a/src/killall5.c b/src/killall5.c
-index a664954..9798423 100644
---- a/src/killall5.c
-+++ b/src/killall5.c
-@@ -977,9 +977,9 @@ int matches(PROC *o, PROC *p)
- =C2=A0 =C2=A0 char *oargv1, *pargv1;
- =C2=A0 =C2=A0 if ((o->argv0 && p->argv0 && !strcmp(o->argv0,p->argv0))) {
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (o->argv1 && p->argv1) {
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((oargv1 =3D canonicalize_fi=
le_name(o->argv1)) =3D=3D NULL)
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((oargv1 =3D realpath(o->arg=
v1, NULL)) =3D=3D NULL)
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oargv1 =3D strdup=
(o->argv1);
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((pargv1 =3D canonicalize_fi=
le_name(p->argv1)) =3D=3D NULL)
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((pargv1 =3D realpath(p->arg=
v1, NULL)) =3D=3D NULL)
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pargv1 =3D strdup=
(p->argv1);
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (! strcmp(oargv1, pargv1)) {
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;
diff --git a/src/mountpoint.c b/src/mountpoint.c
-index b24335e..5f20522 100644
+index 184b1f6..c55b0df 100644
--- a/src/mountpoint.c
+++ b/src/mountpoint.c
@@ -23,6 +23,7 @@
@@ -46,7 +29,7 @@ index b24335e..5f20522 100644
#include <unistd.h>
#include <stdlib.h>
diff --git a/src/wall.c b/src/wall.c
-index d3a2c70..00826e9 100644
+index e527613..1d363ca 100644
--- a/src/wall.c
+++ b/src/wall.c
@@ -30,6 +30,7 @@
diff --git a/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.p=
atch b/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
deleted file mode 100644
index 89d65c23b7..0000000000
--- a/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-# From glibc 2.36, <linux/mount.h> (included from <linux/fs.h>) and
-# <sys/mount.h> (included from glibc) are no longer compatible:
-# https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount=
.h.3E_and_.3Csys.2Fmount.h.3E
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- sysvinit-3.04/src/sulogin.c.orig =C2=A0 =C2=A02022-08-07 23:07:42.9525=
76274 +0200
-+++ sysvinit-3.04/src/sulogin.c =C2=A0 =C2=A02022-08-07 23:08:26.511470983=
 +0200
-@@ -51,7 +51,6 @@
- #ifdef __linux__
- # =C2=A0include <sys/statfs.h>
- # =C2=A0include <sys/mount.h>
--# =C2=A0include <linux/fs.h>
- # =C2=A0include <linux/magic.h>
- # =C2=A0include <linux/major.h>
- # =C2=A0ifndef TMPFS_MAGIC
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-cor=
e/sysvinit/sysvinit_3.10.bb
similarity index 93%
rename from meta/recipes-core/sysvinit/sysvinit_3.04.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.10.bb
index fb9d00891c..89281f9fb3 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.10.bb
@@ -9,21 +9,18 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe \

RDEPENDS:${PN} =3D "${PN}-inittab"

-SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://install.patch \
+SRC_URI =3D "https://github.com/slicer69/sysvinit/releases/download/${PV}/=
sysvinit-${PV}.tar.xz \
file://crypt-lib.patch \
file://pidof-add-m-option.patch \
file://realpath.patch \
file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sysvinit_remove_linux_fs.patch =
\
file://rcS-default \
file://rc \
file://rcS \
file://bootlogd.init \
file://01_bootlogd \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-hddown-include-libgen.h-fo=
r-basename-API.patch \
"
-SRC_URI[sha256sum] =3D "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5b=
ae817bd2b7e3a5"
+SRC_URI[sha256sum] =3D "c52d22f63e187a1247ad491b6a3a049561b887400a166d6b04=
fc9d67705c4da6"

S =3D "${WORKDIR}/sysvinit-${PV}"

--YVyVfXXZKqs608Rhhrl8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hmm... I used git send-email to send the email. Still seems to be stra=
ngly formatted.</div>
<div>Here's another try from the web reply:</div>
<div>&nbsp;</div>
<div>
<div>From cc397d48b4b8dad419cd4790601b07bc71aa0976 Mon Sep 17 00:00:00 2001=
<br />From: Sven Reschke &lt;mr.name@web.de&gt;<br />Date: Sun, 18 Aug 2024=
 10:46:34 +0200<br />Subject: [PATCH] sysvinit: upgrade 3.04 -&gt; 3.10</di=
v>
<div>Upgrade &nbsp; &nbsp;of sysvinit to version 3.10. The upstream moved &=
nbsp; &nbsp;in between to github.<br />Removed &nbsp; &nbsp;the following p=
atches:<br />1. 0001-hddown-include-libgen.h-for-basename-API.patch<br />&n=
bsp; Is already included in upstream<br />2. install.patch<br />&nbsp; Refe=
renced PR is already merged in upstream<br />3. sysvinit_remove_linux_fs.pa=
tch<br />&nbsp; Is already included in upstream</div>
<div>The remaining patches were mostly just updated, with exception to the =
realpath.patch<br />Here the changes to the killall5.c source file couldn't=
 be merged anymore.<br />My guess is, that the changes are already done som=
eway in the upstream.<br />At least the file is now using realpath(). I did=
n't touch the remaining additional includes,<br />as I don't know if they a=
re still needed.</div>
<div>Signed-off-by: Sven Reschke &lt;mr.name@web.de&gt;<br />---<br />&nbsp=
;...wn-include-libgen.h-for-basename-API.patch | 38 --------<br />&nbsp;...=
acros.h-for-major-minor-defines-in-g.patch | &nbsp;6 +-<br />&nbsp;.../sysv=
init/sysvinit/crypt-lib.patch &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;6 +-<br /=
>&nbsp;.../sysvinit/sysvinit/install.patch &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; | 97 -------------------<br />&nbsp;.../sysvinit/pidof-add-m-option.patc=
h &nbsp; &nbsp; &nbsp; &nbsp; | 24 ++---<br />&nbsp;.../sysvinit/sysvinit/r=
ealpath.patch &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 23 +----<br />&nbsp;.../s=
ysvinit/sysvinit_remove_linux_fs.patch &nbsp; | 17 ----<br />&nbsp;.../{sys=
vinit_3.04.bb =3D&gt; sysvinit_3.10.bb} &nbsp; &nbsp;| &nbsp;7 +-<br />&nbs=
p;8 files changed, 23 insertions(+), 195 deletions(-)<br />&nbsp;delete mod=
e 100644 meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-f=
or-basename-API.patch<br />&nbsp;delete mode 100644 meta/recipes-core/sysvi=
nit/sysvinit/install.patch<br />&nbsp;delete mode 100644 meta/recipes-core/=
sysvinit/sysvinit/sysvinit_remove_linux_fs.patch<br />&nbsp;rename meta/rec=
ipes-core/sysvinit/{sysvinit_3.04.bb =3D&gt; sysvinit_3.10.bb} (93%)</div>
<div>diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-l=
ibgen.h-for-basename-API.patch b/meta/recipes-core/sysvinit/sysvinit/0001-h=
ddown-include-libgen.h-for-basename-API.patch<br />deleted file mode 100644=
<br />index 5e4053bad1..0000000000<br />--- a/meta/recipes-core/sysvinit/sy=
svinit/0001-hddown-include-libgen.h-for-basename-API.patch<br />+++ /dev/nu=
ll<br />@@ -1,38 +0,0 @@<br />-From a07c1d94e79840c59563741b45e690e77d4f3df=
a Mon Sep 17 00:00:00 2001<br />-From: Khem Raj &lt;raj.khem@gmail.com&gt;<=
br />-Date: Sun, 3 Dec 2023 20:09:30 -0800<br />-Subject: [PATCH] hddown: i=
nclude libgen.h for basename API<br />-<br />-musl has removed the non-prot=
otype declaration of basename from string.h [1] which now results in build =
errors with clang-17+ compiler<br />-<br />-include libgen.h for using the =
posix declaration of the funciton.<br />-<br />-Fixes<br />-<br />-hddown.c=
:135:8: error: incompatible integer to pointer conversion assigning to 'cha=
r *' from 'int' [-Wint-conversion]<br />- &nbsp;135 | &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ptr =3D base=
name(lnk);<br />- &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^ ~~~~~~~~~~=
~~~<br />-<br />-[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D725e1=
7ed6dff4d0cd22487bb64470881e86a92e7<br />-<br />-Upstream-Status: Submitted=
 [https://github.com/slicer69/sysvinit/pull/21]<br />-Signed-off-by: Khem R=
aj &lt;raj.khem@gmail.com&gt;<br />----<br />- src/hddown.c | 1 +<br />- 1 =
file changed, 1 insertion(+)<br />-<br />-diff --git a/src/hddown.c b/src/h=
ddown.c<br />-index 7a2cf28..3b31bc0 100644<br />---- a/src/hddown.c<br />-=
+++ b/src/hddown.c<br />-@@ -24,6 +24,7 @@ char *v_hddown =3D "@(#)hddown.c=
 &nbsp;1.02 &nbsp;22-Apr-2003 &nbsp;miquels@cistron.nl";<br />- #ifndef _GN=
U_SOURCE<br />- #define _GNU_SOURCE<br />- #endif<br />-+#include &lt;libge=
n.h&gt;<br />- #include &lt;stdio.h&gt;<br />- #include &lt;stdlib.h&gt;<br=
 />- #include &lt;unistd.h&gt;<br />---&nbsp;<br />-2.43.0<br />-<br />diff=
 --git a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-f=
or-major-minor-defines-in-g.patch b/meta/recipes-core/sysvinit/sysvinit/000=
1-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch<br />index 60f=
bd87534..2c29fd81d9 100644<br />--- a/meta/recipes-core/sysvinit/sysvinit/0=
001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch<br />+++ b/m=
eta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-m=
inor-defines-in-g.patch<br />@@ -13,7 +13,7 @@ Upstream-Status: Pending<br =
/>&nbsp; 3 files changed, 3 insertions(+)<br />&nbsp;<br />&nbsp;diff --git=
 a/src/bootlogd.c b/src/bootlogd.c<br />-index 787db87..8b07903 100644<br /=
>+index a323a76..343cbbe 100644<br />&nbsp;--- a/src/bootlogd.c<br />&nbsp;=
+++ b/src/bootlogd.c<br />&nbsp;@@ -29,6 +29,7 @@<br />@@ -25,7 +25,7 @@ in=
dex 787db87..8b07903 100644<br />&nbsp; #include &lt;sys/utsname.h&gt;<br /=
>&nbsp; #include &lt;time.h&gt;<br />&nbsp;diff --git a/src/mountpoint.c b/=
src/mountpoint.c<br />-index 5f20522..94df7a1 100644<br />+index c55b0df..5=
920e13 100644<br />&nbsp;--- a/src/mountpoint.c<br />&nbsp;+++ b/src/mountp=
oint.c<br />&nbsp;@@ -25,6 +25,7 @@<br />@@ -37,7 +37,7 @@ index 5f20522..9=
4df7a1 100644<br />&nbsp; #include &lt;stdlib.h&gt;<br />&nbsp; #include &l=
t;string.h&gt;<br />&nbsp;diff --git a/src/shutdown.c b/src/shutdown.c<br /=
>-index b744a2c..40b7faf 100644<br />+index 89b63a5..7730e53 100644<br />&n=
bsp;--- a/src/shutdown.c<br />&nbsp;+++ b/src/shutdown.c<br />&nbsp;@@ -40,=
6 +40,7 @@<br />diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.=
patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch<br />index 5c39=
fb001b..cc3df8887b 100644<br />--- a/meta/recipes-core/sysvinit/sysvinit/cr=
ypt-lib.patch<br />+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patc=
h<br />@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [configuration]<b=
r />&nbsp; 1 file changed, 2 insertions(+), 9 deletions(-)<br />&nbsp;<br /=
>&nbsp;diff --git a/src/Makefile b/src/Makefile<br />-index 5b1a5a2..b68639=
4 100644<br />+index 21cbb2e..a2c103c 100644<br />&nbsp;--- a/src/Makefile<=
br />&nbsp;+++ b/src/Makefile<br />-@@ -97,15 +97,8 @@ else<br />- endif<br=
 />+@@ -95,15 +95,8 @@ endif<br />+ ROOT &nbsp; &nbsp;?=3D $(DESTDIR)<br />=
&nbsp;&nbsp;<br />&nbsp; # Additional libs for GNU libc.<br />&nbsp;-ifneq =
($(wildcard $(ROOT)/usr/lib*/libcrypt.*),)<br />diff --git a/meta/recipes-c=
ore/sysvinit/sysvinit/install.patch b/meta/recipes-core/sysvinit/sysvinit/i=
nstall.patch<br />deleted file mode 100644<br />index bc6d493c2b..000000000=
0<br />--- a/meta/recipes-core/sysvinit/sysvinit/install.patch<br />+++ /de=
v/null<br />@@ -1,97 +0,0 @@<br />-From 5e35aa105e7a2e85db2a89fee4114090b1a=
c55be Mon Sep 17 00:00:00 2001<br />-From: Qing He &lt;qing.he@intel.com&gt=
;<br />-Date: Fri, 18 Jun 2010 09:40:30 +0800<br />-Subject: [PATCH] sysvin=
it: upgrade to version 2.88dsf<br />-<br />-Upstream-Status: Submitted [htt=
ps://github.com/slicer69/sysvinit/pull/13]<br />-<br />----<br />- src/Make=
file | 53 +++++++++++++++++++++++++++++-----------------------<br />- 1 fil=
e changed, 30 insertions(+), 23 deletions(-)<br />-<br />-diff --git a/src/=
Makefile b/src/Makefile<br />-index 1b368dc..5b1a5a2 100644<br />---- a/src=
/Makefile<br />-+++ b/src/Makefile<br />-@@ -77,7 +77,14 @@ else<br />- &nb=
sp; INSTALL_DATA &nbsp; &nbsp;=3D install -m 644<br />- endif<br />- INSTAL=
L_DIR &nbsp; &nbsp;=3D install -m 755 -d<br />--MANDIR &nbsp; &nbsp; &nbsp;=
 &nbsp;=3D /usr/share/man<br />-+<br />-+ROOT &nbsp; &nbsp; &nbsp; &nbsp; ?=
=3D<br />-+base_bindir &nbsp;?=3D /bin<br />-+base_sbindir ?=3D /sbin<br />=
-+bindir &nbsp; &nbsp; &nbsp; ?=3D /usr/bin<br />-+sysconfdir &nbsp; ?=3D /=
etc<br />-+includedir &nbsp; ?=3D /usr/include<br />-+mandir &nbsp; &nbsp; =
&nbsp; ?=3D /usr/share/man<br />-&nbsp;<br />- ifeq ($(WITH_SELINUX),yes)<b=
r />- &nbsp; SELINUX_DEF &nbsp; &nbsp;=3D &nbsp;-DWITH_SELINUX<br />-@@ -19=
1,43 +198,43 @@ clobber: &nbsp; &nbsp;cleanobjs<br />- distclean: &nbsp; &n=
bsp;clobber<br />-&nbsp;<br />- install: &nbsp; &nbsp;all<br />-- &nbsp; &n=
bsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)/bin/ $(ROOT)/sbin/<br />-- &nbsp; =
&nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)/usr/bin/<br />-+ &nbsp; &nbsp; &=
nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(base_bindir)/ $(ROOT)$(base_sbindir)/<b=
r />-+ &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(bindir)/<br />- &=
nbsp; &nbsp; &nbsp; &nbsp; for i in $(BIN); do \<br />-- &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;$(INSTALL_EXEC) $$i $(ROOT)/bin/ ; \<br />-+ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_EXEC) $$i $(ROOT)$(base_bindir)=
/ ; \<br />- &nbsp; &nbsp; &nbsp; &nbsp; done<br />- &nbsp; &nbsp; &nbsp; &=
nbsp; for i in $(SBIN); do \<br />-- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;$(INSTALL_EXEC) $$i $(ROOT)/sbin/ ; \<br />-+ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;$(INSTALL_EXEC) $$i $(ROOT)$(base_sbindir)/ ; \<br />- &nbsp=
; &nbsp; &nbsp; &nbsp; done<br />- &nbsp; &nbsp; &nbsp; &nbsp; for i in $(U=
SRBIN); do \<br />-- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_EXE=
C) $$i $(ROOT)/usr/bin/ ; \<br />-+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;$(INSTALL_EXEC) $$i $(ROOT)$(bindir)/ ; \<br />- &nbsp; &nbsp; &nbsp; &nb=
sp; done<br />- &nbsp; &nbsp; &nbsp; &nbsp; # $(INSTALL_DIR) $(ROOT)/etc/<b=
r />- &nbsp; &nbsp; &nbsp; &nbsp; $(INSTALL_DIR) $(ROOT)/etc/inittab.d<br /=
>- &nbsp; &nbsp; &nbsp; &nbsp; # $(INSTALL_EXEC) ../doc/initscript.sample $=
(ROOT)/etc/<br />-- &nbsp; &nbsp; &nbsp; &nbsp;ln -sf halt $(ROOT)/sbin/reb=
oot<br />-- &nbsp; &nbsp; &nbsp; &nbsp;ln -sf halt $(ROOT)/sbin/poweroff<br=
 />-- &nbsp; &nbsp; &nbsp; &nbsp;ln -sf init $(ROOT)/sbin/telinit<br />-- &=
nbsp; &nbsp; &nbsp; &nbsp;ln -sf /sbin/killall5 $(ROOT)/bin/pidof<br />-- &=
nbsp; &nbsp; &nbsp; &nbsp;if [ ! -f $(ROOT)/usr/bin/lastb ]; then \<br />--=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ln -sf last $(ROOT)/usr/bin/lastb=
; \<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;ln -sf halt $(ROOT)$(base_sbindir)/r=
eboot<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;ln -sf halt $(ROOT)$(base_sbindir)=
/poweroff<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;ln -sf init $(ROOT)$(base_sbin=
dir)/telinit<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;ln -sf $(base_sbindir)/kill=
all5 $(ROOT)$(base_bindir)/pidof<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;if [ ! =
-f $(ROOT)$(bindir)/lastb ]; then \<br />-+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;ln -sf last $(ROOT)$(bindir)/lastb; \<br />- &nbsp; &nbsp; &nbsp;=
 &nbsp; fi<br />-- &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)/usr/in=
clude/<br />-- &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DATA) initreq.h $(ROOT)=
/usr/include/<br />-- &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(MA=
NDIR)/man1/<br />-- &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(MAND=
IR)/man5/<br />-- &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(MANDIR=
)/man8/<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(included=
ir)/<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DATA) initreq.h $(ROOT)$(=
includedir)/<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(man=
dir)/man1/<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(mandi=
r)/man5/<br />-+ &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DIR) $(ROOT)$(mandir)=
/man8/<br />- &nbsp; &nbsp; &nbsp; &nbsp; for man in $(MAN1); do \<br />-- =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DATA) ../man/$$man $(ROO=
T)$(MANDIR)/man1/; \<br />-- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -=
i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man1/$$man ; \<br />-+ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man1=
/; \<br />-+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -i "1{ $(MANDB); =
}" $(ROOT)$(mandir)/man1/$$man ; \<br />- &nbsp; &nbsp; &nbsp; &nbsp; done<=
br />- &nbsp; &nbsp; &nbsp; &nbsp; for man in $(MAN5); do \<br />-- &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DATA) ../man/$$man $(ROOT)$(MAN=
DIR)/man5/; \<br />-- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -i "1{ $=
(MANDB); }" $(ROOT)$(MANDIR)/man5/$$man ; \<br />-+ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man5/; \<br=
 />-+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -i "1{ $(MANDB); }" $(RO=
OT)$(mandir)/man5/$$man ; \<br />- &nbsp; &nbsp; &nbsp; &nbsp; done<br />- =
&nbsp; &nbsp; &nbsp; &nbsp; for man in $(MAN8); do \<br />-- &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;$(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/ma=
n8/; \<br />-- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -i "1{ $(MANDB)=
; }" $(ROOT)$(MANDIR)/man8/$$man ; \<br />-+ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man8/; \<br />-+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -i "1{ $(MANDB); }" $(ROOT)$(ma=
ndir)/man8/$$man ; \<br />- &nbsp; &nbsp; &nbsp; &nbsp; done<br />- ifeq ($=
(ROOT),)<br />- &nbsp; &nbsp; &nbsp; &nbsp; #<br />diff --git a/meta/recipe=
s-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvi=
nit/sysvinit/pidof-add-m-option.patch<br />index 8ef292ed12..01df5e6ee4 100=
644<br />--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch=
<br />+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch<br=
 />@@ -45,17 +45,17 @@ index 6866cb3..a87d878 100644<br />&nbsp; .TP<br />&=
nbsp; .B 0<br />&nbsp;diff --git a/src/killall5.c b/src/killall5.c<br />-in=
dex b0728fa..72289e3 100644<br />+index 6f7528a..34d656b 100644<br />&nbsp;=
--- a/src/killall5.c<br />&nbsp;+++ b/src/killall5.c<br />&nbsp;@@ -121,6 +=
121,7 @@ typedef struct _s_nfs<br />&nbsp;&nbsp;<br />&nbsp; /* List of pro=
cesses. */<br />- PROC *plist;<br />-+PROC *olist;<br />+ PROC *plist =3D N=
ULL;<br />++PROC *olist =3D NULL;<br />&nbsp;&nbsp;<br />&nbsp; /* List of =
processes to omit. */<br />- OMIT *omit;<br />+ OMIT *omit =3D NULL;<br />&=
nbsp;@@ -356,6 +357,20 @@ static void clear_mnt(void)<br />&nbsp; &nbsp; &n=
bsp; }<br />&nbsp; }<br />@@ -85,7 +85,7 @@ index b0728fa..72289e3 100644<b=
r />&nbsp; &nbsp; &nbsp; struct dirent &nbsp; &nbsp;*d;<br />&nbsp; &nbsp; =
&nbsp; char &nbsp; &nbsp; &nbsp; &nbsp;path[PATH_MAX+1];<br />&nbsp; &nbsp;=
 &nbsp; char &nbsp; &nbsp; &nbsp; &nbsp;buf[PATH_MAX+1];<br />-@@ -670,6 +6=
86,17 @@ int readproc()<br />+@@ -671,6 +687,17 @@ int readproc()<br />&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; p-&gt;next =3D plist;<br />&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; plist =3D p;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p-&g=
t;pid =3D pid;<br />@@ -103,7 +103,7 @@ index b0728fa..72289e3 100644<br />=
&nbsp; &nbsp; &nbsp; }<br />&nbsp; &nbsp; &nbsp; closedir(dir);<br />&nbsp;=
&nbsp;<br />-@@ -870,6 +897,26 @@ PIDQ_HEAD *pidof(char *prog)<br />+@@ -87=
7,6 +904,26 @@ PIDQ_HEAD *pidof(char *prog)<br />&nbsp; &nbsp; &nbsp; retur=
n q;<br />&nbsp; }<br />&nbsp;&nbsp;<br />@@ -130,7 +130,7 @@ index b0728fa=
..72289e3 100644<br />&nbsp; /* Give usage message and exit. */<br />&nbsp;=
 void usage(void)<br />&nbsp; {<br />-@@ -920,6 +967,7 @@ void nsyslog(int =
pri, char *fmt, ...)<br />+@@ -927,6 +974,7 @@ void nsyslog(int pri, char *=
fmt, ...)<br />&nbsp; #define PIDOF_OMIT &nbsp; &nbsp;0x02<br />&nbsp; #def=
ine PIDOF_NETFS &nbsp; &nbsp;0x04<br />&nbsp; #define PIDOF_QUIET &nbsp; &n=
bsp; 0x08<br />@@ -138,7 +138,7 @@ index b0728fa..72289e3 100644<br />&nbsp=
;&nbsp;<br />&nbsp; /*<br />&nbsp; &nbsp;* &nbsp; &nbsp;Pidof functionality=
.<br />-@@ -937,6 +985,7 @@ int main_pidof(int argc, char **argv)<br />+@@ =
-944,6 +992,7 @@ int main_pidof(int argc, char **argv)<br />&nbsp; &nbsp; &=
nbsp; char &nbsp; &nbsp; &nbsp; &nbsp;tmp[512];<br />&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; char &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sep =3D ' ';<br =
/>&nbsp;&nbsp;<br />@@ -146,7 +146,7 @@ index b0728fa..72289e3 100644<br />=
&nbsp; &nbsp; &nbsp; omit =3D (OMIT*)0;<br />&nbsp; &nbsp; &nbsp; nlist =3D=
 (NFS*)0;<br />&nbsp; &nbsp; &nbsp; opterr =3D 0;<br />-@@ -944,7 +993,7 @@=
 int main_pidof(int argc, char **argv)<br />+@@ -951,7 +1000,7 @@ int main_=
pidof(int argc, char **argv)<br />&nbsp; &nbsp; &nbsp; if ((token =3D geten=
v("PIDOF_NETFS")) &amp;&amp; (strcmp(token,"no") !=3D 0))<br />&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; flags |=3D PIDOF_NETFS;<br />&nbsp;&nbsp;<br />@@ -1=
55,7 +155,7 @@ index b0728fa..72289e3 100644<br />&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; case '?':<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; n=
syslog(LOG_ERR,"invalid options on command line!\n");<br />&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; closelog();<br />-@@ -995,6 +1044,9 @@ int=
 main_pidof(int argc, char **argv)<br />+@@ -1002,6 +1051,9 @@ int main_pid=
of(int argc, char **argv)<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; case 'z':<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; list_dz_processes =3D TRU=
E;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; break;<br />@@ -165,7 +165,7 @@ index b0728fa..7228=
9e3 100644<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; case 'n':<br />&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; flags |=3D PIDOF_NETFS;<br />&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; break;<br />-@@ -1026,10 +1078,1=
3 @@ int main_pidof(int argc, char **argv)<br />+@@ -1033,10 +1085,13 @@ in=
t main_pidof(int argc, char **argv)<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; pid_t spid =3D 0;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; while ((p =3D get_next_from_pid_q(q))) {<br />&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if ((flags &amp; PIDOF_OMIT) =
&amp;&amp; omit) {<br />@@ -181,7 +181,7 @@ index b0728fa..72289e3 100644<b=
r />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; }<br />&nbsp;&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; /*<br />-@@ -1071,6 +1126,7 @@ int main_pi=
dof(int argc, char **argv)<br />+@@ -1078,6 +1133,7 @@ int main_pidof(int a=
rgc, char **argv)<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; printf("\n");<br =
/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />&nbsp;&nbsp;<br />diff --git a/=
meta/recipes-core/sysvinit/sysvinit/realpath.patch b/meta/recipes-core/sysv=
init/sysvinit/realpath.patch<br />index b559aa3b49..78bf870612 100644<br />=
--- a/meta/recipes-core/sysvinit/sysvinit/realpath.patch<br />+++ b/meta/re=
cipes-core/sysvinit/sysvinit/realpath.patch<br />@@ -12,29 +12,12 @@ Upstre=
am-Status: Inappropriate [Linux specific]<br />&nbsp;Signed-off-by: Khem Ra=
j &lt;raj.khem@gmail.com&gt;<br />&nbsp;<br />&nbsp;---<br />- src/killall5=
.c &nbsp; | 4 ++--<br />&nbsp; src/mountpoint.c | 1 +<br />&nbsp; src/wall.=
c &nbsp; &nbsp; &nbsp; | 1 +<br />- 3 files changed, 4 insertions(+), 2 del=
etions(-)<br />+ 2 files changed, 2 insertions(+)<br />&nbsp;<br />-diff --=
git a/src/killall5.c b/src/killall5.c<br />-index a664954..9798423 100644<b=
r />---- a/src/killall5.c<br />-+++ b/src/killall5.c<br />-@@ -977,9 +977,9=
 @@ int matches(PROC *o, PROC *p)<br />- &nbsp; &nbsp; char *oargv1, *pargv=
1;<br />- &nbsp; &nbsp; if ((o-&gt;argv0 &amp;&amp; p-&gt;argv0 &amp;&amp; =
!strcmp(o-&gt;argv0,p-&gt;argv0))) {<br />- &nbsp; &nbsp; &nbsp; &nbsp; if =
(o-&gt;argv1 &amp;&amp; p-&gt;argv1) {<br />-- &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;if ((oargv1 =3D canonicalize_file_name(o-&gt;argv1)) =3D=3D NU=
LL)<br />-+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((oargv1 =3D realpa=
th(o-&gt;argv1, NULL)) =3D=3D NULL)<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; oargv1 =3D strdup(o-&gt;argv1);<br />-- &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;if ((pargv1 =3D canonicalize_file_name(p-&gt;=
argv1)) =3D=3D NULL)<br />-+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((=
pargv1 =3D realpath(p-&gt;argv1, NULL)) =3D=3D NULL)<br />- &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pargv1 =3D strdup(p-&gt;argv1);<br=
 />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (! strcmp(oargv1, pargv1)=
) {<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D =
1;<br />&nbsp;diff --git a/src/mountpoint.c b/src/mountpoint.c<br />-index =
b24335e..5f20522 100644<br />+index 184b1f6..c55b0df 100644<br />&nbsp;--- =
a/src/mountpoint.c<br />&nbsp;+++ b/src/mountpoint.c<br />&nbsp;@@ -23,6 +2=
3,7 @@<br />@@ -46,7 +29,7 @@ index b24335e..5f20522 100644<br />&nbsp; #in=
clude &lt;unistd.h&gt;<br />&nbsp; #include &lt;stdlib.h&gt;<br />&nbsp;dif=
f --git a/src/wall.c b/src/wall.c<br />-index d3a2c70..00826e9 100644<br />=
+index e527613..1d363ca 100644<br />&nbsp;--- a/src/wall.c<br />&nbsp;+++ b=
/src/wall.c<br />&nbsp;@@ -30,6 +30,7 @@<br />diff --git a/meta/recipes-cor=
e/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch b/meta/recipes-core/sysv=
init/sysvinit/sysvinit_remove_linux_fs.patch<br />deleted file mode 100644<=
br />index 89d65c23b7..0000000000<br />--- a/meta/recipes-core/sysvinit/sys=
vinit/sysvinit_remove_linux_fs.patch<br />+++ /dev/null<br />@@ -1,17 +0,0 =
@@<br />-# From glibc 2.36, &lt;linux/mount.h&gt; (included from &lt;linux/=
fs.h&gt;) and&nbsp;<br />-# &lt;sys/mount.h&gt; (included from glibc) are n=
o longer compatible:<br />-# https://sourceware.org/glibc/wiki/Release/2.36=
#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E<br />-<br />-Upstre=
am-Status: Pending<br />-Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;=
<br />-<br />---- sysvinit-3.04/src/sulogin.c.orig &nbsp; &nbsp;2022-08-07 =
23:07:42.952576274 +0200<br />-+++ sysvinit-3.04/src/sulogin.c &nbsp; &nbsp=
;2022-08-07 23:08:26.511470983 +0200<br />-@@ -51,7 +51,6 @@<br />- #ifdef =
__linux__<br />- # &nbsp;include &lt;sys/statfs.h&gt;<br />- # &nbsp;includ=
e &lt;sys/mount.h&gt;<br />--# &nbsp;include &lt;linux/fs.h&gt;<br />- # &n=
bsp;include &lt;linux/magic.h&gt;<br />- # &nbsp;include &lt;linux/major.h&=
gt;<br />- # &nbsp;ifndef TMPFS_MAGIC<br />diff --git a/meta/recipes-core/s=
ysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.10.bb<br /=
>similarity index 93%<br />rename from meta/recipes-core/sysvinit/sysvinit_=
3.04.bb<br />rename to meta/recipes-core/sysvinit/sysvinit_3.10.bb<br />ind=
ex fb9d00891c..89281f9fb3 100644<br />--- a/meta/recipes-core/sysvinit/sysv=
init_3.04.bb<br />+++ b/meta/recipes-core/sysvinit/sysvinit_3.10.bb<br />@@=
 -9,21 +9,18 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa95449=
9f7abaabaa882bbe \<br />&nbsp;<br />&nbsp;RDEPENDS:${PN} =3D "${PN}-inittab=
"<br />&nbsp;<br />-SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-$=
{PV}.tar.xz \<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://install.patc=
h \<br />+SRC_URI =3D "https://github.com/slicer69/sysvinit/releases/downlo=
ad/${PV}/sysvinit-${PV}.tar.xz \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; file://crypt-lib.patch \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; file://pidof-add-m-option.patch \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; file://realpath.patch \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch =
\<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://sysvinit_remove_linux_fs=
.patch \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://rcS-default =
\<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://rc \<br />&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; file://rcS \<br />&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; file://bootlogd.init \<br />&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; file://01_bootlogd \<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 file://0001-hddown-include-libgen.h-for-basename-API.patch \<br />&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br />-SRC_URI[sha256sum] =3D "2a621fe6e=
4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5"<br />+SRC_URI[sha2=
56sum] =3D "c52d22f63e187a1247ad491b6a3a049561b887400a166d6b04fc9d67705c4da=
6"<br />&nbsp;<br />&nbsp;S =3D "${WORKDIR}/sysvinit-${PV}"<br />&nbsp;</di=
v>
</div>

--YVyVfXXZKqs608Rhhrl8--

