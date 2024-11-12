Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2395CD32D8C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 10:26:37 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.83518.1731407192594852347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 02:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OZHInNF7;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c9ff17eddbso91133a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 02:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731407191; x=1732011991; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WpKgBE3XQkkxFCehnuB3TM+gNwJlwbUGfhBPopEHCVY=;
        b=OZHInNF7JC8gvrZQ58+hCaXVkK7zH+yiWn4pFJEDFXTJ3jBFvxe7P7aCsQ8nGPfBMf
         H+mm+HzvLpQABwc1b1Hfa1iYu3Dkda6V4cQ6VhK6ldujcKleC3QvzHDMZDmmcsxIVz7x
         pScF2lq9k4ebvwxUhvjxhdBtrezYR16wNRzWa9KHVMdYb0+ZyKfF54BzUeEriyux9fue
         UvHGHgc+nurflNXHvHU1AjuWD7DtVsgxS3bd0GtUaYseekZ2w0MYhoNhH+hWOjxyQrCG
         W+B3B+9KB7n1qtgzDluJd48JpA7YtK1pc++XqNVM8VjswyRc9x+qhg5thL39HlIF2IjO
         Zoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407191; x=1732011991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpKgBE3XQkkxFCehnuB3TM+gNwJlwbUGfhBPopEHCVY=;
        b=QgD9KeissUDcu8IdOX+ywrknJMeD6PQhkNdlVKqL184aO11W6Ij8P3jp3bRcRNqicF
         hkgifSN30st7LiC8qGWidM6zl7SsvNFm4KrRzVvy7S89crf7zE6BP81HUD2/slOaAd7m
         gX89eKI0xz0o6v+o+bu54VETpdmTGGiQQLXS90bS60nqZIjB7u3aJ8fEpA/cxKyhBwyB
         R0wrVLANE/w0zinqrlL2gugCHaH1BSvYwG0lbJEQPvkBWBN0njfyYdCMliEDg4+K5YFJ
         hJZ0DkujeBp/DU5Jzl7NVPJeoODKp7tO4fNUi+eAViKc6cuBjwyT9Bj3TjC7HNkcManm
         xtZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhdo/k77IrJTrSq6Wg/BZcKYmynhcpy75Nl1CNBQ5ByDVIkXNMnpB8Kj6VTZt6/Czb6eXBhHwxX8Ft2qibVIElJw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoFsU/0nl2Xa8MECHv3WzNsLfHgdOrjpu/t52tL9s0MoXGlHrd
	X9eDpRrkuL8sXkLZCUqhydlU0gZYyzh2Yuj3v2vO1xJCTCqZX1lghITpM17sUEv7+xdmUJprWdP
	hrmu5pwuszDQaQsRkfxXoSkSsSg0=
X-Google-Smtp-Source: AGHT+IEkScVQGMusozFJbAseTLCihKYcEBJngnzZwNnpmNLCj1NCMIGuxMce6aMMf9q+Kj5cHhyJEIY9hS1H3tBrjZk=
X-Received: by 2002:a05:6402:2794:b0:5cb:69ba:b3d1 with SMTP id
 4fb4d7f45d1cf-5cf0a441aefmr4677038a12.7.1731407190663; Tue, 12 Nov 2024
 02:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20241025161627.3352-1-sreejith.ravi087@gmail.com>
 <CANNYZj8+5LwPXrQ4eda4muAdOmpfvkg5oo0GXzCG+HJJh65vDQ@mail.gmail.com>
 <CAFt4JuEdi+zFkN37vvvK-PNtqshncC_8dn44gU+FcKXpde-ynA@mail.gmail.com>
 <CANNYZj-Q_Y4X80o_mbA=uEQ3gQbfwNB3bPcnu5-xvsOaPjKCbg@mail.gmail.com>
 <CAFt4JuGioQWK8G72z_J6aJvKscp7zy4W2ZQPWP1_imH_keGSog@mail.gmail.com> <a2870fb05d59ddd3578cee006200ed0d59919a48.camel@linuxfoundation.org>
In-Reply-To: <a2870fb05d59ddd3578cee006200ed0d59919a48.camel@linuxfoundation.org>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Tue, 12 Nov 2024 10:26:08 +0000
Message-ID: <CAFt4JuFFY=huUr=ZBxsb1g2mKHv8o6h9361ddhrv8c6r095eZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_manager : Add configuration option to
 select filterbydependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008faccc0626b4a670"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 10:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207040

--0000000000008faccc0626b4a670
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the detailed explanation. I understand the hesitancy around
adding an extra parameter, especially given the cost and maintenance
implications for both testing and long-term support. If we decide to
incorporate it, I agree that it would be essential to include it in our
test matrix to ensure it works reliably and doesn=E2=80=99t degrade over ti=
me.

One possible race condition could occur when there=E2=80=99s a parallel bui=
ld for
different images with distinct sets of required packages. For example, if
one process is running an opkg update while another is creating an index
with an opkg make index at the same time, this could cause the root
filesystem image installation to fail.

Regarding your concern about potential misuse and the risk of race
conditions like above, I share that reservation. Would it be helpful if we
documented these concerns prominently or added clear guidance on how to use
this parameter safely?

Thanks again for the details, which help me better understand Yocto
internals.

Sreejith

On Mon, Nov 11, 2024 at 1:08=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2024-11-11 at 09:53 +0000, Sreejith Ravi wrote:
> > We are not changing the default behavior of Yocto but are instead
> > using our own custom class to handle IPK.
> >
> > Since create_packages_dir is a function in rootfs.py, it would be
> > beneficial to add an option allowing users to select either the
> > deploy directory or oe-rootfs-repo. This would also save the copy
> > time to oe-rootfs when it is not required for their projects.
>
> For reference, the copy time here is minimal since the copy is created
> using hardlinks to the files.
>
> The reason this is done is to filter the packages to the ones directly
> in the recipe's dependency chain. This is because files can be written
> to tmp/deploy/ while an image build is running and this can cause build
> failures.
>
> For example consider core-image-sato-sdk and core-image-minimal being
> built in parallel. The minimal rootfs will happen before the sato-sdk
> one but if they all used the same directory, the minimal image could
> see pieces of the SDK image. The files may be seen partially through
> the write too.
>
> To avoid this and more complex forms of the race (where things are
> removed as they're rebuilt due to changes), we create the hardlinked
> copy of only the packages a given image recipe should "see".
>
> > Currently, in create_packages_dir, the option to check whether to
> > create "oe-rootfs-repo" or use a symlink from "DEPLOY_DIR_IPK" to
> > "oe-rootfs-repo" is ineffective with filterbydependencies, as it is
> > always set to True. Our request is to add a configuration option for
> > this behavior; otherwise, this check serves no purpose when used with
> > filterbydependencies.
> >
> >     if nodeps or not filterbydependencies:
> >         for arch in d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").split() +
> > d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").replace("-", "_").split():
> >             target =3D os.path.join(deploydir + "/" + arch)
> >             if os.path.exists(target):
> >                 oe.path.symlink(target, subrepo_dir + "/" + arch,
> > True)
> >         return
> >
> >
> > This patch does not change the existing functionality. By default, it
> > is set to True (consistent with default Yocto behavior), but users
> > can adjust it as needed.
>
> I'm not saying yes or no to the patch but you have to understand that
> adding an extra parameter means we have to support that code path.
> Should we include it in our test matrix? If we do, there is the cost of
> testing it but it should work. If we don't, there is a significant risk
> it might stop working at some point. There is therefore a cost/risk to
> both directions if we do add it.
>
> For me, the bigger concern is that we may then see people using this
> without understanding the race concerns above too.
>
> Cheers,
>
> Richard
>
>
>

--0000000000008faccc0626b4a670
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p>Thanks for the detailed explanation. I=
 understand the hesitancy around adding an extra parameter, especially give=
n the cost and maintenance implications for both testing and long-term supp=
ort. If we decide to incorporate it, I agree that it would be essential to =
include it in our test matrix to ensure it works reliably and doesn=E2=80=
=99t degrade over time.<br><br>One possible race condition could occur when=
 there=E2=80=99s a parallel build for different images with distinct sets o=
f required packages. For example, if one process is running an opkg update =
while another is creating an index with an opkg make index at the same time=
, this could cause the root filesystem image installation to fail.<br><br>R=
egarding your concern about potential misuse and the risk of race condition=
s like above, I share that reservation. Would it be helpful if we documente=
d these concerns prominently or added clear guidance on how to use this par=
ameter safely?<br><br>Thanks again for the details, which help me better un=
derstand Yocto internals.</p><p>Sreejith</p></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 11, 2024 at 1:08=E2=
=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Mon, 2024-11-11 at 09:53 +0000,=
 Sreejith Ravi wrote:<br>
&gt; We are not changing the default behavior of Yocto but are instead<br>
&gt; using our own custom class to handle IPK.<br>
&gt; <br>
&gt; Since create_packages_dir is a function in rootfs.py, it would be<br>
&gt; beneficial to add an option allowing users to select either the<br>
&gt; deploy directory or oe-rootfs-repo. This would also save the copy<br>
&gt; time to oe-rootfs when it is not required for their projects.<br>
<br>
For reference, the copy time here is minimal since the copy is created<br>
using hardlinks to the files.<br>
<br>
The reason this is done is to filter the packages to the ones directly<br>
in the recipe&#39;s dependency chain. This is because files can be written<=
br>
to tmp/deploy/ while an image build is running and this can cause build<br>
failures.<br>
<br>
For example consider core-image-sato-sdk and core-image-minimal being<br>
built in parallel. The minimal rootfs will happen before the sato-sdk<br>
one but if they all used the same directory, the minimal image could<br>
see pieces of the SDK image. The files may be seen partially through<br>
the write too.<br>
<br>
To avoid this and more complex forms of the race (where things are<br>
removed as they&#39;re rebuilt due to changes), we create the hardlinked<br=
>
copy of only the packages a given image recipe should &quot;see&quot;.<br>
<br>
&gt; Currently, in create_packages_dir, the option to check whether to<br>
&gt; create &quot;oe-rootfs-repo&quot; or use a symlink from &quot;DEPLOY_D=
IR_IPK&quot; to<br>
&gt; &quot;oe-rootfs-repo&quot; is ineffective with filterbydependencies, a=
s it is<br>
&gt; always set to True. Our request is to add a configuration option for<b=
r>
&gt; this behavior; otherwise, this check serves no purpose when used with<=
br>
&gt; filterbydependencies.<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 if nodeps or not filterbydependencies:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 for arch in d.getVar(&quot;ALL_MULTILIB_PA=
CKAGE_ARCHS&quot;).split() +<br>
&gt; d.getVar(&quot;ALL_MULTILIB_PACKAGE_ARCHS&quot;).replace(&quot;-&quot;=
, &quot;_&quot;).split():<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D os.path.join(depl=
oydir + &quot;/&quot; + arch)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(target):<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.symlin=
k(target, subrepo_dir + &quot;/&quot; + arch,<br>
&gt; True)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; <br>
&gt; <br>
&gt; This patch does not change the existing functionality. By default, it<=
br>
&gt; is set to True (consistent with default Yocto behavior), but users<br>
&gt; can adjust it as needed.<br>
<br>
I&#39;m not saying yes or no to the patch but you have to understand that<b=
r>
adding an extra parameter means we have to support that code path.<br>
Should we include it in our test matrix? If we do, there is the cost of<br>
testing it but it should work. If we don&#39;t, there is a significant risk=
<br>
it might stop working at some point. There is therefore a cost/risk to<br>
both directions if we do add it.<br>
<br>
For me, the bigger concern is that we may then see people using this<br>
without understanding the race concerns above too.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--0000000000008faccc0626b4a670--

