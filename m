Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11005E748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 15:06:55 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.61076.1696172809805846461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 08:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cHFPbOgX;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-79fe6da0049so272863939f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696172809; x=1696777609; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ssMSeKQvqacME84Hrby/2Fsjrqoq+1Nzlf5/jl/4FMc=;
        b=cHFPbOgXOSlp2hjopUi9EUAQo6CK4j+ZjPRPLrn/D7W2WnR0F+/dx4kuS4S3c7lWTk
         Wb2WEOW67E55Z3teDTxYQah3uFt4XK270SqeEi63r9BIrO3Gf0xXXfh0LRrouzIbo4+M
         vKK9hePer1lj/g2pCY7PpX7SirJJsdK40qDOj+Q61/lRhxUbZIBsz/JP6vcZPu+klr5q
         BHi+ou/H9Ry/1krb/5IEOV4mnMzGE/Ats5TjwEg7J1rsBC/vvmTJy3JMmlZtfkpU8doe
         5rs8IEJnou4/SihoQkjfy7Rb1uPPnU/FTnlI+8HsmsIXT5eCXRhW0Z+BQczLY3ZQKx/A
         FctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696172809; x=1696777609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssMSeKQvqacME84Hrby/2Fsjrqoq+1Nzlf5/jl/4FMc=;
        b=S9P36+cG0Zb8VNFQVR+ss0Z+MOPTFjcjvsir9BpfwewvvbL1Sc7F3rRiw9vx9r5t83
         TYYIrKewo5NaZmFK4nuJ+tER+gJ5G/D/wf4IArQlifRoKHz8okxYc+DDKzRerpaCJqY1
         9W3IWdgOhyhNrVcKL3ReNFL3rNKDjxkp/3MWpqK/BPkewR4Yo1NXfeTkMQUm5hkDMmBm
         TBCihCk5rbqZQuiFeqLDwuG0PMiq9dhd8v5AtVnjRxGw7g25uG0pvcS0xL0n3ln1c/lS
         SkQ/DDAulXoa7DeCdo82xFB/HVe5rQ9sRRaELWUcAFexpezJxtggS+dImBWzFKIKcplk
         QUWQ==
X-Gm-Message-State: AOJu0YyMiw68SSewFxtz9mV577WZB79jaW9JS23dLYqeMPBoy197Z4dk
	H1RRp43TVNUty9msfys6USzOK+jXhxmLRBJqwbEZMQ7X1og=
X-Google-Smtp-Source: AGHT+IFXIuiwWgUjLZ20xI0DPclh7+iuoXsSQaz8X5JfpKUQNcknQjlOx+FVOz84WATdUpNEOhQzNVm5o3LpdD8QHwM=
X-Received: by 2002:a6b:dc10:0:b0:79f:99b6:63 with SMTP id s16-20020a6bdc10000000b0079f99b60063mr10437355ioc.9.1696172808856;
 Sun, 01 Oct 2023 08:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
 <2c1e6c379204c619cc4fe41f1b3cea1b8c6582f7.camel@linuxfoundation.org>
 <a87cca5199af470fc7e3b415d57f5b3b8fad4318.camel@linuxfoundation.org> <CADkTA4OAMoHfeLLcp7Cr2KJOFj2gzZxNT66db7UG-=j7FgE6BQ@mail.gmail.com>
In-Reply-To: <CADkTA4OAMoHfeLLcp7Cr2KJOFj2gzZxNT66db7UG-=j7FgE6BQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 1 Oct 2023 11:06:37 -0400
Message-ID: <CADkTA4NN_ar2Gr86xQvy+DfpRcpC+Yn6va_fc2FTwqC+bPFWzQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bfebeb0606a9011f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 15:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188488

--000000000000bfebeb0606a9011f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 1, 2023 at 10:58=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

>
>
> On Sun, Oct 1, 2023 at 7:49=E2=80=AFAM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Sun, 2023-10-01 at 11:13 +0100, Richard Purdie wrote:
>> > On Fri, 2023-09-29 at 16:04 -0400, bruce.ashfield@gmail.com wrote:
>> > > Given where we are in the release cycle, this clearly is NOT a typic=
al
>> > > consolidated pull request.
>> > >
>> > > I've done what normally takes about three weeks in about 4 days.
>> > >
>> > > With 6.4 going EOL before expected upstream, it really isn't a
>> suitable
>> > > reference kernel for the release.
>> > >
>> > > So we've decided to take on the task of getting 6.5 ready and
>> available,
>> > > and at the same time moving the -dev kernel to v6.6. The -dev kernel
>> > > testing for 6.5 was critical for this, since I already knew the core
>> > > was sane.
>> > >
>> > > Also we've never shipped purposely mismatched libc-headers in the
>> release,
>> > > so I also took the leap to update the libc-headers to match.
>> > >
>> > > I've already sent fixes to meta-oe, and there's a btrfs update in th=
is
>> > > series to fix breakage that I found in the tightly coupled packages.
>> > >
>> > > I've built and booted core-image-kernel-dev, core-image-minimal,
>> core-image-sato
>> > > for both glibc and musl for all the supported architectures.
>> > > There will be some things that break regardless, but this needs the
>> > > better coverage of the AB.
>> > >
>> > > If this causes too much problems, our choices are to ship 6.4 EOLd, =
or
>> > > fall all the way back to 6.1.
>> > >
>> > > I'll remove 6.4 from master once we've figured out the fallout from
>> > > this kernel, and which direction we are going.
>> >
>> > I've merged this series which seemed to work fine. Given the time
>> > constraints, I thought I'd throw some 6.5 testing at the autobuilder.
>> > It ran into two issues. One was cryptodev, I have a patch for that in
>> > master-next. The other were entropy boot failures on arm kvm:
>> >
>> >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5512/s=
teps/12/logs/stdio
>> >
>> > [    0.796831] Key type id_resolver registered
>> > [    0.797581] Key type id_legacy registered
>> > [    0.798724] Key type cifs.idmap registered
>> > [    0.808070] jitterentropy: Initialization failed with host not
>> compliant with requirements: 9
>> > [    0.809690] xor: measuring software checksum speed
>> > [    0.811307]    8regs           : 12333 MB/sec
>> > [    0.812862]    32regs          : 12322 MB/sec
>> > [    0.814885]    arm64_neon      :  7851 MB/sec
>> > [    0.815626] xor: using function: 8regs (12333 MB/sec)
>> >
>> >
>> > -----------------------
>> > Central error: [    0.808070] jitterentropy: Initialization failed wit=
h
>> host not compliant with requirements: 9
>> > ***********************
>> >
>> > I did find this in google:
>> >
>> >
>> https://lore.kernel.org/linux-arm-kernel/68c6b70a-8d6c-08b5-46ce-2436074=
79d5c@i2se.com/T/
>> >
>> > which does bisect to a change.
>> >
>> > I'll rerun the autobuilder testing with the cryptodev patch and see if
>> > anything else transpires.
>>
>> The LTP on arm run failed:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5406
>>
>> which diving into the logs shows it went OOM and keeled over badly:
>>
>>
>> https://autobuilder.yocto.io/pub/failed-builds-data/qemu_boot_log.202310=
01101358
>
>
> I also had to up the memory on some of my ARM target testing. On target
> builds were failing in strange ways until I went to 512 or 1G of memory.
>
> But I thought that could have just been my setup.
>
>
>>
>> meta-virtualization doesn't like something:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2295
>>
>>
> There's a Xen uprev in the works, but obviously this one is something
> that I'll eventually sort out.
>

Aha. I didn't push the 6.5 kernel .inc file to meta-virt,so there's likely
missing configuration. I'll do that right now.

Bruce



>
>
>
>> The arm ptest failures above are unsurprisingly still around:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5513
>>
>> There may or may not be failing strace ptests on x86:
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5694/s=
teps/13/logs/stdio
>
>
> strace can be a problem at times. I'll have a look at that first thing
> monday or
> late tonight, if anyone else solves it .. let me know.
>
> Hopefully some of our ARM colleagues can help us out with the other
> issues, otherwise, I will start looking at them Monday.
>
> Bruce
>
>
>
>>
>>
>> but we didn't get the world build failures from cryptodev.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bfebeb0606a9011f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Oct 1, 2023 at 10:58=E2=80=AFAM Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sun, Oct 1, 2023 at 7:49=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linu=
xfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sun, 2023-10-01 at 11:13 +0100, Richard Purdie wrote:<br>
&gt; On Fri, 2023-09-29 at 16:04 -0400, <a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a> wrote:<br>
&gt; &gt; Given where we are in the release cycle, this clearly is NOT a ty=
pical<br>
&gt; &gt; consolidated pull request.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve done what normally takes about three weeks in about 4 da=
ys.<br>
&gt; &gt; <br>
&gt; &gt; With 6.4 going EOL before expected upstream, it really isn&#39;t =
a suitable<br>
&gt; &gt; reference kernel for the release.<br>
&gt; &gt; <br>
&gt; &gt; So we&#39;ve decided to take on the task of getting 6.5 ready and=
 available,<br>
&gt; &gt; and at the same time moving the -dev kernel to v6.6. The -dev ker=
nel<br>
&gt; &gt; testing for 6.5 was critical for this, since I already knew the c=
ore<br>
&gt; &gt; was sane.<br>
&gt; &gt; <br>
&gt; &gt; Also we&#39;ve never shipped purposely mismatched libc-headers in=
 the release,<br>
&gt; &gt; so I also took the leap to update the libc-headers to match.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve already sent fixes to meta-oe, and there&#39;s a btrfs u=
pdate in this<br>
&gt; &gt; series to fix breakage that I found in the tightly coupled packag=
es.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve built and booted core-image-kernel-dev, core-image-minim=
al, core-image-sato<br>
&gt; &gt; for both glibc and musl for all the supported architectures.<br>
&gt; &gt; There will be some things that break regardless, but this needs t=
he<br>
&gt; &gt; better coverage of the AB.<br>
&gt; &gt; <br>
&gt; &gt; If this causes too much problems, our choices are to ship 6.4 EOL=
d, or<br>
&gt; &gt; fall all the way back to 6.1.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ll remove 6.4 from master once we&#39;ve figured out the fa=
llout from<br>
&gt; &gt; this kernel, and which direction we are going.<br>
&gt; <br>
&gt; I&#39;ve merged this series which seemed to work fine. Given the time<=
br>
&gt; constraints, I thought I&#39;d throw some 6.5 testing at the autobuild=
er.<br>
&gt; It ran into two issues. One was cryptodev, I have a patch for that in<=
br>
&gt; master-next. The other were entropy boot failures on arm kvm:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/=
builds/5512/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5512/steps/12/=
logs/stdio</a><br>
&gt; <br>
&gt; [=C2=A0 =C2=A0 0.796831] Key type id_resolver registered<br>
&gt; [=C2=A0 =C2=A0 0.797581] Key type id_legacy registered<br>
&gt; [=C2=A0 =C2=A0 0.798724] Key type cifs.idmap registered<br>
&gt; [=C2=A0 =C2=A0 0.808070] jitterentropy: Initialization failed with hos=
t not compliant with requirements: 9<br>
&gt; [=C2=A0 =C2=A0 0.809690] xor: measuring software checksum speed<br>
&gt; [=C2=A0 =C2=A0 0.811307]=C2=A0 =C2=A0 8regs=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0: 12333 MB/sec<br>
&gt; [=C2=A0 =C2=A0 0.812862]=C2=A0 =C2=A0 32regs=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : 12322 MB/sec<br>
&gt; [=C2=A0 =C2=A0 0.814885]=C2=A0 =C2=A0 arm64_neon=C2=A0 =C2=A0 =C2=A0 :=
=C2=A0 7851 MB/sec<br>
&gt; [=C2=A0 =C2=A0 0.815626] xor: using function: 8regs (12333 MB/sec)<br>
&gt; <br>
&gt; <br>
&gt; -----------------------<br>
&gt; Central error: [=C2=A0 =C2=A0 0.808070] jitterentropy: Initialization =
failed with host not compliant with requirements: 9<br>
&gt; ***********************<br>
&gt; <br>
&gt; I did find this in google:<br>
&gt; <br>
&gt; <a href=3D"https://lore.kernel.org/linux-arm-kernel/68c6b70a-8d6c-08b5=
-46ce-243607479d5c@i2se.com/T/" rel=3D"noreferrer" target=3D"_blank">https:=
//lore.kernel.org/linux-arm-kernel/68c6b70a-8d6c-08b5-46ce-243607479d5c@i2s=
e.com/T/</a><br>
&gt; <br>
&gt; which does bisect to a change.<br>
&gt; <br>
&gt; I&#39;ll rerun the autobuilder testing with the cryptodev patch and se=
e if<br>
&gt; anything else transpires.<br>
<br>
The LTP on arm run failed:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/96/build=
s/5406" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/96/builds/5406</a><br>
<br>
which diving into the logs shows it went OOM and keeled over badly:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/failed-builds-data/qemu_boot_lo=
g.20231001101358" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yocto.io/pub/failed-builds-data/qemu_boot_log.20231001101358</a></blockquot=
e><div><br></div><div><div style=3D"font-size:small">I also had to up the m=
emory on some of my ARM target testing. On target</div><div style=3D"font-s=
ize:small">builds were failing in strange ways until I went to 512 or 1G of=
 memory.</div><br></div><div><div style=3D"font-size:small">But I thought t=
hat could have just been my setup.</div><br></div><div style=3D"font-size:s=
mall"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
meta-virtualization doesn&#39;t like something:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/128/buil=
ds/2295" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/128/builds/2295</a><br>
<br></blockquote><div><br></div><div><div style=3D"font-size:small">There&#=
39;s a Xen uprev in the works, but obviously this one is something</div><di=
v style=3D"font-size:small">that I&#39;ll eventually sort out.</div></div><=
/div></div></blockquote><div><br></div><div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Aha. I didn&#39;t push the 6.5 kernel .inc file to =
meta-virt,so there&#39;s likely missing configuration. I&#39;ll do that rig=
ht now.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
The arm ptest failures above are unsurprisingly still around:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/5513" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/82/builds/5513</a><br>
<br>
There may or may not be failing strace ptests on x86:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/5694/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5694/steps/13/logs/=
stdio</a></blockquote><div><br></div><div><div style=3D"font-size:small">st=
race can be a problem at times. I&#39;ll have a look at that first thing mo=
nday or</div><div style=3D"font-size:small">late tonight, if anyone else so=
lves it .. let me know.</div><div style=3D"font-size:small"><br></div><div =
style=3D"font-size:small">Hopefully some of our ARM colleagues can help us =
out with the other</div><div style=3D"font-size:small">issues, otherwise, I=
 will start looking at them Monday.</div><br></div><div><div style=3D"font-=
size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
but we didn&#39;t get the world build failures from cryptodev.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000bfebeb0606a9011f--

