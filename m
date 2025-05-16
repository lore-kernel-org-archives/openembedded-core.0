Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8099FC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 16:39:26 +0000 (UTC)
Subject: Re: [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: openembedded-core@lists.openembedded.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.13)
X-Originating-Platform: Mac Firefox 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 16 May 2025 09:39:19 -0700
References: <CANNYZj8WRTH0He_BcxPt4q5VeHHkG8qyTFHfKL-_LGiuYstxVw@mail.gmail.com>
In-Reply-To: <CANNYZj8WRTH0He_BcxPt4q5VeHHkG8qyTFHfKL-_LGiuYstxVw@mail.gmail.com>
Message-ID: <13420.1747413559731422430@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="J7WPhQUVcWpBBAp9BbXb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 16:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216759

--J7WPhQUVcWpBBAp9BbXb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 08:55 AM, Alexander Kanavin wrote:

>=20
> If you need to supply these
> arguments some other way, then you can follow for example mesa.inc and
> define empty PACKAGECONFIGS:
>=20
> PACKAGECONFIG[amd] =3D ""
> PACKAGECONFIG[svga] =3D ""
> PACKAGECONFIG[virgl] =3D ""
>=20
> And then use them to form a custom variable, which you can use as you see
> fit:
>=20
> GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
> GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd',
> ',r600', '', d)}"

I think using PACKAGECONFIG to define cargo features list is a normal use-c=
ase in rust based recipes. With this change is not easily achievable becaus=
e ${PACKAGECONFIG_CONFARGS} is unquoted in cargo.bbclass and we can't use i=
t with CARGO_BUILD_FLAGS +=3D " --features" if there are more than one feat=
ure.
So, if the change is not going to be reverted then we realistically have tw=
o options - either complicate the recipes with a lot of conditions like you=
 suggest or just add a comment that oe_cargo_build() is broken in cargo.bbc=
lass and define our own do_compile()

Anton

--J7WPhQUVcWpBBAp9BbXb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, May 16, 2025 at 08:55 AM, Alexander Kanavin wrote:</div>
<div>
<blockquote>If you need to supply these<br />arguments some other way, then=
 you can follow for example mesa.inc and<br />define empty PACKAGECONFIGS:<=
br /><br />PACKAGECONFIG[amd] =3D ""<br />PACKAGECONFIG[svga] =3D ""<br />P=
ACKAGECONFIG[virgl] =3D ""<br /><br />And then use them to form a custom va=
riable, which you can use as you see fit:<br /><br />GALLIUMDRIVERS:append =
=3D "${@bb.utils.contains('PACKAGECONFIG',<br />'gallium-llvm', '${GALLIUMD=
RIVERS_LLVM}', '', d)}"<br />GALLIUMDRIVERS:append =3D "${@bb.utils.contain=
s('PACKAGECONFIG', 'amd',<br />',r600', '', d)}"</blockquote>
</div>
<div>&nbsp; I think using PACKAGECONFIG to define cargo features list is a =
normal use-case in rust based recipes. With this change is not easily achie=
vable because ${PACKAGECONFIG_CONFARGS} is unquoted in cargo.bbclass and we=
 can't use it with CARGO_BUILD_FLAGS +=3D " --features" if there are more t=
han one feature.<br />&nbsp; So, if the change is not going to be reverted =
then we realistically have two options - either complicate the recipes with=
 a lot of conditions like you suggest or just add a comment that oe_cargo_b=
uild() is broken in cargo.bbclass and define our own do_compile()<br /><br =
/></div>
<div>Anton</div>

--J7WPhQUVcWpBBAp9BbXb--

