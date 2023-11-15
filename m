Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5407EC48BF9
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:21:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.14251.1700058104842979023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mcUT76kL;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso56154735e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 06:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700058103; x=1700662903; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VyVhA37oBhZIkos6tosHHfWF3zNLF8b6pX3bqqfuQSc=;
        b=mcUT76kLCv6ET+29oB60L2hqDiy6JMUc/r4ceWqWUrJlQysMHvQXVQuh96hwFao3Wr
         F7LQLVVkx8NqF4HOpsk1zPIKC7u15xhYQosYcqTESGk1FpsTJ2V/DkhWgd88JzAhWQfl
         lYWpX6P2oftTFhykjbvngB0Fq90UFqFj09yr0+23cEx3vItpUv/6ZxXknDDgHfjM0iWS
         hbaOw9s81zXMTaVhNWi1zzJL4zz3ccLpnHD/E3VEDCdVKxsxnQv70xrxuFrKna3XFY1f
         zMRppyY058ZgnzGXDze1yRSIsK/avk8hceARGkkDQjnFuPaE/lQX9cZGTgWBzpPi3QQg
         5j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058103; x=1700662903;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyVhA37oBhZIkos6tosHHfWF3zNLF8b6pX3bqqfuQSc=;
        b=NASS358xzG3vJgq/Ghml/IGenmTI2TAOZ2t7ZGkLOhLjK/kRVNXjEUgM2whwOKl6Kk
         uSCEjtoVcrIos3rn02oJg1j/eyQJnHe1ac2KLUn0X8/jg3SQd5DX0CeY/3vNWo0Ss8M8
         KMTyQU7fcGEtiV8+7aN/8NG7hhx8qME1VUU2zgCMHPilZYZKhjwuviCEWvzO/vihN1su
         tTiUOlD0f8SP5tg66rW7UAU9/+R2tn67IaHnyTFz4rGy557bjgHBIgu/MeEEojL0JOzJ
         VqcYZsIvfRP4bA5za3XmR74wWPz6tPC7d/Az+RCzuyXw2wi/UpUi9/f4pz5/6Du/hdXy
         TcWQ==
X-Gm-Message-State: AOJu0Yyml2c/P6eqImR9siTS2mXbQNN/Gh60lzyQw6ERQUoENNZnkISg
	OpIMBjk+z7zGmj/555q2eAs=
X-Google-Smtp-Source: AGHT+IErUaYlJ7El3JZxbPgkeOJGlNYdEv6Hg3R51nNXvrrAvlYiAF9QZXc8CJKwx62Juu71GIs/bA==
X-Received: by 2002:a05:600c:1d81:b0:409:404e:5ba6 with SMTP id p1-20020a05600c1d8100b00409404e5ba6mr9839497wms.35.1700058103009;
        Wed, 15 Nov 2023 06:21:43 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d408b000000b0032196c508e3sm10697287wrp.53.2023.11.15.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:21:42 -0800 (PST)
Message-ID: <1952881b121248aaae11df8b884caba82d567bec.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the
 default
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: enguerrand.de-ribaucourt@savoirfairelinux.com, Ross.Burton@arm.com
Date: Wed, 15 Nov 2023 15:21:41 +0100
In-Reply-To: <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-4-adrian.freihofer@siemens.com>
	 <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190602

On Mon, 2023-11-06 at 13:50 +0000, Richard Purdie wrote:
> On Wed, 2023-11-01 at 12:01 +0100, Adrian Freihofer wrote:
> > Remove the image-combined-dbg.bbclass and make this the default
> > behavior for the rootfs-dbg. A rootfs-dbg with only debug symbols
> > but
> > no executable binaries also causes problems with gdb, which is
> > probably the most common use case for the roofs-dbg. This change
> > simplifies and improves the user experience for a slightly larger
> > rootfs-dbg.
> >=20
> > If the rootfs-dbg contains a complete copy of the rootfs, it is
> > also
> > usable for booting the target device over the network. This in turn
> > simplifies other use cases with e.g. the use of perf on a device
> > booted over the network.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> I'm being pressured for review on this so I'll just say what the
> problem is. I struggle to review this as off the top of my head, I
> can't remember the difference between "rootfs-dbg" or "image-
> combined-
> dbg". I understand the patch gets rid of one and the argument appears
> to be that gdb doesn't work well with the case that is removed.
>=20
> What isn't here is any reminder of what the differences are, or a
> pointer to the history which lead us to have two different modes in
> the
> first place. We presumably had a reason for adding it.
>=20
> That means in order to review it, I'd have to dig into the history
> and
> work out the differences, then work out why we added the two modes
> and
> then determine if they're still needed.
>=20
> What would help speed up review would be a pointer to the original
> commits and/or a summary of why the were added. A summary of the
> differences between the two modes would also help/
>=20

We have tried to work through the git history and to search for use
cases that rely on the old implementation. The git history does not
explain why it is like it is.

Enguerrand came up with theoretical use cases where the rootfs-dbg
could be mounted somehow as overlay at run-time. I can't rule out the
possibility of someone doing something like that.

Maybe we should keep that as it is.

@Ross: do you have a different opinion regarding the discussion we had:
https://lists.openembedded.org/g/openembedded-core/message/188995


Here are my notes. Just in case we would like to come back to this some
when.

- 7a7c6b021f114c6bedfbdc9afd2bf2925b238d19:
  The first implementation of rootfs-dbg only added the *-dbg packages
  and the package database.
- 69d3df9169133d5e05eff25019569fb8974d48c2
- c1ce0d9a9e200e35a9b6f9d537232875683ab9f1
- e73a85be3e020561db92a197c593afe7fd952919
- 1800b1ba7ae07cd010e529653eaa1d7a5841e6e5
  Added some workarounds related to opkg and openssl which got finally
  reverted again.
- 364c4c7d3fc049f2b734a6a235758a75af364ce0
  Support for PACKAGE_DEBUG_SPLIT_STYLE=3D 'debug-with-srcpkg'
- 5f30534c47571d199d8655b3da51f7b55fe20c04
  Introduce IMAGE_INSTALL_DEBUGFS
- 18f080fbe4cf51824e5f1d73a10e06e3a5724423
  Removes the package database later, as it caused problems with RPMs.

Comparison of
  $ tar xvfj core-image-minimal-qemux86-64.rootfs.tar.bz2
  $ tar xvfj core-image-minimal-qemux86-64.rootfs-dbg.tar.bz2
without this patch verus
  $ tar xvfj core-image-minimal-qemux86-64.rootfs-dbg.tar.bz2
with this patch applied shows some differences. This is expected
because
some of the post rootfs steps run after rootfs gets copied to
rootfs-dbg. Changing this would require more changes.

$ diff -r --no-dereference debug-fs1 debug-fs2
Only in debug-fs1/etc/default: postinst
Only in debug-fs2/etc/init.d: run-postinsts
diff -r --no-dereference debug-fs1/etc/issue debug-fs2/etc/issue
1c1
< Poky (Yocto Project Reference Distro) 4.3+snapshot-
bc66d6ea4b3a6e6c9131295ee0783b88b5a90a02 \n \l
---
> Poky (Yocto Project Reference Distro) 4.3+snapshot-
44ec9356d2d8686189531b55b2bd2b268b5dffa3 \n \l
diff -r --no-dereference debug-fs1/etc/issue.net debug-
fs2/etc/issue.net
1c1
< Poky (Yocto Project Reference Distro) 4.3+snapshot-
bc66d6ea4b3a6e6c9131295ee0783b88b5a90a02 %h
---
> Poky (Yocto Project Reference Distro) 4.3+snapshot-
44ec9356d2d8686189531b55b2bd2b268b5dffa3 %h
Only in debug-fs1/etc: ld.so.cache
Only in debug-fs2/etc/rcS.d: S99run-postinsts
Only in debug-fs1/etc: timestamp
Only in debug-fs1/etc: version
Only in debug-fs2/usr/sbin: run-postinsts
Only in debug-fs2/var/volatile: log
Only in debug-fs2/var/volatile: tmp

Best reagrds,
Adrian

> Cheers,
>=20
> Richard
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190217):
> https://lists.openembedded.org/g/openembedded-core/message/190217
> Mute This Topic: https://lists.openembedded.org/mt/102316026/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


