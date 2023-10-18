Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C38CDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:29:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.282584.1697639347307090799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 07:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nh7aayMx;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40651a726acso60496545e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697639346; x=1698244146; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7JVn2LvJvhHlcr1UKA93p6eD+PsxlvYQb+QZxrkngH4=;
        b=Nh7aayMx9OPJMU2yQuZdDEpoOFMw6rxZFK9p8GbsJNDDWDqvbrggf9MG1w3p1uJMWs
         Ds/fVYA5nGr2wTnnnmKiCGBMMP+8W8xqRvnaKUomnJoiwx78VeGCJW20iiHqic3Yc3mw
         HPUjyhh/LvNRs4u4JCz13xxwL6taShpoLbgsdzwpyk8xCXq1UElINF4I1mi5unmNDIvh
         ganE6R6BLCCbXv+NJSeT3N1X8d9x+eHznhjgA2rz6wb5DmU2DYssBOcw6i8hbEHAEjY6
         OPuFsi05Ic4AOALe1Btu84V9zeER+VnvFQf52Eo47Sy+EZxLUzpZAhSV7gAJxJMEZZnE
         V+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697639346; x=1698244146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JVn2LvJvhHlcr1UKA93p6eD+PsxlvYQb+QZxrkngH4=;
        b=TTjl9WEf5rbIAX3bt+Ncwm+XBnUYqA4PnNiNFwsouCToSNvuuqMDLKypKMKxwXjMrH
         YNvRc2RZvKWGJlI/C94JFWjpuE4hen06s/3KZJJEH2pt8ghldiRf0FVfYWvPSqqoQW01
         6E1z0olUbwoaVBJNIKiJ72IAP/ruNBQLUA67CRXu/G7Dq3e0dUyvbhr5el+SucWyNVXt
         K22shjeNButLDjMBt8nUnost4iAGDWc9sR0tnRdP99uRWABF7h3tZSVGARu4MAlRl+No
         bS2Y4weBHaqXeCVBRnFdjiF2mk8RVPeQLBFrBolEMaYBHTVvjGQF+tNAXZKueUlZC4FU
         z8Pw==
X-Gm-Message-State: AOJu0YwGCVJfTlmrbYyl5Lb5BeEdMwGuHEfh8QqddMaFFslhotWa9YTV
	GJDuYq/16JJ4o/twdnkgsNc8w3EflSr3wdY3dO06N2vwGV0=
X-Google-Smtp-Source: AGHT+IGZpyWiozTLu4s5gULiy/z7fA+5Xh40qMMJ3FdXyuqSQcJ21br0kRNCjfpsQoQGD/MoqEj1utHhW2nMjzkJrE8=
X-Received: by 2002:a05:600c:1d22:b0:408:41b4:7fe5 with SMTP id
 l34-20020a05600c1d2200b0040841b47fe5mr323356wms.16.1697639345308; Wed, 18 Oct
 2023 07:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <d15f738b-60d2-48a0-9dc6-6e242469b7a5@gmail.com>
 <CA+chaQcLsDyXMFRtpUdH6yCWCXuShSytFyoqRZ_5F8Ton4HfzA@mail.gmail.com>
 <d466e4c6-20bf-42e2-8342-c058fca4aea2@gmail.com> <CAEHHSvYW_-O=Z5r+sCTFdfS-vuafcnzRsQ_YoUY=MTVOFS1e5g@mail.gmail.com>
 <6a7c97c6-2fc3-4596-8d45-388eb49c3c32@gmail.com> <CAEHHSvb_dvP4FtS5nhCGFvBvZPuCtZsPDDc18jWh_DoFdaqFLQ@mail.gmail.com>
In-Reply-To: <CAEHHSvb_dvP4FtS5nhCGFvBvZPuCtZsPDDc18jWh_DoFdaqFLQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Oct 2023 16:28:52 +0200
Message-ID: <CA+chaQciV=Cdt4_G1zxbuap9oqxcKn-WVgy8WwYRts-Z3WrcQw@mail.gmail.com>
Subject: Re: [OE-core] gitsm:// question
To: Julien Stephan <jstephan@baylibre.com>
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000224b180607fe76c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 14:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189395

--000000000000224b180607fe76c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Using the git:// SRC_URI did not populate the submodules' directories.

That's expected, you need to use gitsm:// to do that (at least the ones
listed in https://github.com/pytorch/pytorch/blob/main/.gitmodules).

I did not realize that the other gitsm:// you were added were actually
submodules of pytorch itself, but Julien is right, it should work with one
gitsm:// in SRC_URI (even with patches applied to various submodules in
do_patch).

On Wed, Oct 18, 2023 at 4:24=E2=80=AFPM Julien Stephan <jstephan@baylibre.c=
om>
wrote:

> Le mer. 18 oct. 2023 =C3=A0 16:12, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n=
 <zboszor@gmail.com> a
> =C3=A9crit :
> >
> > 2023. 10. 18. 15:28 keltez=C3=A9ssel, Julien Stephan =C3=ADrta:
> > > Le mer. 18 oct. 2023 =C3=A0 15:25, Zoltan Boszormenyi <zboszor@gmail.=
com>
> a =C3=A9crit :
> > >> Thanks, I will try it.
> > >>
> > >> 2023. 10. 18. 15:16 keltez=C3=A9ssel, Martin Jansa =C3=ADrta:
> > >>> Just add the name to pytorch repo url and use only that in
> SRCREV_FORMAT, you probably
> > >>> don't care about representing the other repos in SRCPV if you're
> updating them only
> > >>> together with main pytorch update.
> > >>>
> > >>> On Wed, Oct 18, 2023 at 3:05=E2=80=AFPM Zoltan Boszormenyi <
> zboszor@gmail.com> wrote:
> > >>>
> > >>>      Hi,
> > >>>
> > >>>      I have a working python3-pytorch recipe which originally used
> this:
> > >>>
> > >>>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>>      addtask do_git_submodules after do_unpack before do_patch
> > >>>
> > >>>      do_git_submodules[network] =3D "1"
> > >>>
> > >>>      do_git_submodules () {
> > >>>               cd ${S}
> > >>>               git submodule update --init --recursive
> > >>>      }
> > >>>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>>
> > >>>      I would like to replace the above with a series of gitsm://
> SRC_URI lines.
> > >>>      Here's a subset of submodules that shows the problem I am
> seeing:
> > >>>
> > >>>      SRC_URI =3D " \
> > >>>      git://
> github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=3Drelease/2.1
> > >>>      <
> http://github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=3Drelease/2=
.1> \
> > >>>      ...
> > >>>      gitsm://
> github.com/pytorch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgemm;nobranch=3D1=
;destsuffix=3Dthird_party/fbgemm
> > >>>      <
> http://github.com/pytorch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgemm;nobra=
nch=3D1;destsuffix=3Dthird_party/fbgemm
> >
> > >>>
> > >>>      \
> > >>>      gitsm://
> github.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbgemmasmjit;destsuf=
fix=3Dthird_party/fbgemm/third_party/asmjit
> > >>>      <
> http://github.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbgemmasmjit;=
destsuffix=3Dthird_party/fbgemm/third_party/asmjit
> >
> > >>>
> > >>>      \
> > >>>      gitsm://
> github.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Dfbgemmcpuinfo;dest=
suffix=3Dthird_party/fbgemm/third_party/cpuinfo
> > >>>      <
> http://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Dfbgemmcpuin=
fo;destsuffix=3Dthird_party/fbgemm/third_party/cpuinfo
> >
> > >>>
> > >>>      \
> > >>>      gitsm://
> github.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfbgemmcutlass;dests=
uffix=3Dthird_party/fbgemm/third_party/cutlass
> > >>>      <
> http://github.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfbgemmcutlas=
s;destsuffix=3Dthird_party/fbgemm/third_party/cutlass
> >
> > >>>
> > >>>      \
> > >>>      gitsm://
> github.com/google/googletest.git;protocol=3Dhttps;name=3Dfbgemmgtest;dest=
suffix=3Dthird_party/fbgemm/third_party/googletest
> > >>>      <
> http://github.com/google/googletest.git;protocol=3Dhttps;name=3Dfbgemmgte=
st;destsuffix=3Dthird_party/fbgemm/third_party/googletest
> >
> > >>>
> > >>>      \
> > >>>      gitsm://
> github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=3Dhttps;name=3D=
fbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third_party/hipify_torch
> > >>>      <
> http://github.com/ROCmSoftwarePlatform/hipify_torch.git;protocol=3Dhttps;=
name=3Dfbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third_party/hipify_to=
rch
> >
> > >>>
> > >>>      \
> > >>>      ...
> > >>>      "
> > > Hi Zoltan
> > > This is not how you are supposed to use gitsm.. This is much simpler:
> > >
> > > SRC_URI =3D " gitsm://
> github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=3Drelease/2.1
> > > "
> > >
> > > will do all the magic for you :)
> >
> > When I first created that recipe (Yocto 4.0, PyTorch 1.13.0), it didn't=
.
> >
> > The problems were:
> > * PyTorch source releases are not on https://pypi.org/project/torch
> >     This would have been the most convenient.
> > * Yocto complains about using the (unstable) release tarball URL from
> Github.
> > * Using the git:// SRC_URI did not populate the submodules' directories=
.
> >     This was noticed because some submodules need patches to build unde=
r
> Yocto.
> >     Without checking out submodules manually, those patches fail.
> >
> > Just checked the last one on mickledore, still a problem.
> >
> > Have Yocto master changed this?
> >
>
> I used to have a kirkstone recipe using gitsm properly to fetch the
> submodules. Can you reproduce your issue on master? And maybe share it
> to help debugging?
>
> Cheers
> Julien
> > > You can look at the vulkan-sample recipes in poky for an example of
> > > how to use it:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics=
/vulkan/vulkan-samples_git.bb?h=3Dmaster
> > >
> > > Cheers
> > > Julien
> > >
> > >
> > >>>      As you can see, there are recursively placed git submodules
> > >>>      and do_fetch fails with an error message about SRCREV_FORMAT
> > >>>      having to be set.
> > >>>
> > >>>      The above is a limited subset of the complete list and
> > >>>      some of the repositories (like googletest, gloo, glog and
> pybind11)
> > >>>      occurs multiple times as child submodules of upper ones,
> > >>>      with different SRCREV values in different leaf submodules.
> > >>>
> > >>>      I have not found a conclusive example to use SRCREV_FORMAT
> > >>>      with git:// + gitsm://
> > >>>
> > >>>      Can someone enlighten me how to use SRCREV_FORMAT properly
> > >>>      for this case? Should I stick to the proven working nonstandar=
d
> way
> > >>>      and just run git submodule update --init --recursive?
> > >>>
> > >>>      As an easy way out, is there a flag to git:// to process its
> > >>>      submodules automatically?
> > >>>
> > >>>      Thanks in advance,
> > >>>      Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> > >>>
> > >>>
> > >>>
> > >>>
> > >>
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> Links: You receive all messages sent to this group.
> > >> View/Reply Online (#189390):
> https://lists.openembedded.org/g/openembedded-core/message/189390
> > >> Mute This Topic: https://lists.openembedded.org/mt/102038382/4356723
> > >> Group Owner: openembedded-core+owner@lists.openembedded.org
> > >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [jstephan@baylibre.com]
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>
> >
>

--000000000000224b180607fe76c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Using the git:// SRC_URI did not populate the submodu=
les&#39; directories.<div><br></div><div>That&#39;s expected, you need to u=
se gitsm:// to do that (at least the ones listed in=C2=A0<a href=3D"https:/=
/github.com/pytorch/pytorch/blob/main/.gitmodules">https://github.com/pytor=
ch/pytorch/blob/main/.gitmodules</a>).</div><div><br></div><div>I did not r=
ealize that the other gitsm:// you were added were actually submodules of p=
ytorch itself, but Julien is right, it should work with one gitsm:// in SRC=
_URI (even with patches applied to various submodules in do_patch).</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Oct 18, 2023 at 4:24=E2=80=AFPM Julien Stephan &lt;<a href=3D"mailto:=
jstephan@baylibre.com">jstephan@baylibre.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Le mer. 18 oct. 2023 =C3=A0 16:=
12, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@gm=
ail.com" target=3D"_blank">zboszor@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;<br>
&gt; 2023. 10. 18. 15:28 keltez=C3=A9ssel, Julien Stephan =C3=ADrta:<br>
&gt; &gt; Le mer. 18 oct. 2023 =C3=A0 15:25, Zoltan Boszormenyi &lt;<a href=
=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt; a=
 =C3=A9crit :<br>
&gt; &gt;&gt; Thanks, I will try it.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 2023. 10. 18. 15:16 keltez=C3=A9ssel, Martin Jansa =C3=ADrta:=
<br>
&gt; &gt;&gt;&gt; Just add the name to pytorch repo url and use only that i=
n SRCREV_FORMAT, you probably<br>
&gt; &gt;&gt;&gt; don&#39;t care about representing the other repos in SRCP=
V if you&#39;re updating them only<br>
&gt; &gt;&gt;&gt; together with main pytorch update.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Wed, Oct 18, 2023 at 3:05=E2=80=AFPM Zoltan Boszormeny=
i &lt;<a href=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.=
com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Hi,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I have a working python3-pytorch reci=
pe which originally used this:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 addtask do_git_submodules after do_un=
pack before do_patch<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 do_git_submodules[network] =3D &quot;=
1&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 do_git_submodules () {<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd =
${S}<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git=
 submodule update --init --recursive<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I would like to replace the above wit=
h a series of gitsm:// SRC_URI lines.<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Here&#39;s a subset of submodules tha=
t shows the problem I am seeing:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 SRC_URI =3D &quot; \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/py=
torch/pytorch.git;protocol=3Dhttps;branch=3Drelease/2.1" rel=3D"noreferrer"=
 target=3D"_blank">github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=
=3Drelease/2.1</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://github.com/pyto=
rch/pytorch.git;protocol=3Dhttps;branch=3Drelease/2.1" rel=3D"noreferrer" t=
arget=3D"_blank">http://github.com/pytorch/pytorch.git;protocol=3Dhttps;bra=
nch=3Drelease/2.1</a>&gt; \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 gitsm://<a href=3D"http://github.com/=
pytorch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgemm;nobranch=3D1;destsuffix=
=3Dthird_party/fbgemm" rel=3D"noreferrer" target=3D"_blank">github.com/pyto=
rch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgemm;nobranch=3D1;destsuffix=3Dthi=
rd_party/fbgemm</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://github.com/pyto=
rch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgemm;nobranch=3D1;destsuffix=3Dthi=
rd_party/fbgemm" rel=3D"noreferrer" target=3D"_blank">http://github.com/pyt=
orch/FBGEMM.git;protocol=3Dhttps;name=3Dfbgemm;nobranch=3D1;destsuffix=3Dth=
ird_party/fbgemm</a>&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 gitsm://<a href=3D"http://github.com/=
asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbgemmasmjit;destsuffix=3Dthird_p=
arty/fbgemm/third_party/asmjit" rel=3D"noreferrer" target=3D"_blank">github=
.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbgemmasmjit;destsuffix=3Dth=
ird_party/fbgemm/third_party/asmjit</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://github.com/asmj=
it/asmjit.git;protocol=3Dhttps;name=3Dfbgemmasmjit;destsuffix=3Dthird_party=
/fbgemm/third_party/asmjit" rel=3D"noreferrer" target=3D"_blank">http://git=
hub.com/asmjit/asmjit.git;protocol=3Dhttps;name=3Dfbgemmasmjit;destsuffix=
=3Dthird_party/fbgemm/third_party/asmjit</a>&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 gitsm://<a href=3D"http://github.com/=
pytorch/cpuinfo.git;protocol=3Dhttps;name=3Dfbgemmcpuinfo;destsuffix=3Dthir=
d_party/fbgemm/third_party/cpuinfo" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Dfbgemmcpuinfo;destsuff=
ix=3Dthird_party/fbgemm/third_party/cpuinfo</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://github.com/pyto=
rch/cpuinfo.git;protocol=3Dhttps;name=3Dfbgemmcpuinfo;destsuffix=3Dthird_pa=
rty/fbgemm/third_party/cpuinfo" rel=3D"noreferrer" target=3D"_blank">http:/=
/github.com/pytorch/cpuinfo.git;protocol=3Dhttps;name=3Dfbgemmcpuinfo;dests=
uffix=3Dthird_party/fbgemm/third_party/cpuinfo</a>&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 gitsm://<a href=3D"http://github.com/=
NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfbgemmcutlass;destsuffix=3Dthird=
_party/fbgemm/third_party/cutlass" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfbgemmcutlass;destsuffix=
=3Dthird_party/fbgemm/third_party/cutlass</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://github.com/NVID=
IA/cutlass.git;protocol=3Dhttps;name=3Dfbgemmcutlass;destsuffix=3Dthird_par=
ty/fbgemm/third_party/cutlass" rel=3D"noreferrer" target=3D"_blank">http://=
github.com/NVIDIA/cutlass.git;protocol=3Dhttps;name=3Dfbgemmcutlass;destsuf=
fix=3Dthird_party/fbgemm/third_party/cutlass</a>&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 gitsm://<a href=3D"http://github.com/=
google/googletest.git;protocol=3Dhttps;name=3Dfbgemmgtest;destsuffix=3Dthir=
d_party/fbgemm/third_party/googletest" rel=3D"noreferrer" target=3D"_blank"=
>github.com/google/googletest.git;protocol=3Dhttps;name=3Dfbgemmgtest;dests=
uffix=3Dthird_party/fbgemm/third_party/googletest</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://github.com/goog=
le/googletest.git;protocol=3Dhttps;name=3Dfbgemmgtest;destsuffix=3Dthird_pa=
rty/fbgemm/third_party/googletest" rel=3D"noreferrer" target=3D"_blank">htt=
p://github.com/google/googletest.git;protocol=3Dhttps;name=3Dfbgemmgtest;de=
stsuffix=3Dthird_party/fbgemm/third_party/googletest</a>&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 gitsm://<a href=3D"http://github.com/=
ROCmSoftwarePlatform/hipify_torch.git;protocol=3Dhttps;name=3Dfbgemmhiptorc=
h;destsuffix=3Dthird_party/fbgemm/third_party/hipify_torch" rel=3D"noreferr=
er" target=3D"_blank">github.com/ROCmSoftwarePlatform/hipify_torch.git;prot=
ocol=3Dhttps;name=3Dfbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third_pa=
rty/hipify_torch</a><br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://github.com/ROCm=
SoftwarePlatform/hipify_torch.git;protocol=3Dhttps;name=3Dfbgemmhiptorch;de=
stsuffix=3Dthird_party/fbgemm/third_party/hipify_torch" rel=3D"noreferrer" =
target=3D"_blank">http://github.com/ROCmSoftwarePlatform/hipify_torch.git;p=
rotocol=3Dhttps;name=3Dfbgemmhiptorch;destsuffix=3Dthird_party/fbgemm/third=
_party/hipify_torch</a>&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt; Hi Zoltan<br>
&gt; &gt; This is not how you are supposed to use gitsm.. This is much simp=
ler:<br>
&gt; &gt;<br>
&gt; &gt; SRC_URI =3D &quot; gitsm://<a href=3D"http://github.com/pytorch/p=
ytorch.git;protocol=3Dhttps;branch=3Drelease/2.1" rel=3D"noreferrer" target=
=3D"_blank">github.com/pytorch/pytorch.git;protocol=3Dhttps;branch=3Dreleas=
e/2.1</a><br>
&gt; &gt; &quot;<br>
&gt; &gt;<br>
&gt; &gt; will do all the magic for you :)<br>
&gt;<br>
&gt; When I first created that recipe (Yocto 4.0, PyTorch 1.13.0), it didn&=
#39;t.<br>
&gt;<br>
&gt; The problems were:<br>
&gt; * PyTorch source releases are not on <a href=3D"https://pypi.org/proje=
ct/torch" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/tor=
ch</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0This would have been the most convenient.<br>
&gt; * Yocto complains about using the (unstable) release tarball URL from =
Github.<br>
&gt; * Using the git:// SRC_URI did not populate the submodules&#39; direct=
ories.<br>
&gt;=C2=A0 =C2=A0 =C2=A0This was noticed because some submodules need patch=
es to build under Yocto.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Without checking out submodules manually, those pat=
ches fail.<br>
&gt;<br>
&gt; Just checked the last one on mickledore, still a problem.<br>
&gt;<br>
&gt; Have Yocto master changed this?<br>
&gt;<br>
<br>
I used to have a kirkstone recipe using gitsm properly to fetch the<br>
submodules. Can you reproduce your issue on master? And maybe share it<br>
to help debugging?<br>
<br>
Cheers<br>
Julien<br>
&gt; &gt; You can look at the vulkan-sample recipes in poky for an example =
of<br>
&gt; &gt; how to use it: <a href=3D"https://git.openembedded.org/openembedd=
ed-core/tree/meta/recipes-graphics/vulkan/vulkan-samples_git.bb?h=3Dmaster"=
 rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembe=
dded-core/tree/meta/recipes-graphics/vulkan/vulkan-samples_git.bb?h=3Dmaste=
r</a><br>
&gt; &gt;<br>
&gt; &gt; Cheers<br>
&gt; &gt; Julien<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 As you can see, there are recursively=
 placed git submodules<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 and do_fetch fails with an error mess=
age about SRCREV_FORMAT<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 having to be set.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 The above is a limited subset of the =
complete list and<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 some of the repositories (like google=
test, gloo, glog and pybind11)<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 occurs multiple times as child submod=
ules of upper ones,<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 with different SRCREV values in diffe=
rent leaf submodules.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I have not found a conclusive example=
 to use SRCREV_FORMAT<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 with git:// + gitsm://<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Can someone enlighten me how to use S=
RCREV_FORMAT properly<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for this case? Should I stick to the =
proven working nonstandard way<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 and just run git submodule update --i=
nit --recursive?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 As an easy way out, is there a flag t=
o git:// to process its<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 submodules automatically?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Thanks in advance,<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9ny=
i<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt; &gt;&gt; View/Reply Online (#189390): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/189390" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/189390</=
a><br>
&gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/102038382/4356723" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/mt/102038382/4356723</a><br>
&gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:jstephan@bay=
libre.com" target=3D"_blank">jstephan@baylibre.com</a>]<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000224b180607fe76c9--

