Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A3DC369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:20:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9026.1745594395838466814
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 08:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G/hkTWEF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1804491f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745594394; x=1746199194; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Apr2rshq5AwidJ8CIH9g9d3CfOJctRFqhkCDsHcMRPo=;
        b=G/hkTWEFsFm+oQZgt7HpyTn8SZ7RAqTrDxz8mVM6b3agPVSJvTNSTO1YJ7uwgMR4Y5
         tRqXUYRsYmfKLbWLbJN/aNPbZUvyhx1wCoa7aEvnzDtxMpS41K83dkj87D/Fknry0M6c
         1rvSqeYVwN5pb/W76TFbsG/7oW2N9jvpoO/R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594394; x=1746199194;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Apr2rshq5AwidJ8CIH9g9d3CfOJctRFqhkCDsHcMRPo=;
        b=l6hJkLV58Iepdqj9DxTGzsG87yBRfOIEtYFIrHpUwUBVIxAoKAw3YEgNMJHDzyYarc
         TeSHd7j1N/08oUwV4+6V0yGcezMHNSOPX+jU0wsIWczZXqDnZJMv9v2YDuItAGdGoOxQ
         qsSm0FMsCCNMet9o82HDcRBLrrHQHdoUTgR5e52rrFcrefGrDPC+GAsuB4FocxlJnESd
         sN8ipG+KlvS3Enno9EeD/omMRGsCjMgyEH8R1D7lFBezdDRlhbL5KQuVGY/BDGcV6Ij5
         IeVnGzM0Tml331tyiLRhEUA3Y4yUCq++YoMUnoHS9r+ODeVBIryEjgPWACQaWEGiCSO4
         we8w==
X-Forwarded-Encrypted: i=1; AJvYcCV1EUUTw8MADY+RQZ8yOPFJ0aMoDMR7w/3+iMawlpD80k3vRx7SKRts4okd9FJzBzs4rf4iFJIPE2RfFe6De0Ttaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHMIk6f+YGwYohVErR2fnaaoyL7eImisfcgkLYwG1KthpBytXb
	bS+uACSqwz5Cma1gw9xAO8eXNcIhJsY0PMLQBnNvOAEvNYjxVycgaLn/buXeLm4=
X-Gm-Gg: ASbGncuAo0FaaHZIYUrYvCDqfzr2dy4XLCor1WKjZ15n075xsbMpW23xqmTBf7vTNPI
	IJFLo7c3fkm6/P8HJhZaFtnjqYfNQPLeq+ApgZaGgcQBTz7Mjqr24OK7CjNH4HYPOYEm/filJPE
	ZDL/va9e8iLufMMJP1hbJvaLQVi5moqdQFgeLhd+NAmeKYeHzVG+hRCS0c+kDklH4mZ2Anhbgs8
	8l/B66wKLgFusyoaLpfBNhxaxFerxB/L4wxtNGZjyoVE+pvOLE/F5L5x6XwVhXZLP0D5AzCV4b8
	cfKfG9WUc3XzR1r2oq0MOSJIn72idUjNtY9rr5xlDM3S6zAMgVMgQLnZfL/poV26LkC8VKV0hXz
	MkLVt+zlPidzUDnaVN79tdZFAGfiRnA==
X-Google-Smtp-Source: AGHT+IEI/gpSkZgBW59oWe/nkSq2KUcQYwHphpecs29vqicTUsAQyOWarY+QjXO3HsgAQQ3396FcYw==
X-Received: by 2002:a05:6000:2485:b0:39e:e588:672a with SMTP id ffacd0b85a97d-3a074e0f0c0mr2238792f8f.7.1745594393949;
        Fri, 25 Apr 2025 08:19:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1? ([2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc4025sm2685528f8f.56.2025.04.25.08.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:19:53 -0700 (PDT)
Message-ID: <e8cb10fbf0d0bb9e20241059fb75083501d7fa8b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] send-error-report: improve debugging
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: thomas.perrot@bootlin.com, skandigraun@gmail.com, 
	openembedded-core@lists.openembedded.org
Cc: yocto@lists.yoctoproject.org, helpdesk <helpdesk@yoctoproject.org>
Date: Fri, 25 Apr 2025 16:19:52 +0100
In-Reply-To: <b422d462b12c51ac9f50eb0fe4f673ace665a29d.camel@bootlin.com>
References: <20250418133504.932848-1-thomas.perrot@bootlin.com>
		 <39feaeb4-a937-408d-9e2d-90d2460acbf9@gmail.com>
	 <b422d462b12c51ac9f50eb0fe4f673ace665a29d.camel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 15:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215480

On Fri, 2025-04-25 at 17:02 +0200, Thomas Perrot via
lists.openembedded.org wrote:
> Hello,
>=20
> On Sun, 2025-04-20 at 12:44 +0200, Gyorgy Sarvari via
> lists.openembedded.org wrote:
> > I noticed that this (or at least v1) was applied on master - would
> > like
> > to call some attention to a related discussion[1] in a neighboring
> > list,
> > and some patches[2][3][4] that followed it - at least [3] is a
> > pre-requisite for this patch (error-report-web has hardcoded the
> > version
> > of the script to 0.3).
> >=20
> > [1]: https://lists.yoctoproject.org/g/yocto/message/65184
> > [2]: https://lists.yoctoproject.org/g/yocto/message/65188
> > [3]: https://lists.yoctoproject.org/g/yocto/message/65199
> > [4]: https://lists.yoctoproject.org/g/yocto/message/65200
> >=20
>=20
> Can you revert the patch v1 and then apply patch v2, at least after
> patch [3] has been applied to error-report-web?

It would be helpful to address that to the person who maintains the
repo. I've updated to the v2 of your patch.

I've queued your patch for the server but updating the instance is
beyond my access/skills. I also queued a django and python3 upgrade on
master-next there which it would be good to test.

Copying helpdesk to see if they can schedule in some help in updating
the instance either to master (easier) or ultimately to test master-
next and move to that.

Cheers,

Richard

