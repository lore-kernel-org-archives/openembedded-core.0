Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640F7C88E64
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:47:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15204.1769413636267056129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VSuq8dYT;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fed090e5fso2490879f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 23:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769413635; x=1770018435; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yfF1sj9GgaaENGY7bprf4vxq3bzmyiOpqJSQDiI5PWs=;
        b=VSuq8dYTIlp6MpYCyQ1xYh3QrQi9qd2TGDcL8PfROdlyaDLnZkcrrCZqMRQumE2J5Y
         z3exprAyBTfkITCaBoXNQzc81KjLGR78yW3Ke9aghTMW1n03QuycrbOs6CZtnoifrt1J
         /ovHjJ/QsV7c/WhZY4hFRbA6CAYS9cNYjXp7OMX2smI0zDRdP74CQhi2RqWoDgRb6kkX
         e0pwP6Tsm/rkmSejogpyiy9F9su4oRw30R0N362J8duir+t/5DgQzfWMcrDFxPQerQiB
         WOIN+aaatzcCdY6zT08BVR5tKzEdPJ7wwzMZMCwTQxaQH80xC6YKUbdfwZ4GyfB+LeZd
         8pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413635; x=1770018435;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfF1sj9GgaaENGY7bprf4vxq3bzmyiOpqJSQDiI5PWs=;
        b=QC7fd44Ihk74DorhxqdR9rwOYsj4hjnXYNMHE2THoWJWpGgdmDYuUETUdCqwViuseX
         9oD55XDHuCinFvXXJpnRTHPqHYXyUrksmz+NwBbG2EDzGKvijfYh/sH5MAV317ecN7I5
         RgjrgP5Ebu9LAk9oevr2b2IBI7xnFA1+EBmm+rUHOQHlQbuEXq35ccSXyPdItg5ijfii
         FKT3yTqz9xsQJkJ9dw6lmAVht2fNAaEDG8pKN4usnfzxO8ZOeQeGmfYu88s7LyMhSHEJ
         Btx6XT36mHrOKXKaa84kZIAhiB41PZNv5WT2aPnNWZOmSBKUN6Ahjs3k1MbJhfpBKE+k
         lb5Q==
X-Gm-Message-State: AOJu0Yws9ma7AmgKs53clbkvH2lsoNguAmGL8OdyWeHd2a9wTRx06p9d
	O3cAygBIvLGVCMv3TPnyH/mhgmWdK0gW+Z5P3noHdB+ZTLOsj09XnzDu
X-Gm-Gg: AZuq6aJRWZevZ96DxrLJ3Rcx18ARVWg/wM7IeuDyNBZ1/krj+MMynk7Y/AdD9QkXmBa
	ROhYOkNNgEgV8J3e6hAXMuia+9bncq6COznk0ahVrFb3BBcB/7RTqjHtjjGVJTqKYsgrFPwXwrC
	VshIzHYM5Q34QyiKPSZFLEvCQ0yt8NyQx6QnJiBrVPQrhVRsTKObPtC9EyX/2ghVBo1QmBvlN+K
	/dHJrNYXizEMXpFhrN48Q/tnRqBFUw3hKzDfNz2gmr68JVeE/iEfj/+bEvvimfE37gFuSbgJA9g
	ayPeO+bs2uqL310EA8VPEMWmIUR30feaNngWqGoYWCtep0ykaWLCtm1EQZwSZthIv1Udnv2lmG8
	Uq9HjRasBevnvXdSOFuL8GX8eiitper5aRvedkehd7kl5hIytnmFAIJiGnnyA8l+/tFshh1Dze/
	Tv4rlL4XYWeqfBY19aq/0ftS/0AH73Qi5S04j50xxnKg5ZV4Y38Q5b2D9wQS9ucKtZPU9MJkw=
X-Received: by 2002:a05:6000:40c9:b0:432:8651:4071 with SMTP id ffacd0b85a97d-435ca145270mr5587866f8f.18.1769413634324;
        Sun, 25 Jan 2026 23:47:14 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e715bfsm29653651f8f.22.2026.01.25.23.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:47:13 -0800 (PST)
Message-ID: <d8bd11b28f17eb2b110cf426a83bde71b8f06002.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/14] IDE SDK Improvements
From: adrian.freihofer@gmail.com
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2026 08:47:13 +0100
In-Reply-To: <DFTEDVX1EJ4O.ADHORW5LAF40@bootlin.com>
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
	 <DFNBA0VIZPB8.12G68QK151UGC@bootlin.com>
	 <3fce84b4562ce40c8ee858f36640ca1cfca39b20.camel@gmail.com>
	 <DFTEDVX1EJ4O.ADHORW5LAF40@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229968

On Tue, 2026-01-20 at 12:59 +0100, Antonin Godard wrote:
> Hi,
>=20
> On Wed Jan 14, 2026 at 7:37 PM CET, adrian.freihofer wrote:
> > Hi Antonin
> >=20
> > My proposal for proceeding here is to drop one patch from my
> > series:
> > =C2=A0 [OE-core] [PATCH v2 13/14]
> > =C2=A0 oe-selftest: devtool: add test for gdb pretty-printing
> >=20
> > This one get killed by patches which are currently on master-next
> > too.
> > This makes it almost impossible to fix at the moment.
> > When things will settle down, I will test and send this one again.
> >=20
> > It is just one more test step which would be nice to have but not
> > essential.
> > It also fails only on a ARM host, which I cannot reproduce.
> >=20
> > All in all just too many floating parts for getting this to final
> > state
> > right now.
> >=20
> > Could we please proceed with 13 out of 14 patches from my series as
> > a
> > next step? Mathieu already hat such a branch for a while.
>=20
> Sorry for messing up with what Mathieu had on his branch, probably a
> miss on my
> side as I've picked up his work.

The situation was very confusing.
>=20
> I picked your patches again, and while some oe-selftest runs did
> succeed, I hit
> this error, which seem related to your series:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4983396/raw_inl=
ine
>=20
> From this build:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3035
>=20
> It was run with the following commits:
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.=
yoctoproject.org/valkyrie/a-full-3073
>=20
> I don't recall hitting the issue before having your series in my
> branch, so to
> be sure I ran another build with only your series applied on master,
> and I still
> have the issue:
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5038061/raw_inl=
ine
>=20
> Can you have a look?

Yes, it seams that my patches can trigger this race issue. I sent a v3
with a fix.

Thank you for the extra effort. It's very helpful.

Adrian

>=20
> Antonin

