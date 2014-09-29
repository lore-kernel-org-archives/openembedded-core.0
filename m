Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id B730F6017E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 11:07:21 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so716210wib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 04:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=05mNhIAURKXUlykEiXBvJW+3tho2pUnX4t9pw2+vJpU=;
	b=c/aj9aMKSFO1eyVhGqJ0pxl+3MRc5ARCWZyzIdHk1ips1k78HrkuI9+njjNxU2ydkI
	xWNfxl/Haqbp514iLt8hyWh95mkY2KINkHQu6ODXBMPfzsEfJgt5g1fTDSuGLSaVmyKW
	PKGQH9Nv0np4++Oa9U2msDlsQC+l3CNSYImzyR0Xx1sWICdFJDcusxNJrWWkpqq9/WIo
	zs/Q8wSupHl6K1TzsJNBPQZ/CB7bUfSv7bt+bJ0uiegax2aSB8hUAL5xuiJSloJ8KYvy
	K2OdGCzCGB+1wVDQ/BLxlRi/B3IUGtAuNrpNbOrP7wx44dfP+sSTX3jV/Ll2n85Y8vJx
	AxZQ==
X-Gm-Message-State: ALoCoQl6crWNY0RQ6w+CGSSfbJRsAWmPG+Ota4bgcZUsDGCT9QE2lRu8wDSIMW+9zWVrQxzRCaRG
MIME-Version: 1.0
X-Received: by 10.180.86.195 with SMTP id r3mr64918465wiz.8.1411988842333;
	Mon, 29 Sep 2014 04:07:22 -0700 (PDT)
Received: by 10.27.216.149 with HTTP; Mon, 29 Sep 2014 04:07:22 -0700 (PDT)
In-Reply-To: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
References: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
Date: Mon, 29 Sep 2014 06:07:22 -0500
Message-ID: <CAF7YWnxcr+ZzbJ9bebACTrizRt=uRYtCHTX7S1fDF86ZzYkR8Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Sep 2014 11:07:24 -0000
Content-Type: multipart/alternative; boundary=f46d044286d85ffd0e05043245ac

--f46d044286d85ffd0e05043245ac
Content-Type: text/plain; charset=UTF-8

Thanks to Randy Witt for a patch which resolves this issue.  Randy wrote:
"I looked at the configure logs on an x86 build and saw the same problem.
By default the autotools.bbclass searches for m4 macros in the source tree.
But it searches a depth that is lower than the directory depth of the
location of testcases/realtime/m4. That seems to be causing some of the
macros to be missing and falsely causing features to be missing."  I
believe he will be submitting the patch soon, but am including a link below
for reference:

0001-ltp-Add-additional-m4-path-to-autoconf.patch
<https://mail.google.com/mail/u/0/?ui=2&ik=670054f0eb&view=att&th=14847f46218cf453&attid=0.1&disp=safe&zw>

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

--f46d044286d85ffd0e05043245ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks to Randy Witt for a patch which resolves this issue=
.=C2=A0 Randy wrote: &quot;I looked at the configure logs on an x86 build a=
nd saw the same problem.
 By default the autotools.bbclass searches for m4 macros in the source=20
tree. But it searches a depth that is lower than the directory depth of=20
the location of testcases/realtime/m4. That seems to be causing some of=20
the macros to be missing and falsely causing features to be missing.&quot;=
=C2=A0 I believe he will be submitting the patch soon, but am including a l=
ink below for reference:<br><br><a href=3D"https://mail.google.com/mail/u/0=
/?ui=3D2&amp;ik=3D670054f0eb&amp;view=3Datt&amp;th=3D14847f46218cf453&amp;a=
ttid=3D0.1&amp;disp=3Dsafe&amp;zw">0001-ltp-Add-additional-m4-path-to-autoc=
onf.patch</a><br>
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Sep=
 5, 2014 at 3:36 PM, Gary Robertson <span dir=3D"ltr">&lt;<a href=3D"mailto=
:gary.robertson@linaro.org" target=3D"_blank">gary.robertson@linaro.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>=
<div><div><div><div>Dear OE developers,<br></div><div><br></div>Linaro Netw=
orking Group is building root filesystem images containing=C2=A0 the LTP te=
st suite, using the current recipe at openembedded-core/meta/recipes-extend=
ed/ltp/<a href=3D"http://ltp_20140422.bb" target=3D"_blank">ltp_20140422.bb=
</a>.=C2=A0 This build uses autoconf to probe mutex feature support for pro=
tocol specification, priority inheritance, and robust mutexes.=C2=A0 The ma=
cros used for this can be found in ltp/testcases/realtime/m4/check.m4 from =
the LTP git repository.<br><br></div>We are cross-building for the armv7a a=
rchitecture using the machine definition found in meta-linaro/meta-linaro/c=
onf/machine/genericarmv7a.conf.=C2=A0 The development host platform is an U=
buntu 12.04 x86_64 platform with all software kept regularly updated from t=
he Ubuntu repositories.<br><br></div>The macros in check.m4 use the AC_TRY_=
COMPILE function macro to attempt compilation of POSIX function calls utili=
zing the features being probed - such that if the compilation fails the fea=
tures are deemed to be unsupported... and if compilation succeeds the featu=
res are deemed supported.<br><br></div>Native compilation of the same code =
used in the probes, and execution of the resulting program - shows support =
for all the probed mutex features on both the development host as well as t=
he armv7a target platform... that is when this probe code is built on eithe=
r the host or target machine and then executed in that environment... so su=
pport is there in both environments.<br><br></div>Despite the presence of t=
his support the AC_TRY_COMPILE macro is indicating a lack of support for th=
e probed features during the cross-build process.<br><br>I am not personall=
y familiar with the detailed function of the autoconf macros, and I can fin=
d no documentation about how OE interacts with those macros in order to coe=
rce them into configuring for the target machine in a cross-build environme=
nt... so I am hoping the autoconf experts at OE can shed some light on this=
 and at least provide some clues as to where to look for the problem and po=
ssible resolution.=C2=A0 Any insight you can provide in this matter would b=
e appreciated.<br><div><div><div><br></div><div>Gary Robertson<br><br></div=
><div>Real-time engineer, Linaro Networking Group<br></div><div><br></div><=
/div></div></div>
</blockquote></div><br></div>

--f46d044286d85ffd0e05043245ac--
