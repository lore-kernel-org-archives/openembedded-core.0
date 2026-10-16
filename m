Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACA7CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:15:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21338.1792156494407029638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 06:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BJYXq+be;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 853C81A1255;
	Fri, 16 Oct 2026 13:14:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59A406075D;
	Fri, 16 Oct 2026 13:14:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E326B10328719;
	Fri, 16 Oct 2026 15:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792156488; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g7PHDawCzpet42nyql/1B7iDxDAz0wsnmdblIRkVqIw=;
	b=BJYXq+be4GR1gxYMg20L7VQZiwumKWh2NNL99n3LEroin2rsdCQH5Fy/8GdRGBxTPEyPzI
	tB0YWWJ90Y6XDIBXhhXCUX10vJRLsupxqjQVW/eSRSjdYIV7wzDXDjM6zxKdx+SSwKWXpN
	tAuE5zqyNaTUCkR7q3HFp+T2ahLYfOOgxvKoQwb6t5j/mwVHkIbavOf2Td44048GF6iL0J
	wIGgHw3LgWcslz+8HhW527JC+KLYCn2zwm5ri0WkYGrJKQvEXAbQ6ThiuCWeUrXqsYOU+G
	+1Kxj2jVAd9/5FLFXXu0zsStTxzaekoRD+HKSdq5c/0JS5X9eLVnuZR1FWHs6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 15:14:46 +0200
Message-Id: <DM6AGBWU09J7.1BJCW1KEXDAOL@bootlin.com>
Subject: Re: [OE-core] [PATCH v10 2/3] dnf: Upgrade to 5.4.6.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261015142331.3639101-1-adam.duskett@amarulasolutions.com>
 <20261015142331.3639101-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20261015142331.3639101-2-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248023

On Thu Oct 15, 2026 at 4:23 PM CEST, Adam Duskett via lists.openembedded.or=
g wrote:
> Completely rewritten in C++, there are several changes needed
> to facilitate moving from DNF4 to DNF5. Below are some significant
> items to note:
>
>     - Added a negative lookahead filter for the following warning if
>       RPM_SIGN_PACKAGES !=3D '1': "Warning: skipped OpenPGP checks"
>       This warning is hard-coded and piped to stderr if gpg checks
>       are disabled. However, most users do not sign their RPM packages
>       and use dnf to simply construct the rootfs.
>
>     - The "-v/--verbose" cli option is removed. As such, remove the argum=
ent
>     everywhere it was called.[1]
>
>     - the rpmverbosity cli option is replaced with --setopt=3Drpmverbosit=
y
>
>     - Change gpgcheck to pkg_gpgcheck as this is what the documentation
>     recommends.[2]
>
>     - --nogpgcheck is now --no-gpgchecks
>
>     - --setopt=3Dprotect_running_kernel=3DFalse has to be set or else eve=
ry dnf
>     transaction complains that /boot/vmlinuz-${kernel_version} does not
>     exist in /var/log/dnf5.log. There is an open issue on github[3] to en=
able
>     the currently not-yet implemented `autocheck_running_kernel option`, =
but
>     it has been open for quite some time and the protect_running_kernel
>     option supresses the message.
>
>     - Move --skip-broken to after the install argument as the global
>       --skip-broken argument is removed.
>
>     - /var/cache/dnf is replaced with /var/cache/libdnf5
>
>     - Add `features +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'`
>           `features +=3D 'PACKAGECONFIG:append:pn-librepo =3D " sequoia"\=
n'`
>       to test_testimage_dnf as librepo currently does not work
>       with gpgme.
>
>     - Change `if line.startswith("Error in POSTIN scriptlet in rpm packag=
e"):`
>       to `if "Error in %post scriptlet:" in line:` as dnf prints `>>>`
>       charachters and the error string has changed.
>
> While DNF5 has many config options, unfortunately, the majority
> of them depends on sdbus-c++, which is not included in OE-core.
> However, the package is included in meta-openembedded, so it's
> best to include the PACKAGECONFIG options in the recipe and
> leave them off by default.
>
> 1: https://github.com/rpm-software-management/dnf5/issues/464
> 2: https://dnf5.readthedocs.io/en/latest/dnf5.conf.5.html
> 3: https://github.com/rpm-software-management/dnf5/issues/1255
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Err, I believe this is also breaking libtoml build. I'm not sure to
really get how:

ERROR: libtoml11-1_4.4.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-=
worker/qemuarm-oecore/build/build/tmp/work/cortexa15t2hf-neon-oe-linux-gnue=
abi/libtoml11/4.4.0/temp/run.do_compile.836786' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qemuarm-oe=
core/build/build/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4=
.0/temp/log.do_compile.836786
...
| FAILED: [code=3D1] tests/CMakeFiles/test_value.dir/test_value.cpp.o
| /srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/cortexa15=
t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/recipe-sysroot-native/usr/bin/ar=
m-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ --sysroot=3D/srv/pokybuild/yoct=
o-worker/qemuarm-oecore/build/build/tmp/work/cortexa15t2hf-neon-oe-linux-gn=
ueabi/libtoml11/4.4.0/recipe-sysroot -DTOML11_COMPILE_SOURCES -I/srv/pokybu=
ild/yocto-worker/qemuarm-oecore/build/build/tmp/work/cortexa15t2hf-neon-oe-=
linux-gnueabi/libtoml11/4.4.0/sources/libtoml11-4.4.0/tests/extlib/doctest/=
doctest -I/srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/c=
ortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/libtoml11-4.4.0/=
include -mthumb -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a15 -D_TIME_=
BITS=3D64 -D_FILE_OFFSET_BITS=3D64 -fstack-protector-strong  -O2 -D_FORTIFY=
_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroot=
=3D/srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/cortexa1=
5t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/recipe-sysroot  -O2 -g -fcanon-=
prefix-map  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/qemuarm-oecore/=
build/build/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/so=
urces/libtoml11-4.4.0=3D/usr/src/debug/libtoml11/4.4.0  -ffile-prefix-map=
=3D/srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/cortexa1=
5t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/build=3D/usr/src/debug/libtoml1=
1/4.4.0  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/qemuarm-oecore/bui=
ld/build/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/recip=
e-sysroot=3D  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/qemuarm-oecor=
e/build/build/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/=
recipe-sysroot-native=3D  -pipe -fvisibility-inlines-hidden -std=3Dc++11 -W=
all -Wextra -Wpedantic -Werror -Wsign-conversion -Wconversion -Wduplicated-=
cond -Wduplicated-branches -Wlogical-op -Wdouble-promotion -Wundef -Wshadow=
 -MD -MT tests/CMakeFiles/test_value.dir/test_value.cpp.o -MF tests/CMakeFi=
les/test_value.dir/test_value.cpp.o.d -o tests/CMakeFiles/test_value.dir/te=
st_value.cpp.o -c /srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tm=
p/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/libtoml1=
1-4.4.0/tests/test_value.cpp
| In file included from /srv/pokybuild/yocto-worker/qemuarm-oecore/build/bu=
ild/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/li=
btoml11-4.4.0/include/toml11/types.hpp:9,
|                  from /srv/pokybuild/yocto-worker/qemuarm-oecore/build/bu=
ild/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/li=
btoml11-4.4.0/include/toml11/skip.hpp:8,
|                  from /srv/pokybuild/yocto-worker/qemuarm-oecore/build/bu=
ild/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/li=
btoml11-4.4.0/include/toml11/parser.hpp:10,
|                  from /srv/pokybuild/yocto-worker/qemuarm-oecore/build/bu=
ild/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/li=
btoml11-4.4.0/tests/utility.hpp:6,
|                  from /srv/pokybuild/yocto-worker/qemuarm-oecore/build/bu=
ild/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/li=
btoml11-4.4.0/tests/test_value.cpp:4:
| In member function 'toml::basic_value<TypeConcig>& toml::basic_value<Type=
Concig>::operator=3D(const std::chrono::duration<_Rep, _Period>&) [with Rep=
 =3D long long int; Period =3D std::ratio<3600>; TypeConfig =3D toml::type_=
config]',
|     inlined from 'void test_ctors(T, U, FMT) [with toml::value_t TYPE =3D=
 toml::value_t::local_time; T =3D std::chrono::duration<long long int, std:=
:ratio<3600> >; U =3D std::chrono::duration<long long int>; FMT =3D toml::l=
ocal_time_format_info]' at /srv/pokybuild/yocto-worker/qemuarm-oecore/build=
/build/tmp/work/cortexa15t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources=
/libtoml11-4.4.0/tests/test_value.cpp:303:33:
| /srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/cortexa15=
t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/libtoml11-4.4.0/include/=
toml11/value.hpp:905:13: error: '((unsigned char*)((char*)&x_assign_differe=
nt_type + offsetof(toml::value, toml::basic_value<toml::type_config>::<unna=
med>)))[12]' may be used uninitialized [-Werror=3Dmaybe-uninitialized]
|   905 |             fmt =3D this->as_local_time_fmt();
|       |             ^~~
| /srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/cortexa15=
t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/libtoml11-4.4.0/tests/te=
st_value.cpp: In function 'void test_ctors(T, U, FMT) [with toml::value_t T=
YPE =3D toml::value_t::local_time; T =3D std::chrono::duration<long long in=
t, std::ratio<3600> >; U =3D std::chrono::duration<long long int>; FMT =3D =
toml::local_time_format_info]':
| /srv/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp/work/cortexa15=
t2hf-neon-oe-linux-gnueabi/libtoml11/4.4.0/sources/libtoml11-4.4.0/tests/te=
st_value.cpp:302:21: note: 'x_assign_different_type' declared here
|   302 |         toml::value x_assign_different_type(true);
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/4814
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/4874

I only saw that on arm 32 bits right now.

Can you have a look at it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


