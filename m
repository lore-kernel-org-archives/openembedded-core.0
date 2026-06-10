Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76A7CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 06:34:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14213.1781073240568227504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 23:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dlICBGVX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so56203405e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781073239; x=1781678039; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cTru2hiHF98I9da8FIAkWPJft0u0zJ3hi8URG0U2P7E=;
        b=dlICBGVXoSH85/L/Qb4f8ON1LudnbDT+1gJh+2vPIVrVGORFNKdi8FZ355FBmAaWa1
         NjSeAK1yFxS6Pj5CezGAI56jH8zOdheiFuS8lxacDXY4h4hVqrcJGx4qPnT1tuRUCDQs
         +5DbbxipI3eAp+LayrcfDfj0RkpOIPLA+DIC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073239; x=1781678039;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTru2hiHF98I9da8FIAkWPJft0u0zJ3hi8URG0U2P7E=;
        b=G+zur7OdYAoDHr36OwE4EUSb0TKLVuLUEGQU5ApJUI8mYQ3Zc1vnFWRUIVMRbRENuA
         rwA5JJaSVIQNmKsoC8B1b79KYukFIEIlnow7YJ11y9L+Eoqj4T24UUqXtg1/1G29Gt4Z
         5pSbb24Hd59dOBrsmSfhYaJEITAQwNqZnz2uq2m15dNKpU2nQU2gMEsjRjUgRM7TsUt+
         UMWe0Gzy9s0tOuXjSmGjIZjcVEPutfWy+rqnbuPQnC8hmSnrI955VYWn73sl1JqWQEZS
         CL3av1gikjwcZ8voiOMKE8TJ3pwc8dyfP7EpmLzcaGE0F/xhyg4znRC1qGn3jY2IDtFl
         JxqA==
X-Forwarded-Encrypted: i=1; AFNElJ9WfCvXLTjeJmRK+NEnKUmfGVwnjhcwwa42/F7Iasb/TUaiFr1j6Pi7ZwrQuL2YXg03zxORl9bf5t1pq+4nZa71qA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4hYCJclM9yo/+bog3NPPl/kGRrj0Sc9EpzELeOdFuisqTpSQ0
	lQtyHAeRECPYn1MzICvK+OZMF1BN9GEvNNSw5rz9jTVQvQCJ4b6FHFmKnBZBCrkqZvg=
X-Gm-Gg: Acq92OGtWGMzJGWqW7g8YHAOdc22VqZ4HNgIfcVPmFoJLybX81I9Iv11Bo6N9xueUSb
	Vb3mW63jVAkCfDpjsPdiupWvle/TJJs2wXSaMuNIkIaD9lqwzcdo0e4RHrRR2QKv6feEdDTVby3
	OQPpdJK8B8SNoHY4dq9E9T1DQBwyincL3wbGAFF6eLLf1+NW0xyPjoc6jn+9tcFPSfiLYQl37o5
	uyykmRVmGRNM0KGQsE9c2a4YKMMxZqBg2nskYPL8v2ZFXvsicph/PfnvRv3Fe/OkvuaR9xBz+iS
	2Xss0QvdNh7bGL0BdG51eCmuutTGqfVwVnL0FCNaT7RjcS7VXJU98IKCzl0cZc45cdjCInDB8pW
	8/jdNyCPm/O7F5odQEZ5E+wDwXgrV/eXcOSWb55Y0DQzLLBtJjaOeq5L4FoZf493pqYWZgesc9j
	4HE7O8ymTtcLjPW4tLHVlaSpBQE9LFr/IQZo6QtH1m8dk8nXaCFr/ehvhE4rnASMWDxv9/TacsI
	qE2lObfjRsckjRBQEPNn/YD
X-Received: by 2002:a05:600c:4509:b0:490:c28c:e077 with SMTP id 5b1f17b1804b1-490c2d33c0fmr280019695e9.17.1781073238931;
        Tue, 09 Jun 2026 23:33:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e996:5a7:2609:813f? ([2001:8b0:aba:5f3c:e996:5a7:2609:813f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcaa924bsm63918785e9.1.2026.06.09.23.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:33:58 -0700 (PDT)
Message-ID: <954159bfc9f674bde4da8e0133143589e4945e65.camel@linuxfoundation.org>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM
 URIs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sai Sneha <saisneha196@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org, corentin.guillevic@smile.fr, 
	martin@geanix.com, paul@pbarker.dev, mathieu.dubois-briand@bootlin.com
Date: Wed, 10 Jun 2026 07:33:57 +0100
In-Reply-To: <CANcU11dmkfUA7E8=Qm8O1J8VZLHEv=FW3Gjm2bVpHqvsi7AvUg@mail.gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
	 <20260602062940.3107241-4-saisneha196@gmail.com>
	 <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
	 <18B61AC5A22983D6.29982@lists.openembedded.org>
	 <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
	 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
	 <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
	 <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
	 <CANcU11cf4sH1racrRawKMQ8+622W_1qT33ou=Z06YG=38FJJcA@mail.gmail.com>
	 <ad7d4fdddcf28b3e7daba91cb0e7d100e9bb5f4b.camel@linuxfoundation.org>
	 <18B7A1AFC3F003C5.267903@lists.openembedded.org>
	 <CANcU11dmkfUA7E8=Qm8O1J8VZLHEv=FW3Gjm2bVpHqvsi7AvUg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 06:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238317

On Wed, 2026-06-10 at 11:47 +0530, Sai Sneha wrote:
>=20
> I tested BB_NO_NETWORK:layer-core =3D "1" and found that it does=20
> not prevent the parse crash for the case where SRCREV is=20
> completely missing.
>=20
> The crash happens in srcrev_internal_helper() which raises=20
> FetchError before any network access is attempted =E2=80=94 so=20
> BB_NO_NETWORK never gets checked. The BB_NO_NETWORK flag would=20
> only help for the case where SRCREV is set to a floating=20
> branch/tag and latest_revision() is called, since _lsremote()=20
> calls check_network_access() there.

FetchError isn't a crash, the code is finding there is a problem and
raising an exception. The exception should say what the issue is.

Doesn't that mean that case is already covered and we don't need to do
anything further?

> So it seems like two separate fixes are needed:
>=20
> 1. For missing SRCREV =E2=80=94 something needs to prevent the parse=20
> =C2=A0=C2=A0=C2=A0crash in srcrev_internal_helper(). Would it be appropri=
ate=20
> =C2=A0=C2=A0=C2=A0to check BB_NO_NETWORK in srcrev_internal_helper() itse=
lf=20
> =C2=A0=C2=A0=C2=A0before raising FetchError?

I don't understand why we need to trap this, then handle it again
later?

Cheers,

Richard

