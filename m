Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A601C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 09:46:22 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.23907.1716803171732524197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 02:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=FZwy3ZEm;
 spf=pass (domain: snapchat.com, ip: 209.85.167.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52388d9ca98so16490257e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 02:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1716803170; x=1717407970; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HtxnedxojgoMTZ3h9LmrnUPORKRvf3g1soQETqL3/F4=;
        b=FZwy3ZEmPvf9lYOqMl5YKgv5Y63ab2Y9Giusvppk/JgMxt/x9RsBhRvYOEr/C+AOIT
         CpQfC+Ba0WBP2+uTJ/fV3/S6WRg1jc4wTin3idjHwtL9w3a4G40gjt9pB9muGj4NZ8aE
         OsMTAmzvDPzkm4X3ebzUF6PUhMdQojU9EN9/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803170; x=1717407970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtxnedxojgoMTZ3h9LmrnUPORKRvf3g1soQETqL3/F4=;
        b=vleSbq1xunO9zooCPFfXLc0cBxOmSYcx2qP2BOFDpQz03EeeL6eYGAFvJpxvFF5e5G
         H2XOgdzGItbo8SfDP+9BxS9oFNNIUqigjqF95gn9rZsB0BQ4w0oBdSNacO/AjMk56Vs5
         HTRckoAJts1mNrI/t+qYXJMXFZqOXTn8L6l1SAhELTfXqm20iaQFJqIj16qtG6YnU7eQ
         5A90YVFWgGsLLu7iy+4TSQO/d0rIGRB0vAUvSJNw6BkLsx9nTEgOK8QUx1SnVqD3LCgO
         xo5rAT31xWy9HDZ08MQPcqNMoulVH12Kc/4uFeP9GCNpNRWyAONU72J8u6VI2sgCBonT
         mQ8w==
X-Gm-Message-State: AOJu0YxyodKbhuv1gGjacfUYZcBKJxltu8805bWYJBSqHicCdradS5tB
	sIhV4Poec09fGANGWtEYeuGXgO9HirK7Sj9/ZU4dvBALZ4s2GHdfqTsPFzpXf7+1alqCecMROTk
	5OVxPpk7WV25HobwvHn7nO586v1yB/jUjPw7Odw==
X-Google-Smtp-Source: AGHT+IFX1TjLHQWFQVVR/KQyDhGOPXpYJVG3C2/Ziw3IDtWkEpd+CCvEnmkVCDRDyTziXrH+SkYp6MYpqWiK8lEm09E=
X-Received: by 2002:a05:6512:3055:b0:51d:9291:6945 with SMTP id
 2adb3069b0e04-5296736b9b9mr8958738e87.44.1716803169634; Mon, 27 May 2024
 02:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUKmYaFA8_eHrSCqknXqDfPfkwySdjqxWKvo6thuAAmD4guNw@mail.gmail.com>
 <73130ae89b57e6af9749dbead7dc3f42894e04e7.camel@linuxfoundation.org>
In-Reply-To: <73130ae89b57e6af9749dbead7dc3f42894e04e7.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 27 May 2024 11:45:58 +0200
Message-ID: <CAHUKmYYiOTTz=PLdb8d3Q5X8muZH754Kqz2kBmkfr=Kqp5CTQg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v5] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000013bc8a06196c6347"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 09:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199898

--00000000000013bc8a06196c6347
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I also apologize for replying late. I was busy with other things and
haven't found time to rework this patch.

> Firstly, can I ask why you're using a non-default directory for ${S}?
> Is this as a way of doing a kind of external source usage?

My use-case is that the BSP I am using includes the source of the kernel as
source alongside the BSP yocto layer (not in an extra git repository), and
then points S to the directory containing the sources of the kernel without
using the externalsrc class (as far as I know the externalsrc class isn't
meant for this use-case, since there are several recipes provided as source
in this way, and externalsrc only has one path pointing to the external
source).

I agree with you that the complexity of this function is very high, so not
supporting a non-default S would be a better solution in this case. I'll
try to rework the patch and test it with externalsrc as well.

=C3=89tienne

On Fri, Feb 9, 2024 at 6:36=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2023-12-21 at 22:49 +0100, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > The function do_symlink_kernsrc is not reentrant in the case where S is
> defined
> > to a non-default value. This causes build-failures e.g. when building
> linux-yocto, then updating
> > poky to a commit which modifies kernel.bbclass, and then building
> linux-yocto again.
> >
> > Bugzilla:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproj=
ect.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3De0i=
Yk69Iih3UnIjABITtc6yS38bhv_6P4NMuSpVmmoSHk1-sSuvH3y702O0nTeZj&s=3DOtiPnSuoZ=
jUXFgz9pxbGOOyjQmKPEq-OhEbhtsAmvZE&e=3D
> >
> > Tested with a recipe "my-custom-linux" which unpacks sources to a custo=
m
> ${S} directory
> > and ran symlink_kernsrc several times:
> > $ bitbake -f -c symlink_kernsrc my-custom-linux
>
> Sorry for the delay in getting back to review this patch. I'm extremely
> worried about adding complexity into this function, particularly as
> that complexity is now adding in significant overhead.
>
> Firstly, can I ask why you're using a non-default directory for ${S}?
> Is this as a way of doing a kind of external source usage?
>
> Having spent time looking at what this code is doing, in normal usage,
> S gets set to STAGING_KERNEL_DIR, the source is unpacked there and none
> of this code triggers.
>
> For EXTERNALSRC, a symlink is put in place. The code should remove a
> symlink if present and create it with the current setup. In that sense,
> this patch isn't doing the right thing.
>
> I'm very tempted to say the "using a non default S value" just error
> out.
>
> Whilst I understand how we got to this level of complexity, I think it
> will just end up causing us pain in the long run and I'd rather just
> not support it.
>
> Cheers,
>
> Richard
>

--00000000000013bc8a06196c6347
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br><br>I also apologize for replying late. I w=
as busy with other things and haven&#39;t found time to rework this patch.<=
br><br>&gt; Firstly, can I ask why you&#39;re using a non-default directory=
 for ${S}?<br>&gt; Is this as a way of doing a kind of external source usag=
e?<br><br>My use-case is that the BSP I am using includes the source of the=
 kernel as source alongside the BSP yocto layer (not in an extra git reposi=
tory), and then points S to the directory containing the sources of the ker=
nel without using the externalsrc class (as far as I know the externalsrc c=
lass isn&#39;t meant for this use-case, since there are several recipes pro=
vided as source in this way, and externalsrc only has one path pointing to =
the external source).<br><br>I agree with you that the complexity of this f=
unction is very high,=C2=A0so not supporting=C2=A0a non-default S would be =
a better=C2=A0solution in this case. I&#39;ll try to rework the patch and t=
est it with externalsrc as well.<br><br>=C3=89tienne</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 9, 2024 at =
6:36=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2=
023-12-21 at 22:49 +0100, Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; The function do_symlink_kernsrc is not reentrant in the case where S i=
s defined<br>
&gt; to a non-default value. This causes build-failures e.g. when building =
linux-yocto, then updating<br>
&gt; poky to a commit which modifies kernel.bbclass, and then building linu=
x-yocto again.<br>
&gt; <br>
&gt; Bugzilla: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp=
s-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;d=3DDwIFaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3De0iYk69Iih3UnIjABITtc6yS38bhv_6P4NMuSp=
VmmoSHk1-sSuvH3y702O0nTeZj&amp;s=3DOtiPnSuoZjUXFgz9pxbGOOyjQmKPEq-OhEbhtsAm=
vZE&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fi=
d-3D15325&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3De0iYk69Iih3Un=
IjABITtc6yS38bhv_6P4NMuSpVmmoSHk1-sSuvH3y702O0nTeZj&amp;s=3DOtiPnSuoZjUXFgz=
9pxbGOOyjQmKPEq-OhEbhtsAmvZE&amp;e=3D</a> <br>
&gt; <br>
&gt; Tested with a recipe &quot;my-custom-linux&quot; which unpacks sources=
 to a custom ${S} directory<br>
&gt; and ran symlink_kernsrc several times:<br>
&gt; $ bitbake -f -c symlink_kernsrc my-custom-linux<br>
<br>
Sorry for the delay in getting back to review this patch. I&#39;m extremely=
<br>
worried about adding complexity into this function, particularly as<br>
that complexity is now adding in significant overhead.<br>
<br>
Firstly, can I ask why you&#39;re using a non-default directory for ${S}?<b=
r>
Is this as a way of doing a kind of external source usage?<br>
<br>
Having spent time looking at what this code is doing, in normal usage,<br>
S gets set to STAGING_KERNEL_DIR, the source is unpacked there and none<br>
of this code triggers.<br>
<br>
For EXTERNALSRC, a symlink is put in place. The code should remove a<br>
symlink if present and create it with the current setup. In that sense,<br>
this patch isn&#39;t doing the right thing.<br>
<br>
I&#39;m very tempted to say the &quot;using a non default S value&quot; jus=
t error<br>
out.<br>
<br>
Whilst I understand how we got to this level of complexity, I think it<br>
will just end up causing us pain in the long run and I&#39;d rather just<br=
>
not support it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--00000000000013bc8a06196c6347--

