Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EE5C77B7C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:20:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.94373.1683498020784806790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 15:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qfwo/6SM;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-304935cc79bso3629540f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683498019; x=1686090019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PNCV4zRV/Jw1yuOavLrbsAfa+u4YuBMIlJbfYgsnJVE=;
        b=qfwo/6SMhnbSKQGQrr9ZDaHR3rCMLE6Yo8W6pQlC+NhUqOhk7R38PVHSF/G8I7DDIr
         lKZ+SY0FNVLT8o43CQPlQaztY5RMxTFnMU06cYVIt+hh/+0PLORWHB+/gcLdstb9oVL2
         vzizA2uWzTMGdLTux6i+bM2Cmvf4ZpxLKsLz92QH0X7XqimwQVQN4y2XwJr2qE6QBZFw
         KnuIcFNVm+8fHJJjIbsZ5sVagSKcRPPii9SuSyuVHpq7moGaBKCxMkPVmhrIu6lwTPDk
         +xdkd9aYMsMTmnKQmsyb1/Gcz7woI53D80FmzVN+93tlRHeffPYBJJupmcpYK6TRFgtk
         VQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683498019; x=1686090019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNCV4zRV/Jw1yuOavLrbsAfa+u4YuBMIlJbfYgsnJVE=;
        b=Nuw6Y0gVPXhoo1BA3VmCdHz3juJk7u2uKlkcuWVVK1JFBxgdflNFzRY+97H+Fmmudu
         l/kmrW03NUyclK2NZYndxG3lC/k7K5H5WTkI8xIWiBfrLW8CX4f/Osh58coXs4rO7IMB
         Rqge852esY9Rsb2qxEdD7m9+0UvdFRmEzrkaJcspCxLuoEVWj5khWcHk/nuI6K2L0W48
         PMmy+6KrWeW7A0L/9Ea8xxvtZFkGZmitgzhOE7NphqMTli4ofpm77lYOL4yrZDwOkjHI
         JcUKNTcCGb0MT+MObwcR1iiZyNS3WDFaG81Qo9GiIQeGdy4/oiC0sL0upTDyMBh+s0qe
         7RPw==
X-Gm-Message-State: AC+VfDyJ3XAnxH2XLFdeKLY8t4cFXmX1AdGq8zp02QMqP/WCiTchisyB
	BUF7BFdVj4mrfW2AFQfQM3IMhPU8FXImjq1iIRI=
X-Google-Smtp-Source: ACHHUZ4Z5GLIyES+QasS3YERtvrfVWnyNu2U85ozL+KGaNn4nnYF1l2C++vG6GZ46KvymWNrUyO6fPy0blOXHshrCt4=
X-Received: by 2002:a5d:560c:0:b0:306:3381:67fe with SMTP id
 l12-20020a5d560c000000b00306338167femr5648943wrv.27.1683498018948; Sun, 07
 May 2023 15:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230505163601.6708-1-rs@ti.com> <CA+chaQd0iy1pv1QBhueS1fbpu0=fPzOU9Unr7+ROnGntuOUOcA@mail.gmail.com>
 <DB5PR02MB10213095D76376494151E4B01EF709@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213095D76376494151E4B01EF709@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 May 2023 00:19:59 +0200
Message-ID: <CA+chaQfuTxjoqm8RJO6RARF031YEmBa2g3dZo_A0b5TX7XB9vA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devicetree: allow specification of dtb directory
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "rs@ti.com" <rs@ti.com>, "afd@ti.com" <afd@ti.com>, "detheridge@ti.com" <detheridge@ti.com>, 
	"reatmon@ti.com" <reatmon@ti.com>, "denis@denix.org" <denis@denix.org>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006649b605fb21edb9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 22:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181011

--0000000000006649b605fb21edb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

or
if "${@'true' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else
'false'}"; then
to avoid test as well (like systemd recipes is using) and I did here as
well in:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster&id=3De2a6da5202a6671113758f9746ddbd8141a75757

On Sun, May 7, 2023 at 10:49=E2=80=AFPM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> [ Outlook does not support commenting inline for HTML mails, thus I=E2=80=
=99m top
> posting=E2=80=A6]
>
>
>
> The problem is `=3D=3D`, which is a bashism. POSIX shells (like dash) onl=
y
> support `=3D`. When it comes to quoting, you typically want to quote shel=
l
> variables in tests in case they are empty. OTOH, static strings without
> whitespace or other special characters do not need quoting. So the correc=
t
> way to write the if statements is:
>
>
>
>                if [ "${KERNEL_DTBVENDORED}" =3D false ]; then
>
>
>
> (In this case it is actually a bitbake variable being quoted, but unless
> you can guarantee it is not empty, the same rule applies.)
>
>
>
> //Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Martin Jansa
> *Sent:* den 6 maj 2023 11:10
> *To:* rs@ti.com
> *Cc:* afd@ti.com; detheridge@ti.com; reatmon@ti.com; denis@denix.org;
> alexandre.belloni@bootlin.com; openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][PATCH] kernel-devicetree: allow specification of
> dtb directory
>
>
>
> On Fri, May 5, 2023 at 6:38=E2=80=AFPM Randolph Sapp via lists.openembedd=
ed.org
> <rs=3Dti.com@lists.openembedded.org> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> Fedora/Redhat and Arch are somewhat standardized on their dtb directory
> structure. Let's add some flags to configure yocto to mimic that
> behavior.
>
> Add the following variables to the kernel class:
>         - KERNEL_DTBDEST (controls the destination directory for dtbs)
>         - KERNEL_DTBVENDORED (controls if vendor subdirectories are to
>           be respected)
>
> Currently KERNEL_DTBDEST is expected to be a subdir of KERNEL_IMAGEDEST
> and KERNEL_DTBVENDORED is expected to be "true"/"false". This only
> applies to the package directory structure. The deploydir structure is
> purposely left untouched for compatibility with existing recipes.
>
> By default this is configured to behave the same as the current recipe
> and produce a flat dtb directory at KERNEL_IMAGEDEST.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>
> Well, suppose I was breaking things by submitting this to kirkstone
> first. This is just the master version of the following patchset:
> https://lists.openembedded.org/g/openembedded-core/message/180754
>
> I'd love to get that series merged as well if this patch is acceptable.
>
>  meta/classes-recipe/kernel-devicetree.bbclass | 22 ++++++++++++++-----
>  meta/classes-recipe/kernel.bbclass            |  2 ++
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-devicetree.bbclass
> b/meta/classes-recipe/kernel-devicetree.bbclass
> index 4d0ecb1032..a6c6c5f227 100644
> --- a/meta/classes-recipe/kernel-devicetree.bbclass
> +++ b/meta/classes-recipe/kernel-devicetree.bbclass
> ...
>
>
>
> -               dtb_base_name=3D`basename $dtb .$dtb_ext`
>                 dtb_path=3D`get_real_dtb_path_in_kernel "$dtb"`
> -               install -m 0644 $dtb_path
> ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> +               if [ ${KERNEL_DTBVENDORED} =3D=3D "false" ]; then
>
>
>
> dash doesn't like this:
>
>
>
>  /bin/dash -c "if [ false =3D=3D "false" ]; then echo foo; fi"
>
>
>
> add quotes or use single '=3D'.
>
>
>
> +                       dtb_ext=3D${dtb##*.}
> +                       dtb_base_name=3D`basename $dtb .$dtb_ext`
> +                       dtb=3D$dtb_base_name.$dtb_ext
> +               fi
> +               install -Dm 0644 $dtb_path ${D}/${KERNEL_DTBDEST}/$dtb
>         done
>  }
>
> @@ -88,7 +97,10 @@ do_deploy:append() {
>                 dtb_ext=3D${dtb##*.}
>                 dtb_base_name=3D`basename $dtb .$dtb_ext`
>                 install -d $deployDir
> -               install -m 0644
> ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> +               if [ ${KERNEL_DTBVENDORED} =3D=3D "false" ]; then
>
>
>
> Same here
>
>
>
> +                       dtb=3D$dtb_base_name.$dtb_ext
> +               fi
> +               install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb
> $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
>                 if [ "${KERNEL_IMAGETYPE_SYMLINK}" =3D "1" ] ; then
>                         ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> $deployDir/$dtb_base_name.$dtb_ext
>                 fi
>
>

--0000000000006649b605fb21edb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">or<div>if &quot;${@&#39;true&#39; if oe.types.boolean(d.ge=
tVar(&#39;KERNEL_DTBVENDORED&#39;)) else &#39;false&#39;}&quot;; then<br></=
div><div>to avoid test as well (like systemd recipes is using) and I did he=
re as well in:</div><div><a href=3D"https://git.openembedded.org/openembedd=
ed-core-contrib/commit/?h=3Djansa/master&amp;id=3De2a6da5202a6671113758f974=
6ddbd8141a75757">https://git.openembedded.org/openembedded-core-contrib/com=
mit/?h=3Djansa/master&amp;id=3De2a6da5202a6671113758f9746ddbd8141a75757</a>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sun, May 7, 2023 at 10:49=E2=80=AFPM Peter Kjellerstedt &lt;<a hre=
f=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div cl=
ass=3D"msg-8168117611292164359">





<div lang=3D"SV" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-8168117611292164359WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
[ Outlook does not support commenting inline for HTML mails, thus I=E2=80=
=99m top posting=E2=80=A6]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
The problem is `=3D=3D`, which is a bashism. POSIX shells (like dash) only =
support `=3D`. When it comes to quoting, you typically want to quote shell =
variables in tests in case
 they are empty. OTOH, static strings without whitespace or other special c=
haracters do not need quoting. So the correct way to write the if statement=
s is:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas;c=
olor:rgb(148,54,52)">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ &quot;${KERNEL_DTBVENDORED}&quot; =3D f=
alse ]; then<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
(In this case it is actually a bitbake variable being quoted, but unless yo=
u can guarantee it is not empty, the same rule applies.)<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(148,54,52)">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"=
mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembe=
dded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Martin Jansa<br>
<b>Sent:</b> den 6 maj 2023 11:10<br>
<b>To:</b> <a href=3D"mailto:rs@ti.com" target=3D"_blank">rs@ti.com</a><br>
<b>Cc:</b> <a href=3D"mailto:afd@ti.com" target=3D"_blank">afd@ti.com</a>; =
<a href=3D"mailto:detheridge@ti.com" target=3D"_blank">detheridge@ti.com</a=
>; <a href=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a>; =
<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>; <=
a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">alexandre=
.belloni@bootlin.com</a>; <a href=3D"mailto:openembedded-core@lists.openemb=
edded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><b=
r>
<b>Subject:</b> Re: [OE-core][PATCH] kernel-devicetree: allow specification=
 of dtb directory<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, May 5, 2023 at 6:38=E2=80=AFPM Randolph Sapp=
 via <a href=3D"http://lists.openembedded.org" target=3D"_blank">
lists.openembedded.org</a> &lt;rs=3D<a href=3D"mailto:ti.com@lists.openembe=
dded.org" target=3D"_blank">ti.com@lists.openembedded.org</a>&gt; wrote:<u>=
</u><u></u></p>
</div>
<div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal">From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com"=
 target=3D"_blank">rs@ti.com</a>&gt;<br>
<br>
Fedora/Redhat and Arch are somewhat standardized on their dtb directory<br>
structure. Let&#39;s add some flags to configure yocto to mimic that<br>
behavior.<br>
<br>
Add the following variables to the kernel class:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - KERNEL_DTBDEST (controls the destination dire=
ctory for dtbs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - KERNEL_DTBVENDORED (controls if vendor subdir=
ectories are to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be respected)<br>
<br>
Currently KERNEL_DTBDEST is expected to be a subdir of KERNEL_IMAGEDEST<br>
and KERNEL_DTBVENDORED is expected to be &quot;true&quot;/&quot;false&quot;=
. This only<br>
applies to the package directory structure. The deploydir structure is<br>
purposely left untouched for compatibility with existing recipes.<br>
<br>
By default this is configured to behave the same as the current recipe<br>
and produce a flat dtb directory at KERNEL_IMAGEDEST.<br>
<br>
Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
---<br>
<br>
Well, suppose I was breaking things by submitting this to kirkstone<br>
first. This is just the master version of the following patchset:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18075=
4" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/180754</a><br>
<br>
I&#39;d love to get that series merged as well if this patch is acceptable.=
<br>
<br>
=C2=A0meta/classes-recipe/kernel-devicetree.bbclass | 22 ++++++++++++++----=
-<br>
=C2=A0meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 ++<br>
=C2=A02 files changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-r=
ecipe/kernel-devicetree.bbclass<br>
index 4d0ecb1032..a6c6c5f227 100644<br>
--- a/meta/classes-recipe/kernel-devicetree.bbclass<br>
+++ b/meta/classes-recipe/kernel-devicetree.bbclass<br>
...<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0dtb_base_name=3D`basename $dtb .$dtb_ext`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path=3D`get_rea=
l_dtb_path_in_kernel &quot;$dtb&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 $dt=
b_path ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KERNEL_DTBVE=
NDORED} =3D=3D &quot;false&quot; ]; then<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">dash doesn&#39;t like this:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0/bin/dash -c &quot;if [ false =3D=3D &quot;fal=
se&quot; ]; then echo foo; fi&quot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">add quotes or use single &#39;=3D&#39;.<u></u><u></u=
></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_ext=3D${dtb##*.}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dtb_base_name=3D`basename $dtb .$dtb_ext`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dtb=3D$dtb_base_name.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm 0644 $d=
tb_path ${D}/${KERNEL_DTBDEST}/$dtb<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
@@ -88,7 +97,10 @@ do_deploy:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_ext=3D${dtb##*.=
}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_base_name=3D`ba=
sename $dtb .$dtb_ext`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d $deployD=
ir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${K=
ERNEL_DTB_NAME}.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KERNEL_DTBVE=
NDORED} =3D=3D &quot;false&quot; ]; then<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Same here<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb=3D$dtb_base_name.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_=
ext<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${KERNEL=
_IMAGETYPE_SYMLINK}&quot; =3D &quot;1&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dt=
b_base_name.$dtb_ext<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<u></u><u></u></p=
>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000006649b605fb21edb9--

