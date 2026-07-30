Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1855DC55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:50:27 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12094.1785419417217258094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 06:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WuXIee5z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954aff6088so19683055e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785419415; x=1786024215; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X9Bw4qXtyxxLUguoqIolhPAeJj4VgKJSM/HUwYaa3aU=;
        b=WuXIee5zKEL3x6vPhG9PdBD0Qd12a9y4MydmFCWLAWf5HETbnLQwm9kZwII8CKIl4U
         X/o/KV+CTiquVbJ3k1Ov5RHFxtRmiluJgr1ZbBJT41VUdRzzBeZEQzRNGf/ouw/cZ8qq
         tsbcbRcRAKK6SgTVDAdwP6vcA5S8sDYjZWjLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419415; x=1786024215;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9Bw4qXtyxxLUguoqIolhPAeJj4VgKJSM/HUwYaa3aU=;
        b=lMQuetKCKGB3xCAdxY8BQIqx1rXz5yO86nC/T4QELjW6SHDvMGALFm/e9EWJs+OUHv
         6gpy6znlJ9lHwSg5gEvMTs4F53HQjg8ih0xeYlg4mxSaN4qaY5uMn3kY+Cxhb684dFg9
         93QzTnvALEF045i6xRFHo8Ft5BEOK9Poi8rExbxiGI696NdXS/cAEIlfIdKPOAMBYVtd
         hGNNVO8uXCIukNlqnKFzHkfgh+sgcBtaQW3egSH5LY91HFeLGeWU1dNntHWMaVOrmAUL
         iWkKqDCC9NLoSgd//J2ng5ZPBnxGa+I9DgBh7wKpiMKy8EZSCFBba5mphTfJkxt/2P//
         hWDg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6tbEKZNtqA5myG6JdV0a4ocpZsNeuK2yTk5txALM+gY2I4TgBaUHt1ct5QDCBtAc2a8EvqGIKwE3Fa9o4REkcvQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRL2tWr7V40b9E7sWffHXSD23xlYgN5AXJD1bA0vNZ+NAw+9dQ
	nJzrgFojV7db/A3rTvGuwxPvS9GOaRRQRhuloYkYcjbRnK6pEOomFi/ja1nZF3ymTLdrtqQFx2z
	ENm5ul4g=
X-Gm-Gg: AR+sD13QxUE6PlLer/IPzQHRzwrffJTQh54olag1hx9OqNlukHGQbREKClITXH6m3+y
	pKDG+QHi6ivanUNPqp7UwImITkCYxpELfg+DFn2Bo/JFD9tPoQnAPLY/cWnu9Ot+YJiIvVLCrZw
	V4L6swJ1Fh5w6ELyC+ovHltAizVj7iPFFCbk0v+rd2fd1HSFYi3+Wuu1WQnvVUlABrVxc0x9K9y
	qI24Ldvfb5PGKCF80UwHypkozpuYb4sLduIovPuEugQMrhKo1vka93LphVdrtHEPrIVs/qXM0x6
	3x6u1JstH0c3XKm894Kcxeg/NzND4ewtssopQXBRIYa0JIUtUyIS016PTT5B2EWRUC7MHp4veBE
	agtPBdR5OXt3+MAMgv5Mvw4nfU9dXqHgFZ3T3MvCid0qZr9Bo3Yu3YqrOrUpxuXNOH5THDH9DtN
	MB3op9ERwQWlXjMkLYDTqd3RNBJ2bE6acvhNKbljNut4AVi1uIfPygQ4lxnwDKl8JqHqUeCXWrY
	v91ZDbz6I2yA1u/UudGwyRaj16CITB2phVBrS7JBss/abJvLQhY1akjxQFoZA==
X-Received: by 2002:a05:600c:19cc:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-49800e6d4e4mr35852395e9.3.1785419415184;
        Thu, 30 Jul 2026 06:50:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96? ([2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f1a7f7sm74824675e9.5.2026.07.30.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:50:14 -0700 (PDT)
Message-ID: <cd649f7216df69f4240e27bfb063044108baf6df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/3] kernel-uboot: move FIT_KERNEL_COMP_ALG
 to image-fitimage.conf
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>, 
	openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com
Date: Thu, 30 Jul 2026 14:50:13 +0100
In-Reply-To: <26b3d2639b1c7c876ca89818bf1372c46163a939.camel@ew.tq-group.com>
References: <20260727090601.489155-1-nora.schiffer@ew.tq-group.com>
		 <20260727090601.489155-2-nora.schiffer@ew.tq-group.com>
		 <f0ab7f4d7d6c72feb2b1b8122a4434db98799370.camel@linuxfoundation.org>
		 <b0b1e1501a23b315704c5a6ef99a2c826408a56c.camel@ew.tq-group.com>
		 <d446f5a1d61eb3b5e9c832e8bc717bb869ba8ceb.camel@linuxfoundation.org>
	 <26b3d2639b1c7c876ca89818bf1372c46163a939.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242360

On Thu, 2026-07-30 at 15:35 +0200, Nora Schiffer wrote:
> On Thu, 2026-07-30 at 14:09 +0100, Richard Purdie wrote:
> > On Thu, 2026-07-30 at 13:15 +0200, Nora Schiffer wrote:
> > > On Thu, 2026-07-30 at 11:43 +0100, Richard Purdie wrote:
> > >=20
> > > Okay, new plan: Change uboot_prep_kimage to accept the compression al=
gorithm as
> > > an argument, so we can use different variables when calling it from k=
ernel-
> > > uimage.bbclass and kernel-fit-extra-artifacts.bbclass. kernel-uimage.=
bbclass
> > > could then use a separate variable UBOOT_MKIMAGE_KERNEL_COMP_ALG inst=
ead of
> > > reusing the FIT one.
> > >=20
> > > A more radical approach would be to skip the deprecation of using a l=
inux.bin
> > > generated by the kernel recipe as a FIT image's kernel and drop suppo=
rt
> > > immediately.
> >=20
> > Can you see from the commit history who might have been using that? Do
> > you think there are many people relying upon it? If that functionality
> > doesn't make much sense and wouldn't or shouldn't be used by people,
> > I'm fine with actually removing it, as long as we're clear about why it
> > likely isn't needed or is inefficient (or whatever) and what the
> > alternative is.
> >=20
> > A lot of the time I think we support too many code paths when we should
> > try and encourage people to do the "best" known things.
>=20
> Right now using linux.bin is the only way to build a FIT image using kern=
el-fit-
> image.bbclass - my patch 2/3 introduces the option to use something diffe=
rent
> instead of linux.bin. As currently implemented, the patch results in a
> deprecation warning for *all* BSPs that build FIT images, but that seems
> preferable to breaking such BSPs.
>=20
> Making FIT_KERNEL_FILENAME default to KERNEL_IMAGETYPE would keep the FIT=
 image
> working where KERNEL_IMAGETYPE is the correct image to include in the FIT=
, but
> it would differ from the current generation of linux.bin in kernel-uboot.=
bbclass
> in most cases. As far as I can tell this should work as intended on platf=
orms
> that set KERNEL_IMAGETYPE to "Image"; types like zImage and bzImage would=
 result
> in double compression with the default settings, and most other types wou=
ld just
> be unbootable. I don't think we should go with this solution.

Right, that does not sound like a good outcome. It also means that
linux.bin isn't really deprecated though as the commit messages hinted
at :/.

This is why I'm asking questions since I really haven't looked into
this in detail. I'm just very worried about the spaghetti nature of our
classes and really don't want to make it worse.

Cheers,

Richard

