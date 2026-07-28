Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A87EC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 13:25:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11318.1785245121359530746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 06:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jA/AL5LK;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso20208315e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785245119; x=1785849919; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc+c77VetTbbXSkU8L+9suzgXpgNnkc9SJwUcil56OE=;
        b=jA/AL5LKrtkY76+QJFMQNQJaMTBPaTtamG+4WeOWw1BgySHzgdys+yHBWR63u1dVap
         xesjBN9aeF7p7ZTjcn1aKlWOWIjwjZmb1AJ4WQ+XuyPFRqqaIYbzTPPK/abZ8mDoy8sF
         F2mN7uuqSkn4e6iSD8defZ+2+f1OYuQkk0CRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245119; x=1785849919;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc+c77VetTbbXSkU8L+9suzgXpgNnkc9SJwUcil56OE=;
        b=gxssRxs8DfA897xFdlt21cfEP68X3N6uQ47QbEFifaYy62FcpymReN6HJbByXHtv0W
         tHDxarqSNYj2H3BqXMmdebdnzSltaMrKRWhtgV3YaileVMcL4yYZCbPQChNyxXzEFor3
         VZpviptWf5UuVCExN+LaIj2/lkXRyGANh9doQAncvZcyx3V3VOl4jZJr20gO0uHgzhIu
         2gPd0YYPAZcEl1mZk6kn0r4g4lSca97vN1cqr7BuUKTQkwQ0W9e0vnndz3d/ZH+ZpyYe
         kq4lEyCJst8Z9/AAHNu2rlW20KzxYOrUtt74p0//UJW80t9J1s9hrBMeoMpEo+ilYPmA
         OEFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHIzWxGTFXrk6EDLgeEYFCcDD9d3gnkCjHcW04AqohcwFRvm9JEEm9/x7DPTAeIf9hIUhs1O41+LI6uwWj+vQXyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywzu9DLBzDRZF7q40Dq4Qd52GJirmuJHQPuDoc/ab/XJh/2+SPu
	9suf75zBIVDzbzzRZ2fw66lbo9s9gv1qWLoINMXG/+2UiqvYtgiIBKp0kaDG/7CIxFI=
X-Gm-Gg: AR+sD139WWLpm8RCLU8QCP6sEgaQShEr8bY/VzNQpnUXZEwyGheByNKyju8Z8nSth0M
	9bU/+/uoQQLMiogx6RpVkRH3XSDNL0OAcFGOuOhXflsOdmuzyYDvbWiDhayYzB4tsQylGoRvG/O
	FAmD/Xy8MP6wtsPTeq1RJZ63YWaVn5FQiagzoAEaxyLm0Y91DOlpPAY1e1G5bTrPaYvLxB9U4Co
	yOO+rUA17Nfl8x9TcZtBpyAue+9rvRFeboJnwv6nWmPrkLjM7vED3n3P27hvSN5x2d+bdH9oGJD
	syK/+//TQDMALJ8S0PtNAvC/e8HJrkqUtRNEXMuElfDVXYYO2zy6LE87+AWZeU0Bs/br5XYUiwy
	rMxB4DgCVqZqlYRGH0H7GK/koqoTKtXlYPM2R7D/nMjYhwfTVJvNLwGowNIGs63Z+QDe7Ym7luW
	8KMeqocX5lp6zQE7CZA/7ivSn1TAXFWAndAzqDQ0aQS5zY0w8Rogqp/poqiwyL/g==
X-Received: by 2002:a05:600c:4703:b0:493:fa66:4861 with SMTP id 5b1f17b1804b1-496c6565dfamr29677795e9.25.1785245119142;
        Tue, 28 Jul 2026 06:25:19 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a9451sm88183655e9.1.2026.07.28.06.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 06:25:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 15:25:18 +0200
Message-Id: <DKA8KTAA7TLE.1Z2LMIDYY72W9@smile.fr>
Subject: Re: [OE-core][wrynose 11/36] rsync: Fix CVE-2026-45232
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>, "Ashishkumar Parmar"
 <asparmar@cisco.com>
X-Mailer: aerc 0.20.0
References: <cover.1785190123.git.yoann.congal@smile.fr>
 <9e76a8e19462dab7f04cfa36116ed882fa4947d9.1785190123.git.yoann.congal@smile.fr>
In-Reply-To: <9e76a8e19462dab7f04cfa36116ed882fa4947d9.1785190123.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 13:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242192

On Tue Jul 28, 2026 at 12:55 AM CEST, Yoann Congal wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> This patch applies the upstream v3.4.3 backport for
> CVE-2026-45232. The upstream fix commit is referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://github.com/RsyncProject/rsync/commit/a5fc5ebe7a8ef1aa72f6e344=
599f97fd4427ecba
> [2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-8f85-j=
2cv-59m8
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../rsync/files/CVE-2026-45232.patch          | 240 ++++++++++++++++++
>  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
>  2 files changed, 241 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-45232.patc=
h

This rsync series does not build on debian11:
|[yocon@debian11 build]$ bitbake rsync-native
|Build Configuration:
|BB_VERSION           =3D "2.18.0"
|BUILD_SYS            =3D "x86_64-linux"
|NATIVELSBSTRING      =3D "universal"
|TARGET_SYS           =3D "x86_64-poky-linux"
|MACHINE              =3D "qemux86-64"
|SDKMACHINE           =3D "x86_64"
|DISTRO               =3D "poky"
|DISTRO_VERSION       =3D "6.0.2"
|TUNE_FEATURES        =3D "m64 x86-64-v3"
|meta                 =3D "stable/wrynose-nut:d174aa123d5a3e7dab771a060b2d1=
73192e11535"
|meta-yocto-bsp
|meta-poky            =3D "stable/wrynose-nut:cc2e16655b852958a7bb0ef636e92=
86b91bcb43f"
|workspace            =3D "<unknown>:<unknown>"
|
|Sstate summary: Wanted 71 Local 64 Mirrors 0 Missed 7 Current 20 (90% matc=
h, 92% complete)
|Initialising tasks: 100% |################################################=
###########################################################################=
##########################| Time: 0:00:00
|NOTE: Executing Tasks
|ERROR: rsync-native-3.4.1-r0 do_configure: configure failed
|ERROR: rsync-native-3.4.1-r0 do_configure: Execution of '.../wrynose/bitba=
ke-builds/poky-wrynose/build/tmp/work/x86_64-linux/rsync-native/3.4.1/temp/=
run.do_configure.1808145' failed with exit code 1
|ERROR: Logfile of failure stored in: .../wrynose/bitbake-builds/poky-wryno=
se/build/tmp/work/x86_64-linux/rsync-native/3.4.1/temp/log.do_configure.180=
8145
|Log data follows:
|| DEBUG: Executing python function extend_recipe_sysroot
|| NOTE: Direct dependencies are ['.../wrynose/bitbake-builds/poky-wrynose/=
layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.5.4=
.bb:do_populate_sysroot', '.../wrynose/bitbake-builds/poky-wrynose/layers/o=
penembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_popula=
te_sysroot', 'virtual:native:.../wrynose/bitbake-builds/poky-wrynose/layers=
/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot=
', 'virtual:native:.../wrynose/bitbake-builds/poky-wrynose/layers/openembed=
ded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroo=
t', 'virtual:native:.../wrynose/bitbake-builds/poky-wrynose/layers/openembe=
dded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sys=
root', 'virtual:native:.../wrynose/bitbake-builds/poky-wrynose/layers/opene=
mbedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot', '=
virtual:native:.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-=
core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot', 'virtual=
:native:.../wrynose/bitbake-builds/poky-wrynose/layers/openembedded-core/me=
ta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot']
|| NOTE: Installed into sysroot: []
|| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', =
'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'zli=
b-native', 'autoconf-native', 'automake-native', 'gnu-config-native', 'acl-=
native', 'attr-native', 'popt-native']
|| DEBUG: Python function extend_recipe_sysroot finished
|| DEBUG: Executing shell function autotools_preconfigure
|| DEBUG: Shell function autotools_preconfigure finished
|| DEBUG: Executing python function autotools_sitefiles
|| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit=
-64', 'x86_64-linux', 'common']
|| DEBUG: Python function autotools_sitefiles finished
|| DEBUG: Executing shell function do_configure
|| NOTE: Executing ACLOCAL=3D"aclocal --aclocal-path=3D.../wrynose/bitbake-=
builds/poky-wrynose/build/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-s=
ysroot-native/usr/share/aclocal/" autoreconf -Wcross --verbose --install --=
force --exclude=3Dautopoint
|| autoreconf: export WARNINGS=3Dcross,no-obsolete
|| autoreconf: Entering directory '.'
|| autoreconf: configure.ac: not running autopoint: --exclude autopoint was=
 given
|| autoreconf: running: aclocal --aclocal-path=3D.../wrynose/bitbake-builds=
/poky-wrynose/build/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-sysroot=
-native/usr/share/aclocal/ --force
|| autoreconf: configure.ac: tracing
|| autoreconf: configure.ac: not using Libtool
|| autoreconf: configure.ac: not using Intltool
|| autoreconf: configure.ac: not using Gtkdoc
|| autoreconf: configure.ac: no need to run autopoint (confirmed)
|| autoreconf: running: .../wrynose/bitbake-builds/poky-wrynose/build/tmp/w=
ork/x86_64-linux/rsync-native/3.4.1/recipe-sysroot-native/usr/bin/autoconf =
--force
|| configure.ac:287: warning: AC_RUN_IFELSE called without default to allow=
 cross compiling
|| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is =
expanded from...
|| configure.ac:287: the top level
|| autoreconf: running: .../wrynose/bitbake-builds/poky-wrynose/build/tmp/w=
ork/x86_64-linux/rsync-native/3.4.1/recipe-sysroot-native/usr/bin/autoheade=
r --force
|| autoreconf: configure.ac: not using Automake
|| autoreconf: './config.sub' is updated
|| autoreconf: './config.guess' is updated
|| autoreconf: './install-sh' is updated
|| autoreconf: configure.ac: not running make: --make not given
|| autoreconf: Leaving directory '.'
|| NOTE: Running ./configure  --build=3Dx86_64-linux 		  --host=3Dx86_64-li=
nux 		  --target=3Dx86_64-linux 		  --prefix=3D.../wrynose/bitbake-builds/p=
oky-wrynose/build/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-sysroot-n=
ative/usr 		  --exec_prefix=3D.../wrynose/bitbake-builds/poky-wrynose/build=
/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-sysroot-native/usr 		  --b=
indir=3D.../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86_64-linux=
/rsync-native/3.4.1/recipe-sysroot-native/usr/bin 		  --sbindir=3D.../wryno=
se/bitbake-builds/poky-wrynose/build/tmp/work/x86_64-linux/rsync-native/3.4=
.1/recipe-sysroot-native/usr/sbin 		  --libexecdir=3D.../wrynose/bitbake-bu=
ilds/poky-wrynose/build/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-sys=
root-native/usr/libexec 		  --datadir=3D.../wrynose/bitbake-builds/poky-wry=
nose/build/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-sysroot-native/u=
sr/share 		  --sysconfdir=3D.../wrynose/bitbake-builds/poky-wrynose/build/t=
mp/work/x86_64-linux/rsync-native/3.4.1/recipe-sysroot-native/etc 		  --sha=
redstatedir=3D.../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86_64=
-linux/rsync-native/3.4.1/recipe-sysroot-native/com 		  --localstatedir=3D.=
../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86_64-linux/rsync-na=
tive/3.4.1/recipe-sysroot-native/var 		  --libdir=3D.../wrynose/bitbake-bui=
lds/poky-wrynose/build/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-sysr=
oot-native/usr/lib 		  --includedir=3D.../wrynose/bitbake-builds/poky-wryno=
se/build/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-sysroot-native/usr=
/include 		  --oldincludedir=3D.../wrynose/bitbake-builds/poky-wrynose/buil=
d/tmp/work/x86_64-linux/rsync-native/3.4.1/recipe-sysroot-native/usr/includ=
e 		  --infodir=3D.../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x8=
6_64-linux/rsync-native/3.4.1/recipe-sysroot-native/usr/share/info 		  --ma=
ndir=3D.../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86_64-linux/=
rsync-native/3.4.1/recipe-sysroot-native/usr/share/man 		  --disable-silent=
-rules 		  --disable-dependency-tracking --disable-md2man --with-nobody-gro=
up=3Dnogroup --without-included-zlib --disable-static  --enable-acl-support=
 --enable-xattr-support --enable-ipv6 --disable-lz4 --disable-openssl --dis=
able-xxhash --disable-zstd
|| configure: WARNING: unrecognized options: --disable-silent-rules, --disa=
ble-dependency-tracking, --disable-static
|| configure: loading site script .../wrynose/bitbake-builds/poky-wrynose/l=
ayers/openembedded-core/meta/site/endian-little
|| configure: loading site script .../wrynose/bitbake-builds/poky-wrynose/l=
ayers/openembedded-core/meta/site/common-linux
|| configure: loading site script .../wrynose/bitbake-builds/poky-wrynose/l=
ayers/openembedded-core/meta/site/common-glibc
|| configure: loading site script .../wrynose/bitbake-builds/poky-wrynose/l=
ayers/openembedded-core/meta/site/x86_64-linux
|| configure: loading site script .../wrynose/bitbake-builds/poky-wrynose/l=
ayers/openembedded-core/meta/site/common
|| checking for x86_64-linux-gcc... gcc
|| checking whether the C compiler works... no
|| configure: error: in '.../wrynose/bitbake-builds/poky-wrynose/build/tmp/=
work/x86_64-linux/rsync-native/3.4.1/sources/rsync-3.4.1':
|| configure: error: C compiler cannot create executables
|| See 'config.log' for more details
|| NOTE: The following config.log files may provide further information.
|| NOTE: .../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86_64-linu=
x/rsync-native/3.4.1/sources/rsync-3.4.1/config.log
|| ERROR: configure failed
|| WARNING: exit code 1 from a shell command.
|ERROR: Task (virtual:native:.../wrynose/bitbake-builds/poky-wrynose/layers=
/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_configure)=
 failed with exit code '1'
|NOTE: Tasks Summary: Attempted 189 tasks of which 168 didn't need to be re=
run and 1 failed.
|
|Summary: 1 task failed:
|  virtual:native:.../wrynose/bitbake-builds/poky-wrynose/layers/openembedd=
ed-core/meta/recipes-devtools/rsync/rsync_3.4.1.bb:do_configure
|    log: .../wrynose/bitbake-builds/poky-wrynose/build/tmp/work/x86_64-lin=
ux/rsync-native/3.4.1/temp/log.do_configure.1808145
|Summary: There were 2 ERROR messages, returning a non-zero exit code.

The config.log shows:
|/usr/bin/ld: unrecognized option '--no-rosegment'
|/usr/bin/ld: use the --help option for usage information
|collect2: error: ld returned 1 exit status

Ashishkumar, can you look into that?

Thanks!
--=20
Yoann Congal
Smile ECS


