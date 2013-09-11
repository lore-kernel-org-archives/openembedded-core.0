Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 70D6C6BF57
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:29:39 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so6682716wes.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 03:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=dFTAYD22zCGSRTtS33QEFwYhbr17Vwb+1eQQDTYWLpg=;
	b=Qk8KD6nfFH9yBOZuQbMqnqzbHDl3epjtfNp2yDjT3+E+v+voo9YRxz87gzHRBP9ZGT
	warqr4vlbKVsBwk+Xubpg7FyuinRWLUU0uSQ07mJyrSalh/5pzhWBmOjBgGqjmhyxy2j
	CfU8/DHJCL9BvNxbw7E/z5pNKelWCabiX/PCdXj5yUvrmQVTCRuaVNb9VQPgvpTcipxm
	AiB8lg3EV975EwCL+flzn9kWXPtTJ/r6qslXtGrrF//hZ24zt64Hvp4cplfWt0KQX4Ja
	gZaBttnu1mJ3axlwBn6Us+J1NnQth+HUw/zn4KF/yA1N6j4YsHHYSPbnPvDGLuwIsYPx
	zJ2A==
X-Gm-Message-State: ALoCoQnxqet+UqiHRQVYFtiMMiQxsqUc2WKs69dvIv/jKxIHJ3ApV7gqD8iFZEkBEcZ77C9mIPTm
X-Received: by 10.194.94.101 with SMTP id db5mr344532wjb.67.1378895380611;
	Wed, 11 Sep 2013 03:29:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.218.200 with HTTP; Wed, 11 Sep 2013 03:29:20 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 11 Sep 2013 12:29:20 +0200
Message-ID: <CAP71Wjynkd=CGry-YKvEetsuGvoXmhwhVAF1rXuOuo-nh7V2CQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Linaro Dev <linaro-dev@lists.linaro.org>
Subject: OE gcc-cross with builtin sysroot, BUG?
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
X-List-Received-Date: Wed, 11 Sep 2013 10:29:40 -0000
Content-Type: multipart/alternative; boundary=047d7beb93b4581a4404e61919a8

--047d7beb93b4581a4404e61919a8
Content-Type: text/plain; charset=ISO-8859-1

hi there,

first of all, we are building dylan branch with oe-core +
meta-linaro-toolchain, not using external toolchain, hence the cross post
on OE and linaro lists.

we've been debugging some nasty build issues over the last few days on our
Jenkins server. and i'd like to bring our findings up to the list... i
suspect there could be a bug in OE gcc-cross, but i'd like to hear from you
about that.

our bug appeared because we were 'wrongly' unsetting the CFLAGS from OE in
one of our recipe, so we would loose the following from our compilation
command line

-march=armv7-a
-marm
-mthumb-interwork
-mfloat-abi=hard
-mfpu=neon
--sysroot=/work/rdk/build-genericarmv7a/tmp/sysroots/genericarmv7a

The compilation error was that stdlib.h was not found.

as a matter of fact, we build for several different machines (.conf file),
*but* we share the same sstate and downloads for all machines. We don't do
parallel builds, each machine is built sequentially in its own build folder
(.../workspace/machines/<MACHINE>/build), and all build folder are deleted
before each build (of course sstate and downloads aren't deleted).

What we noticed is that we end up pulling the compiler (gcc-cross) from
sstate as expected. However we pull the same 'blob' from sstate for
gcc-cross for *all* machines we build. It does seem that the compiler does
not use $MACHINE for the sstate checksum.

When the gcc-cross package was built and pushed in sstate, it was being
built for a specific machine (let's say MACHINE-A), hence the compiler has
the 'builtin' sysroot set to 'tmp/sysroots/MACHINE-A'.

Now when building our image for MACHINE-B, we pull gcc-cross from sstate,
and we get the default builtin sysroot for MACHINE-A!! That's why our build
failed, because we tried to build MACHINE-B before MACHINE-A, so stdlib.h
wasn't there yet on Jenkins..

To me the problem is that gcc-cross 'embedds' some $MACHINE data in its
package, but it is not marked as 'machine specific, but arch specific.  So
several machines will end up sharing the same gcc-cross package.

So, of course we shouldn't ignore the CFLAGS from OE, and the CFLAGS would
set the right sysroot, and of course we fixed our software so that we don't
ignore CFLAGS anymore... but that still looks like a bug to me.


cheers

nico

--047d7beb93b4581a4404e61919a8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi there,<div><br></div><div>first of all, we are building=
 dylan branch with oe-core + meta-linaro-toolchain, not using external tool=
chain, hence the cross post on OE and linaro lists.</div><div><br></div><di=
v>

we&#39;ve been debugging some nasty build issues over the last few days on =
our Jenkins server. and i&#39;d like to bring our findings up to the list..=
. i suspect there could be a bug in OE gcc-cross, but i&#39;d like to hear =
from you about that.</div>

<div><br></div><div>our bug appeared because we were &#39;wrongly&#39; unse=
tting the CFLAGS from OE in one of our recipe, so we would loose the follow=
ing from our compilation command line</div><div><br></div><div><div>-march=
=3Darmv7-a</div>

<div>-marm</div><div>-mthumb-interwork</div><div>-mfloat-abi=3Dhard</div><d=
iv>-mfpu=3Dneon</div><div>--sysroot=3D/work/rdk/build-genericarmv7a/tmp/sys=
roots/genericarmv7a</div></div><div><br></div><div>The compilation error wa=
s that stdlib.h was not found.=A0</div>

<div><br></div><div>as a matter of fact, we build for several different mac=
hines (.conf file), *but* we share the same sstate and downloads for all ma=
chines. We don&#39;t do parallel builds, each machine is built sequentially=
 in its own build folder (.../workspace/machines/&lt;MACHINE&gt;/build), an=
d all build folder are deleted before each build (of course sstate and down=
loads aren&#39;t deleted).</div>

<div><br></div><div>What we noticed is that we end up pulling the compiler =
(gcc-cross) from sstate as expected. However we pull the same &#39;blob&#39=
; from sstate for gcc-cross for *all* machines we build. It does seem that =
the compiler does not use $MACHINE for the sstate checksum.=A0</div>

<div><br></div><div>When the gcc-cross package was built and pushed in ssta=
te, it was being built for a specific machine (let&#39;s say MACHINE-A), he=
nce the compiler has the &#39;builtin&#39; sysroot set to &#39;tmp/sysroots=
/MACHINE-A&#39;.=A0</div>

<div><br></div><div>Now when building our image for MACHINE-B, we pull gcc-=
cross from sstate, and we get the default builtin sysroot for MACHINE-A!! T=
hat&#39;s why our build failed, because we tried to build MACHINE-B before =
MACHINE-A, so stdlib.h wasn&#39;t there yet on Jenkins..</div>

<div><br></div><div>To me the problem is that gcc-cross &#39;embedds&#39; s=
ome $MACHINE data in its package, but it is not marked as &#39;machine spec=
ific, but arch specific. =A0So several machines will end up sharing the sam=
e gcc-cross package.</div>

<div><br></div><div>So, of course we shouldn&#39;t ignore the CFLAGS from O=
E, and the CFLAGS would set the right sysroot, and of course we fixed our s=
oftware so that we don&#39;t ignore CFLAGS anymore... but that still looks =
like a bug to me.</div>

<div><br></div><div><br></div><div>cheers</div><div><br></div><div>nico</di=
v></div>

--047d7beb93b4581a4404e61919a8--
