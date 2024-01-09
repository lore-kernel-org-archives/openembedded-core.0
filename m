Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B19C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:50:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.19854.1704815405488868022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z0M6+Kfv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40b5155e154so40496115e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 07:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704815404; x=1705420204; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X81Refop9R1gXjXOKGwLo8UBuI338mgog38VL6mWPzI=;
        b=Z0M6+Kfviwyfj/Nf+HwsjSHztAMDN7NAA+HuwG8fPeRF+1aLzvZVijYA4BpmE79LT7
         qkNFcmGVejaVn4XIotRzANv3fXqvLGqlIokAwLCKq7eucgwBjwWgi+6l8yoVdqDQo+iA
         iApo87Gv/D5XFR+0t6NAZlCs1OLTfUJS825zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704815404; x=1705420204;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X81Refop9R1gXjXOKGwLo8UBuI338mgog38VL6mWPzI=;
        b=luunBOhLpmaAyf4s9Jepx8j6WXLoEiwrAY888gJMX1arDHTRwEPZVGMeWlpmKqxcQI
         OIJXnGgxsbFFd0HOIsxMpMBLOEYOMBce6wNkgxu2JBkPVMbUfR+iPtFjRs/mvAoFo6c5
         loljUsIoKbwvfkzlsq43c/TmdDGatNGav7Vwl9esrEz7jzkh7TODXd1qZTnmhqmAcSaB
         a16rtqvtBUJ7HuKfuEeTlhIdMhoyHBxbEzHFBqWw2BoaP93t6axui8OC2Gnp4M1OwJds
         HlHMqyKRyK2bvI1hJk89uKMz2uH4vSdrJWf+IVAUpP26m34jE6ZPREQ/4/BiHCSrIYEV
         4KYw==
X-Gm-Message-State: AOJu0YzR3h/mp0XsC75irb8zXdr7gXQBks1QrVBPZ6GeDkH5iAiBTNKD
	2TVCgjxNGUsPvM7LgoRZsPQbqdNdw+/Mrw==
X-Google-Smtp-Source: AGHT+IGNO9h/QByzZKNZS0tsD/gyiOoZX3avPJ/N/6LkO6BN5CCwmd2NaeH4O35dsQ+kaa/LP31GJA==
X-Received: by 2002:a7b:ce8e:0:b0:40e:485c:ae84 with SMTP id q14-20020a7bce8e000000b0040e485cae84mr1376562wmj.9.1704815403835;
        Tue, 09 Jan 2024 07:50:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:494c:2c49:a717:e3aa? ([2001:8b0:aba:5f3c:494c:2c49:a717:e3aa])
        by smtp.gmail.com with ESMTPSA id s12-20020adfeccc000000b003368849129dsm2721521wro.15.2024.01.09.07.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 07:50:03 -0800 (PST)
Message-ID: <05071bddaf2a916739e9ecce069cadc8383dcf30.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] sstatesig: Ensure SPDX dependencies update
 when ABI safe recipes change
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Jan 2024 15:50:02 +0000
In-Reply-To: <20240109153651.1732423-1-JPEWhacker@gmail.com>
References: <20240109153651.1732423-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 15:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193465

On Tue, 2024-01-09 at 08:36 -0700, Joshua Watt wrote:
> Because of the way that SPDX documents are linked together, the SPDX
> creation tasks must re-run, even for ABI safe recipes. This sstatesig
> change is more comprehensive version of the same fix found in [1],
> which also has more information about the specific reproducer.
>=20
> In order to this to work correctly with the concept of allarch recipes,
> a few changes need to be made to the SPDX creation tasks:
>  1) All tasks now have stamp-extra-info on MACHINE_ARCH, which ensure
>     they are machine specific (but doesn't affect the actual stamp
>     contents)
>  2) All machine specific variables are excluded from signature values
>     (specifically, SSTATE_PKGARCH and MACHINE_ARCH). These aren't
>     necessary since the tasks are now machine dependent anyway.
>  3) do_create_spdx is no longer run before do_build. Practically
>     speaking, this means users should explicitly run `bitbake -c
>     create_spdx <recipe>` to generate the SPDX for a specific recipe. No
>     changes are needed to generate the SPDX for a complete image as the
>     tasks are automatically pulled in for that case, so this should not
>     affect very many users
>=20
> [1]: https://lists.openembedded.org/g/openembedded-core/message/192743
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass        | 30 +++++++++++++++------
>  meta/lib/oe/sstatesig.py                    |  6 +++++
>  meta/lib/oeqa/selftest/cases/sstatetests.py |  2 ++
>  3 files changed, 30 insertions(+), 8 deletions(-)

Sadly, I'm afraid I'm not happy about this.

This change forces a do_unpack in order for the SPDX task to run and
they have to rerun per machine. This means that any time you switch
machines, it will force everything to be unpacked again if for example
you'd cleaned up TMPDIR in the meantime.

The point behind sstate in the first place is to stop the system having
to do large chunks of work such as unpacking or compiling. This change
undermines the source extraction.

I do think we're going to have to find a better way to handle this
unfortunately, painful as that may be.

When I suggested the machine specific stamps, I was assuming the bulk
of the work was already done and could be reused but that isn't the
same from what I'm seeing in the patch as it needs the unpacked data
every time.

Cheers,

Richard

