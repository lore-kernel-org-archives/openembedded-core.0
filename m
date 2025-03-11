Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4690BC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 21:24:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.22248.1741728246235497138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 14:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=auRwWY6a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso32476935e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741728244; x=1742333044; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UwHX/qLZYeCk1pdvHh9vNMCaKd2SkCJlmPnoaiFhjjY=;
        b=auRwWY6a/jOZoqnQbKpgzydJVxjB/w8Fv5N8objoHJPoXTz2+QiUVKqsKo4Zmveci0
         z6m8yXG7ym9jYy9kR+Z/LgYeqcqq4LrCmqMz6GDVqq6vps0pH2q33X3B9j+SmeA3JuSG
         ek6Pjv9IQG/DAvjl+wHo3YzU/lxnOupIJ6mbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741728244; x=1742333044;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwHX/qLZYeCk1pdvHh9vNMCaKd2SkCJlmPnoaiFhjjY=;
        b=jK9LGfv5urOGDIVAmwsn0EYu1KsnWKeqgxBBBueIJ64kPLraVp8UmIgpCfPVpvZpNU
         LR9vZsLO2Z6ZCe88FXMjvBInrNcHRfZVkskf+bxvqxp/nBgql8ji2aHnHfAR56CwBnsG
         v/EXQ3HZtb8OyBSMH1aYlYl1gmqEchWrFRMz2upo1qorNZJiJ9MGRNtMB4kaULOOb1c9
         OXR/F+JQ478egnEOpCjronb7ipUt76lUkPRoksO8MlejnSm4BUnl12qpgwUTIPa/+Zq2
         kcBPuP9XXSF798sknvwA7XAVpiPE9cqLPxLUqn2lXrJrgGDTXxEQun0kfQJgvwzmORF5
         Q3rQ==
X-Gm-Message-State: AOJu0YwCs+Ei0KgI9wWMmoXS0YX1byAqVNjYoDEmZDq3B/lRuEy0N8i8
	aEuScfipxIeAlkGPGZ2FhDAd48lSRwBfLQWworZ0VF6waMFKINSWjYxOnZrTZdY=
X-Gm-Gg: ASbGncsDvllVz/EuMIAGC0c1aRLPbUJm9v712iaez2K4UEJdyWinwJjKTxw9ESaZUXq
	a27WiGFS9tnvzutnSCknZnY8/vI4PIvdPx3MlecPPaEPJxJI7VmbDCsEnfBf/nQPBwbNlnSx8Nk
	VTaIYFspbVBe+3zvOxc8JOJBY4ClV1aP8OnQVbNdSnnCDNkMTxUoSbsx/AWa7f3cJ0NoYDWH5Ck
	sBbWlLSTo7oW8XWCpR7wpjuy0SqAQGt91HXLMPsQeabBzPTJOw0mbRp8xiP2Wgb4m2iJsLITGkV
	orevalJL3JhdTIWl8hkXw7nIWT+hs92C7IA7oKlP+g8KuPTnyTxG/K4wKl1ytiQ+mC5Xc6GGfq7
	zXqpfq8ns/Fp2DajW3BGPRkOWIQF6Qk1vqg==
X-Google-Smtp-Source: AGHT+IHW8RerWorcJ5KuMx00rPtzW+tnFJpjX4g2kBLldSvMl1Z2QwG2jQpaBaM9DhanpW3YML0Y6Q==
X-Received: by 2002:a05:6000:2ac:b0:38d:e6b6:508b with SMTP id ffacd0b85a97d-39132d308b8mr14363372f8f.9.1741728244422;
        Tue, 11 Mar 2025 14:24:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4fd:52e8:cce8:770c? ([2001:8b0:aba:5f3c:e4fd:52e8:cce8:770c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7934sm19448724f8f.12.2025.03.11.14.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 14:24:03 -0700 (PDT)
Message-ID: <79803243ee911ce791f3b9740d921be947d27347.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] tcmode-default: eliminate needless rust,
 cargo defaults
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: martin.jansa@gmail.com, randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com, 
	mathieu.dubois-briand@bootlin.com
Date: Tue, 11 Mar 2025 21:24:00 +0000
In-Reply-To: <CA+chaQd7urrvOvB3K1hbh523xW+kYq+pr5=4Y9HgLOwxn6oS4w@mail.gmail.com>
References: <20250311162532.1676284-1-Randy.MacLeod@windriver.com>
	 <CA+chaQd7urrvOvB3K1hbh523xW+kYq+pr5=4Y9HgLOwxn6oS4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 21:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212633

On Tue, 2025-03-11 at 18:06 +0100, Martin Jansa via lists.openembedded.org =
wrote:
> I know you want to eliminate this whole file, but I find RUSTVERSION
> useful in situations where some layer wants to backport different
> version of rust and related recipes and then the DISTRO can set just
> the RUSTVERSION variable to choose between the versions available. Now
> the layer with different rust recipes will probably need to provide
> some .inc file with this, so that the users of this layer won't need
> to know which 8 recipes need to have PREFERRED_VERSION set at the same
> time.
>=20
> Like it was with
> https://github.com/meta-rust/meta-rust/commits/master/conf/distro/include=
/rust_versions.inc
> https://github.com/meta-rust/meta-rust/commit/9c0a1059be62417439615126ddd=
3044269406a66
>=20
> otherwise the version from layer with higher priority will win and the
> DISTRO won't be able to easily avoid that, other than adding all these
> PREFERRED_VERSIONS or using BBMASK or preventing that layer to be
> included in BBLAYERS.
>=20
> Just my 2c

In some ways these patches are to check who is actually using some of
these things. They need maintaining and I've not been convinced some of
them are used.

If you are saying you find the rust version useful, that is probably a
reason to keep this, annoying as it can be to maintain...

Cheers,

Richard

