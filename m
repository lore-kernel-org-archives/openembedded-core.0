Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BBEC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 07:18:45 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web08.3670.1651648717159195522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 00:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OAN+sNcF;
 spf=pass (domain: linaro.org, ip: 209.85.219.182,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f182.google.com with SMTP id s30so932084ybi.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 00:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtZzH+IkMZUPjAZR8nlW+6ySrix2osvTPpHsRGf33i4=;
        b=OAN+sNcFBxq+oB0h/P017fdOJpLny0moVc4/JH7se3l5xyhdQLeHm4Kz8Bbe98R3Jp
         TZandVz9fCMWF3D31hjX2myv2v3KsopmVBAX2nVqWP5TclGWKyfQHbU/xRnWsssNksAi
         FKzQ+NmzSmtXV3r8pe0iJBTn04rtQx0o6H0EFvJkiR2djWPNAqQ7Fh0TUHB5s01U5Vlk
         d4zAaODbcxgAjSbvCTd4mdCsjF0s8fKT4zFO6YBPyhsIMw1vkae+B1GIt9cUEfpcAqNn
         55vJTjxM1I7wggDpKnw1s3KecI52vd0sJ6a5QWUaUDNSbp5fkdZR02H0Ggwg8v+gsXnQ
         DQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtZzH+IkMZUPjAZR8nlW+6ySrix2osvTPpHsRGf33i4=;
        b=NVhFaUJlFyUhhVwpB010DxbxGWe2Yrt74C6egIC9ifkcY3FPn3NwqW4IKOrnZSAWId
         ZjnLl7b/zO5Nj4059Xy+g4+C0FnRrJ3mgjp2+XsipRmBgK0jJKWRsOPG2DpJg8EF8kLq
         Gfk/Jg7wGSG2auQgsYRRVruO6fjNxxUUYn+MccobKCpQIy69Rgofl5Hn1Ac2EjP2DEOl
         KxBlz3QnMBNnI28YEQ6iRoqRoOK6FQ8uMlqJbe5hg4WyUkVTtHef6QzkMp+BPtHwSVB2
         GxRnnyOJI85hrBE3wKZz2k52dAO7kp5ovSyiYfOj1njfhO6aL0+2Erj2HXVdLshkHVSr
         bChQ==
X-Gm-Message-State: AOAM531ajGXIbbYRFOQEoM/uDFIZtlbFK4Hqy6NGd5mXIo5gARUmrHeA
	zQFjrB3u9g8VmXxBw8lUBDsMTLxO3o3eYDADG+fJAg==
X-Google-Smtp-Source: 
 ABdhPJxOmcmI9sz4OnVn4J6zN87j952UtwumiVZFmfXx2wKGjqkOoJy3yAq8R4cWIEC7q6/Bwe6MMJxwTbG/7Aej6a8=
X-Received: by 2002:a05:6902:907:b0:649:59bc:c211 with SMTP id
 bu7-20020a056902090700b0064959bcc211mr14285098ybb.171.1651648716203; Wed, 04
 May 2022 00:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
 <16EA5E7263695663.11702@lists.openembedded.org>
 <16EA76835C38B7CA.4798@lists.openembedded.org>
 <16EA920E59E6B6F1.28542@lists.openembedded.org>
 <CADkTA4M6NzCMVtEhiu+Hyaqp4gMZViP1XRH1qP1t2Ds3S6TL1w@mail.gmail.com>
 <f52bff6a24a5c2a015ed595ab09da89b2e249e75.camel@linuxfoundation.org>
In-Reply-To: 
 <f52bff6a24a5c2a015ed595ab09da89b2e249e75.camel@linuxfoundation.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 4 May 2022 09:18:25 +0200
Message-ID: 
 <CAP71WjzwwV00BAeG6BtVD49fVrCe8rKvToEsKMi0hahxER4PVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/15] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jdmason@kudzu.us>
Content-Type: multipart/alternative; boundary="00000000000006005805de2a6f98"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 07:18:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165211

--00000000000006005805de2a6f98
Content-Type: text/plain; charset="UTF-8"

hey Bruce,

On Sun, May 1, 2022 at 6:59 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2022-04-30 at 17:35 -0400, Bruce Ashfield wrote:
> > On Sat, Apr 30, 2022 at 12:26 AM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > >
> > > On Fri, Apr 29, 2022 at 4:02 PM Bruce Ashfield via
> > > lists.openembedded.org
> > > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > > >
> > > > On Fri, Apr 29, 2022 at 8:41 AM Bruce Ashfield via
> > > > lists.openembedded.org
> > > > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > >
> > > > > I'll see about running the strace locally today. Hopefully it pops
> up
> > > > > here so I can debug.
> > > >
> > > > FYI: I have the landlock test case passing here, there's just an
> > > > output difference from the kernel. The test is passing.
> > >
> > > I have located the exact kernel commit that changed the output, hence
> > > why the test is failing.
> > >
> > > strace upstream hasn't adjusted yet, so I'll spin up a patch, and get
> > > send patches to the list over the weekend.
> >
> > The two patches that fix the strace ptest fail, and qemuarm graphical
> > boot are on the list.
>
> Thanks Bruce! I've queued it and started it running through testing.
>

Since this patch, qemuarmv5 fails to build with:

00:01:47 NOTE: Running task 899 of 5734
(virtual:native:/home/tuxbake/oe/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:
do_deploy_source_date_epoch)
00:01:47 ERROR: linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0
do_kernel_metadata: Could not locate BSP definition for qemuarm/standard
and no defconfig was provided
00:01:47 ERROR: linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0
do_kernel_metadata:
ExecutionError('/home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.do_kernel_metadata.98856',
1, None, None)
00:01:47 ERROR: Logfile of failure stored in:
/home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/log.do_kernel_metadata.98856
00:01:47 Log data follows:
00:01:47 | DEBUG: Executing python function extend_recipe_sysroot
00:01:47 | NOTE: Direct dependencies are
['/home/tuxbake/oe/poky/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:
do_populate_sysroot']
00:01:47 | NOTE: Installed into sysroot: []
00:01:47 | NOTE: Skipping as already exists in sysroot:
['kern-tools-native']
00:01:47 | DEBUG: Python function extend_recipe_sysroot finished
00:01:47 | DEBUG: Executing shell function do_kernel_metadata
00:01:47 | NOTE: do_kernel_metadata: for summary/debug, set
KCONF_AUDIT_LEVEL > 0
00:01:47 | ERROR: Could not locate BSP definition for qemuarm/standard and
no defconfig was provided
00:01:47 | WARNING:
/home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.do_kernel_metadata.98856:404
exit 1 from 'exit 1'
00:01:47 | WARNING: Backtrace (BB generated script):
00:01:47 | #1: bbfatal_log,
/home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.do_kernel_metadata.98856,
line 404
00:01:47 | #2: do_kernel_metadata,
/home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.do_kernel_metadata.98856,
line 272
00:01:47 | #3: main,
/home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.do_kernel_metadata.98856,
line 435
00:01:47 NOTE: recipe
linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0: task
do_kernel_metadata: Failed
00:01:47 ERROR: Task
(/home/tuxbake/oe/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)
failed with exit code '1'

see full build log
https://oebuilds.tuxbuild.com/28f9WxOsIhBeAgIbQH3DsCwyQCc/build-debug.log




> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165076):
> https://lists.openembedded.org/g/openembedded-core/message/165076
> Mute This Topic: https://lists.openembedded.org/mt/90753174/1279857
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000006005805de2a6f98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hey Bruce,</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 1, 2022 at 6:59 AM =
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sat, 2022-04-30 at 17:35 -0400, Bruce A=
shfield wrote:<br>
&gt; On Sat, Apr 30, 2022 at 12:26 AM Bruce Ashfield via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Fri, Apr 29, 2022 at 4:02 PM Bruce Ashfield via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Fri, Apr 29, 2022 at 8:41 AM Bruce Ashfield via<br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.opene=
mbedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I&#39;ll see about running the strace locally today. Ho=
pefully it pops up<br>
&gt; &gt; &gt; &gt; here so I can debug.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; FYI: I have the landlock test case passing here, there&#39;s=
 just an<br>
&gt; &gt; &gt; output difference from the kernel. The test is passing.<br>
&gt; &gt; <br>
&gt; &gt; I have located the exact kernel commit that changed the output, h=
ence<br>
&gt; &gt; why the test is failing.<br>
&gt; &gt; <br>
&gt; &gt; strace upstream hasn&#39;t adjusted yet, so I&#39;ll spin up a pa=
tch, and get<br>
&gt; &gt; send patches to the list over the weekend.<br>
&gt; <br>
&gt; The two patches that fix the strace ptest fail, and qemuarm graphical<=
br>
&gt; boot are on the list.<br>
<br>
Thanks Bruce! I&#39;ve queued it and started it running through testing.<br=
></blockquote><div><br></div><div>Since this patch, qemuarmv5 fails to buil=
d with:</div><div><br></div><div>00:01:47 NOTE: Running task 899 of 5734 (v=
irtual:native:/home/tuxbake/oe/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:d=
o_deploy_source_date_epoch)<br>00:01:47 ERROR: linux-yocto-5.15.36+gitAUTOI=
NC+fcf48627ea_ebfb1822e9-r0 do_kernel_metadata: Could not locate BSP defini=
tion for qemuarm/standard and no defconfig was provided<br>00:01:47 ERROR: =
linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0 do_kernel_metadata:=
 ExecutionError(&#39;/home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-g=
nueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.do_=
kernel_metadata.98856&#39;, 1, None, None)<br>00:01:47 ERROR: Logfile of fa=
ilure stored in: /home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-gnuea=
bi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/log.do_kern=
el_metadata.98856<br>00:01:47 Log data follows:<br>00:01:47 | DEBUG: Execut=
ing python function extend_recipe_sysroot<br>00:01:47 | NOTE: Direct depend=
encies are [&#39;/home/tuxbake/oe/poky/meta/recipes-kernel/kern-tools/kern-=
tools-native_git.bb:do_populate_sysroot&#39;]<br>00:01:47 | NOTE: Installed=
 into sysroot: []<br>00:01:47 | NOTE: Skipping as already exists in sysroot=
: [&#39;kern-tools-native&#39;]<br>00:01:47 | DEBUG: Python function extend=
_recipe_sysroot finished<br>00:01:47 | DEBUG: Executing shell function do_k=
ernel_metadata<br>00:01:47 | NOTE: do_kernel_metadata: for summary/debug, s=
et KCONF_AUDIT_LEVEL &gt; 0<br>00:01:47 | ERROR: Could not locate BSP defin=
ition for qemuarm/standard and no defconfig was provided<br>00:01:47 | WARN=
ING: /home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yoc=
to/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/run.do_kernel_metadata.=
98856:404 exit 1 from &#39;exit 1&#39;<br>00:01:47 | WARNING: Backtrace (BB=
 generated script):<br>00:01:47 | 	#1: bbfatal_log, /home/tuxbake/oe/build/=
tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf486=
27ea_ebfb1822e9-r0/temp/run.do_kernel_metadata.98856, line 404<br>00:01:47 =
| 	#2: do_kernel_metadata, /home/tuxbake/oe/build/tmp/work/qemuarmv5-poky-l=
inux-gnueabi/linux-yocto/5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0/temp/r=
un.do_kernel_metadata.98856, line 272<br>00:01:47 | 	#3: main, /home/tuxbak=
e/oe/build/tmp/work/qemuarmv5-poky-linux-gnueabi/linux-yocto/5.15.36+gitAUT=
OINC+fcf48627ea_ebfb1822e9-r0/temp/run.do_kernel_metadata.98856, line 435<b=
r>00:01:47 NOTE: recipe linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e=
9-r0: task do_kernel_metadata: Failed<br>00:01:47 ERROR: Task (/home/tuxbak=
e/oe/poky/meta/recipes-kernel/linux/linux-yocto_5.15.bb:do_kernel_metadata)=
 failed with exit code &#39;1&#39;<br></div><div><br></div><div>see full bu=
ild log<br></div><div><a href=3D"https://oebuilds.tuxbuild.com/28f9WxOsIhBe=
AgIbQH3DsCwyQCc/build-debug.log">https://oebuilds.tuxbuild.com/28f9WxOsIhBe=
AgIbQH3DsCwyQCc/build-debug.log</a><br></div><div><br></div><div><br></div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165076): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165076" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165076</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90753174/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90753174/1279857</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:nicolas.dechesne@linaro.or=
g" target=3D"_blank">nicolas.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000006005805de2a6f98--

