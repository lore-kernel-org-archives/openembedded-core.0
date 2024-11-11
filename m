Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A55D2E9CF
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 09:54:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.55904.1731318838815319765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 01:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mrdDA2s5;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cebbbbaeceso566646a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 01:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731318837; x=1731923637; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2q0bjqMRIgn3u4JxydRabMBfxgC/Qzqtebgdbo6vuk=;
        b=mrdDA2s5HUVnpLNeyU1kKP5ITV5zU8ED5PP9hqy9Jjd3gDJvDmaY7pRPuGnqFls9lG
         IcBVAvr5vj/zU5sBdIgknxtd/NTj+xbPuQLXo44eRUgbVB7l/Dlx1sWRJzhXHX1T15UQ
         CpiJ2cbADXVjVg2Qt0foE0DqaJ+9XjK0t5bg0/Q/p6EHaJQMPbTU1LtGsUJHitH/eK2n
         k0lJH9pjW+MynrhNXkEb0sPWCyZdG1mnq43BxcmnS2m8LjF4WVZx6PG79EvV32iDMiRL
         1m1apdI/V0eQveo5ydzsqnni0WAzToTcC5KjG5NhyLjlWESY3lhNZzC7fxjdu/VfLQcr
         nTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318837; x=1731923637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2q0bjqMRIgn3u4JxydRabMBfxgC/Qzqtebgdbo6vuk=;
        b=dPcRaMm9ZFHaIhHtFnDgUq+wyY+AXWa4IeZa/FvOEYfQcUKDR1DXN+dvDpQV14PMof
         L56w1my/ybuWzWJ3QewhEme5+WsoTiNzjyNKVZ9zKlEKmf0ITvi4S3GbEnHBBuXuXOL2
         nTWtyrWM0S6O6CSB0FxCrhKuVMDTX725AZbHxG5EarGjtguslv4RiSUV7YP4xBFl4r2k
         DMO1I8efBWBMz9C77hfS3bD42RI8F498Z+dZVmDhDPO+W8DPs9RclDhnPK5O035GyH9k
         HDUM+qBn2iX0VVAQtNtHQDvmgXdcRP7BHRBAWtPOLA32i8+EDgi5d3E/yvf4H+/TfOI1
         rozA==
X-Gm-Message-State: AOJu0YxBOFJlXImgj7Q/xU1nEOwxEcW4eE8K5+GHdbN6/8n2v1hXwkFF
	vjnyfUGgEKLAY59s4MxM1rcji7KuXjVe013ICHDPHTDzaITobyV7QqNpTz9jVBTqzxqaLzu5RLN
	7t9JVXRVEi6lfuyMzctYCPjmnt/E=
X-Google-Smtp-Source: AGHT+IG9hbCpzikvomE+KZDwgdRSfO4swrNhFPouBCys+eMDoJHmt9/stsAiN8n37OJdl0uavOaLNVWgGaVRWDTMMJ8=
X-Received: by 2002:a05:6402:13d3:b0:5ce:aed7:a67 with SMTP id
 4fb4d7f45d1cf-5cf0a43f930mr3978741a12.6.1731318836934; Mon, 11 Nov 2024
 01:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20241025161627.3352-1-sreejith.ravi087@gmail.com>
 <CANNYZj8+5LwPXrQ4eda4muAdOmpfvkg5oo0GXzCG+HJJh65vDQ@mail.gmail.com>
 <CAFt4JuEdi+zFkN37vvvK-PNtqshncC_8dn44gU+FcKXpde-ynA@mail.gmail.com> <CANNYZj-Q_Y4X80o_mbA=uEQ3gQbfwNB3bPcnu5-xvsOaPjKCbg@mail.gmail.com>
In-Reply-To: <CANNYZj-Q_Y4X80o_mbA=uEQ3gQbfwNB3bPcnu5-xvsOaPjKCbg@mail.gmail.com>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Mon, 11 Nov 2024 09:53:44 +0000
Message-ID: <CAFt4JuGioQWK8G72z_J6aJvKscp7zy4W2ZQPWP1_imH_keGSog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_manager : Add configuration option to
 select filterbydependencies
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000044be280626a01453"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206941

--00000000000044be280626a01453
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

We are not changing the default behavior of Yocto but are instead using our
own custom class to handle IPK.

Since create_packages_dir is a function in rootfs.py, it would be
beneficial to add an option allowing users to select either the deploy
directory or oe-rootfs-repo. This would also save the copy time to
oe-rootfs when it is not required for their projects.

Currently, in create_packages_dir, the option to check whether to create
"oe-rootfs-repo" or use a symlink from "DEPLOY_DIR_IPK" to "oe-rootfs-repo"
is ineffective with filterbydependencies, as it is always set to True. Our
request is to add a configuration option for this behavior; otherwise, this
check serves no purpose when used with filterbydependencies.

    if nodeps or not filterbydependencies:
        for arch in d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").split() +
d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").replace("-", "_").split():
            target =3D os.path.join(deploydir + "/" + arch)
            if os.path.exists(target):
                oe.path.symlink(target, subrepo_dir + "/" + arch, True)
        return


This patch does not change the existing functionality. By default, it is
set to True (consistent with default Yocto behavior), but users can adjust
it as needed.

Thanks
Sreejith

On Mon, Oct 28, 2024 at 6:52=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Fri, 25 Oct 2024 at 20:19, Sreejith Ravi <sreejith.ravi087@gmail.com>
> wrote:
> > We aim to use released IPK files from a previous release build instead
> of building from source. During package processing, we skip all build tas=
ks
> for the package and copy it to the deploy directory, adjusting the feeds
> accordingly. With a customized opkg configuration, we can set the feeds
> either from a remote server or the deploy directory. Since we are using t=
he
> released IPK files, there is no need to filter by dependencies, as this h=
as
> already been handled during the release of the IPK.
> >
> > This patch provides an additional option to use the deploy directory as
> an IPK repository. By default, this option is disabled but can be enabled
> if needed.
>
> Unfortunately I am strongly against supporting this use case in
> openembedded core, and I think many will agree. OE's main feature is
> end to end builds from source that are also reproducible. Sstate is
> the way to rebuild only what's needed, and you need to further explain
> why it isn't being used instead. All code in rootfs creation assumes
> that packages used to compose an image are produced through the
> regular build process or come from sstate, and not imported from
> elsewhere.
>
> If you must do things differently then you need to implement your own
> set of classes (perhaps subclassing what's there), and set
> PACKAGES_CLASSES =3D "package_prebuilt_ipk" or similar.
>
> Alex
>

--00000000000044be280626a01453
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><br>We are not changing the default behavior of Yoct=
o but are instead using our own custom class to handle IPK.<br><br>Since cr=
eate_packages_dir is a function in rootfs.py, it would be beneficial to add=
 an option allowing users to select either the deploy directory or oe-rootf=
s-repo. This would also save the copy time to oe-rootfs when it is not requ=
ired for their projects.<br><br>Currently, in create_packages_dir, the opti=
on to check whether to create &quot;oe-rootfs-repo&quot; or use a symlink f=
rom &quot;DEPLOY_DIR_IPK&quot; to &quot;oe-rootfs-repo&quot; is ineffective=
 with filterbydependencies, as it is always set to True. Our request is to =
add a configuration option for this behavior; otherwise, this check serves =
no purpose when used with filterbydependencies.<br><br>=C2=A0 =C2=A0 if nod=
eps or not filterbydependencies:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for arch in=
 d.getVar(&quot;ALL_MULTILIB_PACKAGE_ARCHS&quot;).split() + d.getVar(&quot;=
ALL_MULTILIB_PACKAGE_ARCHS&quot;).replace(&quot;-&quot;, &quot;_&quot;).spl=
it():<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D os.path.join(=
deploydir + &quot;/&quot; + arch)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if os.path.exists(target):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 oe.path.symlink(target, subrepo_dir + &quot;/&quot; + arch, =
True)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br><br><br>This patch does not =
change the existing functionality. By default, it is set to True (consisten=
t with default Yocto behavior), but users can adjust it as needed.<br><div>=
<br></div><div>Thanks</div><div>Sreejith</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 28, 2024 at 6:52=
=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Fri, 25 Oct 2024 at 20:19, Sreejith Ravi &lt;<a h=
ref=3D"mailto:sreejith.ravi087@gmail.com" target=3D"_blank">sreejith.ravi08=
7@gmail.com</a>&gt; wrote:<br>
&gt; We aim to use released IPK files from a previous release build instead=
 of building from source. During package processing, we skip all build task=
s for the package and copy it to the deploy directory, adjusting the feeds =
accordingly. With a customized opkg configuration, we can set the feeds eit=
her from a remote server or the deploy directory. Since we are using the re=
leased IPK files, there is no need to filter by dependencies, as this has a=
lready been handled during the release of the IPK.<br>
&gt;<br>
&gt; This patch provides an additional option to use the deploy directory a=
s an IPK repository. By default, this option is disabled but can be enabled=
 if needed.<br>
<br>
Unfortunately I am strongly against supporting this use case in<br>
openembedded core, and I think many will agree. OE&#39;s main feature is<br=
>
end to end builds from source that are also reproducible. Sstate is<br>
the way to rebuild only what&#39;s needed, and you need to further explain<=
br>
why it isn&#39;t being used instead. All code in rootfs creation assumes<br=
>
that packages used to compose an image are produced through the<br>
regular build process or come from sstate, and not imported from<br>
elsewhere.<br>
<br>
If you must do things differently then you need to implement your own<br>
set of classes (perhaps subclassing what&#39;s there), and set<br>
PACKAGES_CLASSES =3D &quot;package_prebuilt_ipk&quot; or similar.<br>
<br>
Alex<br>
</blockquote></div>

--00000000000044be280626a01453--

