Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183F8C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 11:06:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20153.1784631989428669202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 04:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e7ZAwe31;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f365afc5aso5562982f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 04:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784631987; x=1785236787; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2F6byZ1O8zaoG81yPDRte4VxlWAanQXcO2sDfoM2T/A=;
        b=e7ZAwe317rzVY/Ux8SegaBb4u1Ne94ymEQOAnYNLgXPF3GNeIwObBeXvxnmEMjtQPu
         FYIXmXmGm2VYe7fKssF5l1IZXQOAaWeJAO5CV1d1WOityq58uE3j/+Q4Vq6FEhFyUz4k
         ONWeRYxRfz+TiL3lvYnh2ZIGZXTFueXQHD4x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784631987; x=1785236787;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2F6byZ1O8zaoG81yPDRte4VxlWAanQXcO2sDfoM2T/A=;
        b=bJq9WKbHkhITjfZEXDSBClWkRSkLt3Bq60Z9H10eJ9u8ykr/4AAIHzQx9+E74cI6qt
         5o/qrXrUJHZRso7Vdt2Rv56FrB29EtFAugnwlA2Ug8VkEUTTbzs4d+cwfyPO9TpzaP1Y
         pr1E6rTGbky8J8DAyojxVrAjj9bh1Ha/epHOc+fnK4CE5W7694i9WoGwGMv+vARLFZIW
         /iYJAx4fjfn3ApaO+vSdsM+SZFtE77/3uqOfiYdCMyCID0uPJ4Shc3X85qMj0xDJ1liv
         /ncp6w0KlklYuS/8+7DL5rGK6AjEJburEMbce69Kd3x6tRY5O/6hs0W3/HyfjWpGccDq
         VS0A==
X-Gm-Message-State: AOJu0YwbItbGjSFAQfYflY0ATJmUdP5R+ORIkJWxAn8ZTVyN3h4Uvo/2
	AredziDpnOvIGzNio2BzDrXHU5w6ewqBGCXlOGal4ePHeTUIXT41ue699lR2mpUyGyttYqcDqvA
	m8/NxJbY=
X-Gm-Gg: AR+sD13D5rDkpFJgTRjUEN61H6WPtFW+iKhV26kOYniJwtjzu2hO0FDU/T8ZekTgMyG
	7fTy5VgX6tfnoPdS9K8fjZ9J4BLtXxVVUgaP+76b/4rsjKL5MKVrNDUbNLG9On2+PsP1m6SuOnm
	mEZ+plvYS98HYyTWUBKNWztoy25myJkceejZkwFGHwDlIjqDwhBw7QLJg/FF0escuur2U5EvlIS
	ugaF91IPNjxqCIr34uOiLPM94buDHzrEhgKOVOdU96YKSfGv2pf3Hd1okAOfEgZkvs0u+bffa6+
	2F610yGvXhmWjhxjVjvYLg9KgbaQmqYwmZnsn/hOUjJX10lEqRjvUb4EDc3DZMqxB5ElB1PxIhH
	yekV7Cx35/Gu4xJqgJwmrjwEZbN+s0JUysCkbpYLs+DzeQfySpLyldEPRNf0HBz9ecxn1W1ffdD
	smdUK8bAbtK3/gsB0rtfv3mTQZwhlWRYzBcWOWNEYKhOtgTxlUH5Kkf1ChqtxlLQOB+mABW/SLa
	cHxQQ==
X-Received: by 2002:a5d:5f86:0:b0:46d:9871:1a44 with SMTP id ffacd0b85a97d-47f6232c0bbmr22591851f8f.32.1784631987444;
        Tue, 21 Jul 2026 04:06:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1a08:6122:8bae:1f82? ([2001:8b0:aba:5f3c:1a08:6122:8bae:1f82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edcf8dsm40636347f8f.27.2026.07.21.04.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:06:26 -0700 (PDT)
Message-ID: <6edd296ba042635eb8e03507c6c90392b36869ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] Running large numbers of testimage tasks in parallel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>
Date: Tue, 21 Jul 2026 12:06:26 +0100
In-Reply-To: <18C2D268C91A8F9E.1021316@lists.openembedded.org>
References: <18C2D268C91A8F9E.1021316@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 11:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241516

On Thu, 2026-07-16 at 17:35 +0100, Richard Purdie via
lists.openembedded.org wrote:
> In order to try and attempt to reproduce the autobuilder qemuarm*
> hangs, I wanted to share a quick guide on how to hack things to make
> running multiple testimage tasks in parallel easy.
>=20
> Firstly, I added:
>=20
> BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+str(x) for x in
> range(0,100)])}"
>=20
> to core-image-sato.bb
>=20
> I then deleted the test case files listed at the end of the email to
> make the tests run faster. The hangs are generally in the boot
> process
> before login so if we reach that point, it isn't a hang scenario. I
> could have probably set TEST_SUITES instead.
>=20
> I then ran "bitbake core-image-sato" to get a base image to run the
> tests with. After that, I used the following script fragment:
>=20
> cd tmp/deploy/images/qemuarm64
> for i in `seq 1 100`
> do
> =C2=A0=C2=A0=C2=A0 ln -s core-image-sato{,-$i}-qemuarm64.rootfs.manifest
> =C2=A0=C2=A0=C2=A0 ln -s core-image-sato{,-$i}-qemuarm64.rootfs.ext4.zst
> =C2=A0=C2=A0=C2=A0 ln -s core-image-sato{,-$i}-qemuarm64.rootfs.testdata.=
json=20
> done
>=20
> I could the run 100 testimages in parallel with:
>=20
> bitbake `for ((i=3D1; i<=3D80; i++)); do echo -n "core-image-sato-$i ";
> done` -c testimage
>=20
> (which will run BB_NUMBER_THREADS in parallel)
>=20
> I'm sure there are neater ways to do it but this basically works.
>=20
> I haven't had any luck reproducing hangs with qemuarm64 with this
> yet.
> I did have to switch from using a DISPLAY over ssh to unsetting
> DISPLAY
> and using qemu's local vnc as otherwise the display traffic over ssh
> was limiting the CPU load I could trigger on my server.
>=20
> Hope someone finds this useful!

Rather than deleting tests, you can do:

TEST_SUITES =3D "date df parselogs perl ping scp ssh xorg"

Also, there is a decompression race in runqemu as it assumes only it is
booting a given image. You can work around it by creating an
uncompressed copy of the image in advance, e.g.:

zstd -d core-image-sato-qemuarmv5.rootfs-20260721071104.ext4.zst -o core-im=
age-sato-qemuarmv5.rootfs-20260721071104.ext4

Cheers,

Richard

