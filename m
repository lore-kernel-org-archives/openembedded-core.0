Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDA9EF99D3
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 19:51:45 +0000 (UTC)
Subject: Re: [PATCH] rust: Enable dynamic linking with llvm
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.222.206)
X-Originating-Platform: Windows Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 11:51:38 -0800
References: <20260212165035.1806068-1-sunilkumar.dora@windriver.com> <D0F37E52-3E1F-4477-932A-02BEDB07AE2A@arm.com>
In-Reply-To: <D0F37E52-3E1F-4477-932A-02BEDB07AE2A@arm.com>
Message-ID: <675892.1771012298240808740@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9idG5trffXSohcT2pgzi"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 19:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231138

--9idG5trffXSohcT2pgzi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 10:36 PM, Ross Burton wrote:

>=20
> What=E2=80=99s the impact on the native sysroot and target packages when =
we link
> rust against all of libLLVM.so dynamically vs statically linking the
> pieces that are used?

Hi Ross,

Below are the observed impacts when linking Rust against shared libLLVM.so =
versus
statically linking LLVM components.

On Native:
**********
All required LLVM-related libraries were already present in recipe-sysroot-=
native before switching
Rust to dynamic LLVM. Dynamic linking does not introduce any new native dep=
endencies.
Existing llvm-native artifacts are reused.

Static:
-rw-r--r-- 1 xxx users 213M Feb 13 00:29 librustc_driver-4b6f2c2478f9ef2c.s=
o
Dynamic:
-rw-r--r-- 1 xxx users 132M Feb 13 00:52 librustc_driver-4b6f2c2478f9ef2c.s=
o

So on native we see ~81 MB reduction in librustc_driver, with no additional=
 sysroot growth.

On Target:
**********
librustc_driver shrinks from 144.8 MB to 84.2 MB (~60 MB reduction).
However, dynamic linking introduces shared libLLVM.so plus a few runtime de=
pendencies.

Static:
root@qemux86-64:~# ls -lh /usr/lib/librustc_driver-*.so
-rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0144.8=
M Apr =C2=A05 =C2=A02011 /usr/lib/librustc_driver-151eed90355bbdac.so

Dynamic:
root@qemux86-64:~# ls -lh /usr/lib/librustc_driver-*.so
-rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 84.2=
M Apr =C2=A05 =C2=A02011 /usr/lib/librustc_driver-151eed90355bbdac.so

New dynamic dependencies:
root@qemux86-64:~# ldd /usr/lib/librustc_driver-*.so
libLLVM.so.21.1 libffi.so.8 libxml2.so.16

Size contribution on target:
- libLLVM.so.21.1 =E2=89=88 75.5 MB
- libxml2.so.16 =E2=89=88 1.2 MB
- libffi.so.8 =E2=89=88 42.5 KB

When LLVM is only used by Rust, this results in a net image increase of app=
roximately 15=E2=80=9316 MB.

--9idG5trffXSohcT2pgzi
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Feb 12, 2026 at 10:36 PM, Ross Burton wrote:</div>
<div>
<blockquote>What&rsquo;s the impact on the native sysroot and target packag=
es when we link rust against all of libLLVM.so dynamically vs statically li=
nking the pieces that are used?</blockquote>
Hi Ross,<br /><br />
<div>Below are the observed impacts when linking Rust against shared libLLV=
M.so versus&nbsp;<br />statically linking LLVM components.</div>
<div><br />On Native:<br />**********<br />All required LLVM-related librar=
ies were already present in recipe-sysroot-native before switching&nbsp;<br=
 />Rust to dynamic LLVM. Dynamic linking does not introduce any new native =
dependencies.&nbsp;<br />Existing llvm-native artifacts are reused.<br /><b=
r /></div>
<div>Static:<br />-rw-r--r-- 1 xxx users 213M Feb 13 00:29 librustc_driver-=
4b6f2c2478f9ef2c.so</div>
<div>Dynamic:<br />-rw-r--r-- 1 xxx users 132M Feb 13 00:52 librustc_driver=
-4b6f2c2478f9ef2c.so<br /><br /></div>
<div>So on native we see ~81 MB reduction in librustc_driver, with no addit=
ional sysroot growth.</div>
<br />
<div>On Target:<br />**********<br />librustc_driver shrinks from 144.8 MB =
to 84.2 MB (~60 MB reduction).<br />However, dynamic linking introduces sha=
red libLLVM.so plus a few runtime dependencies.<br /><br /></div>
<div>Static:<br />root@qemux86-64:~# ls -lh /usr/lib/librustc_driver-*.so<b=
r />-rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp;1=
44.8M Apr &nbsp;5 &nbsp;2011 /usr/lib/librustc_driver-151eed90355bbdac.so<b=
r /><br /></div>
<div>Dynamic:<br />root@qemux86-64:~# ls -lh /usr/lib/librustc_driver-*.so<=
br />-rw-r--r-- &nbsp; &nbsp;1 root &nbsp; &nbsp; root &nbsp; &nbsp; &nbsp;=
 84.2M Apr &nbsp;5 &nbsp;2011 /usr/lib/librustc_driver-151eed90355bbdac.so<=
br /><br /></div>
<div>New dynamic dependencies:<br />root@qemux86-64:~# ldd /usr/lib/librust=
c_driver-*.so<br />&nbsp; &nbsp; &nbsp; &nbsp; libLLVM.so.21.1 libffi.so.8 =
libxml2.so.16<br /><br /></div>
<div>Size contribution on target:<br />&nbsp;- libLLVM.so.21.1 &asymp; 75.5=
 MB<br />&nbsp;- libxml2.so.16 &asymp; 1.2 MB<br />&nbsp;- libffi.so.8 &asy=
mp; 42.5 KB<br /><br /></div>
<div>When LLVM is only used by Rust, this results in a net image increase o=
f approximately 15&ndash;16 MB.</div>
</div>

--9idG5trffXSohcT2pgzi--

