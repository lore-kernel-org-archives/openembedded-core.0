Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A003C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 09:50:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.19755.1751449828893421696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 02:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AurUVNs8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so55505825e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 02:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751449827; x=1752054627; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvsr2IoYQBI96J3aaupkVP+w7r9KZoAfoUtgT3dSMow=;
        b=AurUVNs8DxyFuXBSbr1aYd7CA3eUKp/fELtcym3Pzm0DA2CxTFOPHiiD1hlRqkeg4P
         c9iGyGen3OfJ+W1jgRZIwM8FYiwDST/CL+NFtYZEvin5t0LrySPf/8p0gA7+rIZF8/3z
         SSHNs28xk3KKsnNZcpePwpJg6ksEuoNJxkHqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751449827; x=1752054627;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mvsr2IoYQBI96J3aaupkVP+w7r9KZoAfoUtgT3dSMow=;
        b=B67lxjiinCdtkwD1HgTZhWvZJBAKQNtbv2GkpnikkqbFSQ1LtG2IqWUin9PVhId+84
         z/Bs24PsHGY8Dhk2wL49V4XmlvlwPWk1Ftjb9eVh8bPcTTwrDuewVuqQAOvLsv9XVRq/
         dnzJWry1dSux8b/yBdwmk/TlywN+d/Rt6842EZYX5E5MhhC0KuIJkdOZ1L+U7c+JlGhU
         bfiC2cFcUR8xuBeoqqtFw/dnMSWhp8Ryu/gGbP57b0VoaNwWqLvvLpkOYqMF1Z7Au58I
         9Kzzgk9u1bc41i1sfuwyC6YXcgIn+lyZhk+Z+E/JBuj4yAKQCfvCvPe6QbDTOMiTDCuX
         hJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuT/4emW8qpOlV24GJpe5H9XAFoUyaFGgSgeMw3eVh1Af6B34zDKyqx0b7WfpYHD4kC1eUyFimy952SMB0yi3kZQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVwnTt8CTCBBB0JJG8DR3toTt/0Fx2PQlCuqZu8feTWf/a8vvV
	dhpvrRFZmOhYVzqunu50VL8EvRnuRjIexcuRRgNKULSiH9SV54Cqi4vnupVorAMup3imTScVKJS
	Avbr3
X-Gm-Gg: ASbGncvAUJ92BdwxLwLzBG/6fJx4TD9Wj5wn+rZ+W9qVY325e4NJVms7AArgzjyQChx
	XD2UUtr7A7N/CIcgb7//0FFpWuBaIO22/Qo91pv1KYetlOmvwww/hSBQDzup7mRshgl64vEUpGQ
	Mtv52lr2qgbTeUZOb1bAZVThs1Gn0tM/m1iaD53vAsUTOSEhvY39bxFdNs7JjRFUmpTUFR9E4bQ
	NWtMy7bCb7WyQePwkwdCHIcThWnOfI5UOS+8I/GiK8uxE+t29RVJEukwzYW4UnulhkjqYeztsWq
	sUpBMUJbUb4IhhJnTxUZfWisM8dbNA4gyQtkPVv9SOn4TdSbFjDENvnk49FaCTLK5iinPwEcLp4
	3z8Xy3FKVFRme8u9MHv4ge2eCz68FjGKKq9FI9E/97cOMITqwyTA=
X-Google-Smtp-Source: AGHT+IHHsF0u+k1xJunuAJEwMa7/5Hn4PohHmmVDKfRICwtLQoZWtdGuzZ02NGOsjck6LclcavZIPA==
X-Received: by 2002:a05:600c:1f8e:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-454a37262c0mr18715415e9.28.1751449827302;
        Wed, 02 Jul 2025 02:50:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:acf3:9ed8:45ec:fd86? ([2001:8b0:aba:5f3c:acf3:9ed8:45ec:fd86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ba553sm218418395e9.31.2025.07.02.02.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:50:26 -0700 (PDT)
Message-ID: <5adfa8d29073dc1c934c607d3b74aef5d4f008c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 02 Jul 2025 10:50:25 +0100
In-Reply-To: <18523.1751446167828815127@lists.openembedded.org>
References: <18523.1751446017821038910@lists.openembedded.org>
	 <18523.1751446167828815127@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 09:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219814

On Wed, 2025-07-02 at 01:49 -0700, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org wrote:
> To add, I could send another patch to update from v3.50.1 to v3.50.2,
> but I doubt that the problem is with the SQLite source files. It has
> to be something related to the Bitbake recipe right?

The error is occurring in start_fakeworker() which means it is trying
to call "pseudo bitbake-worker" and that is failing for some reason.

pseudo is a heavy users of sqlite-native so I'd suspect the problem is
somewhere in pseudo's use of sqlite.

Cheers,

Richard

