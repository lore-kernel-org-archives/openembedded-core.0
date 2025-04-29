Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE67C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:43:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.194.1745937804874480553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NmBY4rmq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso43641675e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745937803; x=1746542603; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rKLOX0+tBdgDssVAa1SnZNtjF8ay3L/DQvWYBO7QidU=;
        b=NmBY4rmq7x2s4bUW9zRmQycfW4lJR5w7u8svXjHAyX5EQdfYY5UfG4pmtV6y0p6gw0
         H8gG6Y/cp/82y803N9CsrJUFflyXWOTCmGity3xQoy2EdzBBTNuYmq4QmYCMTaxL8rb/
         La8t+zck3sT3CItZ2ljY733nsG6HidccRtBHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937803; x=1746542603;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKLOX0+tBdgDssVAa1SnZNtjF8ay3L/DQvWYBO7QidU=;
        b=HMXrj94qChiIEo+7xAZVtRIS+ZLuPPAFJcabomAS2pb7hR8S2fPJZFT0ye8vdMYO4Z
         N73ArKFWp9yzEd8i7+aNucug+K3tR8OzzsNQgXBqDJik56GtYmvbocwuc+q/8u+4t22C
         0TJRIxkz497pRdtdH3TcLqrIvBQNITX4jRmbXofQy+PWupSMdPnkE/ALz93re3b15SMB
         UjEDvXeOFVC43w3a4p+tWWDH7n+WWBHm1Eyu6B8Kx5P46MDfP9Kr0fLo3XqXy6PPQZAK
         P4bqyWfEEJggEoa4tGKoNSdDbmYdM5wDVqkwKd5V5ZFk3G54zG8Vqu9UivsWu0f5S2E/
         0KeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzZraFRoeCm1sC/4m6mygj2tqZ26X5UQAVefn2w+s2GnOZnfbD4rZicPAUZsbNao+fVF2NiCV6MGMzZwRxaIUOTA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyoa/nUbwImbVboAQMZ16pkD3fjMwHUvKaxJwLvFl6nGJYrE42l
	FAmFe4A2mU4RrPcqaPHfaoPJy5ymf4Ywg8i6VwOQ3EwvQ6m9+xGYfG995sSQKqk=
X-Gm-Gg: ASbGnctv6e2sKjBN1gdKqJOWHM2DA3I95VZm7+OTOg7OIhdNXtmC0GqRQZu3/e33KUr
	bADl5Pj2z/emxzp5oJuwZnctN3Rd7Aqgls4nnGbeFfvQCrGijY1FDLf6YhcbDOkGr7CzdV7aQcd
	dg3HrjogdD0SqxCvMjy58ZNwGZ1omt8S5lw8C2hzEkwK3yh3dOMf0OFxnfyJ+Jm/568kv3yDmq5
	uskmYalC7jQYCKywQgv78xIzaKI6iCotAxda1TYl4Y8BbG433LU2huIUGZeuE3TPDyTF+FChfBl
	CxKZnhJ3BsljSD5BjrWgMB5/NpgebiSoJxcCPE8/Gbm71kAlIvpdTVOC6VjYU1WgttFsx+sNs4c
	85TNbxwrAV1kFS4edkBYgaOOo2O6B/w==
X-Google-Smtp-Source: AGHT+IHCtKjOL/umJ6lLqhscudzDcbfOR+tO+3PN+sGfTndrKSRK40r3OdZuVxabknxxeIO63r+R0Q==
X-Received: by 2002:a05:600c:4708:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-440ab77d015mr101976525e9.6.1745937803021;
        Tue, 29 Apr 2025 07:43:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ccf:8af4:a5fb:d268? ([2001:8b0:aba:5f3c:3ccf:8af4:a5fb:d268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d868asm190806735e9.26.2025.04.29.07.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:43:22 -0700 (PDT)
Message-ID: <f15f7db2297bcd53287699582e960fb29b919fd8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA info
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Cc: Peter.Marko@siemens.com
Date: Tue, 29 Apr 2025 15:43:21 +0100
In-Reply-To: <20250429143904.634082-2-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
	 <20250429143904.634082-2-daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215676

On Tue, 2025-04-29 at 16:38 +0200, Daniel Turull via lists.openembedded.org=
 wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Add CVE data source for kernel.org.
>=20
> It includes more information than the one provided by NVD.
> Use similar mechanism and same variables as cve-check to define
> when to update.
>=20
> To use without internet access, change variable VULNS_URL to a local
> copy or mirror.
>=20
> CC: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
> =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 |=C2=A0 1 +
> =C2=A0meta/recipes-core/meta/linux-vulns_git.bb | 76 ++++++++++++++++++++=
+++
> =C2=A02 files changed, 77 insertions(+)
> =C2=A0create mode 100644 meta/recipes-core/meta/linux-vulns_git.bb

If this is a real git repo, why can't we use a standard SRC_URI ?

That would avoid having to invent new mirror variables and so on?

Cheers,

Richard

