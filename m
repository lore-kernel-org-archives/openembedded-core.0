Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0551B65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 16:28:03 +0000 (UTC)
Received: by qkcn129 with SMTP id n129so73510122qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iTAHsJfKAJ4ozFTI4YDHCZiHvVYyupRyq0xWRFp2NS0=;
	b=Tt6UchUC06jGR0qAOQ31gaGYkNo4x/bk1yq1awNnx+S9Q3kHHV3LNgw2A8KEAxusdU
	5bsyDabJXvzbaRlSecFko3m+N3ZVbw4MJVXKx8oWypIodinAs6/juiFpUFb64SgFpf+8
	h+LMxQIABwNT0dbEG45XYXdj/PQwBRxj0KsiO6jfHa2Zf1IoXM1agolV1NCOPcDQKMQi
	7m5usxDPbxiJ3Y8sAHj+QzlEAUujSZ0y4wITceV1M5DyJPu4wIIVu3bXngPyNWICxUbJ
	IAZLsPlaW4PSO4n5x3FBSAAwLi8W419i0N9P4J8qnChG7RqokHZmtxBU/SFWNFeezjx/
	pKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iTAHsJfKAJ4ozFTI4YDHCZiHvVYyupRyq0xWRFp2NS0=;
	b=LNa+NOKp/FVHPzCZIDzhUF0WBDoAXnswZ3Sx5YsO/92SPQcU3l0TIractxBjy6anFB
	RI+VGZDRjq6WOatxpD3J+4UG4dsXcUOIGoW7CmaCrNeoZTpTy6+y9pZoOgmEe77Qcws+
	cQ2SL6w7/ypTIEilvGfNsKTiRL6U3BXELt+7x1O8STZACx7aDSQbTAnNUYNXPVAzHjML
	1SBFe1PQ7Ht0hv7E6oNagraSNDWJ+X6I00oSQr4RLraQ+MN6+ayyaiR9rIianvMvqPBP
	zkImrLYmfCusO8eKpI5OBpq3EaI+loLGTxWj4JZ6Ie3hD8B8WskdU4j8OO1chozPgb+R
	zDuA==
X-Gm-Message-State: ALoCoQnyXq/yz0FEfxSJTAbJVHETjScN74xydszYVQ91aLxrxU2GyQviRS3T5kahU0piHSzJii9I
X-Received: by 10.55.72.70 with SMTP id v67mr30791550qka.83.1447086484123;
	Mon, 09 Nov 2015 08:28:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Mon, 9 Nov 2015 08:27:44 -0800 (PST)
In-Reply-To: <3da4fc0c20bf2ab7ac4c489aaa37d707e769d6c3.1446645475.git.liezhi.yang@windriver.com>
References: <cover.1446645475.git.liezhi.yang@windriver.com>
	<3da4fc0c20bf2ab7ac4c489aaa37d707e769d6c3.1446645475.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Nov 2015 16:27:44 +0000
Message-ID: <CAJTo0Lb6zSiunoe73fu==ZHD6yFsT+4d9FTRmxDgfpV-p0tY=Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cross-canadian/libgcc: fix aarch64's multilib SDK
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
X-List-Received-Date: Mon, 09 Nov 2015 16:28:08 -0000
Content-Type: multipart/alternative; boundary=001a114a97f6d8924a05241e1351

--001a114a97f6d8924a05241e1351
Content-Type: text/plain; charset=UTF-8

On 4 November 2015 at 13:58, Robert Yang <liezhi.yang@windriver.com> wrote:

> The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,
> this makes multilib sdk doesn't work, for example:
>
> MACHINE = qemuarm64
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
>
> $ bitbake core-image-minimal -cpopulate_sdk
>
> Then extract SDK, the
> environment-setup-armv7a-vfp-neon-pokymllib32-linux-gnueabi
> doesn't work since:
> * The CC is arm-pokymllib32-linux-gnueabi-gcc
>   which doesn't exist, the patch for cross-canadian.bbclass
>   fixes problem.
> * Need aarch64-poky-linux/usr/lib/arm-poky-linux-linux-gnueabi
>   which doesn't exist, the patch for libgcc-common.inc fixes the
>   problem.
>
> [YOCTO #8616]
>

This breaks the allarch sstate sanity test on the autobuilder which
verifies that allarch recipes don't have different hashes for a no-op
change to the machine.

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/242/steps/Running%20oe-selftest/logs/stdio

Ross

--001a114a97f6d8924a05241e1351
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 November 2015 at 13:58, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D":447" class=3D"" sty=
le=3D"overflow:hidden">The arm toolchain has a &quot;-gnueabi&quot; suffix,=
 but aarch64 doesn&#39;t,<br>
this makes multilib sdk doesn&#39;t work, for example:<br>
<br>
MACHINE =3D qemuarm64<br>
require conf/multilib.conf<br>
MULTILIBS =3D &quot;multilib:lib32&quot;<br>
DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;armv7at-neon&quot;<br>
<br>
$ bitbake core-image-minimal -cpopulate_sdk<br>
<br>
Then extract SDK, the<br>
environment-setup-armv7a-vfp-neon-pokymllib32-linux-gnueabi<br>
doesn&#39;t work since:<br>
* The CC is arm-pokymllib32-linux-gnueabi-gcc<br>
=C2=A0 which doesn&#39;t exist, the patch for <span class=3D"">cross</span>=
-<span class=3D"">canadian</span>.bbclass<br>
=C2=A0 fixes problem.<br>
* Need aarch64-poky-linux/usr/lib/arm-poky-linux-linux-gnueabi<br>
=C2=A0 which doesn&#39;t exist, the patch for <span class=3D"">libgcc</span=
>-common.inc fixes the<br>
=C2=A0 problem.<br>
<br>
[YOCTO #8616]</div></blockquote></div><br>This breaks the allarch sstate sa=
nity test on the autobuilder which verifies that allarch recipes don&#39;t =
have different hashes for a no-op change to the machine.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"https://autob=
uilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/242/steps/=
Running%20oe-selftest/logs/stdio">https://autobuilder.yoctoproject.org/main=
/builders/nightly-oe-selftest/builds/242/steps/Running%20oe-selftest/logs/s=
tdio</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a114a97f6d8924a05241e1351--
