Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D0FC19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 16:19:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.6835.1659629953863046473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 09:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iUQMTIJw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id l22so259242wrz.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc;
        bh=2vzDgEHZBtHVKsokXdLPgja3tDZJYZMfV+lf5gWaHwU=;
        b=iUQMTIJw4uPv9b5BYfHyJHMvdJ/h3eXvjom86uxhtbYd7lVGu5RP5HKWypKhMKZkqw
         iHi01XHUMlk2XaVsQVpLL7gGOj9WzKESg0qUasQvx87bKllgGpLLV9Tp/ECbiqfp9rLq
         dhZXdbeg80fk3PjnAdoeY/MuRDLKBQ3o6A2cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc;
        bh=2vzDgEHZBtHVKsokXdLPgja3tDZJYZMfV+lf5gWaHwU=;
        b=a5+pH93UTJDEeQeWMB4MJun3MvEcTsCiiw9QmWRPV6NpkmD9x7A4r85tCnSv0Ed+oI
         TJCabv96uvfN9Rs6R9rUf3CEUU20X0ruwCb/Z/I+wVMaTbgoOpHWvpyIhHpGDxfLFGTp
         DH6pTn2BwtUZHys7g72gVpGxPH6+clZrcp35ybivvRVjlkw2ohrSQryvSNgN288Vydaq
         QKBj4Bj3HaLw0QZ/lP1dbRmwThhDaYsGz9FILcTKPuigXD92UMZqXgRZQIOSsie+UCzp
         f3Eej7R7uwUyZrsQg56/jNYdOLU6xqqyIqrk4wPdDCNf7mjDdjn+wGuUb57DZIgTm10P
         nWJA==
X-Gm-Message-State: ACgBeo12yez4emYqRFcRCNEJ8sJHfx72t6o/qPAyG9vIVFu3qTLQdU8m
	Si0K9+62LKa7WphzviMZBuYluueraiLZDg==
X-Google-Smtp-Source: 
 AA6agR68pZL0w9JHMcyidGxzrNFq4jZoWcIXTWrrYL0mPVTDuyh7EoA1qXgjh5SUC1e6O8RxPA23og==
X-Received: by 2002:a5d:6da8:0:b0:220:7e04:536e with SMTP id
 u8-20020a5d6da8000000b002207e04536emr1971159wrs.317.1659629951625;
        Thu, 04 Aug 2022 09:19:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3?
 ([2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3])
        by smtp.gmail.com with ESMTPSA id
 w15-20020adfec4f000000b0021e6b62fde2sm1442042wrn.59.2022.08.04.09.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 09:19:11 -0700 (PDT)
Message-ID: 
 <1c81d4c3c2401e3024982198007ee5c087ef9c52.camel@linuxfoundation.org>
Subject: [PATCH RFC] pseudo: Add rust install workaround for jemalloc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: seebs <seebs@seebs.net>
Date: Thu, 04 Aug 2022 17:19:10 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 16:19:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168860

We see hangs if we leave pseudo enabled when running rust do_install.
The prebuilt rust binaries use jemalloc as a memory allocator and it is
interacting rather badly with pseudo's LD_PRELOAD.

The hangs are because pseudo intercepts are called at malloc init time
but that triggers pseudo's own init code which calls malloc itself and
it deadlocks.

There are two issue entry points. One is that it calls readlink() or
readlinkat() on /etc/malloc.conf to load it's configuration. It also
calls syscall() instead of open() on some /proc files, ironically, to
avoid wrapper libs like ours, except we also wrap syscall().

This patch hacks pseudo to break the deadlocks in those functions by
assuming a library won't make a readlink() call for a file containing
"malloc.conf" or call syscall() as it's first library call.

Sending as an RFC so people can understand why rust deadlocks and see
if anyone has any better ideas on how to fix this. We may just decide
not to run rust under pseudo instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/mallocignore.patch                | 183 +++++++++++++++++=
++++
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/mallocignore.patch

diff --git a/meta/recipes-devtools/pseudo/files/mallocignore.patch b/meta/r=
ecipes-devtools/pseudo/files/mallocignore.patch
new file mode 100644
index 0000000000..365019b78d
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/mallocignore.patch
@@ -0,0 +1,183 @@
+Upstream-Status: Inappropriate [works around issues with rust and jemalloc=
]
+
+We see two deadlocks when running rust do_install due to jemalloc and=20
+pseudo conflicting at init time. We hack to hack the readlink() and=20
+syscall() intercepts to break the deadlock.
+
+#0  0x00007f3806c84bcf in __lll_lock_wait () from /home/pokybuild/yocto-wo=
rker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so=
.6
+#1  0x00007f3806c8aec2 in pthread_mutex_lock () from /home/pokybuild/yocto=
-worker/qemumips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc=
.so.6
+#2  0x00005629da227a0e in malloc_mutex_lock_final (mutex=3D0x5629da45a288 =
<init_lock>) at include/jemalloc/internal/mutex.h:155
+#3  _rjem_je_malloc_mutex_lock_slow (mutex=3D0x5629da45a288 <init_lock>) a=
t src/mutex.c:85
+#4  0x00005629da1ffddb in malloc_mutex_lock (tsdn=3D0x0, mutex=3D<optimize=
d out>) at include/jemalloc/internal/mutex.h:221
+#5  malloc_init_hard () at src/jemalloc.c:1739
+#6  0x00005629da1fa2ee in malloc_init () at src/jemalloc.c:223
+#7  imalloc_init_check (sopts=3D<optimized out>, dopts=3D<optimized out>) =
at src/jemalloc.c:2229
+#8  imalloc (sopts=3D<optimized out>, dopts=3D<optimized out>) at src/jema=
lloc.c:2260
+#9  _rjem_je_malloc_default (size=3D101) at src/jemalloc.c:2289
+#10 0x00007f3806c998fe in strdup () from /home/pokybuild/yocto-worker/qemu=
mips64/build/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
+#11 0x00007f380b19da1b in pseudo_set_value () from /home/pokybuild/yocto-w=
orker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/u=
sr/lib/pseudo/lib64/libpseudo.so
+#12 0x00007f380b19dbb9 in pseudo_init_util () from /home/pokybuild/yocto-w=
orker/qemumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/u=
sr/lib/pseudo/lib64/libpseudo.so
+#13 0x00007f380b16bd01 in ?? () from /home/pokybuild/yocto-worker/qemumips=
64/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/=
lib64/libpseudo.so
+#14 0x00007f380b19125d in readlink () from /home/pokybuild/yocto-worker/qe=
mumips64/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/lib/p=
seudo/lib64/libpseudo.so
+#15 0x00005629da1fe07b in obtain_malloc_conf (which_source=3D2, buf=3D0x7f=
fca80e7cc0 "\320~\016\250\374\177") at src/jemalloc.c:980
+#16 malloc_conf_init_helper (sc_data=3Dsc_data@entry=3D0x0, bin_shard_size=
s=3Dbin_shard_sizes@entry=3D0x0, initial_call=3Dtrue, opts_cache=3Dopts_cac=
he@entry=3D0x7ffca80e6260, buf=3D<optimized out>,=20
+    buf@entry=3D0x7ffca80e7cc0 "\320~\016\250\374\177") at src/jemalloc.c:=
1038
+#17 0x00005629da1fdcac in malloc_conf_init (sc_data=3D0x7ffca80e6310, bin_=
shard_sizes=3D0x7ffca80e6280) at src/jemalloc.c:1445
+#18 malloc_init_hard_a0_locked () at src/jemalloc.c:1505
+#19 0x00005629da1fff46 in malloc_init_hard () at src/jemalloc.c:1750
+#20 0x00005629da1fa2ee in malloc_init () at src/jemalloc.c:223
+
+
+0x00007f36e6884bcf in __lll_lock_wait () from /media/build1/poky/build/tmp=
-musl/sysroots-uninative/x86_64-linux/lib/libc.so.6
+(gdb) bt
+#0 0x00007f36e6884bcf in __lll_lock_wait () from /media/build1/poky/build/=
tmp-musl/sysroots-uninative/x86_64-linux/lib/libc.so.6
+#1 0x00007f36e688aec2 in pthread_mutex_lock () from /media/build1/poky/bui=
ld/tmp-musl/sysroots-uninative/x86_64-linux/lib/libc.so.6
+#2 0x000055a537834a0e in malloc_mutex_lock_final (mutex=3D0x55a537a67288 <=
init_lock>) at include/jemalloc/internal/mutex.h:155
+#3 _rjem_je_malloc_mutex_lock_slow (mutex=3D0x55a537a67288 <init_lock>) at=
 src/mutex.c:85
+#4 0x000055a53780cddb in malloc_mutex_lock (tsdn=3D0x0, mutex=3D<optimised=
 out>) at include/jemalloc/internal/mutex.h:221
+#5 malloc_init_hard () at src/jemalloc.c:1739
+#6 0x000055a5378072ee in malloc_init () at src/jemalloc.c:223
+#7 imalloc_init_check (sopts=3D<optimised out>, dopts=3D<optimised out>) a=
t src/jemalloc.c:2229
+#8 imalloc (sopts=3D<optimised out>, dopts=3D<optimised out>) at src/jemal=
loc.c:2260
+#9 _rjem_je_malloc_default (size=3D79) at src/jemalloc.c:2289
+#10 0x00007f36e68998fe in strdup () from /media/build1/poky/build/tmp-musl=
/sysroots-uninative/x86_64-linux/lib/libc.so.6
+#11 0x00007f36eabf842e in pseudo_set_value () from /media/build1/poky/buil=
d/tmp-musl/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/li=
bpseudo.so
+#12 0x00007f36eabf85e0 in pseudo_init_util () from /media/build1/poky/buil=
d/tmp-musl/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/li=
bpseudo.so
+#13 0x00007f36eabc2645 in ?? () from /media/build1/poky/build/tmp-musl/sys=
roots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libpseudo.so
+#14 0x00007f36eabd1055 in syscall () from /media/build1/poky/build/tmp-mus=
l/sysroots-components/x86_64/pseudo-native/usr/lib/pseudo/lib64/libpseudo.s=
o
+#15 0x000055a5378353e6 in os_overcommits_proc () at src/pages.c:475
+#16 _rjem_je_pages_boot () at src/pages.c:616
+#17 0x000055a53780ad0e in malloc_init_hard_a0_locked () at src/jemalloc.c:=
1518
+#18 0x000055a53780cf46 in malloc_init_hard () at src/jemalloc.c:1750
+#19 0x000055a5378072ee in malloc_init () at src/jemalloc.c:223
+#20 imalloc_init_check (sopts=3D<optimised out>, dopts=3D<optimised out>) =
at src/jemalloc.c:2229
+#21 imalloc (sopts=3D<optimised out>, dopts=3D<optimised out>) at src/jema=
lloc.c:2260
+#22 _rjem_je_malloc_default (size=3D72704) at src/jemalloc.c:2289
+#23 0x000055a537807630 in malloc (size=3D94168091620040, size@entry=3D7270=
4) at include/jemalloc/internal/cache_bin.h:100
+#24 0x00007f36e623b950 in (anonymous namespace)::pool::pool (this=3D0x7f36=
e678cde0 <(anonymous namespace)::emergency_pool>)
+at ../../../../gcc-5.5.0/libstdc++-v3/libsupc++/eh_alloc.cc:117
+#25 __static_initialization_and_destruction_0 (__priority=3D65535, __initi=
alize_p=3D1) at ../../../../gcc-5.5.0/libstdc++-v3/libsupc++/eh_alloc.cc:24=
4
+#26 _GLOBAL__sub_I_eh_alloc.cc(void) () at ../../../../gcc-5.5.0/libstdc++=
-v3/libsupc++/eh_alloc.cc:307
+#27 0x00007f36eac28e5e in call_init () from /media/build1/poky/build/tmp-m=
usl/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
+#28 0x00007f36eac28f4c in _dl_init () from /media/build1/poky/build/tmp-mu=
sl/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
+#29 0x00007f36eac407ca in _dl_start_user () from /media/build1/poky/build/=
tmp-musl/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
+
+
+Index: git/makewrappers
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/makewrappers
++++ git/makewrappers
+@@ -232,6 +232,7 @@ class Function:
+         self.fd_arg =3D False
+         self.noignore_path =3D False
+         self.hand_wrapped =3D None
++        self.disabled_condition =3D None
+         self.async_skip =3D None
+         # used for the copyright date when creating stub functions
+         self.date =3D datetime.date.today().year
+@@ -340,6 +341,13 @@ class Function:
+         else:
+             return ""
+=20
++    def extra_disabled_condition(self):
++        if self.disabled_condition:
++            if self.name =3D=3D "syscall":
++                return 'pseudo_util_initted =3D=3D -1'           =20
++            return 'pseudo_util_initted =3D=3D -1 && strstr(path, "malloc=
.conf") !=3D NULL'
++        return "0"
++
+     def comment(self):
+         """declare self (in a comment)"""
+         return self.decl(comment =3D True)
+Index: git/templates/wrapfuncs.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/templates/wrapfuncs.c
++++ git/templates/wrapfuncs.c
+@@ -26,6 +26,16 @@ ${name}(${decl_args}) {
+=20
+ ${maybe_async_skip}
+=20
++	if (${extra_disabled_condition}) {
++		${variadic_start}
++		${type} (*f)(${decl_args}) =3D (${type} (*)(${decl_args})) NULL;
++		f =3D dlsym(RTLD_NEXT, "${name}");
++		${rc_assign} f(${call_args});
++		${variadic_end}
++		PROFILE_DONE;
++		${rc_return}
++	}
++
+ 	if (!pseudo_check_wrappers() || !real_$name) {
+ 		/* rc was initialized to the "failure" value */
+ 		pseudo_enosys("${name}");
+Index: git/ports/unix/wrapfuncs.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/ports/unix/wrapfuncs.in
++++ git/ports/unix/wrapfuncs.in
+@@ -59,8 +59,8 @@ int symlinkat(const char *oldname, int d
+ int unlink(const char *path); /* flags=3DAT_SYMLINK_NOFOLLOW */
+ int unlinkat(int dirfd, const char *path, int rflags); /* flags=3DAT_SYML=
INK_NOFOLLOW */
+ # primarily for use with chroot()
+-ssize_t readlink(const char *path, char *buf, size_t bufsiz); /* flags=3D=
AT_SYMLINK_NOFOLLOW */
+-ssize_t readlinkat(int dirfd, const char *path, char *buf, size_t bufsiz)=
; /* flags=3DAT_SYMLINK_NOFOLLOW */
++ssize_t readlink(const char *path, char *buf, size_t bufsiz); /* flags=3D=
AT_SYMLINK_NOFOLLOW, disabled_condition=3D1 */
++ssize_t readlinkat(int dirfd, const char *path, char *buf, size_t bufsiz)=
; /* flags=3DAT_SYMLINK_NOFOLLOW, disabled_condition=3D1 */
+ int system(const char *command);
+ FILE *popen(const char *command, const char *mode); /* hand_wrapped=3D1 *=
/
+ # Based on experiments by Richard Purdie: Allow pseudo to eliminate
+Index: git/pseudo_util.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/pseudo_util.c
++++ git/pseudo_util.c
+@@ -98,7 +98,7 @@ static unsigned long pseudo_debug_flags_
+  * program starts playing with things, so we need to do our
+  * best to handle that case.
+  */
+-static int pseudo_util_initted =3D -1;  /* Not yet run */
++int pseudo_util_initted =3D -1;  /* Not yet run */
+=20
+ /* bypass wrapper logic on path computations */
+ int (*pseudo_real_lstat)(const char *path, PSEUDO_STATBUF *buf) =3D NULL;
+Index: git/pseudo_client.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/pseudo_client.h
++++ git/pseudo_client.h
+@@ -49,6 +49,7 @@ extern int pseudo_pwd_lck_open(void);
+ extern int pseudo_pwd_lck_close(void);
+ extern FILE *pseudo_pwd;
+ extern FILE *pseudo_grp;
++extern int pseudo_util_initted;
+=20
+ /* pseudo_wrappers will try to initialize these */
+ extern int (*pseudo_real_lstat)(const char *path, PSEUDO_STATBUF *buf);
+Index: git/ports/linux/wrapfuncs.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/ports/linux/wrapfuncs.in
++++ git/ports/linux/wrapfuncs.in
+@@ -59,7 +59,7 @@ int getpw(uid_t uid, char *buf);
+ int getpwent_r(struct passwd *pwbuf, char *buf, size_t buflen, struct pas=
swd **pwbufp);
+ int getgrent_r(struct group *gbuf, char *buf, size_t buflen, struct group=
 **gbufp);
+ int capset(cap_user_header_t hdrp, const cap_user_data_t datap); /* real_=
func=3Dpseudo_capset */
+-long syscall(long nr, ...); /* hand_wrapped=3D1 */
++long syscall(long nr, ...); /* hand_wrapped=3D1, disabled_condition=3D1 *=
/
+ int renameat2(int olddirfd, const char *oldpath, int newdirfd, const char=
 *newpath, unsigned int flags); /* flags=3DAT_SYMLINK_NOFOLLOW */
+ int prctl(int option, ...); /* hand_wrapped=3D1 */
+ int close_range(unsigned int lowfd, unsigned int maxfd, int flags);
+Index: git/ports/linux/pseudo_wrappers.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/ports/linux/pseudo_wrappers.c
++++ git/ports/linux/pseudo_wrappers.c
+@@ -59,6 +59,13 @@ syscall(long number, ...) {
+ 	long rc =3D -1;
+ 	va_list ap;
+=20
++	if (pseudo_util_initted =3D=3D -1) {
++		long (*f)(long nr, ...) =3D (long (*)(long nr, ...)) NULL;
++		f =3D dlsym(RTLD_NEXT, "syscall");
++		void *res =3D __builtin_apply((void (*)(void)) f, __builtin_apply_args(=
), sizeof(long) * 7);
++		__builtin_return(res);
++	}
++
+ 	if (!pseudo_check_wrappers() || !real_syscall) {
+ 		/* rc was initialized to the "failure" value */
+ 		pseudo_enosys("syscall");
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devt=
ools/pseudo/pseudo_git.bb
index 7dedb0242c..452212cf56 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
=20
 SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Doe-core;protocol=
=3Dhttps \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://mallocignore.patch \
            file://fallback-passwd \
            file://fallback-group \
            "


