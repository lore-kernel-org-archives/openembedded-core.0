Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723DCC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 14:49:34 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web10.16948.1674053369925882578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 06:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kCpNwgbR;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id l129so15650243vkh.6
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 06:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PyknVgFR0ar9PX0c1f1Isu0x54IaT0PE6iEtt4qpJ64=;
        b=kCpNwgbR6ld9bO0h31vua+bTOZ3TCDndyc8miccbBEwJzfKOWKokR0EXgD6FbIYA0i
         5rDTOLZkZP13Nze3DqHJEC2rltAtb4NPFhsiAfp2kwEbrl6Ff+1WyDz4sISYYpAVrMKp
         PcuoSvdjh/knjymos6rbOe/k6BF67ceOpGfqg6YSLgqtr7n8EoJIAemGl2hAp2gIk/7j
         Iokual/m9hlMpI3mcwHnSH4muPbaukiRiJWrZszqPUFrqRvADRUIidlriz1XVMd4kh5Y
         qUnKQYqBfqsJGI3SAfrhD1fPXatxZkTSzHDFmTH32/h40uoYSgMHGauWEI9BUd6rOH1L
         7KeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyknVgFR0ar9PX0c1f1Isu0x54IaT0PE6iEtt4qpJ64=;
        b=kMcGVQNhDj1aS1VfTh1BYvOGn3qlOJ2ttJPwqfm7957g+Z7TY9/+uL42xvx2QQ3Dm/
         H4a/wpQnrv9tDbtPRuaBdMcz4wte30OwMBjxx6iqFvmngR+3iR8v75R2OHAYlh3q7Q0g
         Nvy8R9bzAVujCmPAnA1hq8tO70R3ebxSlRUBNkNwELEDpYAh1wu+GOtu6cVGmL2vboIa
         mhoOrk4If0vzWWp8Wifc7nwMdiECxtzDF/GIlQ8gHk2NbuuRaAUTT6fExIGQosr/4sRH
         tlL2kLAWdbJWFWXB1kN8+MKdkq4Smg9mQKGN9UOerJ5H07cnTvxS8KAVqG8mxrTw/Bmx
         TaFg==
X-Gm-Message-State: AFqh2kpTWjRbSLNjhCDd18l4yMeKLPpMXRl10toPWjbPvlWUzDhvr13p
	TtJk13Hum+cpanDPX9MgPaWjxLo0yrAf7gyUQ3Y=
X-Google-Smtp-Source: AMrXdXvxDD9AB4gHr8+oEIEELwdj+7oFC/dutrkBifa97yGVzJC8esOkWiPSABf38IhN87hHVlQFzI5p4uo7nTEVjTs=
X-Received: by 2002:a1f:5c4f:0:b0:3c6:6f9a:9f1d with SMTP id
 q76-20020a1f5c4f000000b003c66f9a9f1dmr1007843vkb.11.1674053368877; Wed, 18
 Jan 2023 06:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20221205045856.68662-1-Qi.Chen@windriver.com> <1739E878132F7D7E.25137@lists.openembedded.org>
 <CANPvuR=3JzJuKkE0rLh2nBy18ud6+tbi4hmW_Zdo5gBTabANtA@mail.gmail.com> <6be59d113a7221ab1cf4b4c4999750fbc95a6519.camel@linuxfoundation.org>
In-Reply-To: <6be59d113a7221ab1cf4b4c4999750fbc95a6519.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 18 Jan 2023 14:49:17 +0000
Message-ID: <CANPvuR=v5sUjuJDZuwLLTkMuCUBno-jpGJxZb2eWjHjKuSo=5Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rm_work: adjust dependency to make
 do_rm_work_all depend on do_rm_work
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000631ce805f28aecde"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 14:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176103

--000000000000631ce805f28aecde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quarta,
18/01/2023 =C3=A0(s) 13:39:

> On Wed, 2023-01-18 at 13:10 +0000, Jose Quaresma wrote:
> > Hi Chen,
> >
> > Jose Quaresma via lists.openembedded.org
> > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
> > sexta, 13/01/2023 =C3=A0(s) 15:39:
> > > Hi Chen,
> > >
> > > Just for your information,
> > > This patch introduces a regression that breaks the do_create_spdx
> > > tasks when building with multiconfig machines.
> > >
> > > I am investigating it more deeply and will come back with my
> > > findings.
> > >
> >
> >
> > I don't understand the reason for this regression but I am thinking
> > of sending a revert for this patch.
> >
> > Here are the steps to reproduce:
> >
> > git clone https://git.yoctoproject.org/git/poky
> > cd poky
> > git clone https://git.yoctoproject.org/git/meta-arm
> > git clone https://git.yoctoproject.org/git/meta-ti
> > source oe-init-build-env
> > bitbake-layers add-layer ../meta-arm/meta-arm-toolchain
> > bitbake-layers add-layer ../meta-arm/meta-arm
> > bitbake-layers add-layer ../meta-ti/meta-ti-bsp
> > bitbake-layers add-layer ../meta-ti/meta-ti-extras
> > echo 'INHERIT +=3D "rm_work"' >>conf/local.conf
> > echo 'INHERIT +=3D "create-spdx"' >>conf/local.conf
> >
> > MACHINE=3Dam64xx-evm bitbake core-image-minimal
> > MACHINE=3Dam62xx-evm bitbake core-image-minimal
> >
> > At least these two machines are broken.
> >
>
> Do you have a pointer to the actual errors that result?
>

The issue can be reproduced quite fast in less than 1 minute, the error is
the following:

ERROR: mc:k3r5-gp:quilt-native-0.67-r0 do_create_spdx: Error executing a
python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_create_spdx(d)
     0003:
File: '/home/jq/foundries/git/poky/meta/classes/create-spdx-2.2.bbclass',
lineno: 525, function: do_create_spdx
     0521:                recipe.packageFileName =3D str(recipe_archive.nam=
e)
     0522:
     0523:    dep_recipes =3D collect_dep_recipes(d, doc, recipe)
     0524:
 *** 0525:    doc_sha1 =3D oe.sbom.write_doc(d, doc, "recipes",
indent=3Dget_json_indent(d))
     0526:    dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
     0527:
     0528:    recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
     0529:    recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" +
recipe.name
File: '/home/jq/foundries/git/poky/meta/lib/oe/sbom.py', lineno: 50,
function: write_doc
     0046:        doc_sha1 =3D spdx_doc.to_json(f, sort_keys=3DTrue,
indent=3Dindent)
     0047:
     0048:    l =3D spdx_deploy / "by-namespace" /
spdx_doc.documentNamespace.replace("/", "_")
     0049:    l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
 *** 0050:    l.symlink_to(os.path.relpath(dest, l.parent))
     0051:
     0052:    return doc_sha1
     0053:
     0054:
File: '/usr/lib/python3.10/pathlib.py', lineno: 1255, function: symlink_to
     1251:        """
     1252:        Make this path a symlink pointing to the target path.
     1253:        Note the order of arguments (link, target) is the reverse
of os.symlink.
     1254:        """
 *** 1255:        self._accessor.symlink(target, self, target_is_directory)
     1256:
     1257:    def hardlink_to(self, target):
     1258:        """
     1259:        Make this path a hard link pointing to the same file as
*target*.
Exception: FileExistsError: [Errno 17] File exists:
'../recipes/recipe-quilt-native.spdx.json' ->
'/home/jq/foundries/git/poky/build/tmp/work/x86_64-linux/quilt-native/0.67-=
r0/spdx/deploy/by-namespace/http:__spdx.org_spdxdoc_recipe-quilt-native-167=
37c05-483f-569e-ab20-5a7a779c8317'

ERROR: Logfile of failure stored in:
/home/jq/foundries/git/poky/build/tmp/work/x86_64-linux/quilt-native/0.67-r=
0/temp/log.do_create_spdx.1386095
ERROR: Task
(mc:k3r5-gp:/home/jq/foundries/git/poky/meta/recipes-devtools/quilt/quilt-n=
ative_0.67.bb:do_create_spdx)
failed with exit code '1'


>
> I'm not sure I would take a revert as I did carefully check this patch
> and I think it does fix a number of problems.
>

I understand and use this patch for a bunch of other machines and it works
in all of them.
When writing this last sentence I remembered that I use the patch as well
in some other multiconfig machines
but these ones are from Xilinx that has one TMP folder for each machine.

Is not the first time I have an issue with multiconfig machines that uses
the same TMP
folder and looks like this can be the issue with the TI machines.

Jose


>
> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000631ce805f28aecde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quarta, 18/01/2023 =C3=A0(s) 13:39:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Wed, 2023-01-18 at 13:10 +0000, =
Jose Quaresma wrote:<br>
&gt; Hi Chen,<br>
&gt; <br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu no di=
a<br>
&gt; sexta, 13/01/2023 =C3=A0(s) 15:39:<br>
&gt; &gt; Hi=C2=A0Chen,<br>
&gt; &gt; <br>
&gt; &gt; Just for your information,<br>
&gt; &gt; This patch introduces a regression=C2=A0that breaks the do_create=
_spdx<br>
&gt; &gt; tasks when building with multiconfig machines.<br>
&gt; &gt; <br>
&gt; &gt; I am investigating it more deeply and will come back with my<br>
&gt; &gt; findings.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I don&#39;t=C2=A0understand the reason for this regression but I am th=
inking<br>
&gt; of sending a revert for this patch.<br>
&gt; <br>
&gt; Here are the steps=C2=A0to reproduce:<br>
&gt; <br>
&gt; git clone <a href=3D"https://git.yoctoproject.org/git/poky" rel=3D"nor=
eferrer" target=3D"_blank">https://git.yoctoproject.org/git/poky</a><br>
&gt; cd poky<br>
&gt; git clone <a href=3D"https://git.yoctoproject.org/git/meta-arm" rel=3D=
"noreferrer" target=3D"_blank">https://git.yoctoproject.org/git/meta-arm</a=
> <br>
&gt; git clone <a href=3D"https://git.yoctoproject.org/git/meta-ti" rel=3D"=
noreferrer" target=3D"_blank">https://git.yoctoproject.org/git/meta-ti</a> =
<br>
&gt; source oe-init-build-env<br>
&gt; bitbake-layers add-layer ../meta-arm/meta-arm-toolchain<br>
&gt; bitbake-layers add-layer ../meta-arm/meta-arm<br>
&gt; bitbake-layers add-layer ../meta-ti/meta-ti-bsp<br>
&gt; bitbake-layers add-layer ../meta-ti/meta-ti-extras<br>
&gt; echo &#39;INHERIT +=3D &quot;rm_work&quot;&#39; &gt;&gt;conf/local.con=
f<br>
&gt; echo &#39;INHERIT +=3D &quot;create-spdx&quot;&#39; &gt;&gt;conf/local=
.conf<br>
&gt; <br>
&gt; MACHINE=3Dam64xx-evm bitbake core-image-minimal<br>
&gt; MACHINE=3Dam62xx-evm bitbake core-image-minimal<br>
&gt; <br>
&gt; At least these two machines are broken.<br>
&gt; <br>
<br>
Do you have a pointer to the actual errors that result?<br></blockquote><di=
v><br>The issue can be reproduced quite fast in less than 1 minute, the err=
or is the following:</div><div><br>ERROR: mc:k3r5-gp:quilt-native-0.67-r0 d=
o_create_spdx: Error executing a python function in exec_func_python() auto=
generated:<br><br>The stack trace of python calls that resulted in this exc=
eption/failure was:<br>File: &#39;exec_func_python() autogenerated&#39;, li=
neno: 2, function: &lt;module&gt;<br>=C2=A0 =C2=A0 =C2=A00001:<br>=C2=A0***=
 0002:do_create_spdx(d)<br>=C2=A0 =C2=A0 =C2=A00003:<br>File: &#39;/home/jq=
/foundries/git/poky/meta/classes/create-spdx-2.2.bbclass&#39;, lineno: 525,=
 function: do_create_spdx<br>=C2=A0 =C2=A0 =C2=A00521: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipe.packageFileName =3D str(<a href=
=3D"http://recipe_archive.name">recipe_archive.name</a>)<br>=C2=A0 =C2=A0 =
=C2=A00522:<br>=C2=A0 =C2=A0 =C2=A00523: =C2=A0 =C2=A0dep_recipes =3D colle=
ct_dep_recipes(d, doc, recipe)<br>=C2=A0 =C2=A0 =C2=A00524:<br>=C2=A0*** 05=
25: =C2=A0 =C2=A0doc_sha1 =3D oe.sbom.write_doc(d, doc, &quot;recipes&quot;=
, indent=3Dget_json_indent(d))<br>=C2=A0 =C2=A0 =C2=A00526: =C2=A0 =C2=A0de=
p_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))<br>=C2=A0 =C2=A0=
 =C2=A00527:<br>=C2=A0 =C2=A0 =C2=A00528: =C2=A0 =C2=A0recipe_ref =3D oe.sp=
dx.SPDXExternalDocumentRef()<br>=C2=A0 =C2=A0 =C2=A00529: =C2=A0 =C2=A0reci=
pe_ref.externalDocumentId =3D &quot;DocumentRef-recipe-&quot; + <a href=3D"=
http://recipe.name">recipe.name</a><br>File: &#39;/home/jq/foundries/git/po=
ky/meta/lib/oe/sbom.py&#39;, lineno: 50, function: write_doc<br>=C2=A0 =C2=
=A0 =C2=A00046: =C2=A0 =C2=A0 =C2=A0 =C2=A0doc_sha1 =3D spdx_doc.to_json(f,=
 sort_keys=3DTrue, indent=3Dindent)<br>=C2=A0 =C2=A0 =C2=A00047:<br>=C2=A0 =
=C2=A0 =C2=A00048: =C2=A0 =C2=A0l =3D spdx_deploy / &quot;by-namespace&quot=
; / spdx_doc.documentNamespace.replace(&quot;/&quot;, &quot;_&quot;)<br>=C2=
=A0 =C2=A0 =C2=A00049: =C2=A0 =C2=A0l.parent.mkdir(exist_ok=3DTrue, parents=
=3DTrue)<br>=C2=A0*** 0050: =C2=A0 =C2=A0l.symlink_to(os.path.relpath(dest,=
 l.parent))<br>=C2=A0 =C2=A0 =C2=A00051:<br>=C2=A0 =C2=A0 =C2=A00052: =C2=
=A0 =C2=A0return doc_sha1<br>=C2=A0 =C2=A0 =C2=A00053:<br>=C2=A0 =C2=A0 =C2=
=A00054:<br>File: &#39;/usr/lib/python3.10/pathlib.py&#39;, lineno: 1255, f=
unction: symlink_to<br>=C2=A0 =C2=A0 =C2=A01251: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;&quot;&quot;<br>=C2=A0 =C2=A0 =C2=A01252: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Make this path a symlink pointing to the target path.<br>=C2=A0 =C2=A0 =
=C2=A01253: =C2=A0 =C2=A0 =C2=A0 =C2=A0Note the order of arguments (link, t=
arget) is the reverse of os.symlink.<br>=C2=A0 =C2=A0 =C2=A01254: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>=C2=A0*** 1255: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0self._accessor.symlink(target, self, target_is_directory)<br>=C2=
=A0 =C2=A0 =C2=A01256:<br>=C2=A0 =C2=A0 =C2=A01257: =C2=A0 =C2=A0def hardli=
nk_to(self, target):<br>=C2=A0 =C2=A0 =C2=A01258: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;&quot;&quot;<br>=C2=A0 =C2=A0 =C2=A01259: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Make this path a hard link pointing to the same file as *target*.<br>Exc=
eption: FileExistsError: [Errno 17] File exists: &#39;../recipes/recipe-qui=
lt-native.spdx.json&#39; -&gt; &#39;/home/jq/foundries/git/poky/build/tmp/w=
ork/x86_64-linux/quilt-native/0.67-r0/spdx/deploy/by-namespace/http:__spdx.=
org_spdxdoc_recipe-quilt-native-16737c05-483f-569e-ab20-5a7a779c8317&#39;<b=
r><br>ERROR: Logfile of failure stored in: /home/jq/foundries/git/poky/buil=
d/tmp/work/x86_64-linux/quilt-native/0.67-r0/temp/log.do_create_spdx.138609=
5<br>ERROR: Task (mc:k3r5-gp:/home/jq/foundries/git/poky/meta/recipes-devto=
ols/quilt/quilt-native_0.67.bb:do_create_spdx) failed with exit code &#39;1=
&#39;<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m not sure I would take a revert as I did carefully check this patch<=
br>
and I think it does fix a number of problems.<br></blockquote><div><br>I un=
derstand and use this patch for a bunch of other machines and it works in a=
ll of them.</div><div>When writing this last=C2=A0sentence=C2=A0I remembere=
d that I use the patch as well in some other multiconfig machines</div><div=
>but these ones are from Xilinx=C2=A0that=C2=A0has one TMP folder for each =
machine.</div><div><br>Is not the first time I have an issue with multiconf=
ig machines that uses the same TMP</div><div>folder and looks like this can=
 be the issue with the=C2=A0TI machines.</div><div><br></div><div>Jose</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000631ce805f28aecde--

