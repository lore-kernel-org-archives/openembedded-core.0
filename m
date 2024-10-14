Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9436ED1813A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 17:48:34 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.1214.1728928105053177181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 10:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PescQWUS;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e7ffcd95c1so2245031eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728928104; x=1729532904; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThlXwdauMavaASOTEoA5FLXL1A7W4koNs8+7V8Rz8i0=;
        b=PescQWUSQERKl5suCyIZB8iDqPywy1mQz3fLps092TKbr3F+84alAnXAYzNHcm3Mt1
         sFmrraQpU2yirNyir1uLhlJXII1QGY5rmglG2lfDq2b7ylGqzP81xLmRYsNXJkwYtBg9
         jK/AEPwro4Nju6h9KzlTHTmLhUM3jOwnFrkoPuOOhEuWzdbmz76tomcCTnlHhdlBvrsG
         P1OX+K8JiHsEluHDDSYd5Oinw/iDs46aR7pauPSulalK1i/sVJtMSXh39QmPlQpL6CkT
         RnElJw8Ez+Xiobbq2LndunuBQ1ZBz7t5237fhJdO95BvwomRacVgY1G6MSAwTm/o6wgP
         iC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928104; x=1729532904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThlXwdauMavaASOTEoA5FLXL1A7W4koNs8+7V8Rz8i0=;
        b=aK5GRfty2pj+iM0j5tntwDzQ5ZDrvrXV9yWbNard2pvbdmPsdY+dND1QthariMMQC6
         uoET657HzQyTVtG5LLEUtWKp22pNCDsmsHyDZIHKuJ5BCZ8pk6/Mds047T6BMW6jmSU/
         zuJDFMPi6xI8n0OziNlDjN0U3t0FIE0tGubQ5ZA7FqrQoxwcFM1umoWHXTMjOzrchBF/
         qhzYVFS/QUQW6ja77vmkgiAjx70ug30h2qmUVMPc4Ke9DuK9TKohCXQzORsnZtYfVjPb
         HBCI6AtkqArWX4yZHvzSF3Eyp8G8zZjzVRxw8ohdXwaMK6tYPq7BYztnFD3H6iZF1Wav
         Ruvw==
X-Gm-Message-State: AOJu0YzRfv46VBCYFxKp5rsMDLFDhC6zt4tk82X95CjISf0pUceecpCw
	4bJ78NqELZkIOBXH7OQmwEeEk94sC7T4axwpHE3uMcUAi0rdPVQQemTNnO5NeiNhby9kd9O6Ffg
	SESJrecNFhjcfkzG45zyTvGdh29Q=
X-Google-Smtp-Source: AGHT+IFDM2gHMpMOhGjhbZDf+//qBXZRzYvG0bq6w9IcQQuEfPkWYvN9xH+e/CbVzysJ9iohn0yKMmIjI+84qtofmag=
X-Received: by 2002:a05:6820:2228:b0:5dc:cdf8:21c8 with SMTP id
 006d021491bc7-5eb1a183395mr6271894eaf.4.1728928104250; Mon, 14 Oct 2024
 10:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241013191703.317096-1-raj.khem@gmail.com> <1506FDBE-46E2-49A6-A6B6-01AE3F10BDF8@arm.com>
In-Reply-To: <1506FDBE-46E2-49A6-A6B6-01AE3F10BDF8@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Oct 2024 10:47:58 -0700
Message-ID: <CAMKF1spbRdy6Qtr4RDZeTe+aKb_rPvMe=GP5DsqV4FubdgK25g@mail.gmail.com>
Subject: Re: [PATCH] ffmpeg: Disable asm optimizations on x86
To: Ross Burton <Ross.Burton@arm.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 17:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205791

On Mon, Oct 14, 2024 at 4:02=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 13 Oct 2024, at 20:17, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > disable asm code if PIC is required, as the provided asm
> > decidedly is not PIC for x86.
>
> I think I=E2=80=99d prefer to see a revert of the textrel change I sent, =
with a comment explaining how to trigger it.  I tried, but didn=E2=80=99t c=
onsidering trying ldd.

well, revert is not required we should just apply this patch since the prob=
lem
is only on x86/32bit + nasm assembler. For reproducer here is one

https://termbin.com/zbzg

I hope that should make it clear ?

>
> Ross

