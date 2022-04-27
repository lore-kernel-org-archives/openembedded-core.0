Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4F9C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 10:37:28 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.6568.1651055839442572971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 03:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CHf2kFib;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id y32so2365125lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4W3YqTnkGSQoeegz15yNw6G59kp5w3ViRUxHAJsy+v4=;
        b=CHf2kFibqBUjWXnoCZX1pFQF3nmNeGajwQMWPuBsGGoMfCDK6MDX7P7sQPpcEznHOW
         rY98C17e1qqsnWEANcAIACeogOrVXXTBipHpl8CAUNbvXwtIIHPqiuYtT73IAKqyw5wU
         2RM2LZOO2noGDmHFLeOAVx4vC37QNo2UOC3C7OOl9vOrbj8najrP19NxmedR60sYUmIq
         eGMqJswRD0017h+M1xciXZfNNVVWAqbAj5CQ5Ify9rssyQOK4ZfZgwe3clrjkE0cshHG
         +k0eisdS11xKVVOtIkFpsfUkS3RbYLwfxuaODfBHhwb33O0f2A71XoM/TthjDSg3F2Ge
         h91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4W3YqTnkGSQoeegz15yNw6G59kp5w3ViRUxHAJsy+v4=;
        b=0scW79tjMr4KUqcFadzNbn5Wyehk/NeT2TiYvF3FJnAp+++2FPsBeNWvnUC4ioElcy
         MXItzUtuk4owtDrHj06kAiCIQYQYVaGe23VLnWdrubsYYWtPKGM07sK6Eb8k5flJmlf2
         SCirL0+yapaGC5XXHlBF0DNIoEvfkwWCQtuH9S+G2sQsGx0pWJknyylKkT0+YzjiR57M
         3T9XRz0DEz+lo5CvrdMwBIDVKNcsRVrY2QAyfhwl0jKUIMF0mpsyJGOvaOtVh6iRrKF3
         QXV0O6oYskvo5bYimm0QxEKvuzeEtI0T2+ERLLDhXf0XKGbxGXwYVHvC6AfBgDyBL9xO
         Ddvw==
X-Gm-Message-State: AOAM531M0owfPC3YYLzJNVBv5qSTdD4kPsgVtnZfrxTrYtmLifKb23qA
	uYc78D5n633jjWAA36woLOcCEDec4iCyYVZZrSE=
X-Google-Smtp-Source: 
 ABdhPJxseC9Uw686o9pw9npURqYVGPNjylT6pOpcf9Pdxy0qXP30I69NQ7kHqokfigQzZs1Oo9LVywmVSC3NHQ+dDf8=
X-Received: by 2002:a05:6512:2527:b0:471:fe6c:6ba6 with SMTP id
 be39-20020a056512252700b00471fe6c6ba6mr12949870lfb.95.1651055837319; Wed, 27
 Apr 2022 03:37:17 -0700 (PDT)
MIME-Version: 1.0
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6812ddf4-d065-4e4e-ad42-c48d1bca155d@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.65eda1d8-3d07-4fbe-a1d1-669c533cd0a5@emailsignatures365.codetwo.com>
 <ef4b958c-8310-4b40-f671-779558228550@topic.nl>
 <749f33fad354821ee5e1b9f061aae211c252b934.camel@linuxfoundation.org>
 <70d61f68-8a56-86fa-5772-598628219797@topic.nl>
 <b14c0ed1-ebf3-3b25-54c7-dc6b9efdb4ce@denx.de>
 <24e9cfaa101ed3c4f1eb227cfee43a14ee475ecf.camel@linuxfoundation.org>
In-Reply-To: 
 <24e9cfaa101ed3c4f1eb227cfee43a14ee475ecf.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 27 Apr 2022 11:37:06 +0100
Message-ID: 
 <CANPvuRkZ20058vkTg8EQsg7C0fbVczdguj+0AY9Q-eBGq59P=g@mail.gmail.com>
Subject: Re: [OE-core] Git and pseudo
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Stefano Babic <sbabic@denx.de>, Mike Looijmans <mike.looijmans@topic.nl>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000b0152505dda064b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 10:37:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164914

--000000000000b0152505dda064b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quarta,
27/04/2022 =C3=A0(s) 11:22:

> On Wed, 2022-04-27 at 08:47 +0200, Stefano Babic wrote:
> > Hi Mike, Richard,
> >
> > On 26.04.22 11:08, Mike Looijmans wrote:
> > >
> > > Met vriendelijke groet / kind regards,
> > >
> > > Mike Looijmans
> > > System Expert
> > >
> > >
> > > TOPIC Embedded Products B.V.
> > > Materiaalweg 4, 5681 RJ Best
> > > The Netherlands
> > >
> > > T: +31 (0) 499 33 69 69
> > > E: mike.looijmans@topicproducts.com
> > > W: www.topic.nl
> > >
> > > Please consider the environment before printing this e-mail
> > > On 25-04-2022 14:51, Richard Purdie wrote:
> > > > On Mon, 2022-04-25 at 09:40 +0200, Mike Looijmans wrote:
> > > > > Recently GIT got updated with a security fix:
> > > > >
> > > > >
> https://github.blog/2022-04-12-git-security-vulnerability-announced/
> > > > >
> > > > >
> > > > > The problem is that this causes all "git" tasks that run within
> pseudo
> > > > > (most noticably, image recipes) to fail. In many repositories, we
> use:
> > > > > git rev-parse --verify HEAD > /etc/revision
> > > > >
> > > > > Or something similar to that. After the GIT update, this now fail=
s
> with
> > > > > an error like:
> > > > >
> > > > > '''
> > > > > fatal: unsafe repository ('/home/mike/repository/path' is owned b=
y
> > > > > someone else)
> > > > > To add an exception for this directory, call:
> > > > >
> > > > >       git config --global --add safe.directory
> > > > > /home/mike/repository/path
> > > > > '''
> > > > >
> > > > > Apart from doing as it says, or even "git config --global --add
> > > > > safe.directory '*'" anyone have a better idea, especially one tha=
t
> > > > > prevents the system thinking I'm someone else (root in the case o=
f
> > > > > pseudo).
> > > >
> https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5f2d87=
4eaa4a92fff0e5
> > > >
> > > >
> > > > However this isn't quite enough as some things encode the path to
> git
> > > > into build
> > > > files so the PATH change at do_install isn't enough. igt-gpu-tools
> via
> > > > meson in
> > > > OE-Core is an example.
> > > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > > Nice, also for general usefulness.
> > >
> > >
> > > For our particular case, I came up with this (works in old OE version=
s
> > > as well), just inserting a task since both do_image and do_rootfs run
> > > under fakeroot:
> > >
> > >   # We require access to the git repository here, so we must run
> outside
> > > fakeroot
> > > do_swumetadata() {
> > >     # Hardware revision for SWUpdate
> > >     echo "${SWU_BOARD_HWREVISION}" >
> > > ${IMAGE_ROOTFS}${sysconfdir}/hwrevision
> > >     v=3D`git rev-parse --verify HEAD`
> > >     echo $v > ${IMAGE_ROOTFS}${sysconfdir}/swrevision
> > >     echo $v > ${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}.swrevision
> > > }
> > > addtask do_swumetadata before do_image after do_rootfs
> > >
> >
> > It looks like we have several breakages. I found yesterday that
> > buildinfo (image-buildinfo) does not work anymore.
> >
> > meta-filesystems  =3D <unknown>:<unknown>
> >
> > meta-networking   =3D <unknown>:<unknown>
> >
> > meta-oe           =3D <unknown>:<unknown>
> >
> > meta-perl         =3D <unknown>:<unknown>
> >
> > meta-python       =3D <unknown>:<unknown>
> >
> > meta-swupdate     =3D <unknown>:<unknown>
> >
> > meta              =3D <unknown>:<unknown>
> >
> > meta-poky         =3D <unknown>:<unknown>
> >
> > meta-yocto-bsp    =3D <unknown>:<unknown>
> >
> >
> >
> > And the reason is exactly this security update to git, and
> > base_get_metadata_git_revision / base_get_metadata_git_branch do not
> > work anymore (in this context, of course). So should we create
> > /etc/build in a task before do_rootfs ?
> >
> > Bad is also that this affects older versions (dunfell for example),
> > because it depends on an external package (git) to OE.
>
>
>
> https://git.yoctoproject.org/poky/commit/?id=3D5bca57859b280f73b23247aac7=
dec6b05f48fde8


The change that introduces the intercept script [1] Is partially reversed
with [2]
With this approach using the environment we don't need the intercept script
anymore or I am missing something?

[1]
https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5f2d874e=
aa4a92fff0e5
[2]
https://git.yoctoproject.org/poky/commit/?id=3D5546a868b52400ed1487b2ac7149=
f3a9e7293bd2

Jose


>
> is now the preferred fix and we will likely be backporting this to
> kirkstone,
> honister and dunfell.
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164911):
> https://lists.openembedded.org/g/openembedded-core/message/164911
> Mute This Topic: https://lists.openembedded.org/mt/90680045/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b0152505dda064b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; escreveu no dia quarta, 27/04/2022 =C3=A0(s) 11:22:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, 2022-04-27 at 08:47 +0200, St=
efano Babic wrote:<br>
&gt; Hi Mike, Richard,<br>
&gt; <br>
&gt; On 26.04.22 11:08, Mike Looijmans wrote:<br>
&gt; &gt; <br>
&gt; &gt; Met vriendelijke groet / kind regards,<br>
&gt; &gt; <br>
&gt; &gt; Mike Looijmans<br>
&gt; &gt; System Expert<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; TOPIC Embedded Products B.V.<br>
&gt; &gt; Materiaalweg 4, 5681 RJ Best<br>
&gt; &gt; The Netherlands<br>
&gt; &gt; <br>
&gt; &gt; T: +31 (0) 499 33 69 69<br>
&gt; &gt; E: <a href=3D"mailto:mike.looijmans@topicproducts.com" target=3D"=
_blank">mike.looijmans@topicproducts.com</a><br>
&gt; &gt; W: <a href=3D"http://www.topic.nl" rel=3D"noreferrer" target=3D"_=
blank">www.topic.nl</a><br>
&gt; &gt; <br>
&gt; &gt; Please consider the environment before printing this e-mail<br>
&gt; &gt; On 25-04-2022 14:51, Richard Purdie wrote:<br>
&gt; &gt; &gt; On Mon, 2022-04-25 at 09:40 +0200, Mike Looijmans wrote:<br>
&gt; &gt; &gt; &gt; Recently GIT got updated with a security fix:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.blog/2022-04-12-git-security-=
vulnerability-announced/" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.blog/2022-04-12-git-security-vulnerability-announced/</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The problem is that this causes all &quot;git&quot; tas=
ks that run within pseudo<br>
&gt; &gt; &gt; &gt; (most noticably, image recipes) to fail. In many reposi=
tories, we use:<br>
&gt; &gt; &gt; &gt; git rev-parse --verify HEAD &gt; /etc/revision<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Or something similar to that. After the GIT update, thi=
s now fails with<br>
&gt; &gt; &gt; &gt; an error like:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &#39;&#39;&#39;<br>
&gt; &gt; &gt; &gt; fatal: unsafe repository (&#39;/home/mike/repository/pa=
th&#39; is owned by<br>
&gt; &gt; &gt; &gt; someone else)<br>
&gt; &gt; &gt; &gt; To add an exception for this directory, call:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0=C2=A0 =C2=A0git config --global --add saf=
e.directory <br>
&gt; &gt; &gt; &gt; /home/mike/repository/path<br>
&gt; &gt; &gt; &gt; &#39;&#39;&#39;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Apart from doing as it says, or even &quot;git config -=
-global --add<br>
&gt; &gt; &gt; &gt; safe.directory &#39;*&#39;&quot; anyone have a better i=
dea, especially one that<br>
&gt; &gt; &gt; &gt; prevents the system thinking I&#39;m someone else (root=
 in the case of <br>
&gt; &gt; &gt; &gt; pseudo).<br>
&gt; &gt; &gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D21=
559199516a31c7635c5f2d874eaa4a92fff0e5" rel=3D"noreferrer" target=3D"_blank=
">https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635c5f2d87=
4eaa4a92fff0e5</a> <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; However this isn&#39;t quite enough as some things encode th=
e path to git <br>
&gt; &gt; &gt; into build<br>
&gt; &gt; &gt; files so the PATH change at do_install isn&#39;t enough. igt=
-gpu-tools via <br>
&gt; &gt; &gt; meson in<br>
&gt; &gt; &gt; OE-Core is an example.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Richard<br>
&gt; &gt; &gt; <br>
&gt; &gt; Nice, also for general usefulness.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; For our particular case, I came up with this (works in old OE ver=
sions <br>
&gt; &gt; as well), just inserting a task since both do_image and do_rootfs=
 run <br>
&gt; &gt; under fakeroot:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0# We require access to the git repository here, so we=
 must run outside <br>
&gt; &gt; fakeroot<br>
&gt; &gt; do_swumetadata() {<br>
&gt; &gt;=C2=A0 =C2=A0=C2=A0 # Hardware revision for SWUpdate<br>
&gt; &gt;=C2=A0 =C2=A0=C2=A0 echo &quot;${SWU_BOARD_HWREVISION}&quot; &gt; =
<br>
&gt; &gt; ${IMAGE_ROOTFS}${sysconfdir}/hwrevision<br>
&gt; &gt;=C2=A0 =C2=A0=C2=A0 v=3D`git rev-parse --verify HEAD`<br>
&gt; &gt;=C2=A0 =C2=A0=C2=A0 echo $v &gt; ${IMAGE_ROOTFS}${sysconfdir}/swre=
vision<br>
&gt; &gt;=C2=A0 =C2=A0=C2=A0 echo $v &gt; ${DEPLOY_DIR_IMAGE}/${IMAGE_BASEN=
AME}.swrevision<br>
&gt; &gt; }<br>
&gt; &gt; addtask do_swumetadata before do_image after do_rootfs<br>
&gt; &gt; <br>
&gt; <br>
&gt; It looks like we have several breakages. I found yesterday that <br>
&gt; buildinfo (image-buildinfo) does not work anymore.<br>
&gt; <br>
&gt; meta-filesystems=C2=A0 =3D &lt;unknown&gt;:&lt;unknown&gt;<br>
&gt; <br>
&gt; meta-networking=C2=A0 =C2=A0=3D &lt;unknown&gt;:&lt;unknown&gt;<br>
&gt; <br>
&gt; meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &lt;unknown&gt;:&l=
t;unknown&gt;<br>
&gt; <br>
&gt; meta-perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &lt;unknown&gt;:&lt;unk=
nown&gt;<br>
&gt; <br>
&gt; meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &lt;unknown&gt;:&lt;unknown&=
gt;<br>
&gt; <br>
&gt; meta-swupdate=C2=A0 =C2=A0 =C2=A0=3D &lt;unknown&gt;:&lt;unknown&gt;<b=
r>
&gt; <br>
&gt; meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &lt;unknown&g=
t;:&lt;unknown&gt;<br>
&gt; <br>
&gt; meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &lt;unknown&gt;:&lt;unk=
nown&gt;<br>
&gt; <br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =3D &lt;unknown&gt;:&lt;unknown&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; And the reason is exactly this security update to git, and <br>
&gt; base_get_metadata_git_revision / base_get_metadata_git_branch do not <=
br>
&gt; work anymore (in this context, of course). So should we create <br>
&gt; /etc/build in a task before do_rootfs ?<br>
&gt; <br>
&gt; Bad is also that this affects older versions (dunfell for example), <b=
r>
&gt; because it depends on an external package (git) to OE.<br>
<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D5bca57859b280f73b=
23247aac7dec6b05f48fde8" rel=3D"noreferrer" target=3D"_blank">https://git.y=
octoproject.org/poky/commit/?id=3D5bca57859b280f73b23247aac7dec6b05f48fde8<=
/a></blockquote><div><br></div><div>The change that introduces the intercep=
t script [1] Is partially=C2=A0reversed with [2]</div><div><div>With this a=
pproach=C2=A0using the environment we don&#39;t need the intercept script a=
nymore or I am missing something?<br></div><div><br></div></div><div>[1] <a=
 href=3D"https://git.yoctoproject.org/poky/commit/?id=3D21559199516a31c7635=
c5f2d874eaa4a92fff0e5">https://git.yoctoproject.org/poky/commit/?id=3D21559=
199516a31c7635c5f2d874eaa4a92fff0e5</a></div><div>[2] <a href=3D"https://gi=
t.yoctoproject.org/poky/commit/?id=3D5546a868b52400ed1487b2ac7149f3a9e7293b=
d2">https://git.yoctoproject.org/poky/commit/?id=3D5546a868b52400ed1487b2ac=
7149f3a9e7293bd2</a><br></div><div><br></div><div>Jose</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
is now the preferred fix and we will likely be backporting this to kirkston=
e,<br>
honister and dunfell.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164911): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164911" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164911</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90680045/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90680045/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000b0152505dda064b5--

