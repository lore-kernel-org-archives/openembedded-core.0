Return-Path: <eichest@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E0CC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 07:21:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.14462.1744701684771600859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 00:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H2+Wrd5x;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: eichest@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso40560995e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744701683; x=1745306483; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FMGjnguFu4fmTyCN+czuVIDiVNlxDiedoBOYHPvxXMk=;
        b=H2+Wrd5xL7mbsrHtQi+ktG/qHCEv/JNbJOFXGGAMZDPI6TVuCADTHO2MQah0JADUr1
         hzDJljjN75ulURTmrEYy3YJMZITu/qU66FXPcYtVW3s3SUdbhDEz4YBvnnnIwXeHqMZS
         +mXzAimPK+/+DJK68yhRZ3ThH5+kYfB6sPm1z3zjhVxceyd+Dqajdp4i2kxdzNBezyWB
         aB04K+NuN+uVAgwB8dGm3p/dXVDVIJ7oszbHqoIx4hpgTlsujPbnFTzysGc7cNTEf9l4
         xt17mIuq+sqDGA2OxLIosmwuz5TLmqyMnFM0zDXQ+YVyRbDWTobAehIzgR5gzI9e0rjX
         n5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701683; x=1745306483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMGjnguFu4fmTyCN+czuVIDiVNlxDiedoBOYHPvxXMk=;
        b=V5KI3Y4PleTEnj0YWMwV5QDbJNRVR52ECYu6GwgBOun9nm13ThWSB9ATumqS76Ei+P
         GD88qvt5Uv65eN+ycd0E7NigNH+b9MkDQYT09Bs+o/d+7audTdh+Q85fbyh3e8s3/+SW
         LFAqSyOcjYfhRBEA5MNPN5MGtRabVSgIXuy3fnTf34phgY9sEgUTRiC4v4hEleR9LfE4
         rrD2bKWJOjNYO9Q6DOd+Mpe7nNPAjZpguCvzZUCLsU0gMGNEtem2oZ1K3L4WOi71sW7q
         ge4/kEuvQz8/yVi1I0cSki5P0kgD1w7iifze2bXByQoUTmuMzHvspFZuAKj1375JivOZ
         tlWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW6uu0v0CTC8JGtDJSnl74G6zFDHaQeuaMkBBhipJ2J3SCHEENSXy2l2q7gUTbd0RPfJlsuFus4+zyBGgratg42w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFBLWrb9Blmp/rSRN9nqZRrSYtgdCwNtjVkxoYehlrEng0Sd8x
	EhPprXA3+yl0Re93GDDgTyl7Yg4PjhJp3OnCURGA4uNHqgYO7goZ
X-Gm-Gg: ASbGncsvvLlRG2TA5mjs9NITJrn0ywvHrefp0FQ3stFxaH2pk76gNoeGPu3dXB0bqbO
	0j/dG6qrdQqr92vqPPcp57GS73wTDxQBvBMU+KPIReZYLrex7SJXLGUFvyL8SgSwr6hJvLp2rIh
	M7em4d7VmLdJJopxbYqY9FzNZox40QTXn0KCryWtBNAA/JteFRU+31d/yYZThFl/Dce2LRryWYz
	w6wKjperY0akszXgjpdP0rKPllLwdasRRipGq5N+7sOmWrOkwJnqrSROExtkrdQFlKKmkEVjghv
	E0iF8PWk/DP2p46fya5arZvBJV8oHXjUeIFL2Xuy
X-Google-Smtp-Source: AGHT+IG7XdGIKfX6cSqAY/h2YYuSdNN3jAU8ubKgCW3xOfLur5dVKb4Sc3OhdybW4wzO0N6W7OgUVA==
X-Received: by 2002:a05:600c:5107:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-43f3a926606mr118739785e9.6.1744701682533;
        Tue, 15 Apr 2025 00:21:22 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:84e4:c917:4bcc:b2c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979684sm13406059f8f.55.2025.04.15.00.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:21:22 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:21:20 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
Cc: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [OE-core] [PATCH] systemd: Allow overriding PNI name policies
Message-ID: <Z_4I8K3RT-3aNpyT@eichest-laptop>
References: <20250409101545.5936-1-eichest@gmail.com>
 <CAJdd5Ga7-Swcb8Zej8dpuLP5AzuBHiTmFVSatL33Biwjhym+rA@mail.gmail.com>
 <A1955164-126F-4B34-B796-B2CD3E530AF7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A1955164-126F-4B34-B796-B2CD3E530AF7@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 07:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214825

Hi Joshua and Koen,

On Tue, Apr 15, 2025 at 08:56:26AM +0200, Koen Kooi wrote:
> 
> 
> > Op 14 apr 2025, om 19:03 heeft Joshua Watt via lists.openembedded.org <JPEWhacker=gmail.com@lists.openembedded.org> het volgende geschreven:
> > 
> > On Wed, Apr 9, 2025 at 4:15 AM Stefan Eichenberger via
> > lists.openembedded.org <eichest=gmail.com@lists.openembedded.org>
> > wrote:
> >> 
> >> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >> 
> >> Add two new variables, PNI_NAME_POLICY and PNI_ALTNAMES_POLICY, to allow
> >> overriding the default Predictable Network Interface (PNI) name and
> >> alternative name policies respectively.
> >> 
> >> This allows setting different name policies via a .bbappend file if the
> >> defaults are not suitable for a specific use case.
> > 
> > It's very difficult to configured systemd in a way that is acceptable
> > to everyone, and I'm not sure adding variable "knobs" for every
> > possible configuration option is feasible for systemd.
> 
> For me, the issue is that OE-core adds the MAC naming feature that upstream has disabled by default, which gives me unpredictable names for various on-SoC network interfaces[1]. Having a way, supported by OE-core, to disable the addition that results in predictable names not being predictable would be great. It would make PNI function as intended :)

This is the exact same issue we have.

> > You could do the exact same thing by putting your sed command in a
> > do_install:append() function (since you want to set them from a
> > bbappend anyway), and in that case it's irrelevant if pni-names is set
> > in PACKAGECONFIG or not.
> 
> I know and I hate it:
> 
> https://github.com/qualcomm-linux/meta-qcom-distro/commit/1820fefb6c67506726277f7f789fd5a4538ea33f
> 
> It's fragile and noone on the oe-core side will realize that changing do_install() might break DISTROs that use such bbappend. A proper variable like Stefan proposes would be more obvious and less fragile.
> 
> Or we could just drop the bit that adds 'mac' and have DISTROs that want that write a bbappend!

I also don't like the sed approach because exactly of what Koen says. I
agree that one of the base problem is that we already modify the policy
and not just use systemds default. If we just remove the "mac" part that
would be good for us as well.

Regards,
Stefan

