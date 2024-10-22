Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427E5D2C54E
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 13:09:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.17739.1729602552642695613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 06:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bZ2aYMJ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315baec69eso52010165e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 06:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729602551; x=1730207351; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hZKs9IdjXp2ltcTl7b7aQYF/L0dIUS5twg4DnQ5qAfo=;
        b=bZ2aYMJ82JYC2LmDqw/0KmoCV1QEViFPN/qlL8ffvaNf7XdD8ubGbCpeqa+zKElC1y
         ZAZZP5e8BCqOLEfXzEX88mbUhX5jqqPCzYW5ktZNl3hNcd+BoyTHjAymS6GwmZLbnzeg
         n7dexhaMXsRfzEmopT/+oKFM1s1xwb+8FJA0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729602551; x=1730207351;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZKs9IdjXp2ltcTl7b7aQYF/L0dIUS5twg4DnQ5qAfo=;
        b=bMbGZgbYs/6XWBIxFasZbyadDVvYN+hC//UOwANFeFTjZgEzmFJG/sFVv4g4AO5kT4
         Abim9ZfyvW+qVyGlmdB6FwhQqzLfG/YDDhNPtzk1K7vnhiiACxtft7/dzazcAJBOqcxL
         XaV3A5SpsCSO6C+b+UU/S/ehr3QIhCEpch1GMwpVD2Dp00kwyEwaOrxGoFq7mTjjOm02
         q0sNIfwsYwG59gGPfkq2tkkkmGKx1BmtV4pccLrM6G0A5lgSYEFe9UKjg+xubd6aPjZV
         NAiZYEHNkLyBEyhwt2nLy7YUY0qjV104k7WhcS73fapKekvJfY3TjB7r56VP8iCtO+kt
         wjDA==
X-Gm-Message-State: AOJu0YwGB/ED1oL/eZhUaqVdwK5KfP4DAEX4z68wJmMYqBq5NKZ0Y5aj
	cjkXd+uS5xfWFCk+T1EWtAzOlYTnoNMUNHc/TdRaxt9MnzMO7JS7CEdZ5HmrBEk=
X-Google-Smtp-Source: AGHT+IFV41i8Gny+5bT9BZ0j83HGO4dMR1xtZrxw6AsYvYWC9wAgFYOTnnLLMqSEvEt2OqWn90+K4g==
X-Received: by 2002:a5d:6a86:0:b0:374:bd48:fae9 with SMTP id ffacd0b85a97d-37ea216e2d2mr9343322f8f.20.1729602550806;
        Tue, 22 Oct 2024 06:09:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:65f7:2a12:edef:6771? ([2001:8b0:aba:5f3c:65f7:2a12:edef:6771])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb42sm6558706f8f.98.2024.10.22.06.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 06:09:10 -0700 (PDT)
Message-ID: <0ac8780b1703a929a085f732db8647e5f091d933.camel@linuxfoundation.org>
Subject: Re: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the
 database during builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2024 14:09:09 +0100
In-Reply-To: <CAOSpxdYkNiYFE3n2KBaAPH=Qrxu3DGxgnLuWaJkMQbwHkEmVAA@mail.gmail.com>
References: <cover.1723636705.git.steve@sakoman.com>
	 <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
	 <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com>
	 <17EB9EED917D6CD6.10903@lists.openembedded.org>
	 <CAOSpxdYkNiYFE3n2KBaAPH=Qrxu3DGxgnLuWaJkMQbwHkEmVAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 13:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206152

On Tue, 2024-10-22 at 05:59 -0700, Steve Sakoman via lists.openembedded.org=
 wrote:
> Hi Marta,
>=20
> We are still getting database errors on scarthgap (and occasionally on
> kirkstone if memory serves), so I think we need to reconsider
> backporting this patch.
>=20
> Can you suggest changes that would make it acceptable to you?

Just for complete context, moving the database on master did isolate the da=
tabase issues to scarthgap so the problem is in the older branches at this =
point.

Cheers,

Richard

