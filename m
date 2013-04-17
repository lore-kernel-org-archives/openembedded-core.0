Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1USH06-000359-9a
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 03:17:39 +0200
Received: by mail-pa0-f51.google.com with SMTP id jh10so623987pab.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 17:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=C8jrdpwIYxrb2sl3YtRoC0JK9lQ55GOIadAf24fIyqY=;
	b=ZamfqDsHNGYQdmZwY9wHzEP9upW0CmdxvXCC4IuMt4nOX8+CPYCoPdOZKYyTgDdAx9
	svhOHi52Hmen80I/d74BfW6ltdq6Yr4dZApMZyY6+/k0uYHI8PoMKZYSXjfYRmpcvV03
	PhoEIkHGaZFH5ifAHyvkqFwo/U2UUZOy5jDM8GOOq9oTKjcHtAVeimrLcnZqcMBKVSlw
	Rqx5hBEO07o/12VhoDj2FHS0afV0gA7LUuWdNp6lqrCLbrtFOBCbNlgsMg5TwI1Uf2EV
	1yHbli0fSWSjj0+xUYpTVeFTFNq4R7XvSNJljfgiPDtkvmyxEpaCtEkX2FbA5FQfpvkB
	w+Og==
X-Received: by 10.67.2.68 with SMTP id bm4mr6208551pad.9.1366160393453;
	Tue, 16 Apr 2013 17:59:53 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id fc8sm4692491pad.21.2013.04.16.17.59.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 17:59:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1366147707.8670.110.camel@ted>
Date: Tue, 16 Apr 2013 17:59:53 -0700
Message-Id: <72299C10-2B6D-4295-80B1-C509C186B326@gmail.com>
References: <1366115411-15270-1-git-send-email-Martin.Jansa@gmail.com>
	<1366147707.8670.110.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: use AC_CHECK_TOOL instead of AC_PATH_TOOL when checking objcopy, strings, gperf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 01:17:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 16, 2013, at 2:28 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2013-04-16 at 14:30 +0200, Martin Jansa wrote:
>> * with external toolchain I have different HOST_PREFIX and HOST_SYS
>>  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
>>  then it tries objcopy without prefix which is found on host, but
>>  that objcopy does not work for arm libs
>> * with internal toolchain gperf is not prefixed with HOST_PREFIX, but
>>  fallback to "gperf" only finds the one in native sysroot first
>> * based on =
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/037985.h=
tml
>>  Khem suggested to export strings and gperf from bitbake.conf instead
>>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> meta/conf/bitbake.conf                             |  2 ++
>> ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | 41 =
++++++++++++++++++++++
>> meta/recipes-core/systemd/systemd_199.bb           |  1 +
>> 3 files changed, 44 insertions(+)
>> create mode 100644 =
meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-obj=
copy-strings-and-.patch
>>=20
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index cd5d61e..a84ae38 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -455,6 +455,8 @@ export RANLIB =3D "${HOST_PREFIX}ranlib"
>> export STRIP =3D "${HOST_PREFIX}strip"
>> export OBJCOPY =3D "${HOST_PREFIX}objcopy"
>> export OBJDUMP =3D "${HOST_PREFIX}objdump"
>> +export STRINGS =3D "${HOST_PREFIX}strings"
>> +export GPERF =3D "${HOST_PREFIX}gperf"
>> export NM =3D "${HOST_PREFIX}nm"
>> PYTHON =3D "${@sys.executable}"
>=20
> At this point in the release cycle I'm not adding new global exports =
to
> ever piece of software in the system. I appreciate in theory nothing =
bad
> should happen however the reality is sometimes different :/. I'm =
taking
> a *lot* of risks in including as many changes as I have, I don't want =
to
> add this one too.
>=20
> I'm also not sure its a good idea in general to build up more exports =
in
> bitbake.conf if we haven't yet needed them.
>=20

We can not be certain we did not need them autoconfed packages will =
default to one on host
so it might be that many recipes have been wrongly using non-cross =
version of tools and succeeding
the build. Problem is there in though.=20

I think on master this patch should be considered as such

> I'll take a version of this which does this in the systemd recipe.

For dylan this seems ok

>=20
> Cheers,
>=20
> Richard
>=20
>> diff --git =
a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-o=
bjcopy-strings-and-.patch =
b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-o=
bjcopy-strings-and-.patch
>> new file mode 100644
>> index 0000000..d847bbc
>> --- /dev/null
>> +++ =
b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-o=
bjcopy-strings-and-.patch
>> @@ -0,0 +1,41 @@
>> +=46rom d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 =
2001
>> +From: Martin Jansa <Martin.Jansa@gmail.com>
>> +Date: Tue, 16 Apr 2013 14:20:41 +0200
>> +Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings =
and gperf
>> +
>> +* using AC_PATH_TOOL does not allow to override it from shell =
environment
>> +  which is useful when cross-compiling
>> +* with external toolchain I have different HOST_PREFIX and HOST_SYS
>> +  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
>> +  which is available only as ${TARGET_PREFIX}objcopy then it tries
>> +  objcopy without prefix which is found on host, but that objcopy
>> +  does not work for !host (e.g. arm when building on x86) libs
>> +
>> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> +Upstream-Status: Submitted
>> =
+http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468.htm=
l
>> +
>> +---
>> + configure.ac | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 33b0ca9..519f1a9 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
>> +    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
>> +    enable_introspection=3Dno])
>> +=20
>> +-AC_PATH_TOOL(OBJCOPY, objcopy)
>> +-AC_PATH_TOOL(STRINGS, strings)
>> +-AC_PATH_TOOL(GPERF, gperf)
>> ++AC_CHECK_TOOL(OBJCOPY, objcopy)
>> ++AC_CHECK_TOOL(STRINGS, strings)
>> ++AC_CHECK_TOOL(GPERF, gperf)
>> + if test -z "$GPERF" ; then
>> +         AC_MSG_ERROR([*** gperf not found])
>> + fi
>> +--=20
>> +1.8.1.5
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_199.bb =
b/meta/recipes-core/systemd/systemd_199.bb
>> index d22df12..e8ad8f5 100644
>> --- a/meta/recipes-core/systemd/systemd_199.bb
>> +++ b/meta/recipes-core/systemd/systemd_199.bb
>> @@ -27,6 +27,7 @@ SRC_URI =3D =
"http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>>            file://0002-readahead-chunk-on-spinning-media.patch \
>>            file://0003-readahead-cleanups.patch \
>>            =
file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch \
>> +           =
file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch \
>>            file://199-firmware.patch \
>>            file://init \
>>           "
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



