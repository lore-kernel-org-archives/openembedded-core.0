Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167A2C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 03:42:41 +0000 (UTC)
Subject: Re: [PATCH V1] coreutils: Add gcc parameter for ptest
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 111
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 17 Apr 2023 20:42:33 -0700
References: <CAMKF1socwNE1yE3ywMyimSqu8JF03hzKR27YKXL6qJu-1r2d3g@mail.gmail.com>
In-Reply-To: <CAMKF1socwNE1yE3ywMyimSqu8JF03hzKR27YKXL6qJu-1r2d3g@mail.gmail.com>
Message-ID: <17294.1681789353965294418@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DgDCGV4nJ0KcqoiU2umu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 03:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180174

--DgDCGV4nJ0KcqoiU2umu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
>=20
>=20
> This should be a symlink to gcc on target so I wonder why it does not wor=
k
>=20
>=20
>=20

First, see the coreutils=E2=80=99 files which installed on target.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Makefile=C2=A0 -->created by cross-compile

build-aux

init.cfg =C2=A0=C2=A0=C2=A0=C2=A0--> copied from src

run-ptest

tests

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

In Makefile, CC is defined by aarch64-agl-linux-gcc with --sysroot=3Drecipe=
-sysroot.

CC =3D aarch64-agl-linux-gcc=C2=A0 -fstack-protector-strong=C2=A0 -O2 -D_FO=
RTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sys=
root=3Drecipe-sysroot

In init.cfg, CC=C2=A0 is used to compile k.c file.

$CC -Wall -shared --std=3Dgnu99 -fPIC -O2 $* "$in" -o "$out" $gcc_shared_li=
bs_

Because of =E2=80=9C --sysroot=3Drecipe-sysroot =E2=80=9D , it does not wor=
k.

So, we could add =E2=80=9C -I /usr/include =E2=80=9D in Makefile or init.cf=
g, or delete =E2=80=9C --sysroot=3Drecipe-sysroot =E2=80=9D from Makefile.

Which one is better?

Let me know, and I will send the patch v2.

thanks.

--DgDCGV4nJ0KcqoiU2umu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">This should be a symli=
nk to gcc on target so I wonder why it does not work=C2=A0</p>
</blockquote>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">First, see the coreutils=E2=80=99 files which =
installed on target.</span><span lang=3D"EN-US"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</span><span lang=3D"EN-US"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">=C2=A0=C2=A0Makefile=C2=A0 --&gt;created by cr=
oss-compile</span><span lang=3D"EN-US"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">=C2=A0=C2=A0build-aux</span><span lang=3D"EN-U=
S"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">=C2=A0=C2=A0init.cfg =C2=A0=C2=A0=C2=A0=C2=A0-=
-&gt; copied from src</span><span lang=3D"EN-US"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">=C2=A0=C2=A0run-ptest</span><span lang=3D"EN-U=
S"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">tests</span><span lang=3D"EN-US"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</span><span lang=3D"EN-US"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US">=
In=C2=A0</span><span lang=3D"EN-US" style=3D"font-size: 11.0pt;">Makefile, =
CC is defined by=C2=A0</span><span lang=3D"EN-US">aarch64-agl-linux-gcc wit=
h --sysroot=3Drecipe-sysroot.</span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US">=
=C2=A0CC =3D aarch64-agl-linux-gcc=C2=A0 -fstack-protector-strong=C2=A0 -O2=
 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security=
 --sysroot=3Drecipe-sysroot</span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">In init.cfg, CC=C2=A0 is used to compile=C2=A0=
</span><span lang=3D"EN-US">k.c file.</span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US">=
=C2=A0$CC -Wall -shared --std=3Dgnu99 -fPIC -O2 $* &#34;$in&#34; -o &#34;$o=
ut&#34; $gcc_shared_libs_</span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US">=
Because of=C2=A0</span><span lang=3D"ZH-CN" style=3D"mso-fareast-language: =
ZH-CN;">=E2=80=9C</span><span lang=3D"EN-US">--sysroot=3Drecipe-sysroot</sp=
an><span lang=3D"ZH-CN" style=3D"mso-fareast-language: ZH-CN;">=E2=80=9D</s=
pan><span lang=3D"EN-US">, it does not work.</span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US">=
So, we could add=C2=A0</span><span lang=3D"ZH-CN" style=3D"mso-fareast-lang=
uage: ZH-CN;">=E2=80=9C</span><span lang=3D"EN-US">-I /usr/include</span><s=
pan lang=3D"ZH-CN" style=3D"mso-fareast-language: ZH-CN;">=E2=80=9D</span><=
span lang=3D"EN-US">=C2=A0in=C2=A0</span><span lang=3D"EN-US" style=3D"font=
-size: 11.0pt;">Makefile or init.cfg, or delete=C2=A0</span><span lang=3D"Z=
H-CN" style=3D"mso-fareast-language: ZH-CN;">=E2=80=9C</span><span lang=3D"=
EN-US">--sysroot=3Drecipe-sysroot</span><span lang=3D"ZH-CN" style=3D"mso-f=
areast-language: ZH-CN;">=E2=80=9D</span><span lang=3D"EN-US">=C2=A0from=C2=
=A0</span><span lang=3D"EN-US" style=3D"font-size: 11.0pt;">Makefile.</span=
><span lang=3D"EN-US"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">Which one is better?</span><span lang=3D"EN-US=
"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">Let me know, and I will send the patch v2.</sp=
an><span lang=3D"EN-US"></span></p>
<p class=3D"defangedmsonormal" style=3D"margin: 0mm;"><span lang=3D"EN-US" =
style=3D"font-size: 11.0pt;">thanks.</span><span lang=3D"EN-US"></span></p>

--DgDCGV4nJ0KcqoiU2umu--

