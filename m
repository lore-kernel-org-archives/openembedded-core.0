Return-Path: <logan.buchy@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id A7ACE60291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 20:30:51 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id b35so42369757qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 12:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gnw55FuchKZMy4siDLwz9dHSCn4NZiQcmuGSDyX0Qtg=;
	b=OV0hWeuytN/Bx1KJD3X1PdimxK3LDERrX0NdvPXW8VbNHjh2tkyODnw2Yz2u7rHlNa
	T1OD6kDLDg7drJB/8l4jVI0JwxvKK8kEU5qH9EMaNjQl1o6WBgP49TivThWDwvtScsaQ
	7MWxBAdX4gfpTz2sdf/q248kGm1cJIDOP4/btpXRJcyWVCSnKEHIHIk/gia9+ny0d4+h
	m+V0ayGPc7nN4gWUemCsN35Uc9/RSzF1m67ZJeoAUqpX904bwBmKGwKiVdhauuAsfEib
	+Wu1OaW9dZgzcn+F+TBrRGaGOwKJh919UvavJd+MZ60Fd7gvog5Rr/5U4FiuNNi2uAYx
	yfSw==
MIME-Version: 1.0
X-Received: by 10.140.173.132 with SMTP id t126mr85002103qht.96.1451421051964; 
	Tue, 29 Dec 2015 12:30:51 -0800 (PST)
Received: by 10.55.150.133 with HTTP; Tue, 29 Dec 2015 12:30:51 -0800 (PST)
Date: Tue, 29 Dec 2015 12:30:51 -0800
Message-ID: <CAH=96PH06f+uQqNVed2Tz_z1rNB3-nLO8xgxecq9SmOU4rK=vw@mail.gmail.com>
From: Logan Buchy <logan.buchy@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Multiple recipes sharing the same source
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
X-List-Received-Date: Tue, 29 Dec 2015 20:30:52 -0000
Content-Type: multipart/alternative; boundary=001a1139c33c38d39805280f4c87

--001a1139c33c38d39805280f4c87
Content-Type: text/plain; charset=UTF-8

Hi,

I've got a third-party SDK given to me by our SoC provider.  The SDK
contains
* Vanilla Linux kernel with a set of patches that adds drivers for SoC
peripherals
* Proprietary bootloader
* Proprietary binary libraries
* Proprietary firmware for on-chip peripherals
* A build system which compiles everything

This SDK comes a a big tarball.  Splitting the tarball into separate
tarballs is not desirable since this would need to be done every time the
provider issues an update (which comes as another big tarball).

What I have now is a recipe that compiles and installs the entire SDK,
which works alright but I am looking to split up the SDK into separate
packages with associated do_configure/do_compile/do_install tasks.  For
example, I would like to split this into packages that provide:
* virtual/kernel
* proprietary-binary-blob
* soc-kernel-drivers
* proprietary-firmware-blob

What I am wondering about is how would I go about writing multiple recipes
that share the same tarball without having bitbake untar it for each
recipe.  Is this even possible?  Are there any examples of packages that do
this?

My best guess about how to go about this would be to create a class which
defines a do_fetch/do_unpack routine and then for each package, inherit the
class and define custom do_configure/do_compile/do_install routines.

Am I going down the right path here?

Thanks,
Logan

--001a1139c33c38d39805280f4c87
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;ve got a third-party SDK give=
n to me by our SoC provider.=C2=A0 The SDK contains</div><div>* Vanilla Lin=
ux kernel with a set of patches that adds drivers for SoC peripherals</div>=
<div>* Proprietary bootloader</div><div>* Proprietary binary libraries</div=
><div>* Proprietary firmware for on-chip peripherals</div><div>* A build sy=
stem which compiles everything</div><div><br></div><div>This SDK comes a a =
big tarball.=C2=A0 Splitting the tarball into separate tarballs is not desi=
rable since this would need to be done every time the provider issues an up=
date (which comes as another big tarball).</div><div><br></div><div>What I =
have now is a recipe that compiles and installs the entire SDK, which works=
 alright but I am looking to split up the SDK into separate packages with a=
ssociated do_configure/do_compile/do_install tasks.=C2=A0 For example, I wo=
uld like to split this into packages that provide:</div><div>* virtual/kern=
el</div><div>* proprietary-binary-blob</div><div>* soc-kernel-drivers</div>=
<div>* proprietary-firmware-blob</div><div><br></div><div>What I am wonderi=
ng about is how would I go about writing multiple recipes that share the sa=
me tarball without having bitbake untar it for each recipe.=C2=A0 Is this e=
ven possible?=C2=A0 Are there any examples of packages that do this?</div><=
div><br></div><div>My best guess about how to go about this would be to cre=
ate a class which defines a do_fetch/do_unpack routine and then for each pa=
ckage, inherit the class and define custom do_configure/do_compile/do_insta=
ll routines.</div><div><br></div><div>Am I going down the right path here?<=
/div><div><br></div><div>Thanks,</div><div>Logan</div><div><br></div></div>

--001a1139c33c38d39805280f4c87--
