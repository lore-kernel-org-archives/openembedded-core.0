Return-Path: <gary.robertson@linaro.org>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBC7605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 18:52:55 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so4692534wes.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 11:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=fp2uNBKI/ttOVFifAVbP5pHNLr+KVUFcPkd8gTXUKYE=;
	b=LmYioUL9H0vVs3pqKxTf+S3rYBpKaCkQDwizrY9JRe2JW0LZm2sVBJ6+B98sSsxRuL
	hQRMa17OKdH4vr3DC8xw5XeqRZG8TNl4HOw6kT5S9belkAmZrYMYxwJZRef0VK/cxJYG
	9uAikAx8JbXk80Zdnh4TU28wEwGf8cf/Welk3s3BTQHybvbNTwO3wW2PiBrO/ZDL85cN
	7jd0W6k7Yd6YTj7qLXwSX5xsAfzR1+P2XfWecRyo4PVgzOVWOBVJz95SgQU/Vp+r14lX
	FKhp8mO0gZ4sgC7Z4daDHYvqGxbvwDEuktUL8fPRbzf31T5n7gdWj0OpaREe0ALmuQwd
	qNcw==
X-Gm-Message-State: ALoCoQmsCur54XXmnluJIDKn1AIGj2gOzYQ4J80Xy8R+vzKzAtUTVVpd+oW4HChULorDXVnLTCDW
MIME-Version: 1.0
X-Received: by 10.194.250.103 with SMTP id zb7mr47265877wjc.52.1412016776418; 
	Mon, 29 Sep 2014 11:52:56 -0700 (PDT)
Received: by 10.27.216.149 with HTTP; Mon, 29 Sep 2014 11:52:56 -0700 (PDT)
In-Reply-To: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
References: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
Date: Mon, 29 Sep 2014 13:52:56 -0500
Message-ID: <CAF7YWnyjGRmjGr7xHnYkCzG-sMNPHanNfbFuy-3eOUuYo6XbWg@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Mike Holmes <mike.holmes@linaro.org>
Subject: Re: Autoconf problems in OE build of LTP realtime tests
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
X-List-Received-Date: Mon, 29 Sep 2014 18:52:59 -0000
Content-Type: multipart/alternative; boundary=001a11c26cca6049fa050438c647

--001a11c26cca6049fa050438c647
Content-Type: text/plain; charset=UTF-8

Thanks to Randy Witt for a patch which resolves this issue.  Randy wrote:
"I looked at the configure logs on an x86 build and saw the same problem.
By default the autotools.bbclass searches for m4 macros in the source tree.
But it searches a depth that is lower than the directory depth of the
location of testcases/realtime/m4. That seems to be causing some of the
macros to be missing and falsely causing features to be missing."

I beiieve Randy will be submitting this patch soon, and included a link in
my previous response - but evidently that link worked for nobody but myself
- so with apologies I am re-transmitting the response with the patch text
included inline below for reference:

From bce5869545cacd4923b1efcf6e1218f65ad46af7 Mon Sep 17 00:00:00 2001
From: Randy Witt <randy.e.witt@linux.intel.com>
Date: Fri, 5 Sep 2014 15:00:59 -0700
Subject: [PATCH] ltp: Add additional m4 path to autoconf.

The ltp code has some m4 macros that are deeper than the default depth
that the directory depth the autotools.bbclass checks. This causes some
macros to not be found and for supported features to not be enabled.

This patch adds the extra m4 path to the autoconf arguments.
---
 meta/recipes-extended/ltp/ltp_20140422.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb
b/meta/recipes-extended/ltp/ltp_20140422.bb
index c658bc0..0b29ea4 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -37,6 +37,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"

+EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
 EXTRA_OECONF = " --with-power-management-testsuite
--with-realtime-testsuite "

 # ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure
call.
-- 
1.9.3


On Fri, Sep 5, 2014 at 3:36 PM, Gary Robertson <gary.robertson@linaro.org>
wrote:

> Dear OE developers,
>
> Linaro Networking Group is building root filesystem images containing  the
> LTP test suite, using the current recipe at
> openembedded-core/meta/recipes-extended/ltp/ltp_20140422.bb.  This build
> uses autoconf to probe mutex feature support for protocol specification,
> priority inheritance, and robust mutexes.  The macros used for this can be
> found in ltp/testcases/realtime/m4/check.m4 from the LTP git repository.
>
> We are cross-building for the armv7a architecture using the machine
> definition found in
> meta-linaro/meta-linaro/conf/machine/genericarmv7a.conf.  The development
> host platform is an Ubuntu 12.04 x86_64 platform with all software kept
> regularly updated from the Ubuntu repositories.
>
> The macros in check.m4 use the AC_TRY_COMPILE function macro to attempt
> compilation of POSIX function calls utilizing the features being probed -
> such that if the compilation fails the features are deemed to be
> unsupported... and if compilation succeeds the features are deemed
> supported.
>
> Native compilation of the same code used in the probes, and execution of
> the resulting program - shows support for all the probed mutex features on
> both the development host as well as the armv7a target platform... that is
> when this probe code is built on either the host or target machine and then
> executed in that environment... so support is there in both environments.
>
> Despite the presence of this support the AC_TRY_COMPILE macro is
> indicating a lack of support for the probed features during the cross-build
> process.
>
> I am not personally familiar with the detailed function of the autoconf
> macros, and I can find no documentation about how OE interacts with those
> macros in order to coerce them into configuring for the target machine in a
> cross-build environment... so I am hoping the autoconf experts at OE can
> shed some light on this and at least provide some clues as to where to look
> for the problem and possible resolution.  Any insight you can provide in
> this matter would be appreciated.
>
> Gary Robertson
>
> Real-time engineer, Linaro Networking Group
>
>

--001a11c26cca6049fa050438c647
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks to Randy Witt for a patch which resolves this =
issue.=C2=A0 Randy=20
wrote: &quot;I looked at the configure logs on an x86 build and saw the sam=
e=20
problem.
 By default the autotools.bbclass searches for m4 macros in the source=20
tree. But it searches a depth that is lower than the directory depth of=20
the location of testcases/realtime/m4. That seems to be causing some of=20
the macros to be missing and falsely causing features to be missing.&quot; =
<br><br></div>I beiieve Randy will be submitting this patch soon, and inclu=
ded a link in my previous response - but evidently that link worked for nob=
ody but myself - so with apologies I am re-transmitting the response with t=
he patch text included inline below for reference:<br><br>From bce5869545ca=
cd4923b1efcf6e1218f65ad46af7 Mon Sep 17 00:00:00 2001<br>From: Randy Witt &=
lt;<a href=3D"mailto:randy.e.witt@linux.intel.com">randy.e.witt@linux.intel=
.com</a>&gt;<br>Date: Fri, 5 Sep 2014 15:00:59 -0700<br>Subject: [PATCH] lt=
p: Add additional m4 path to autoconf.<br><br>The ltp code has some m4 macr=
os that are deeper than the default depth<br>that the directory depth the a=
utotools.bbclass checks. This causes some<br>macros to not be found and for=
 supported features to not be enabled.<br><br>This patch adds the extra m4 =
path to the autoconf arguments.<br>---<br>=C2=A0meta/recipes-extended/ltp/<=
a href=3D"http://ltp_20140422.bb">ltp_20140422.bb</a> | 1 +<br>=C2=A01 file=
 changed, 1 insertion(+)<br><br>diff --git a/meta/recipes-extended/ltp/<a h=
ref=3D"http://ltp_20140422.bb">ltp_20140422.bb</a> b/meta/recipes-extended/=
ltp/<a href=3D"http://ltp_20140422.bb">ltp_20140422.bb</a><br>index c658bc0=
..0b29ea4 100644<br>--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_2=
0140422.bb">ltp_20140422.bb</a><br>+++ b/meta/recipes-extended/ltp/<a href=
=3D"http://ltp_20140422.bb">ltp_20140422.bb</a><br>@@ -37,6 +37,7 @@ TARGET=
_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>=C2=A0export prefix =3D &quot;/opt/=
ltp&quot;<br>=C2=A0export exec_prefix =3D &quot;/opt/ltp&quot;<br>=C2=A0<br=
>+EXTRA_AUTORECONF +=3D &quot;-I ${S}/testcases/realtime/m4&quot;<br>=C2=A0=
EXTRA_OECONF =3D &quot; --with-power-management-testsuite --with-realtime-t=
estsuite &quot;<br>=C2=A0<br>=C2=A0# ltp doesn&#39;t regenerate ffsb-6.0-rc=
2 configure and hardcode configure call.<br>-- <br>1.9.3<br><br></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Sep 5, 2014 at=
 3:36 PM, Gary Robertson <span dir=3D"ltr">&lt;<a href=3D"mailto:gary.rober=
tson@linaro.org" target=3D"_blank">gary.robertson@linaro.org</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div><=
div><div>Dear OE developers,<br></div><div><br></div>Linaro Networking Grou=
p is building root filesystem images containing=C2=A0 the LTP test suite, u=
sing the current recipe at openembedded-core/meta/recipes-extended/ltp/<a h=
ref=3D"http://ltp_20140422.bb" target=3D"_blank">ltp_20140422.bb</a>.=C2=A0=
 This build uses autoconf to probe mutex feature support for protocol speci=
fication, priority inheritance, and robust mutexes.=C2=A0 The macros used f=
or this can be found in ltp/testcases/realtime/m4/check.m4 from the LTP git=
 repository.<br><br></div>We are cross-building for the armv7a architecture=
 using the machine definition found in meta-linaro/meta-linaro/conf/machine=
/genericarmv7a.conf.=C2=A0 The development host platform is an Ubuntu 12.04=
 x86_64 platform with all software kept regularly updated from the Ubuntu r=
epositories.<br><br></div>The macros in check.m4 use the AC_TRY_COMPILE fun=
ction macro to attempt compilation of POSIX function calls utilizing the fe=
atures being probed - such that if the compilation fails the features are d=
eemed to be unsupported... and if compilation succeeds the features are dee=
med supported.<br><br></div>Native compilation of the same code used in the=
 probes, and execution of the resulting program - shows support for all the=
 probed mutex features on both the development host as well as the armv7a t=
arget platform... that is when this probe code is built on either the host =
or target machine and then executed in that environment... so support is th=
ere in both environments.<br><br></div>Despite the presence of this support=
 the AC_TRY_COMPILE macro is indicating a lack of support for the probed fe=
atures during the cross-build process.<br><br>I am not personally familiar =
with the detailed function of the autoconf macros, and I can find no docume=
ntation about how OE interacts with those macros in order to coerce them in=
to configuring for the target machine in a cross-build environment... so I =
am hoping the autoconf experts at OE can shed some light on this and at lea=
st provide some clues as to where to look for the problem and possible reso=
lution.=C2=A0 Any insight you can provide in this matter would be appreciat=
ed.<br><div><div><div><br></div><div>Gary Robertson<br><br></div><div>Real-=
time engineer, Linaro Networking Group<br></div><div><br></div></div></div>=
</div>
</blockquote></div><br></div>

--001a11c26cca6049fa050438c647--
