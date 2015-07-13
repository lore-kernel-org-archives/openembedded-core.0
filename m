Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC4A739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:38:27 +0000 (UTC)
Received: by qgy5 with SMTP id 5so21223378qgy.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=+7lTllJBrazNHhbDv1vlryZsUx3NEfpro2IFApHql7A=;
	b=g2iUA1KzVgFh2r1jAqGAKSAn7HYDDg3v2uZi/oxKdjHa4uihNoWkCA7SwJrTk9g1CK
	Zz+fq4Wqand1vX4gm21XQew5Sa/ZFhzfZvr4qogVFU5a0l1SU4bv/d9mxAwl/xAcmYZF
	8H3biRGVpRxPjoxHzI802dCUDb8157EXbxaNt0/Sv16gtoyWdCeTrP2RZDmJDFBzQ6RU
	4HsGKnnUvSfo5rpeoJdQSDui9e1+UUR38Gn1RmwsDnF7q0IzmAgXcSV1Kh55R9Dr8xrL
	A4yTjua4Wd1R/ACbVRNqRzpP6jluX0GjsnRNqame7i4PVbJfVt+4qGkDhbIqj2/Z3YUS
	y7pQ==
X-Received: by 10.55.48.11 with SMTP id w11mr52931940qkw.61.1436798303903;
	Mon, 13 Jul 2015 07:38:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Mon, 13 Jul 2015 07:38:04 -0700 (PDT)
In-Reply-To: <0263c62a7c1a31f2d974d1b5f635133b16d92d2d.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
	<0263c62a7c1a31f2d974d1b5f635133b16d92d2d.1436795781.git.ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 13 Jul 2015 07:38:04 -0700
X-Google-Sender-Auth: P82esvAtOv5zute1JMfU7wKyT5o
Message-ID: <CABcZAN=fvRRCS1UzYwOWsgDwMOd5Ut7RnDp6fuv7Esu8oOh4=A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] libc-package: fix path assumption
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
X-List-Received-Date: Mon, 13 Jul 2015 14:38:27 -0000
Content-Type: multipart/alternative; boundary=001a1146f09084a6d4051ac2ac40

--001a1146f09084a6d4051ac2ac40
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 7:03 AM, Ross Burton <ross.burton@intel.com> wrote:

> Relying on exec_func() doing a mkdir and chdir if you set ${B} is obscure=
,
> instead just pass -C <dir> to oe_runmake.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/libc-package.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/libc-package.bbclass
> b/meta/classes/libc-package.bbclass
> index 2076aa1..21c6b43 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -363,10 +363,9 @@ python package_do_split_gconvs () {
>              m.write(cmd + ":\n")
>              m.write("\t" + commands[cmd] + "\n\n")
>          m.close()
> -        d.setVar("B", os.path.dirname(makefile))
>          d.setVar("EXTRA_OEMAKE", "${PARALLEL_MAKE}")
>          bb.note("Executing binary locale generation makefile")
> -        bb.build.exec_func("oe_runmake", d)
> +        bb.build.exec_func("oe_runmake", d, [os.path.dirname(makefile),]=
)
>          bb.note("collecting binary locales from locale tree")
>          bb.build.exec_func("do_collect_bins_from_locale_tree", d)
>          do_split_packages(d, binary_locales_dir, file_regex=3D'(.*)', \
>

This says you=E2=80=99re passing -C <dir> to oe_runmake, but actually passe=
s the
dir as dirs for exec_func.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1146f09084a6d4051ac2ac40
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jul 13, 2015 at 7:03 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ap" cla=
ss=3D"a3s" style=3D"overflow:hidden">Relying on exec_func() doing a mkdir a=
nd chdir if you set ${B} is obscure,<br>
instead just pass -C &lt;dir&gt; to oe_runmake.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/libc-package.bbclass | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.=
bbclass<br>
index 2076aa1..21c6b43 100644<br>
--- a/meta/classes/libc-package.bbclass<br>
+++ b/meta/classes/libc-package.bbclass<br>
@@ -363,10 +363,9 @@ python package_do_split_gconvs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.write(cmd + &quot;:\n&quo=
t;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.write(&quot;\t&quot; + co=
mmands[cmd] + &quot;\n\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.close()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;B&quot;, os.path.dirname(makefi=
le))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;EXTRA_OEMAKE&quot;, &quot;=
${PARALLEL_MAKE}&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Executing binary locale gen=
eration makefile&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;oe_runmake&quot;, d)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;oe_runmake&quot;, d, =
[os.path.dirname(makefile),])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;collecting binary locales f=
rom locale tree&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;do_collect_bins_=
from_locale_tree&quot;, d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_split_packages(d, binary_locales_dir, =
file_regex=3D&#39;(.*)&#39;, \</div></blockquote></div><br>This says you=E2=
=80=99re passing -C &lt;dir&gt; to oe_runmake, but actually passes the dir =
as dirs for exec_func.<br>-- <br><div class=3D"gmail_signature">Christopher=
 Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphic=
s</div>
</div></div>

--001a1146f09084a6d4051ac2ac40--
