Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0CFC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 22:06:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.398.1752530766558208865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 15:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hz2IIGqc;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-237311f5a54so41357575ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 15:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752530766; x=1753135566; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vG7WWmOmwJM4WbpV7Aql/kgA9PmnhCMFY+llSWBLN5I=;
        b=Hz2IIGqct/6WPI6NjoxddJMDXQdhAWjBhoiFL/GZoLJcbjktFwhBzdHDQZyMOXZrVg
         hB37vcUpcsoNHpn38eba0ueC7o9dumSIvF0irk8M+BIBfXD22+RIv3O4HgjRskTY6GKB
         /71fSB4tLgsOBSs1xPBw/mp9GSR46QQFZPcA1IODozLVZWF8W2LDCBNooPVA6MJTgedQ
         fnsaOODopAyLUh9C7fA7gYZn+5KXoC2Q+tcCmIghkfyNOGQp5Z1UTJQE/QOfK5AMFEKM
         8t0arT4mKOxqSAY4gkDCvyHn+gfPqQt3Uh68W7cmJzVs6Y7A7yYrw01ad0XwulHQFW/y
         3FxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752530766; x=1753135566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG7WWmOmwJM4WbpV7Aql/kgA9PmnhCMFY+llSWBLN5I=;
        b=Mw6oWePGErZ2bmvUKaz8dtE50Zlh8tbZK6WIfbMNh08KYL+u+6j4sHZABQ1GLvpQFJ
         RVQHUQCzAyBBz7NhO9eM3TmaIk3qLBOzm5guSy+fkrxnEy2RJ+7Lvy3QhWLWULeegAOC
         HQLlK/gbeg4sfH3/B/cIiIrwx8K7MsyQQrQQ0P1gNb2vhvCGT+o6O7Q0TPiqwoP6+JKc
         m13vqDBwnNYQtHz1B9Nx+ODxmAHilvl5mDjwvr/qdZ/CM/gbcTlBbfLjtE8duWnlg+Ph
         Oj+W5RGV4h1413mYDBXJK8K4vosJxOMgbsulcbaJSzr0cnMhwyyPIW5g2Rpnke0Jf8YO
         PlUQ==
X-Gm-Message-State: AOJu0YwZAWEMG9HsrsIl+89b/TEIb7gvr1UCpsFPJV3dKAS3y1KfC9j7
	DUO3eBWYHEoHOHpjboLvZkvhxduI+etIzzzKPafNf8Wj/3ia3yv87Sal
X-Gm-Gg: ASbGncu8v+jwZLKRXTB22sCp/W0fs7nkegCN/nvzEXlBTlZ65cfuey5KSjDx8zE9YDU
	sNV0uRMBOrd6hF3QDx5SGQG05Cb/x4HatRDwsD2E9j6kUWpBlIdckD84AP6MWJ/58FhGwgrWMNT
	gUkbFxc8aGJN7Pbjvm+L/AePgFd5Xw8YZxvypxbKF7xMjtSUB2ieF4Nrr+h2AWEwEwjhRddRDPR
	REAW17I+ZE+bxYxvLV+dA7UHBl7r1GpqtGyfn6u/+TPPmCk/VVs4/af6Q+UdumBAa08P26NarVb
	Dk6mKosdUtH1YArLcCIVzEOj2kK43t0aFEn0/0xIt6nRX51uhVUOT7H1zDmRPT/MxiZkJ7qBHcI
	3T6V7fqvmAZvBZ8860qQ=
X-Google-Smtp-Source: AGHT+IHzyxvuS2GIiShIha55tcTfxFwgyj6QJrEr5UW3PNMI1RmxFVeoY7Q4VMnisuqflUcMnxuKqQ==
X-Received: by 2002:a17:902:e78d:b0:234:a139:1215 with SMTP id d9443c01a7336-23dee28fa46mr213866375ad.35.1752530765644;
        Mon, 14 Jul 2025 15:06:05 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad9d9sm102951175ad.67.2025.07.14.15.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 15:06:05 -0700 (PDT)
Date: Mon, 14 Jul 2025 19:06:01 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Chen Qi <Qi.Chen@windriver.com>
Subject: Re: [OE-core] Circular dependency error on util-linux fstrim service
Message-ID: <20250714220601.oirb4vfnbdaqkazf@hiagonb>
References: <20250711180958.tbmriqtce25kxd2q@hiagonb>
 <CANNYZj_uadTj_Z77A8SvdH71CxTzptieMCU450nJ_-6w-C8yCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_uadTj_Z77A8SvdH71CxTzptieMCU450nJ_-6w-C8yCg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 22:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220261

On Mon, Jul 14, 2025 at 04:28:34PM +0200, Alexander Kanavin wrote:
> On Fri, 11 Jul 2025 at 20:10, Hiago De Franco via
> lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
> wrote:
> > Currently there is a circular dependecy error on util-linux recipe if we
> > try to use fstrim.service and fstrim.timer. These files depend on
> > libsystemd, therefore when you enable the systemd PACKAGECONFIG of
> > util-linux the recipe breaks because systemd is also dependent on
> > util-linux.
> >
> > I was wondering if we should create an util-linux-libuuid recipe
> > equivalent for fstrim as well (util-linux-fstrim_<version>.bb ?), so we
> > can get rid of this error. I am not sure if this is the correct
> > approach, do anybody has any reccomendations? I will be happy to send a
> > patch to fix this issue.
> 
> With a circular dependency it helps to ask the question (and consider
> solutions) in both directions:
> - why is A depending on B?
> - why is B depending on A?
> 
> In this case, why is systemd listing *target* util-linux in DEPENDS,
> which is build time? I quickly ran an experiment, and dropped that,
> and systemd still builds ok. So you could investigate further
> (particularly verify that installed systemd artefacts do not change,
> e.g. there is no hidden floating dependency on util-linux) and propose
> a patch.
> 
> Alex

Thanks for your information Alex. I believe we can get rid of util-linux
dependecy in systemd by creating some PACKAGECONFIGs. I have a patch
which I am testing, but unfortunately it requires a backport from
systemd [1] to make the libmount PACKAGECONFIG possible.

I will keep testing and will try to propose something tomorrow.

[1] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306155fb4c531c8f

Best Regards,

Hiago.

