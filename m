Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE89AD29FED
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:57:43 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7528.1768388256871893531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dYrcr15w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47edffe5540so11850015e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 02:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768388255; x=1768993055; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d62dbcGZ7/rpKw6MS0Mnm7Q09+AJ0TySa92fCtXR/oc=;
        b=dYrcr15wnqu1cVwsxz8JIIiKSQOt964+sFYOELeCU6UTRGvE4+IqaQzUUynGqxX2BT
         a+WUYsv/lRUc6lBpa4Fu7UWpBOA/1efCKrQtX7/emir3CqMSaMYiYasbZpO/F47YKLuf
         DuamQsVcNwiSIrS8uyvQ3RAySgJlyjrQaYXFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768388255; x=1768993055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d62dbcGZ7/rpKw6MS0Mnm7Q09+AJ0TySa92fCtXR/oc=;
        b=SGKFwIj7txjIYkpD15I6RZI+lwlfCaI5+pjhZcRaRpIrcrcrB+rIyMdWNhmrJBSK2V
         TE7R/TnBpgwGIlWzSCt6ye/yi1VYDB0RlmBUAhELg4iww092Zg1tDd6dDMjP6msP3Y15
         m5IZHttZNmsHsYGkSvHzc+cRtyArWmgkoUVhASiHaV0LW+N+GGBR0JHSO0/cjKVFPcI8
         uanHtV9PKDYVoEfs62C33xoEUPRI+8v2dxiPoCE5zsevJBp/oE9h3+Jb1IV+3OBwRryo
         vblf1beleI8C6XBcT0hxGmJMKG/q3QU63oLk44Pwbn7ZWF1Ab/92sa1sKpnYRsW7+aOv
         bhcA==
X-Forwarded-Encrypted: i=1; AJvYcCWEQ7iWfj6lHYZoW4bzSfF1JUfQ00MC46QpSEmmKbyP5lC9ZdFoLlhPfQ1hzN6EdJTOaL9ND/O60joU47/chTeS5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRYIUVwHArUGji80Oh4aoUhOw1eOnnnqH6fKvhESEUzowBsQqn
	ykrvV3WlNyy0Cwc6FzUsz2QfnBaqHgmDJQb2seb+G7phtsLyL+9X/PiSZnkMwUjII4I=
X-Gm-Gg: AY/fxX6qsZPc/4CfGtJZiG83IGIw81gBAQmDLnZhttNoMrL22O3U/vEW9FMLtqLmNnI
	Xr5IzM7I62nvRV/8cZ4hQUGJdXMj/s5XoPR2S9KGYSzvv2erU90y00VzZHzIvpWvXzxe0OlU+Jf
	MUPmdOh1H/19RdV9BjiKcgSRV0tfNAacfP6jEPIatXI++dr12Wq0S1z2yiVU2vCTdVxo05MIKB3
	VN4fCFpKX56YM4WiA7u/YVEkx1VEDhTdlL4RqSm8hp34slQu3M1CLIQc66CQ6bkSSTKJha3ntJe
	LvQzMiA85L7vGk9Zfd00lUwYkSs1vDIjYW9dWTIYx4Mp4mwDPcLkBuve4nyOrnjZzJm+KWk5PaS
	36EXl4kd9dHGpgIgVgnxXqFrl3CwVKKp50zNPF/wVyzb9p1xZjzrhG+7zYfa+PzRlxRP9JfC66D
	EE9QyRm1UXalxWzvOrN2UtoSf14R8bDPnm0vheE/YIj3uL3cv/Bei72d0CDMd+ciPOLVuzPSAKD
	JoW+NOi2vY+IBxVVrgHKsZk
X-Received: by 2002:a05:600c:c0c3:20b0:47e:e481:7968 with SMTP id 5b1f17b1804b1-47ee4817d5amr15433905e9.31.1768388255212;
        Wed, 14 Jan 2026 02:57:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:94c7:73b9:87a6:4747? ([2001:8b0:aba:5f3c:94c7:73b9:87a6:4747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee54b90d5sm22386875e9.2.2026.01.14.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:57:34 -0800 (PST)
Message-ID: <e52b1b42d9b9d2d9d2c5d051ebbd266dd01885ac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 7/7] rust-target-config.bbclass: Update for
 new riscv TUNE_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: mark.hatle@kernel.crashing.org,
 openembedded-core@lists.openembedded.org,  Paul Barker <paul@pbarker.dev>
Date: Wed, 14 Jan 2026 10:57:33 +0000
In-Reply-To: <CANNYZj8VxKnzaq67qmXEziy8k+iMn-n8AGBQgC8rt48P8b35ew@mail.gmail.com>
References: 
	<1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
	 <1750203584-32065-8-git-send-email-mark.hatle@kernel.crashing.org>
	 <CANNYZj-7dDr=UwCzDHW-EqMRPWvsSKX3DABLoAtQx1D0ba8k7g@mail.gmail.com>
	 <4ba4ca643eb20de0eddbcb4895598d22831b12be.camel@linuxfoundation.org>
	 <CANNYZj8VxKnzaq67qmXEziy8k+iMn-n8AGBQgC8rt48P8b35ew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229320

On Wed, 2026-01-14 at 11:50 +0100, Alexander Kanavin wrote:
> On Wed, 14 Jan 2026 at 11:33, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > Nice find. I worry about our sstate tests not covering this. We
> > might need to do:
> >=20
> > -rust_gen_target[vardepsexclude] +=3D "ABIEXTENSION llvm_cpu"
> > +rust_gen_target[vardepsexclude] +=3D "ABIEXTENSION llvm_cpu
> > TUNE_RISCV_ABI"
>=20
> I thought of that, but would this rebuild correctly if someone first
> builds for one TUNE_RISCV_ABI, then for another? I just don't know
> enough about it to run experiments. It probably would, as that
> variable feeds into TUNE_CCARGS.

The comment above this line says:

# These are accounted for in tmpdir path names so don't need to be in the t=
ask sig

so in theory this would handle changes to different machines with
different ABIs fine, as long as those ABIs have different tmpdir paths
which they should.

It doesn't guard against the value of TUNE_RISCV_ABI changing for a
given target as that wouldn't rebuild correctly.

I guess if we wanted to be really clear, we could probably do something
like:

RUSTCONFIG_EXCLUDEVARS =3D ""
RUSTCONFIG_EXCLUDEVARS:class-native =3D "ABIEXTENSION llvm_cpu TUNE_RISCV_A=
BI"
RUSTCONFIG_EXCLUDEVARS:class-nativesdk =3D "ABIEXTENSION llvm_cpu TUNE_RISC=
V_ABI"
rust_gen_target[vardepsexclude] +=3D "${RUSTCONFIG_EXCLUDEVARS}"

but I guess we've not thought that was worth the effort in the past...

Cheers,

Richard

