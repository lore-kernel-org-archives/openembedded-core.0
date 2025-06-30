Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F84C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 11:23:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.37287.1751282628609627130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 04:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BdPR16Mw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso16108945e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751282627; x=1751887427; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rwOtqmve0M2bFMW80dNVp3qHLLS8mTRnMMTM18ChOCo=;
        b=BdPR16MwlqlYOg+gikVX/MOf9QWUZYBn7xzj4iq8N85lewDVhDe++jg0X04tSJapba
         ISxHEmYKxOtFsuom1naJLny/zLZnRgFqnSStXL86OAg40PpBfbISd8FUBdPl/7NXtXm5
         BepTom63pO22CL3NofUMuF6+JiB7Qj5vJJ4IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282627; x=1751887427;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwOtqmve0M2bFMW80dNVp3qHLLS8mTRnMMTM18ChOCo=;
        b=EbRbsVkFfd5BoReudTlu7XzKmRHJW8t6mqk/Ez9NofFYxn5paLFk5NSgwi4RX23Fi8
         rXOtMGeqRWQtgr+ciH8joNYbeykl24QaBAqPlvo/bZs7l4e/qzx+K8P+6KwQzBxbKHLV
         gWL56zJEkz07Eh5E9IRBI2Rio3QudhFtC5F/qsp0GyODnBeKhPoE8yZZJrrs1ayOmp27
         F1LPI/ms0K2m7ilDJira+0r3lpPNoW8sCGWiq+Aaa3WqSvOG1j6gXdr/j/cZ8kXbZhTU
         Kv1FoKLZxw2OvP+dRjqBcdGI4ZbH+TuqRMm1Z/OGn5kqpt9jNQlpuNnFz5Sr6KuKq2W1
         PVLA==
X-Gm-Message-State: AOJu0YzZcB1VUMm3mEifTRF0QxD5V0d7xFpLZMMETOytDJkK2uamIVOA
	75VlvoVsCtbBK4lbPoSAQP49EGaQKGjEsna8ZhBF3PiA/p55hMjKCUSte+ber5bQ0YhjbTsOmzf
	uWY7c
X-Gm-Gg: ASbGnctvFnJfqIYJYdGyOZrHil7a7UUY5pHpoLRECQrb+GeEQwzsEiFIvKSg9m+hO/o
	JiqzPwvpXLwxtfHksxqnL5UC3c74sXwLAdnWWj4eF2j6BB0iVRnRDFKRWnEYry5q5ySdIcrXJs6
	35KE2E7wtr1pXZ0AdFmPYOkd/q6xoRpLMumlF27kXxhMq8AEIfdxtCFdDMvLPCMDv+jmtFVGlxX
	zi6rFNqGS8XWlZqd7t65I2XUg/sI3NxHd5LQlRZ2NfokIpB06ASLU/KTbEBVNgKk0uN20W9eyZT
	g3x3N3Q+sxnE+yIAMDcT2LVq2dSy/uIGAmA74WumBJenPTPmwrf2KMrfpKJR6Yuckoq07AWrJvO
	3Ys7UaPX/6YjTePUYvps9tCccHndbtgFOFzKQiQYSEUrCWKUdzp8=
X-Google-Smtp-Source: AGHT+IEkMGmSFvFLaMRmgbNCpJmK8o/MK4YYLbGJy90EqQ4UeIPKdODKbR91ijOLsdydL9lruMLMhA==
X-Received: by 2002:a05:600c:1e11:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-4538ee43af9mr126798875e9.14.1751282626953;
        Mon, 30 Jun 2025 04:23:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea45:3640:e90f:2224? ([2001:8b0:aba:5f3c:ea45:3640:e90f:2224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ca4sm10214411f8f.58.2025.06.30.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:23:46 -0700 (PDT)
Message-ID: <16d9e5fe8b7d1737aac5fb9003b3ba2e847e6b8f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] base: Use DEFAULT_SHARED_UMASK for
 do_fetch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2025 12:23:45 +0100
In-Reply-To: <878ql9y4dx.fsf@prevas.dk>
References: <20250627212423.3315152-1-richard.purdie@linuxfoundation.org>
		<20250627212423.3315152-2-richard.purdie@linuxfoundation.org>
	 <878ql9y4dx.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 11:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219514

On Mon, 2025-06-30 at 11:18 +0200, Rasmus Villemoes wrote:
> On Fri, Jun 27 2025, "Richard Purdie via lists.openembedded.org"
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> > The intent has always been to share DL_DIR, so set the umask
> > accordingly
> > to the new DEFAULT_SHARED_UMASK variable and match expectations.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes-global/base.bbclass | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/classes-global/base.bbclass b/meta/classes-
> > global/base.bbclass
> > index b86f50e2839..77bdbd03dcb 100644
> > --- a/meta/classes-global/base.bbclass
> > +++ b/meta/classes-global/base.bbclass
> > @@ -154,6 +154,7 @@ do_fetch[file-checksums] =3D
> > "${@bb.fetch.get_checksum_file_list(d)}"
> > =C2=A0do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}=
"
> > =C2=A0do_fetch[prefuncs] +=3D "fetcher_hashes_dummyfunc"
> > =C2=A0do_fetch[network] =3D "1"
> > +do_fetch[umask] =3D "${DEFAULT_SHARED_UMASK}"
>=20
> So this changes metadata hash of everything. Perhaps that's the right
> thing to do, but it does mean that changing that shared umask
> variable comes with a rather high cost.

Since this value doesn't change the output, other than the mode of
files in SSTATE_DIR and DL_DIR, which have their own ABI of sorts, I'd
be ok with excluding OE_SHARED_UMASK from task hashes.

> I was looking at doing the var lookup inside the download method
> instead to hide this dependency.
>=20
> But, I suppose, both the old and new umask variable are really more
> "named constants" than things that are meant to be tweaked at all, as
> they (especially BB_DEFAULT_UMASK) have wide-ranging effects that are
> not really easy to predict.

BB_DEFAULT_UMASK isn't meant to be changed. OE_SHARED_UMASK, could be
by users for security policies locally so I'm ok with making that work.

Cheers,

Richard

