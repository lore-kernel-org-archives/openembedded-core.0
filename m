Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDAEFB3D18
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:50:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48129.1774867817416910441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QufFYd+l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so634693f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774867816; x=1775472616; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sjeaTYQMpJUV9tmG/Q2vfpSdN1cy92/0YeHBrkqJIXc=;
        b=QufFYd+lwCPEo4zwSIkGApyzAz9gg5+fFifR03nM3KnBYTaiTz2fcvssKB7Z6h0sLJ
         nayaLW9qmoEh1bXOj8MCYGydCXY3cAUvfZXO2M+Ord+VIXEnhqIk9sOu7/RgLt8Rr7SY
         BEhw1WCGcmoRUBnI+46wJC8YRozYG/l9TDWSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867816; x=1775472616;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjeaTYQMpJUV9tmG/Q2vfpSdN1cy92/0YeHBrkqJIXc=;
        b=iTjtO8QUKUt3CA6KDo+96bvvjJIDyIsUVykY6PwEN8umc12lHY3tZqZlZ7t4GL9WBq
         XvYgSktr3yYsr14NVcCJ5OZKdYSsIZtrLj4Uc5a3EZXLvTNWk0v9mk3qkISSOWivVIz7
         JGPsgkT5zNAt2tJ1f0Wbt7RpzHCi4H6RaIdp+yEL+wyUGbvNyrusEYJrGcsJi+gyC4JO
         2Uv31dVcvaHZ8FPHIKv1/fH4hkB73LE426MQ+hPRThwNUYkB7K1pfKqqaOP/wiyMTpN7
         5JodL/iM05oSJkZv8RHGzMIKqcb+9ZF7mAurJGIHQcFUruaT7KhADzBhysbjaPGieBJR
         Z03A==
X-Forwarded-Encrypted: i=1; AJvYcCXys7K1HHld+Gem5Xhe22WtoT1kRqx7WbtPVPpM1YBnR4Pp/V7hMwUWAw5k26HiQxL8uggmmhF/+zk1h27LraE82Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4rrkmq6M4yd/y5wJf7nZnDKqAPMd4ZxHZTwlLycGRzTsNCBWW
	NyUnMnRD0/5zyTtTojPcA6BB8d2/BKn2YGAWlXNNlffCBTbQXioVB37owMMH2oX3dlE=
X-Gm-Gg: ATEYQzxWyy2y0LftQOza7PcvO0Qd5AcjwVlBvLG3/cpTq0otJa4QFXHGoOVIWIyleTG
	8B8mULH8JnD2VZNf/0DZPyQqlCD+W8jVjn0ifcMXjuB2zmR2GRyA6ak+zrqnHYbLosATXBe5b1w
	B5HFDDmKRaOjadCjJhlhIJYdIXytEZSlM9uU0wumblMeFhU1waFRmDq9Dl+3yQrve1thH9UwlQO
	m9pPNOAPhw/3LMtTW27GMj+2yljQSdvaS+mPeCnBEpddDKiIY8uU513i1ewJROa6Q6hMzwx/D3s
	+Prvh/+DWXVgQY2TEdPGkEckgSGv8CSH8YVEAvJQCruaKNNsrfzT82NwMF05rAl3YbU1ZHDZgUu
	5xNnArtYe2KK4zrtWLjUwXyJeO+TqW9kXXL71i9AXDyJeTMT4NNYM+DO9q1Z/N2qnligKQGC/ks
	bKpJOXrzfaAP5Z4M1OwkF6749x3z3kJ9ofdi60L25KsDjNm7mfqY5QxyVNg66PPzJHIF3L3ztpa
	ERAMaB9WjA24vuA
X-Received: by 2002:a05:6000:612:b0:43d:60d:944b with SMTP id ffacd0b85a97d-43d060d9570mr772315f8f.37.1774867815703;
        Mon, 30 Mar 2026 03:50:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:49bb:fc1a:471d:cb37? ([2001:8b0:aba:5f3c:49bb:fc1a:471d:cb37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f173dsm20812964f8f.15.2026.03.30.03.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:50:15 -0700 (PDT)
Message-ID: <d1c47a43e10b398376ff27a65dd1be14313a5c94.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to
 TARGET_LDFLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Sommer <joerg.sommer@navimatix.de>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, 
	openembedded-core@lists.openembedded.org, changqing.li@windriver.com,
 rs@ti.com, 	ricardo.salveti@oss.qualcomm.com, raj.khem@gmail.com,
 antonin.godard@bootlin.com
Date: Mon, 30 Mar 2026 11:50:14 +0100
In-Reply-To: <acpOozTnDECIDOVg@navimatix.de>
References: <20260204052638.284617-1-changqing.li@windriver.com>
	 <acg3xGOKkL769U3e@navimatix.de>
	 <0110332424c01404402aa58286399958e1449110.camel@bootlin.com>
	 <2e2f88fe044c6b3dc868652c01f647d58abf1a33.camel@linuxfoundation.org>
	 <acpOozTnDECIDOVg@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234225

On Mon, 2026-03-30 at 12:23 +0200, J=C3=B6rg Sommer wrote:
> Richard Purdie schrieb am Mo 30. M=C3=A4r, 11:18 (+0100):
> > On Mon, 2026-03-30 at 11:59 +0200, Thomas Perrot wrote:
> > > On Sat, 2026-03-28 at 21:26 +0100, J=C3=B6rg Sommer via
> > > lists.openembedded.org wrote:
> > > > Changqing Li via lists.openembedded.org schrieb am Mi 04. Feb,
> > >=20
> > > I confirm this patch is required to fix QA check build paths for a
> > > few packages.=20
> >=20
> > Can someone please work out a smaller reproducer to provide to upstream
> > gcc/binutils so we can try and get the underlying bug fixed?
>=20
> I've send some simple test cases in
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D124581

Thanks, I've tried to raise awareness in the other bug.

Cheers,

Richard

