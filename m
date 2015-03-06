Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1E73D6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 22:49:32 +0000 (UTC)
Received: by igbhn18 with SMTP id hn18so7809198igb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 14:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Xxwn9kHYCF8q2osZfgIgLNlxyhAGBbkzzGl1HegnWNw=;
	b=EYL4/zhisFKNDIUpdEER2aKwsQ1Ca0NoMvhTqU6MMzWOjFdyqGCJ78XQVdrlqgLuXn
	D0WKvb01YoNEAGY3kXpvMT/lxLCNI8pTNs34ZTQyom4EoJTjt4NSwAGIsvHw7BMe5FGg
	ZeEDbp/r/nD7J2l0SDfzSH5o/FKwu58HHZj2Ugj6o/J3hif+SKr90l2YroehocyxC47A
	HUMlp3tH2H36aTjEZjPmBvNxV7r3viDKkVgXC5eUE2nmOhmsS3V8CMQG8oXdvtFqUclE
	we0d2PWYcknzfKredjCCTcOgEF4tmiL2n1LvgPS67235GtVBgXmPjiPBVyS4yI09SNeX
	2D5w==
X-Received: by 10.107.10.157 with SMTP id 29mr7979569iok.79.1425682173275;
	Fri, 06 Mar 2015 14:49:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Fri, 6 Mar 2015 14:49:03 -0800 (PST)
In-Reply-To: <1425678686-5469-1-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1425678686-5469-1-git-send-email-bruno.bottazzini@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Mar 2015 14:49:03 -0800
Message-ID: <CAMKF1spHsw-9DXLUy1EzfVQDFt5XGdyaLvXC6McVg05RWjVi5w@mail.gmail.com>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: 219 -> stable-219
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
X-List-Received-Date: Fri, 06 Mar 2015 22:49:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 6, 2015 at 1:51 PM, Bruno Bottazzini
<bruno.bottazzini@intel.com> wrote:
> The upstream systemd git repo only contains the main systemd branch that
> progresses at a quick pace, continuously bringing both bugfixes and new features.
>
> Distributions usually prefer basing their releases on stabilized versions
> that receive the bugfixes but not the features.

Thats good, although we have to be open on stable branch to do SRCREV
updates which we hardly do. We only backport fixed via master
so I see this as pointless from that angle.

> ---
>  ...0-Make-root-s-home-directory-configurable.patch | 89 +++++++++-------------
>  meta/recipes-core/systemd/systemd_219.bb           |  6 +-
>  2 files changed, 40 insertions(+), 55 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> index 41b9039..ff2871b 100644
> --- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> +++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> @@ -1,7 +1,7 @@
> -From 3dc731c1d270e2e143de621db9bd898299fd849d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 20 Feb 2015 05:24:49 +0000
> -Subject: [PATCH 10/11] Make root's home directory configurable
> +From dd843247b6c769a3983462f7e616dc43226974a0 Mon Sep 17 00:00:00 2001
> +From: Bruno Bottazzini <bruno.bottazzini@intel.com>
> +Date: Thu, 5 Mar 2015 17:38:12 -0300
> +Subject: [PATCH] Make root's home directory configurable
>
>  OpenEmbedded has a configurable home directory for root. Allow
>  systemd to be built using its idea of what root's home directory
> @@ -9,32 +9,31 @@ should be.
>
>  Upstream-Status: Pending
>
> -Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Patch made by Khem Raj <raj.khem@gmail.com> updated to be
> +compatbile with systemd 219-stable
>  ---
> - Makefile.am                       | 2 ++
> - configure.ac                      | 7 +++++++
> - src/core/unit-printf.c            | 2 +-
> - src/nspawn/nspawn.c               | 4 ++--
> - src/shared/util.c                 | 4 ++--
> - units/console-shell.service.m4.in | 4 ++--
> - units/emergency.service.in        | 4 ++--
> - units/rescue.service.in           | 4 ++--
> - 8 files changed, 20 insertions(+), 11 deletions(-)
> + Makefile.am                | 2 ++
> + configure.ac               | 7 +++++++
> + src/core/unit-printf.c     | 2 +-
> + src/nspawn/nspawn.c        | 5 ++---
> + src/shared/util.c          | 4 ++--
> + units/emergency.service.in | 4 ++--
> + units/rescue.service.in    | 4 ++--
> + 7 files changed, 18 insertions(+), 10 deletions(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 0fb3f9f..4623963 100644
> +index 93c0509..31ea94d 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -199,6 +199,7 @@ AM_CPPFLAGS = \
> -       -DKEXEC=\"$(KEXEC)\" \
> -       -DLIBDIR=\"$(libdir)\" \
> +@@ -201,6 +201,7 @@ AM_CPPFLAGS = \
>         -DROOTLIBDIR=\"$(rootlibdir)\" \
> -+      -DROOTHOMEDIR=\"$(roothomedir)\" \
> +       -DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
>         -DTEST_DIR=\"$(abs_top_srcdir)/test\" \
> ++      -DROOTHOMEDIR=\"$(roothomedir)\" \
>         -I $(top_srcdir)/src \
>         -I $(top_builddir)/src/shared \
> -@@ -6342,6 +6343,7 @@ EXTRA_DIST += \
> +       -I $(top_srcdir)/src/shared \
> +@@ -6350,6 +6351,7 @@ EXTRA_DIST += \
>   substitutions = \
>          '|rootlibexecdir=$(rootlibexecdir)|' \
>          '|rootbindir=$(rootbindir)|' \
> @@ -43,10 +42,10 @@ index 0fb3f9f..4623963 100644
>          '|SYSTEMCTL=$(rootbindir)/systemctl|' \
>          '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
>  diff --git a/configure.ac b/configure.ac
> -index a5b2e6e..55bb7d8 100644
> +index 01ee8dc..800a587 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1428,6 +1428,11 @@ AC_ARG_WITH([rootlibdir],
> +@@ -1410,6 +1410,11 @@ AC_ARG_WITH([rootlibdir],
>           [],
>           [with_rootlibdir=${libdir}])
>
> @@ -58,7 +57,7 @@ index a5b2e6e..55bb7d8 100644
>   AC_ARG_WITH([pamlibdir],
>           AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
>           [],
> -@@ -1518,6 +1523,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
> +@@ -1500,6 +1505,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
>   AC_SUBST([pamconfdir], [$with_pamconfdir])
>   AC_SUBST([rootprefix], [$with_rootprefix])
>   AC_SUBST([rootlibdir], [$with_rootlibdir])
> @@ -66,7 +65,7 @@ index a5b2e6e..55bb7d8 100644
>
>   AC_CONFIG_FILES([
>           Makefile po/Makefile.in
> -@@ -1617,6 +1623,7 @@ AC_MSG_RESULT([
> +@@ -1599,6 +1605,7 @@ AC_MSG_RESULT([
>           include_prefix:          ${INCLUDE_PREFIX}
>           lib dir:                 ${libdir}
>           rootlib dir:             ${with_rootlibdir}
> @@ -75,10 +74,10 @@ index a5b2e6e..55bb7d8 100644
>           SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
>           Build Python:            ${PYTHON}
>  diff --git a/src/core/unit-printf.c b/src/core/unit-printf.c
> -index 97135db..14d12f1 100644
> +index 7736899..ac5f008 100644
>  --- a/src/core/unit-printf.c
>  +++ b/src/core/unit-printf.c
> -@@ -259,7 +259,7 @@ static int specifier_user_home(char specifier, void *data, void *userdata, char
> +@@ -256,7 +256,7 @@ static int specifier_user_home(char specifier, void *data, void *userdata, char
>                    * best of it if we can, but fail if we can't */
>
>                   if (!c->user || streq(c->user, "root") || streq(c->user, "0"))
> @@ -88,21 +87,22 @@ index 97135db..14d12f1 100644
>                           return -ENOTSUP;
>
>  diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> -index b597edb..0b32673 100644
> +index 08bfdcf..b44b4cd 100644
>  --- a/src/nspawn/nspawn.c
>  +++ b/src/nspawn/nspawn.c
> -@@ -4192,7 +4192,7 @@ int main(int argc, char *argv[]) {
> +@@ -4180,8 +4180,7 @@ int main(int argc, char *argv[]) {
> +                         r = change_uid_gid(&home);
>                           if (r < 0)
>                                   _exit(EXIT_FAILURE);
> -
> +-
>  -                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
>  +                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
>                               (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
>                               (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0)) {
>                                   log_oom();
> -@@ -4266,7 +4266,7 @@ int main(int argc, char *argv[]) {
> -                                 execvp(argv[optind], argv + optind);
> - #endif /* HAVE_EXECVPE */
> +@@ -4250,7 +4249,7 @@ int main(int argc, char *argv[]) {
> +                         } else if (argc > optind)
> +                                 execvpe(argv[optind], argv + optind, env_use);
>                           else {
>  -                                chdir(home ? home : "/root");
>  +                                chdir(home ? home : ROOTHOMEDIR);
> @@ -110,10 +110,10 @@ index b597edb..0b32673 100644
>                                   execle("/bin/sh", "-sh", NULL, env_use);
>                           }
>  diff --git a/src/shared/util.c b/src/shared/util.c
> -index cbbe3b1..a0e3cc5 100644
> +index 241e752..00adab6 100644
>  --- a/src/shared/util.c
>  +++ b/src/shared/util.c
> -@@ -4609,7 +4609,7 @@ int get_user_creds(
> +@@ -4604,7 +4604,7 @@ int get_user_creds(
>                           *gid = 0;
>
>                   if (home)
> @@ -122,7 +122,7 @@ index cbbe3b1..a0e3cc5 100644
>
>                   if (shell)
>                           *shell = "/bin/sh";
> -@@ -5611,7 +5611,7 @@ int get_home_dir(char **_h) {
> +@@ -5606,7 +5606,7 @@ int get_home_dir(char **_h) {
>           /* Hardcode home directory for root to avoid NSS */
>           u = getuid();
>           if (u == 0) {
> @@ -131,21 +131,6 @@ index cbbe3b1..a0e3cc5 100644
>                   if (!h)
>                           return -ENOMEM;
>
> -diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
> -index 5c80722..efde5f0 100644
> ---- a/units/console-shell.service.m4.in
> -+++ b/units/console-shell.service.m4.in
> -@@ -15,8 +15,8 @@ After=rc-local.service
> - Before=getty.target
> -
> - [Service]
> --Environment=HOME=/root
> --WorkingDirectory=/root
> -+Environment=HOME=@roothomedir@
> -+WorkingDirectory=@roothomedir@
> - ExecStart=-@SULOGIN@
> - ExecStopPost=-@SYSTEMCTL@ poweroff
> - Type=idle
>  diff --git a/units/emergency.service.in b/units/emergency.service.in
>  index 2695d7b..7f47b73 100644
>  --- a/units/emergency.service.in
> @@ -177,5 +162,5 @@ index de73fee..47f3593 100644
>   ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
>   ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --fail --no-block default"
>  --
> -2.1.4
> +1.9.1
>
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index 24486f1..7db2b33 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -25,11 +25,11 @@ SECTION = "base/shell"
>
>  inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
>
> -SRCREV = "a88abde72169ddc2df77df3fa5bed30725022253"
> +SRCREV = "0436d5c5f4b39ba8177437fa92f082f8ef1830fb"
>
> -PV = "219+git${SRCPV}"
> +PV = "219-stable+git${SRCPV}"
>
> -SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
> +SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stable;protocol=git \
>             file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
>             file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>             file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

