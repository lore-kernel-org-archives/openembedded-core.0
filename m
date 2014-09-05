Return-Path: <gary.robertson@linaro.org>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id CD898713DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 20:36:09 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so12387474wes.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 13:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=mlD3b0WV318FTvnkzvNH4JVjX847XPfV9IS5w/h42UA=;
	b=kg5a3VSI05638cMLaFxPZOMfAXwKu01fpqNsHTQYr4FOCRgCst2xjxoZlM2GNj93F3
	MLkUwcorH+PmidCfR0ooNDT0Fyz6yjPIAQRc52CIr4txRaUmHmLKFRUDHObzXLX9x58z
	oF78GIT+Rsio8O2C7KHfbQ/lX+5RFVNQnLNqlswncPkqlKChBRhVNeAK1Pvm3z1UxjSK
	tDraoLtiIv+k3yXWin5dKrouk39FHqtQO7cFo5Gzu6NGOyQBcZIDD/SYsW2766+fwgxf
	2n0DyBm3i3aBvoufBErLLmfAnHVP+nda4yXfOqotwMPf0ojBxaTEmE1R174JmZDo5YLA
	RSQA==
X-Gm-Message-State: ALoCoQn38qTxAUYrYhxkmGRD9c3rMraVi3j+Tl3QfAytLeMkZ/JBO+Ic+X9YVImMyfOzIoqKc37t
MIME-Version: 1.0
X-Received: by 10.194.203.73 with SMTP id ko9mr17380895wjc.101.1409949370425; 
	Fri, 05 Sep 2014 13:36:10 -0700 (PDT)
Received: by 10.217.130.200 with HTTP; Fri, 5 Sep 2014 13:36:10 -0700 (PDT)
Date: Fri, 5 Sep 2014 15:36:10 -0500
Message-ID: <CAF7YWnxMgNYAFH9=TFJvxwumF36KH=nDnZPPUKn3iazOwh1wJA@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Mike Holmes <mike.holmes@linaro.org>
Subject: Autoconf problems in OE build of LTP realtime tests
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
X-List-Received-Date: Fri, 05 Sep 2014 20:36:16 -0000
Content-Type: multipart/alternative; boundary=047d7b5dbafc60419e0502576b9e

--047d7b5dbafc60419e0502576b9e
Content-Type: text/plain; charset=UTF-8

Dear OE developers,

Linaro Networking Group is building root filesystem images containing  the
LTP test suite, using the current recipe at
openembedded-core/meta/recipes-extended/ltp/ltp_20140422.bb.  This build
uses autoconf to probe mutex feature support for protocol specification,
priority inheritance, and robust mutexes.  The macros used for this can be
found in ltp/testcases/realtime/m4/check.m4 from the LTP git repository.

We are cross-building for the armv7a architecture using the machine
definition found in
meta-linaro/meta-linaro/conf/machine/genericarmv7a.conf.  The development
host platform is an Ubuntu 12.04 x86_64 platform with all software kept
regularly updated from the Ubuntu repositories.

The macros in check.m4 use the AC_TRY_COMPILE function macro to attempt
compilation of POSIX function calls utilizing the features being probed -
such that if the compilation fails the features are deemed to be
unsupported... and if compilation succeeds the features are deemed
supported.

Native compilation of the same code used in the probes, and execution of
the resulting program - shows support for all the probed mutex features on
both the development host as well as the armv7a target platform... that is
when this probe code is built on either the host or target machine and then
executed in that environment... so support is there in both environments.

Despite the presence of this support the AC_TRY_COMPILE macro is indicating
a lack of support for the probed features during the cross-build process.

I am not personally familiar with the detailed function of the autoconf
macros, and I can find no documentation about how OE interacts with those
macros in order to coerce them into configuring for the target machine in a
cross-build environment... so I am hoping the autoconf experts at OE can
shed some light on this and at least provide some clues as to where to look
for the problem and possible resolution.  Any insight you can provide in
this matter would be appreciated.

Gary Robertson

Real-time engineer, Linaro Networking Group

--047d7b5dbafc60419e0502576b9e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Dear OE developers,<br></div><div=
><br></div>Linaro Networking Group is building root filesystem images conta=
ining=C2=A0 the LTP test suite, using the current recipe at openembedded-co=
re/meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb">ltp_2014042=
2.bb</a>.=C2=A0 This build uses autoconf to probe mutex feature support for=
 protocol specification, priority inheritance, and robust mutexes.=C2=A0 Th=
e macros used for this can be found in ltp/testcases/realtime/m4/check.m4 f=
rom the LTP git repository.<br><br></div>We are cross-building for the armv=
7a architecture using the machine definition found in meta-linaro/meta-lina=
ro/conf/machine/genericarmv7a.conf.=C2=A0 The development host platform is =
an Ubuntu 12.04 x86_64 platform with all software kept regularly updated fr=
om the Ubuntu repositories.<br><br></div>The macros in check.m4 use the AC_=
TRY_COMPILE function macro to attempt compilation of POSIX function calls u=
tilizing the features being probed - such that if the compilation fails the=
 features are deemed to be unsupported... and if compilation succeeds the f=
eatures are deemed supported.<br><br></div>Native compilation of the same c=
ode used in the probes, and execution of the resulting program - shows supp=
ort for all the probed mutex features on both the development host as well =
as the armv7a target platform... that is when this probe code is built on e=
ither the host or target machine and then executed in that environment... s=
o support is there in both environments.<br><br></div>Despite the presence =
of this support the AC_TRY_COMPILE macro is indicating a lack of support fo=
r the probed features during the cross-build process.<br><br>I am not perso=
nally familiar with the detailed function of the autoconf macros, and I can=
 find no documentation about how OE interacts with those macros in order to=
 coerce them into configuring for the target machine in a cross-build envir=
onment... so I am hoping the autoconf experts at OE can shed some light on =
this and at least provide some clues as to where to look for the problem an=
d possible resolution.=C2=A0 Any insight you can provide in this matter wou=
ld be appreciated.<br><div><div><div><br></div><div>Gary Robertson<br><br><=
/div><div>Real-time engineer, Linaro Networking Group<br></div><div><br></d=
iv></div></div></div>

--047d7b5dbafc60419e0502576b9e--
