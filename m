Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A416FD29FE6
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:33:23 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7244.1768386797124139863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U4/NEXxS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee0291921so9971235e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768386795; x=1768991595; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nNnKmZHNFnBRB6z3MPoZzKpRzdZ+JFl5Q9FRny5XyZw=;
        b=U4/NEXxSkEGN5brEmLaPknmsjRz2SRGrm4aIMREn/wDKdL7mo7G9keE+f7VfeMusYk
         3AqyjRbeVzPKq+GoMiW1MF+Myajc2l+EPiLvBa/x7lBqPzM/oL26ZLQarcSJzzW0M1Nt
         3f/1TRAhFUgxlc2PVXVr4mnX5Epjm6Yf4V9HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386795; x=1768991595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNnKmZHNFnBRB6z3MPoZzKpRzdZ+JFl5Q9FRny5XyZw=;
        b=lBbT32EoSW0fhMhubuAcEFhekeia7GJj2/n5sth3zrIc83xOER3xkEYBOKcQ4TkQWq
         hfGounXKx0s0mDTJh3lH55aOOD0hZQ7w7t3iJaV98vuXbXI/zFaG4REZYbOzwVPbexNo
         QBDIpAtv1N2m7lXR+CCjduhU2/TiXHbs3kN8W299a5Szlf91/kEzay8VBSAd2kmt5hjB
         Wszc4x6bJJnNFfa2T8p4KVfvdIbRPA/zFK7buSct8lPoTNObSwd7N31SnbXhLKlbdqLK
         wBaiSrw1vRzW1zQAVXd4a4+5Y2y8UNqwU7N8y2SBrRGV0GHjus5HJisWycy13NDeRKVA
         g6PQ==
X-Gm-Message-State: AOJu0YwGXwtuQwuOvnisRlqPhGCdZsHDvFEqV0iaPDr5G98TpbJqFfPv
	LIAz+xMTCyBDv/MUV7ZkngHqcpN6QpRbbqurJNjpVgcFf8xCXcOxSopNBqm29yaiOH4=
X-Gm-Gg: AY/fxX5HShvWA6TGEN37P8W2wG2AgvOIP7P2YhMafbPCMI+CC/tW+T0Xn/rc4qIpnwR
	Oy2msmqEs6KfGqWgw+helHZcmhahFoVXObSOHYlci/D6z2YTCagQsAAFhEidFppyvqWxU6OeQed
	Dayej6F3PZp08jbBsqhym5Da51bgFCuoR/HH50tBRMhw+0nd/LZ5rNReL1koChPluyAfXbfe9Nc
	bLeInQvL/HJZxtr6miozImsOTO5vRObOQHK6b2wrrQSm6Pi7xLPgNJiLVEH5LJPa2nxopO1VVRr
	sQ9GFJqWSKdUhDHAAkZ8pQRIBpfJRXbn5VKz3703ZvObPe+VAGjh6qaZ1Z6h1aFMROaVJnA0ApK
	QrQQHvX1NhJRs3BhhQYDRtmcLdVDJYcTnFWYyuFn7A85sR1Vdyeay7rp71dMcpVeD6oRmzztir9
	xkGAO915Qg4Qc0Hv97/lrrEv25VDVg8soCCrhue4KZvXf8xgrzW+30MfzKQ35GeUK34i+ZCu2kF
	mM=
X-Received: by 2002:a05:600c:8b12:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-47ee3318519mr23426105e9.5.1768386795515;
        Wed, 14 Jan 2026 02:33:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:94c7:73b9:87a6:4747? ([2001:8b0:aba:5f3c:94c7:73b9:87a6:4747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee562d7aasm21061475e9.11.2026.01.14.02.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:33:15 -0800 (PST)
Message-ID: <4ba4ca643eb20de0eddbcb4895598d22831b12be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 7/7] rust-target-config.bbclass: Update for
 new riscv TUNE_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	mark.hatle@kernel.crashing.org
Cc: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
Date: Wed, 14 Jan 2026 10:33:14 +0000
In-Reply-To: <CANNYZj-7dDr=UwCzDHW-EqMRPWvsSKX3DABLoAtQx1D0ba8k7g@mail.gmail.com>
References: 
	<1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
	 <1750203584-32065-8-git-send-email-mark.hatle@kernel.crashing.org>
	 <CANNYZj-7dDr=UwCzDHW-EqMRPWvsSKX3DABLoAtQx1D0ba8k7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229317

On Wed, 2026-01-14 at 11:16 +0100, Alexander Kanavin wrote:
> On Wed, 18 Jun 2025 at 01:39, Mark Hatle via lists.openembedded.org
> <mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tspec['llvm-abiname'] =3D "=
lp64d"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tspec['llvm-abiname'] =3D d=
.getVar('TUNE_RISCV_ABI')
> > =C2=A0=C2=A0=C2=A0=C2=A0 if "riscv32" in tspec['llvm-target']:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tspec['llvm-abiname'] =3D "=
ilp32d"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tspec['llvm-abiname'] =3D d=
.getVar('TUNE_RISCV_ABI')
>=20
> Unfortunately this adds a dependency on TUNE_RISCV_ABI (which is set
> only if the target is a risc-v machine) to rust-native's
> rust_gen_targets task, breaking sstate reuse for it between risc-v and
> any other target. I can imagine other native pieces written in rust
> will have the same issue.
>=20
> It's not immediately obvious to me how to address this, so I'd really
> appreciate suggestions. The code is hairy.
>=20
> Ticket: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16132

Nice find. I worry about our sstate tests not covering this. We might need =
to do:

-rust_gen_target[vardepsexclude] +=3D "ABIEXTENSION llvm_cpu"
+rust_gen_target[vardepsexclude] +=3D "ABIEXTENSION llvm_cpu TUNE_RISCV_ABI=
"

Cheers,

Richard


