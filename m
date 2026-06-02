Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89331CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 09:31:23 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21070.1780392681138872267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 02:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S30BESEJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-516d0db9372so98807951cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 02:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780392680; cv=none;
        d=google.com; s=arc-20240605;
        b=NDP+U7pr6yPwkDNffWY88dXtiCmMVKV9DretmQgetPCycJQ5uTjVwJB7i3efeWs4aL
         eheM1V/hZPUL9F4UFXtEM4QVXSQIkRye6NxWdSWknCM5LqiktLHy7pj2cCB7Gu/UHSLi
         83oG5vPzqIk2sKNcPgZuamHvd4KsGCE33tvnsMOI77rWxuapzn6cHnBzYiv9XYAkq5Np
         OyRAf36/GCQG2kSZ2MK72Q8blQSWQA3IIMKSy/BlwoRyGVln+qbyxehoUk1bX5haW0Sa
         5UEVNEnWtZR+Eu642eNgvBJ4CtwAThq1imNJpXnYD9rHJ8G3Qs9Mrvub8I6hGKkCyHTd
         7oMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+JJ0kXBnclf2WC7Tk97JB3Vhq/fFHjOuOq5X9GTIS5o=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=IWgM91KTBPoTNfjDNv7NDKRrd4tArzQbqeS3wjLvu9CLb4sUGn9fqwsXc6NOQ/qa7X
         vXiROvxsX3Z7yHgekiKdxFCkpswqphvDUwFwS2z4cHyQfcw8pvriDgyK0YcJd6TO9Ffx
         rtzKqr5vBvxamKmFLbIuXr9p9NkgbxfUNmJ20eaeUPCWl2ZykquzZ5W+4Oe8UG8nnbfw
         ROhCgnzUT+oPNGr3UQmCVupjrxszNSP+qcP2/1O4t1baXvlT1ZMWAmDhTNTOXKoZukM2
         BhnPGgeGJcgUkfLuW1mHBc1fQleBjr2C15lYirMK53cKRLcXhQ7NdIAhUCzNhZsbiQRh
         35Ig==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780392680; x=1780997480; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+JJ0kXBnclf2WC7Tk97JB3Vhq/fFHjOuOq5X9GTIS5o=;
        b=S30BESEJTTVViXDQcNxeY8mZE1hiFxKacw3YOtrZR90AesNpVB96hqU60sRSPj90Ay
         Per01McbNRWxq77iFfYazDq3Fyhvun15LL0Tl6Ov5fv0cVh3Pxx5FkxsDiEfdWcgPwRv
         G6OtMs4/nnhAo5XV37ydm3we2XZaPbDhv0tUPUEH5RpMWJwkVZUD9yowyXgTvxDHCd+U
         CV6PegvFaVu0+mV9TrhfSLhBzs+3f+IuKRK7OdJDIprQqqK9dFLjCZkWZ5gXmy0uOHyY
         B+Heogi28prkGE6d8WjqiY+fMFXJLWAP4/4HZEwMaLav0Cyhq7xONMMa/RkZ+Q6MnueZ
         rZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392680; x=1780997480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JJ0kXBnclf2WC7Tk97JB3Vhq/fFHjOuOq5X9GTIS5o=;
        b=YBhIjAk/vKdLLDeo/shHulBB2fuFA+rgilXMQD4+dCgqK/70Vfs9IDZoUsiyPiLVRG
         NhMk1K1/bSAAdbt07JTg1TtJn6YY/F0eYS21ejwZo8Oo7zbKq6T78UWKJAQJMDSUkbwY
         LXO9yoTM8dQu6mN+AYk2SoT+A8u/MPCZQR4vY701uJxcB8E4c5DHv9Q89mMhO73W5u2F
         w5yyXk3yCwOeu+RitKV3mCToGE4MuqWycnY8qo32REM+Z1iDXUgAVtTMcNC5ax0BJH5C
         6rirm4lCOVvyN8c4BL3fFNtQZyn1imH+dYfcXeZ3WCm6Y2ZXqKBXq5LPGkiz0Pma/7H8
         P8gA==
X-Gm-Message-State: AOJu0YwgPdrTW/OGKiv/GBauvvxbWaxpZq3h/yg+1HrsB9iA7g3LNRux
	HCyKxVcRkBPScZkCltMIAbFE45OCjjwCXnmjHCgJl6jNEt/tD2fJ6WdL1Z3fDvBd5n/WloLYVf0
	dmnqv1auriZq5tkRWVSCasuoHU9snNqSN3aHOjnwvUw==
X-Gm-Gg: Acq92OEfHxGAYTkOYoG6IUW84JmjmJ/Vos27mX8OxDypi6d9t4oSAd0EjP90KVzQ/et
	Js6Yly6IAIjEkeQauEz4zDCMBw/w0j3FjPMa9QQJnHTG5tPFgsTJq9wy2gbf2eE6DeOdsyn5c9G
	GlYHOLMyxPFFq7rzu8F3sCefQ3d1PAyRBdkdIii/r0VHpUJT7nJUL/mxnwW2AhszjU4gzcKsRRt
	cImlCNyJYcOp4XGnX/dKjGRsK1tKFmUiMjIUpWK5+Yvy2iG3d1Fq7NgWbW4F97CNuLoFYFafKT+
	Ont3NUOwuydCJdAl7DtiqiPrrhNZ89bNLqzGc4P4z7eTovi3dw==
X-Received: by 2002:a05:622a:1f16:b0:50d:edcd:4f39 with SMTP id
 d75a77b69052e-5173a834783mr205096421cf.40.1780392679794; Tue, 02 Jun 2026
 02:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260601165912.533636-1-sivakumar.bs@gmail.com> <DIYFVYFWGIGJ.1GE117T1IOCR9@bootlin.com>
In-Reply-To: <DIYFVYFWGIGJ.1GE117T1IOCR9@bootlin.com>
From: Siva Kumar Balasubramanian <sivakumar.bs@gmail.com>
Date: Tue, 2 Jun 2026 15:00:53 +0530
X-Gm-Features: AVHnY4KoqVibheeYZ6SaBAvQtVEPh1fKF4UKIZpA_-5XG3pjF-QedFgCEh-UIiM
Message-ID: <CACFV95LZwuSSnt38Qpwpu9KbESyJCoLW2NA6kOfOR+v6WqiU5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] qemuboot.bbclass: add missing task
 dependency on kernel deploy
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003d6b0f065341f947"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 09:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238023

--0000000000003d6b0f065341f947
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

KERNEL_DEPLOY_DEPEND is only defined in image.bbclass,
so in baremetal recipes that don't inherit it, the variable is unset and
[depends] +=3D gets an empty string, causing the unpack failure.
Fix is to add KERNEL_DEPLOY_DEPEND ?=3D "virtual/kernel:do_deploy" in
qemuboot.bbclass itself, mirroring the same pattern in image.bbclass. Will
send v3 shortly.
Thanks for catching this.

Siva

On Tue, Jun 2, 2026 at 2:31=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Mon Jun 1, 2026 at 6:59 PM CEST, Siva Balasubramanian via
> lists.openembedded.org wrote:
> > do_write_qemuboot_conf had no dependency on the kernel deploy task,
> > so if the kernel was rebuilt without invalidating the rootfs sstate,
> > the task was skipped and .qemuboot.conf was left stale while new
> > image artifacts were deployed with a new timestamp suffix.
> >
> > Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND, which
> > is the same variable used by do_build[depends] in image.bbclass for
> > the same reason. Since KERNEL_DEPLOY_DEPEND is defined with ?=3D it
> > correctly handles firmware and baremetal images that override it to
> > their own deploy target.
> >
> > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
> > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> > ---
> >  meta/classes-recipe/qemuboot.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes-recipe/qemuboot.bbclass
> b/meta/classes-recipe/qemuboot.bbclass
> > index 56106b1958..db971d50bd 100644
> > --- a/meta/classes-recipe/qemuboot.bbclass
> > +++ b/meta/classes-recipe/qemuboot.bbclass
> > @@ -128,6 +128,7 @@ inherit image-artifact-names
> >
> >  # Create qemuboot.conf
> >  addtask do_write_qemuboot_conf after do_rootfs before do_image
> > +do_write_qemuboot_conf[depends] +=3D "${KERNEL_DEPLOY_DEPEND}"
> >
> >  def qemuboot_vars(d):
> >      build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>
> So I struggle to understand why, but it looks lie this patch is
> responsible of this error on the autobuilder:
>
> Parsing recipes...ERROR: Unable to parse
> /srv/pokybuild/yocto-worker/a-full/build/layers/openembedded-core/meta/re=
cipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> Traceback (most recent call last):
>   File
> "/srv/pokybuild/yocto-worker/a-full/build/layers/bitbake/lib/bb/cooker.py=
",
> line 2334, in parse_next
>     raise result
> ValueError: not enough values to unpack (expected 2, got 1)
>
> ERROR: Parsing halted due to errors, see error messages above
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3909
>
> Any clue about what might be wrong is welcome.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20

Sivakumar B

--0000000000003d6b0f065341f947
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi Mathieu,</div><div class=3D"gmail_default" style=3D"=
font-family:arial,helvetica,sans-serif"><br>KERNEL_DEPLOY_DEPEND is only de=
fined in image.bbclass,=C2=A0</div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif">so in baremetal recipes that don&#39;=
t inherit it, the variable is unset and [depends] +=3D gets an empty string=
, causing the unpack failure.<br>Fix is to add KERNEL_DEPLOY_DEPEND ?=3D &q=
uot;virtual/kernel:do_deploy&quot; in qemuboot.bbclass itself, mirroring th=
e same pattern in image.bbclass. Will send v3 shortly.<br>Thanks for catchi=
ng this.</div><div class=3D"gmail_default" style=3D"font-family:arial,helve=
tica,sans-serif"><br>Siva</div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2026 at=
 2:31=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois=
-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Jun 1, 2026 at=
 6:59 PM CEST, Siva Balasubramanian via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrot=
e:<br>
&gt; do_write_qemuboot_conf had no dependency on the kernel deploy task,<br=
>
&gt; so if the kernel was rebuilt without invalidating the rootfs sstate,<b=
r>
&gt; the task was skipped and .qemuboot.conf was left stale while new<br>
&gt; image artifacts were deployed with a new timestamp suffix.<br>
&gt;<br>
&gt; Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND, which<br>
&gt; is the same variable used by do_build[depends] in image.bbclass for<br=
>
&gt; the same reason. Since KERNEL_DEPLOY_DEPEND is defined with ?=3D it<br=
>
&gt; correctly handles firmware and baremetal images that override it to<br=
>
&gt; their own deploy target.<br>
&gt;<br>
&gt; Fixes: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14520" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D14520</a><br>
&gt; Signed-off-by: Siva Balasubramanian &lt;<a href=3D"mailto:sivakumar.bs=
@gmail.com" target=3D"_blank">sivakumar.bs@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/qemuboot.bbclass | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recip=
e/qemuboot.bbclass<br>
&gt; index 56106b1958..db971d50bd 100644<br>
&gt; --- a/meta/classes-recipe/qemuboot.bbclass<br>
&gt; +++ b/meta/classes-recipe/qemuboot.bbclass<br>
&gt; @@ -128,6 +128,7 @@ inherit image-artifact-names<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Create qemuboot.conf<br>
&gt;=C2=A0 addtask do_write_qemuboot_conf after do_rootfs before do_image<b=
r>
&gt; +do_write_qemuboot_conf[depends] +=3D &quot;${KERNEL_DEPLOY_DEPEND}&qu=
ot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def qemuboot_vars(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 build_vars =3D [&#39;MACHINE&#39;, &#39;TUNE_ARCH&=
#39;, &#39;DEPLOY_DIR_IMAGE&#39;,<br>
<br>
So I struggle to understand why, but it looks lie this patch is<br>
responsible of this error on the autobuilder:<br>
<br>
Parsing recipes...ERROR: Unable to parse /srv/pokybuild/yocto-worker/a-full=
/build/layers/openembedded-core/meta/recipes-extended/baremetal-example/<a =
href=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">baremetal-helloworld_git.bb</a><br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/a-full/build/layers/bitbake/l=
ib/bb/cooker.py&quot;, line 2334, in parse_next<br>
=C2=A0 =C2=A0 raise result<br>
ValueError: not enough values to unpack (expected 2, got 1)<br>
<br>
ERROR: Parsing halted due to errors, see error messages above<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3909" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/3909</a><br>
<br>
Any clue about what might be wrong is welcome.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><br></div>Sivakumar B=
<span></span><span></span></div></div></div></div>

--0000000000003d6b0f065341f947--

