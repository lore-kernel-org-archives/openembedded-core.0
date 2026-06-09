Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B781CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 11:41:34 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77853.1781005285284396246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 04:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ekf2LKwa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso7563389a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781005283; x=1781610083; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ul5VH+XMFkj5LJoie4HUYlAFYyzs7SKhf53YaODWIg4=;
        b=ekf2LKwaePY6uA/nkf5w9oEyA5MRuR/ahhgvoWqMgmK6prq0Qc4DZ/WZ1Y/SGdIju6
         6K1Jln7AN4urVmgYTQ6sTNzK0A4/0OkKRlXjNUys4qjDvRCa9yic8THlkrDXYkm8Fa3h
         bMJ89z8IDhvQo9xEDc3GFHf+ItoKVzq/OvXEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005283; x=1781610083;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ul5VH+XMFkj5LJoie4HUYlAFYyzs7SKhf53YaODWIg4=;
        b=Qnupx9GsGmzfwD0abyl8wqFuhrQ3hN1on/8IBilJhCMuf/B066QSj/TH5D0792Da4B
         haymAmkLn0akGilYwinZDqw0lH3/WPamPDMq1LHzTPwbHhNQRsGPklJE/EZ0h9AB66oD
         hyUsLTVtkvEIMOdvIcdqk/1Ewkmp2LNtqnP0df5vdGccDkddu7V1TuVhSFteW1H3oQQl
         JiVEp4Z21wKd4+MTI/Xv/3MnGCE+nomKOaVlvwFx0QI1+rKICMrOToWLoZsHZFwWhqK8
         nissy1US8ahAc+2FQItzfS/MPc7vssZdzDo2cC42xNMSGSWbbO+HsRtD7ymQDNqKql+u
         p0Yw==
X-Forwarded-Encrypted: i=1; AFNElJ/oO4DMXp/K7yPwCs89ar6FigujYI5Sxt0AeabpgOZPhslIzm5Hs5iuIce1QL2to9q8pQHw/skhrsdHwHAXtipjXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUVxzn35sCRgcAF7kBXrNVzBQFIvFj9NQwhmiT38Uza3CyA1d1
	XheFbVCLamB79zqMbfUw7QPAgLp9+aIl1bZAYOqCXmHOdwI9YnBuIQRKca2ZlsQbgU8=
X-Gm-Gg: Acq92OF9s6+3rHOT+EDZYlLU+BDauxni6JKZHGhK88RnXAFbaWLDuqVm4SStyC2EsaF
	hAmjHTa4XCIUiOdO2kfQvf2ppT11e8v6k4SwQWinAUhl3ReHPhyDc++vrv7Fsil7erHU/GTTF07
	P5oVcFjICkOhhSpwUWULbhvC4JkvMlTopkBj+424hWEA5W2zspwkBq3IFp97OstB5K1u9RVQpVn
	EB6eupySd2iCf+mz/YMea2ChxxBrwoxGav+1anwdiLWp5lE15clxbkVzUbQ9r+NsDB5ImjP/h2G
	yYFONtgrdlpjp5yxZXreUyjPHZsuccYCQObKiIPE6oPAyKRkQam3M9UhRPj6fF3ZDi2a5BSNBGb
	h4VXbPnE1AiCKVycuFU4HrBYUkqkqXdKQr4KQzWuWwM021qNhUekhs5VXkg0urwGS51IG2A+3t4
	fzFFyf5MsO0MVQpo6JFBFGLOMZnPzFsh8s0yi/g7HkMZXQk0xCCyio+64AMRsFbTTJNyTedOFsm
	f16vhcSNSyOqU1BpLwrWfKt7Ko=
X-Received: by 2002:a05:6402:3882:b0:68d:296d:9a24 with SMTP id 4fb4d7f45d1cf-68fa4c0c10dmr8674840a12.1.1781005283328;
        Tue, 09 Jun 2026 04:41:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1? ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851fa2sm8308298a12.18.2026.06.09.04.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:41:22 -0700 (PDT)
Message-ID: <ad7d4fdddcf28b3e7daba91cb0e7d100e9bb5f4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM
 URIs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sai Sneha <saisneha196@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org, corentin.guillevic@smile.fr, 
	martin@geanix.com, paul@pbarker.dev, mathieu.dubois-briand@bootlin.com
Date: Tue, 09 Jun 2026 12:41:21 +0100
In-Reply-To: <CANcU11cf4sH1racrRawKMQ8+622W_1qT33ou=Z06YG=38FJJcA@mail.gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
	 <20260602062940.3107241-4-saisneha196@gmail.com>
	 <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
	 <18B61AC5A22983D6.29982@lists.openembedded.org>
	 <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
	 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
	 <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
	 <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
	 <CANcU11cf4sH1racrRawKMQ8+622W_1qT33ou=Z06YG=38FJJcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 11:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238290

On Tue, 2026-06-09 at 16:04 +0530, Sai Sneha wrote:
> Hi Richard,
>=20
> Please correct me if am wrong.
> =C2=A0 BB_NO_NETWORK:layer-core =3D "1"=20
> would work for the case where SRCREV is set to a floating=20
> branch or tag, since _lsremote() calls check_network_access()=20
> which raises NetworkAccess when BB_NO_NETWORK is set.
>=20
> However for the case where SRCREV is completely missing the=20
> crash happens earlier in srcrev_internal_helper() which raises=20
> FetchError before latest_revision() is even called so=C2=A0
> BB_NO_NETWORK wouldn=E2=80=99t catch that case.

In that case the build fails to parse and is unbuildable? That is
probably fine as check-layer tests whether it parses?

Cheers,

Richard

