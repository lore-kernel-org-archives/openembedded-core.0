Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8423C746A6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 14:46:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w49EkXGS026600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 May 2018 07:46:33 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.223) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 9 May 2018 07:46:33 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 9 May 2018 10:46:32 -0400
Message-ID: <1824420.23D1t2XzuG@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAC+thW1hEyOHdtCMPBW3EpZtAt=J0WwBQ1Y26tRY1mMB_M5TMA@mail.gmail.com>
References: <CAC+thW1hEyOHdtCMPBW3EpZtAt=J0WwBQ1Y26tRY1mMB_M5TMA@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: backport patch to fix build when gcrypt is enabled
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
X-List-Received-Date: Wed, 09 May 2018 14:46:33 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, May 9, 2018 10:36:17 AM EDT Andrea Galbusera wrote:
> Hi Mark!
>=20
> Il mer 9 mag 2018, 15:56 Mark Asselstine <mark.asselstine@windriver.com> =
ha
>=20
> scritto:
> > On Wednesday, May 9, 2018 8:16:08 AM EDT Andrea Galbusera wrote:
> > > When gcrypt support is present in PACKAGECONFIG, build fails due to t=
he
> >=20
> > bug
> >=20
> > > reported in [1]. Since this is already solved upstream, this commit
> > > backports the corresponding patch.
> > >=20
> > > [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D893602
> > >=20
> > > Signed-off-by: Andrea Galbusera <gizero@gmail.com>
> >=20
> > Thanks Andrea, I can confirm this fixes a build failure we were seeing =
as
> > well.
>=20
> Thanks for further testing the patch so quickly!

No problem. I had a build going with the same upstream patch in place when =
I=20
saw your email.

>=20
> Out of curiosity... Are you also enabling gcrypt support to workaround the
> implict dependency resolved used to have upon gcrypt in the past?=20

We have been enabling gcrypt since 2016 when building systemd. We found tha=
t=20
there was upstream work which meant that gcrypt was necessary and not optio=
nal=20
(as it appeared). I don't think we ever revisited this since that initial=20
discovery.

> It took
> me a few hours to figure out what was specific in my configuration, since
> this bug was obviously not exposed in configurations currently built by t=
he
> autobuilders!

We do nightly builds of meta-overc (https://github.com/OverC/meta-overc) wh=
ere=20
we often catch things the autobuilds miss. You most likely don't care about=
=20
the content of meta-overc but it might be worthwhile to keep an eye on comm=
its=20
we do there since we often stage systemd and other fixes there while they a=
re=20
pending for other oe/yocto repos.

>=20
> As a side note, I know there is a newer released version of systemd (238),
> but upgrading such a complex recipe was not an option for me in the short.
> I'm CC-ing the recipe's maintainer here, in case there's already an effort
> to upgrade to 238...

Makes sense, it's the "smart thing to do". Since meta-overc does lots of wo=
rk=20
around containers we can be sensitive to systemd uprev's but are usually qu=
ick=20
to address any issues the uprev might cause.

Mark

>=20
> > Mark
> >=20
> > > ---
> > >=20
> > >  ...rename-noreturn-into-_noreturn_-8456.patch | 203 ++++++++++++++++=
++
> > >  meta/recipes-core/systemd/systemd_237.bb      |   1 +
> > >  2 files changed, 204 insertions(+)
> > >  create mode 100644
> > >=20
> > > meta/recipes-core/systemd/systemd/0033-basic-macros-
> >=20
> > rename-noreturn-into-_n
> >=20
> > > oreturn_-8456.patch
> > >=20
> > > diff --git
> > > a/meta/recipes-core/systemd/systemd/0033-basic-macros-
> >=20
> > rename-noreturn-into-
> >=20
> > > _noreturn_-8456.patch
> > > b/meta/recipes-core/systemd/systemd/0033-basic-macros-
> >=20
> > rename-noreturn-into-
> >=20
> > > _noreturn_-8456.patch new file mode 100644
> > > index 0000000000..59647b22f8
> > > --- /dev/null
> > > +++
> > > b/meta/recipes-core/systemd/systemd/0033-basic-macros-
> >=20
> > rename-noreturn-into-
> >=20
> > > _noreturn_-8456.patch @@ -0,0 +1,203 @@
> > > +From 848e863acc51ecfb0f3955c498874588201d9130 Mon Sep 17 00:00:00 20=
01
> > > +From: Franck Bui <fbui@suse.com>
> > > +Date: Thu, 15 Mar 2018 06:23:46 +0100
> > > +Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#845=
6)
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +"noreturn" is reserved and can be used in other header files we
> > > include:
> > > +
> > > +  [   16s] In file included from /usr/include/gcrypt.h:30:0,
> > > +  [   16s]                  from ../src/journal/journal-file.h:26,
> > > +  [   16s]                  from ../src/journal/journal-vacuum.c:31:
> > > +  [   16s] /usr/include/gpg-error.h:1544:46: error: expected =E2=80=
=98,=E2=80=99 or =E2=80=98;=E2=80=99
> > > before =E2=80=98)=E2=80=99 token +  [   16s]  void gpgrt_log_bug (con=
st char *fmt, ...)
> > >=20
> > > GPGRT_ATTR_NR_PRINTF(1,2); +
> > > +Here we include grcrypt.h (which in turns include gpg-error.h) *afte=
r*
> >=20
> > we
> >=20
> > > +"noreturn" was defined in macro.h.
> > > +---
> > > + src/basic/log.c                         |  4 ++--
> > > + src/basic/log.h                         |  4 ++--
> > > + src/basic/macro.h                       | 19 +++++++++----------
> > > + src/basic/process-util.c                |  2 +-
> > > + src/basic/process-util.h                |  2 +-
> > > + src/core/main.c                         |  4 ++--
> > > + src/journal/test-journal-interleaving.c |  2 +-
> > > + src/shared/pager.c                      |  2 +-
> > > + src/udev/collect/collect.c              |  2 +-
> > > + 9 files changed, 20 insertions(+), 21 deletions(-)
> > > +
> > > +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/8=
456
> >=20
> > ]
> >=20
> > > +
> > > +diff --git a/src/basic/log.c b/src/basic/log.c
> > > +index 7a7f2cbec..16a2431c5 100644
> > > +--- a/src/basic/log.c
> > > ++++ b/src/basic/log.c
> > > +@@ -814,7 +814,7 @@ static void log_assert(
> > > +         log_dispatch_internal(level, 0, file, line, func, NULL, NUL=
L,
> > > NULL, NULL, buffer); + }
> > > +
> > > +-noreturn void log_assert_failed_realm(
> > > ++_noreturn_ void log_assert_failed_realm(
> > > +                 LogRealm realm,
> > > +                 const char *text,
> > > +                 const char *file,
> > > +@@ -826,7 +826,7 @@ noreturn void log_assert_failed_realm(
> > > +         abort();
> > > + }
> > > +
> > > +-noreturn void log_assert_failed_unreachable_realm(
> > > ++_noreturn_ void log_assert_failed_unreachable_realm(
> > > +                 LogRealm realm,
> > > +                 const char *text,
> > > +                 const char *file,
> > > +diff --git a/src/basic/log.h b/src/basic/log.h
> > > +index efcf0f1bf..314be128a 100644
> > > +--- a/src/basic/log.h
> > > ++++ b/src/basic/log.h
> > > +@@ -186,7 +186,7 @@ int log_dump_internal(
> > > +                 char *buffer);
> > > +
> > > + /* Logging for various assertions */
> > > +-noreturn void log_assert_failed_realm(
> > > ++_noreturn_ void log_assert_failed_realm(
> > > +                 LogRealm realm,
> > > +                 const char *text,
> > > +                 const char *file,
> > > +@@ -195,7 +195,7 @@ noreturn void log_assert_failed_realm(
> > > + #define log_assert_failed(text, ...) \
> > > +         log_assert_failed_realm(LOG_REALM, (text), __VA_ARGS__)
> > > +
> > > +-noreturn void log_assert_failed_unreachable_realm(
> > > ++_noreturn_ void log_assert_failed_unreachable_realm(
> > > +                 LogRealm realm,
> > > +                 const char *text,
> > > +                 const char *file,
> > > +diff --git a/src/basic/macro.h b/src/basic/macro.h
> > > +index 95be63a20..8911edfc4 100644
> > > +--- a/src/basic/macro.h
> > > ++++ b/src/basic/macro.h
> > > +@@ -53,6 +53,15 @@
> > > + #else
> > > + #define _fallthrough_
> > > + #endif
> > > ++/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
> > > ++ * compiler versions */
> > > ++#ifndef _noreturn_
> > > ++#if __STDC_VERSION__ >=3D 201112L
> > > ++#define _noreturn_ _Noreturn
> > > ++#else
> > > ++#define _noreturn_ __attribute__((noreturn))
> > > ++#endif
> > > ++#endif
> > > +
> > > + /* Temporarily disable some warnings */
> > > + #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT
> > >=20
> >    \
> > >=20
> > > +@@ -414,16 +423,6 @@ static inline unsigned long ALIGN_POWER2(unsign=
ed
> >=20
> > long
> >=20
> > > u) { + #endif
> > > + #endif
> > > +
> > > +-/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
> > > +- * compiler versions */
> > > +-#ifndef noreturn
> > > +-#if __STDC_VERSION__ >=3D 201112L
> > > +-#define noreturn _Noreturn
> > > +-#else
> > > +-#define noreturn __attribute__((noreturn))
> > > +-#endif
> > > +-#endif
> > > +-
> > > + #define DEFINE_TRIVIAL_CLEANUP_FUNC(type, func)                 \
> > > +         static inline void func##p(type *p) {                   \
> > > +                 if (*p)                                         \
> > > +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> > > +index aa9846db5..e6120af5b 100644
> > > +--- a/src/basic/process-util.c
> > > ++++ b/src/basic/process-util.c
> > > +@@ -987,7 +987,7 @@ bool is_main_thread(void) {
> > > +         return cached > 0;
> > > + }
> > > +
> > > +-noreturn void freeze(void) {
> > > ++_noreturn_ void freeze(void) {
> > > +
> > > +         log_close();
> > > +
> > > +diff --git a/src/basic/process-util.h b/src/basic/process-util.h
> > > +index 93029e36e..5170adec7 100644
> > > +--- a/src/basic/process-util.h
> > > ++++ b/src/basic/process-util.h
> > > +@@ -91,7 +91,7 @@ int pid_from_same_root_fs(pid_t pid);
> > > +
> > > + bool is_main_thread(void);
> > > +
> > > +-noreturn void freeze(void);
> > > ++_noreturn_ void freeze(void);
> > > +
> > > + bool oom_score_adjust_is_valid(int oa);
> > > +
> > > +diff --git a/src/core/main.c b/src/core/main.c
> > > +index 076846a41..4b2d14923 100644
> > > +--- a/src/core/main.c
> > > ++++ b/src/core/main.c
> > > +@@ -141,7 +141,7 @@ static uint64_t arg_default_tasks_max =3D UINT64=
_MAX;
> > > + static sd_id128_t arg_machine_id =3D {};
> > > + static EmergencyAction arg_cad_burst_action =3D
> > > EMERGENCY_ACTION_REBOOT_FORCE; +
> > > +-noreturn static void freeze_or_reboot(void) {
> > > ++_noreturn_ static void freeze_or_reboot(void) {
> > > +
> > > +         if (arg_crash_reboot) {
> > > +                 log_notice("Rebooting in 10s...");
> > > +@@ -156,7 +156,7 @@ noreturn static void freeze_or_reboot(void) {
> > > +         freeze();
> > > + }
> > > +
> > > +-noreturn static void crash(int sig) {
> > > ++_noreturn_ static void crash(int sig) {
> > > +         struct sigaction sa;
> > > +         pid_t pid;
> > > +
> > > +diff --git a/src/journal/test-journal-interleaving.c
> > > b/src/journal/test-journal-interleaving.c +index 5a88b2774..d87bdbdd3
> > > 100644
> > > +--- a/src/journal/test-journal-interleaving.c
> > > ++++ b/src/journal/test-journal-interleaving.c
> > > +@@ -37,7 +37,7 @@
> > > +
> > > + static bool arg_keep =3D false;
> > > +
> > > +-noreturn static void log_assert_errno(const char *text, int error,
> >=20
> > const
> >=20
> > > char *file, int line, const char *func) { ++_noreturn_ static void
> > > log_assert_errno(const char *text, int error, const char *file, int
> > > line,
> > > const char *func) { +         log_internal(LOG_CRIT, error, file, lin=
e,
> > > func,
> > > +                      "'%s' failed at %s:%u (%s): %m", text, file,
> > > line,
> > > func); +         abort();
> > > +diff --git a/src/shared/pager.c b/src/shared/pager.c
> > > +index 75db3c985..681af9c40 100644
> > > +--- a/src/shared/pager.c
> > > ++++ b/src/shared/pager.c
> > > +@@ -47,7 +47,7 @@ static int stored_stderr =3D -1;
> > > + static bool stdout_redirected =3D false;
> > > + static bool stderr_redirected =3D false;
> > > +
> > > +-noreturn static void pager_fallback(void) {
> > > ++_noreturn_ static void pager_fallback(void) {
> > > +         int r;
> > > +
> > > +         r =3D copy_bytes(STDIN_FILENO, STDOUT_FILENO, (uint64_t) -1=
, 0);
> > > +diff --git a/src/udev/collect/collect.c b/src/udev/collect/collect.c
> > > +index 2821640e9..c8fa47b3d 100644
> > > +--- a/src/udev/collect/collect.c
> > > ++++ b/src/udev/collect/collect.c
> > > +@@ -58,7 +58,7 @@ static inline struct _mate *node_to_mate(struct
> > > udev_list_node *node) +         return container_of(node, struct _mat=
e,
> > > node);
> > > + }
> > > +
> > > +-noreturn static void sig_alrm(int signo)
> > > ++_noreturn_ static void sig_alrm(int signo)
> > > + {
> > > +         exit(4);
> > > + }
> > > +--
> > > +2.17.0
> > > +
> > > diff --git a/meta/recipes-core/systemd/systemd_237.bb
> > > b/meta/recipes-core/systemd/systemd_237.bb index 1d04796f39..6f59e606=
4e
> > > 100644
> > > --- a/meta/recipes-core/systemd/systemd_237.bb
> > > +++ b/meta/recipes-core/systemd/systemd_237.bb
> > > @@ -50,6 +50,7 @@ SRC_URI +=3D "file://touchscreen.rules \
> > >=20
> > > file://0030-fix-missing-of-__register_atfork-for-non-glibc-build.patc=
h \
> > > file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patc=
h \
> > > file://0032-memfd.patch \
> > > +
> > > file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch \=
 "
> > >=20
> > >  SRC_URI_append_qemuall =3D "
> > >=20
> > > file://0001-core-device.c-Change-the-default-device-timeout-to-2.patc=
h"





