Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16CBC072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 16:26:37 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17704.1700065595477433722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 08:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MOaXMA8q;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: kergoth@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cc4f777ab9so54467915ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700065595; x=1700670395; darn=lists.openembedded.org;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=++JHfJAt2ObVngdDXe7GHvt/LRwF9q5YZJByoSYwPFQ=;
        b=MOaXMA8qwBchYVabOEycOJaYCtPNzgB7/qUkrrDe4WK0qOVsBxsVf4T88JIc8GEte+
         krBB8q0qFieeU6MFDmql2MHy7P2okv+egpv2GQabQDsVrVbRL8hYcBFyCgGd8+YLDze8
         9zX1WYCnlQHYDaGDTIqzJXW0tJvYLrtyqBahq3NVpaU/K8vOpHqB3AHmY9NIEdP2uVcm
         AtG8AG/GIa15DVG6pvniAsF/6aqC6vt3KnT0Pd3DYJd+9onH+gtrQBUz8E7c26ctTGMT
         TZapWTKG+RcDE3gxNaatul9/Ollv31A/y4FJl9UByiT08lanF/zb3zsF5ZssZyNWS3V9
         tVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065595; x=1700670395;
        h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++JHfJAt2ObVngdDXe7GHvt/LRwF9q5YZJByoSYwPFQ=;
        b=CYXuX2a5gKNJPEmb4H+JPLa27YtkD2P+KKBuKCYf8vqeUm9hZMkv7y1ZVCuV9UO/uE
         gxXHRgYK6GLCq0Pt2aR72e9cSYE8og3aZYmedbPJmi8Yi0lECUCNCAtDA72nRxCheo55
         LkdqnqzPAmEs2sob8k/VMj6TJR3prqIdhekVi8lRbDt3HFdxoobHHRDE16LwRW8+OEXu
         rjks6f/Sfz5MK6rwPoGykMvHf+Oohrt3wAysxvb3vMMTNdiQ1zAOlIT7Qg8Tsk2F5jSy
         Kud+pHIficNV5ujasHrUrDADTtjaIejYU30SOG1p72D2vP0/K2PGRZLj01EWpL6XaTFn
         faNw==
X-Gm-Message-State: AOJu0Yzso7t8Ri4Nzz1It92K31BTKLVww5NaUIFCpX5+uII/7E00xu54
	5/IcgS/wBt4G2iNgj2wNMsQ=
X-Google-Smtp-Source: AGHT+IFiWel8PcaEhYmsgh0RA55Z3viS24CxAR6QTuyNg6/Jyo0nTQY0DfBZhXdQRC8SwnD3Ket4xA==
X-Received: by 2002:a17:903:11c3:b0:1c9:dff6:58e8 with SMTP id q3-20020a17090311c300b001c9dff658e8mr7085340plh.54.1700065594744;
        Wed, 15 Nov 2023 08:26:34 -0800 (PST)
Received: from [2600:8800:6cc0:300:40ca:3404:70:0] ([2600:8800:6cc0:300::1005])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902d34900b001b9d335223csm7597517plk.26.2023.11.15.08.26.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:26:34 -0800 (PST)
Date: Wed, 15 Nov 2023 09:26:26 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 openembedded-core@lists.openembedded.org, Adrian Freihofer
 <adrian.freihofer@gmail.com>
Cc: enguerrand.de-ribaucourt@savoirfairelinux.com, Ross.Burton@arm.com
Message-ID: <b98adc29-7e18-4c68-b94c-4b9b5b2a38db@Spark>
In-Reply-To: <1952881b121248aaae11df8b884caba82d567bec.camel@gmail.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
 <20231101110129.647878-4-adrian.freihofer@siemens.com>
 <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
 <1952881b121248aaae11df8b884caba82d567bec.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the
 default
X-Readdle-Message-ID: b98adc29-7e18-4c68-b94c-4b9b5b2a38db@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6554f139_5fae8bf2_17301"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 16:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190734

--6554f139_5fae8bf2_17301
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Can you explain your issues with gdb with using a rootfs-dbg, because I d=
on=E2=80=99t see any problem with a filesystem that only contains debug s=
ymbols, given how easily gdb can be configured to look into alternate pat=
hs. I=E2=80=99ll admit I also don=E2=80=99t know the difference between t=
hese modes, and also wonder how IMAGE=5FGEN=5FDEBUG=46S relates.

--
Christopher Larson
chris=5Flarson=40mentor.com, chris.larson=40siemens.com, kergoth=40gmail.=
com
Principal Software Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemens =
Digital Industries Software
On Nov 15, 2023 at 7:21=E2=80=AFAM -0700, Adrian =46reihofer <adrian.frei=
hofer=40gmail.com>, wrote:
> On Mon, 2023-11-06 at 13:50 +0000, Richard Purdie wrote:
> > On Wed, 2023-11-01 at 12:01 +0100, Adrian =46reihofer wrote:
> > > Remove the image-combined-dbg.bbclass and make this the default
> > > behavior for the rootfs-dbg. A rootfs-dbg with only debug symbols
> > > but
> > > no executable binaries also causes problems with gdb, which is
> > > probably the most common use case for the roofs-dbg. This change
> > > simplifies and improves the user experience for a slightly larger
> > > rootfs-dbg.
> > >
> > > If the rootfs-dbg contains a complete copy of the rootfs, it is
> > > also
> > > usable for booting the target device over the network. This in turn=

> > > simplifies other use cases with e.g. the use of perf on a device
> > > booted over the network.
> > >
> > > Signed-off-by: Adrian =46reihofer <adrian.freihofer=40siemens.com>
> >
> > I'm being pressured for review on this so I'll just say what the
> > problem is. I struggle to review this as off the top of my head, I
> > can't remember the difference between =22rootfs-dbg=22 or =22image-
> > combined-
> > dbg=22. I understand the patch gets rid of one and the argument appea=
rs
> > to be that gdb doesn't work well with the case that is removed.
> >
> > What isn't here is any reminder of what the differences are, or a
> > pointer to the history which lead us to have two different modes in
> > the
> > first place. We presumably had a reason for adding it.
> >
> > That means in order to review it, I'd have to dig into the history
> > and
> > work out the differences, then work out why we added the two modes
> > and
> > then determine if they're still needed.
> >
> > What would help speed up review would be a pointer to the original
> > commits and/or a summary of why the were added. A summary of the
> > differences between the two modes would also help/
> >
>
> We have tried to work through the git history and to search for use
> cases that rely on the old implementation. The git history does not
> explain why it is like it is.
>
> Enguerrand came up with theoretical use cases where the rootfs-dbg
> could be mounted somehow as overlay at run-time. I can't rule out the
> possibility of someone doing something like that.
>
> Maybe we should keep that as it is.
>
> =40Ross: do you have a different opinion regarding the discussion we ha=
d:
> https://lists.openembedded.org/g/openembedded-core/message/188995
>
>
> Here are my notes. Just in case we would like to come back to this some=

> when.
>
> - 7a7c6b021f114c6bedfbdc9afd2bf2925b238d19:
> The first implementation of rootfs-dbg only added the *-dbg packages
> and the package database.
> - 69d3df9169133d5e05eff25019569fb8974d48c2
> - c1ce0d9a9e200e35a9b6f9d537232875683ab9f1
> - e73a85be3e020561db92a197c593afe7fd952919
> - 1800b1ba7ae07cd010e529653eaa1d7a5841e6e5
> Added some workarounds related to opkg and openssl which got finally
> reverted again.
> - 364c4c7d3fc049f2b734a6a235758a75af364ce0
> Support for PACKAGE=5FDEBUG=5FSPLIT=5FSTYLE=3D 'debug-with-srcpkg'
> - 5f30534c47571d199d8655b3da51f7b55fe20c04
> Introduce IMAGE=5FINSTALL=5FDEBUG=46S
> - 18f080fbe4cf51824e5f1d73a10e06e3a5724423
> Removes the package database later, as it caused problems with RPMs.
>
> Comparison of
> =24 tar xvfj core-image-minimal-qemux86-64.rootfs.tar.bz2
> =24 tar xvfj core-image-minimal-qemux86-64.rootfs-dbg.tar.bz2
> without this patch verus
> =24 tar xvfj core-image-minimal-qemux86-64.rootfs-dbg.tar.bz2
> with this patch applied shows some differences. This is expected
> because
> some of the post rootfs steps run after rootfs gets copied to
> rootfs-dbg. Changing this would require more changes.
>
> =24 diff -r --no-dereference debug-fs1 debug-fs2
> Only in debug-fs1/etc/default: postinst
> Only in debug-fs2/etc/init.d: run-postinsts
> diff -r --no-dereference debug-fs1/etc/issue debug-fs2/etc/issue
> 1c1
> < Poky (Yocto Project Reference Distro) 4.3+snapshot-
> bc66d6ea4b3a6e6c9131295ee0783b88b5a90a02 =5Cn =5Cl
> ---
> > Poky (Yocto Project Reference Distro) 4.3+snapshot-
> 44ec9356d2d8686189531b55b2bd2b268b5dffa3 =5Cn =5Cl
> diff -r --no-dereference debug-fs1/etc/issue.net debug-
> fs2/etc/issue.net
> 1c1
> < Poky (Yocto Project Reference Distro) 4.3+snapshot-
> bc66d6ea4b3a6e6c9131295ee0783b88b5a90a02 %h
> ---
> > Poky (Yocto Project Reference Distro) 4.3+snapshot-
> 44ec9356d2d8686189531b55b2bd2b268b5dffa3 %h
> Only in debug-fs1/etc: ld.so.cache
> Only in debug-fs2/etc/rcS.d: S99run-postinsts
> Only in debug-fs1/etc: timestamp
> Only in debug-fs1/etc: version
> Only in debug-fs2/usr/sbin: run-postinsts
> Only in debug-fs2/var/volatile: log
> Only in debug-fs2/var/volatile: tmp
>
> Best reagrds,
> Adrian
>
> > Cheers,
> >
> > Richard
> >
> >
> >
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (=23190602): https://lists.openembedded.org/g/openemb=
edded-core/message/190602
> Mute This Topic: https://lists.openembedded.org/mt/102316026/3617123
> Group Owner: openembedded-core+owner=40lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =5B=
kergoth=40gmail.com=5D
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--6554f139_5fae8bf2_17301
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>Can you explain your issues with gdb with using a r=
ootfs-dbg, because I don=E2=80=99t see any problem with a filesystem that=
 only contains debug symbols, given how easily gdb can be configured to l=
ook into alternate paths. I=E2=80=99ll admit I also don=E2=80=99t know th=
e difference between these modes, and also wonder how IMAGE=5FGEN=5FDEBUG=
=46S relates.</div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div class=3D=22match=46ont=22>
<div dir=3D=22auto=22>--</div>
<div dir=3D=22auto=22>Christopher Larson</div>
<div dir=3D=22auto=22>chris=5Flarson=40mentor.com, chris.larson=40siemens=
.com, kergoth=40gmail.com</div>
<div dir=3D=22auto=22><span style=3D=22color: var(--textColor); backgroun=
d-color: var(--backgroundColor);=22>Principal Software Engineer,&=23160;<=
/span><span style=3D=22color: var(--textColor); background-color: var(--b=
ackgroundColor);=22>Embedded Linux Solutions,&=23160;</span><span style=3D=
=22color: var(--textColor); background-color: var(--backgroundColor);=22>=
Siemens Digital Industries Software</span><br /></div>
</div>
</div>
<div name=3D=22messageReplySection=22>On Nov 15, 2023 at 7:21=E2=80=AFAM =
-0700, Adrian =46reihofer &lt;adrian.freihofer=40gmail.com&gt;, wrote:<br=
 />
<blockquote type=3D=22cite=22 style=3D=22border-left-color: grey; border-=
left-width: thin; border-left-style: solid; margin: 5px 5px;padding-left:=
 10px;=22>On Mon, 2023-11-06 at 13:50 +0000, Richard Purdie wrote:<br />
<blockquote type=3D=22cite=22>On Wed, 2023-11-01 at 12:01 +0100, Adrian =46=
reihofer wrote:<br />
<blockquote type=3D=22cite=22>Remove the image-combined-dbg.bbclass and m=
ake this the default<br />
behavior for the rootfs-dbg. A rootfs-dbg with only debug symbols<br />
but<br />
no executable binaries also causes problems with gdb, which is<br />
probably the most common use case for the roofs-dbg. This change<br />
simplifies and improves the user experience for a slightly larger<br />
rootfs-dbg.<br />
<br />
If the rootfs-dbg contains a complete copy of the rootfs, it is<br />
also<br />
usable for booting the target device over the network. This in turn<br />=

simplifies other use cases with e.g. the use of perf on a device<br />
booted over the network.<br />
<br />
Signed-off-by: Adrian =46reihofer &lt;adrian.freihofer=40siemens.com&gt;<=
br /></blockquote>
<br />
I'm being pressured for review on this so I'll just say what the<br />
problem is. I struggle to review this as off the top of my head, I<br />
can't remember the difference between =22rootfs-dbg=22 or =22image-<br />=

combined-<br />
dbg=22. I understand the patch gets rid of one and the argument appears<b=
r />
to be that gdb doesn't work well with the case that is removed.<br />
<br />
What isn't here is any reminder of what the differences are, or a<br />
pointer to the history which lead us to have two different modes in<br />=

the<br />
first place. We presumably had a reason for adding it.<br />
<br />
That means in order to review it, I'd have to dig into the history<br />
and<br />
work out the differences, then work out why we added the two modes<br />
and<br />
then determine if they're still needed.<br />
<br />
What would help speed up review would be a pointer to the original<br />
commits and/or a summary of why the were added. A summary of the<br />
differences between the two modes would also help/<br />
<br /></blockquote>
<br />
We have tried to work through the git history and to search for use<br />=

cases that rely on the old implementation. The git history does not<br />=

explain why it is like it is.<br />
<br />
Enguerrand came up with theoretical use cases where the rootfs-dbg<br />
could be mounted somehow as overlay at run-time. I can't rule out the<br =
/>
possibility of someone doing something like that.<br />
<br />
Maybe we should keep that as it is.<br />
<br />
=40Ross: do you have a different opinion regarding the discussion we had:=
<br />
https://lists.openembedded.org/g/openembedded-core/message/188995<br />
<br />
<br />
Here are my notes. Just in case we would like to come back to this some<b=
r />
when.<br />
<br />
- 7a7c6b021f114c6bedfbdc9afd2bf2925b238d19:<br />
The first implementation of rootfs-dbg only added the *-dbg packages<br /=
>
and the package database.<br />
- 69d3df9169133d5e05eff25019569fb8974d48c2<br />
- c1ce0d9a9e200e35a9b6f9d537232875683ab9f1<br />
- e73a85be3e020561db92a197c593afe7fd952919<br />
- 1800b1ba7ae07cd010e529653eaa1d7a5841e6e5<br />
Added some workarounds related to opkg and openssl which got finally<br /=
>
reverted again.<br />
- 364c4c7d3fc049f2b734a6a235758a75af364ce0<br />
Support for PACKAGE=5FDEBUG=5FSPLIT=5FSTYLE=3D 'debug-with-srcpkg'<br />
- 5f30534c47571d199d8655b3da51f7b55fe20c04<br />
Introduce IMAGE=5FINSTALL=5FDEBUG=46S<br />
- 18f080fbe4cf51824e5f1d73a10e06e3a5724423<br />
Removes the package database later, as it caused problems with RPMs.<br /=
>
<br />
Comparison of<br />
=24 tar xvfj core-image-minimal-qemux86-64.rootfs.tar.bz2<br />
=24 tar xvfj core-image-minimal-qemux86-64.rootfs-dbg.tar.bz2<br />
without this patch verus<br />
=24 tar xvfj core-image-minimal-qemux86-64.rootfs-dbg.tar.bz2<br />
with this patch applied shows some differences. This is expected<br />
because<br />
some of the post rootfs steps run after rootfs gets copied to<br />
rootfs-dbg. Changing this would require more changes.<br />
<br />
=24 diff -r --no-dereference debug-fs1 debug-fs2<br />
Only in debug-fs1/etc/default: postinst<br />
Only in debug-fs2/etc/init.d: run-postinsts<br />
diff -r --no-dereference debug-fs1/etc/issue debug-fs2/etc/issue<br />
1c1<br />
&lt; Poky (Yocto Project Reference Distro) 4.3+snapshot-<br />
bc66d6ea4b3a6e6c9131295ee0783b88b5a90a02 =5Cn =5Cl<br />
---<br />
<blockquote type=3D=22cite=22>Poky (Yocto Project Reference Distro) 4.3+s=
napshot-<br /></blockquote>
44ec9356d2d8686189531b55b2bd2b268b5dffa3 =5Cn =5Cl<br />
diff -r --no-dereference debug-fs1/etc/issue.net debug-<br />
fs2/etc/issue.net<br />
1c1<br />
&lt; Poky (Yocto Project Reference Distro) 4.3+snapshot-<br />
bc66d6ea4b3a6e6c9131295ee0783b88b5a90a02 %h<br />
---<br />
<blockquote type=3D=22cite=22>Poky (Yocto Project Reference Distro) 4.3+s=
napshot-<br /></blockquote>
44ec9356d2d8686189531b55b2bd2b268b5dffa3 %h<br />
Only in debug-fs1/etc: ld.so.cache<br />
Only in debug-fs2/etc/rcS.d: S99run-postinsts<br />
Only in debug-fs1/etc: timestamp<br />
Only in debug-fs1/etc: version<br />
Only in debug-fs2/usr/sbin: run-postinsts<br />
Only in debug-fs2/var/volatile: log<br />
Only in debug-fs2/var/volatile: tmp<br />
<br />
Best reagrds,<br />
Adrian<br />
<br />
<blockquote type=3D=22cite=22>Cheers,<br />
<br />
Richard<br />
<br />
<br />
<br /></blockquote>
<br />
<br />
<br />
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br />
Links: You receive all messages sent to this group.<br />
View/Reply Online (=23190602): https://lists.openembedded.org/g/openembed=
ded-core/message/190602<br />
Mute This Topic: https://lists.openembedded.org/mt/102316026/3617123<br /=
>
Group Owner: openembedded-core+owner=40lists.openembedded.org<br />
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =5B=
kergoth=40gmail.com=5D<br />
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br />
<br /></blockquote>
</div>
</body>
</html>

--6554f139_5fae8bf2_17301--


