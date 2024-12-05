Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CBCE7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 10:40:12 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.7953.1733395204559337137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 02:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ShDm0NAh;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30020d33d05so5398381fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 02:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733395202; x=1734000002; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g21HT8Ba21KUqli324OJIVTPfuiNNLz2O/4ksWTJgNE=;
        b=ShDm0NAhlaHDclqKfEGHEgVkWv40IwUYEEsW74oGHmGqmKM5aYBaFMVdIM7ryOWuT7
         YBooMN0bJ+88cglTYzqUoZFRJKSXk17K9XhVAUr0KZtJNz3p2R5WtATNXi9H4iU5x9dL
         VqbJySyb8xfNQn66lMRSMjP4+CnB2bHG9aWK3/IPVQB9yarm7kypAZfz4et238mi/1kL
         zLGp2/tyFVPJRNMBHv66+4WW1oKpNxZcPBDruOlME29Eb4bmn+hDovEnNiM8FC+ShGVV
         2V+1wiEULyPbniskhlGmHZsudufIJDHu0523DOtm3V8kxjZJ6ZBcZPdNfLjTVRJGV//J
         VLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395202; x=1734000002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g21HT8Ba21KUqli324OJIVTPfuiNNLz2O/4ksWTJgNE=;
        b=QqhRZSziM9Koz0/sd6mttffl6oQZ1a/m9tK1nAjYgia1p3aBS1OE5qeMP2qhkhP71r
         wGj4v2sSEbzSqwhkzncZPOBQvMxrl+wZUR2A7RfSsdL298SmaHDtB9suMiIASvfJQnDE
         ywAtnB3Wr2uj7TR7Ow81QBFSgZZgpV27BSdFvUP7ONMDJvBTXqfDVoAurof3AGwlBNFw
         RutElTK1KN04aWAh/ZRYMtZswQHvlsdzgfhYHoy0fsisEai8J0clKNR0Wwr4jK8CB+DC
         1xp6P08sg9P12EzclTHSWIN8vZ8zid7l+HqM08wmvJwj07Cz6bRvPK1vTttbjWn7AgCY
         QSgQ==
X-Gm-Message-State: AOJu0YzArwktJJAnNTd0EM0u1APqooKbg/9tkH5kvcLfpU2PRsHbyMif
	be+V5DKEroqnUAr+GBvylYmprXQ5Z6FjgKx5+T/N75k6UCm8KqgfIzLqAgovOC+RFDqgZxeydoI
	7P+ufG0E/MjCIdetwkZEckOCMoDA=
X-Gm-Gg: ASbGnctrslhuv5s+xLpwx/jFIYhEfCJJ+eQ8YJHyu+w2LsFPW1FczQNIhVaarWV6cl2
	L16Yq/ftfw0zEXJkCR0J+TeSb3phXyZkLGw==
X-Google-Smtp-Source: AGHT+IG+xbe4BB4wyigdoPjUeonfK3JzM+Mfo7oiGOXD9nVrQTS0Kefvw76A0EmIi0rOvjYoMZrBr2VIMfiBOK3ckCA=
X-Received: by 2002:a2e:b887:0:b0:2fa:c185:ac4e with SMTP id
 38308e7fff4ca-3001eb748d0mr7481531fa.13.1733395202180; Thu, 05 Dec 2024
 02:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20241205093237.333818-1-mikko.rapeli@linaro.org>
 <CA+chaQfkLvTfv5o30LZzuBHJ42Yo_q1MHkg55HJbcZTw+SdqDQ@mail.gmail.com> <Z1F8WTH18m_fzyxQ@nuoska>
In-Reply-To: <Z1F8WTH18m_fzyxQ@nuoska>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Dec 2024 11:39:50 +0100
Message-ID: <CA+chaQdQck_Cyj7S4V==VG=0yxgGO8n-tKKbtZ1F8+MciGWiAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] swig: update from 4.2.1 to 4.3.0
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, peter.marko@siemens.com, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 10:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208374

On Thu, Dec 5, 2024 at 11:11=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Thu, Dec 05, 2024 at 10:43:19AM +0100, Martin Jansa wrote:
> > Does this swig upgrade fix the issue with work around added in:
> > https://git.openembedded.org/meta-openembedded/commit/?id=3Df9158ce32ff=
fa6f18eed4008c3295146c81d55ea
> > if yes, can you please send revert of this work around to meta-oe?
>
> Unfortunately no. Without f9158ce32fffa6f18eed4008c3295146 in meta-openem=
bedded
> python3-m2crypto fails:
>
> | src/SWIG/_m2crypto_wrap.c: In function '_wrap_fd_set___fds_bits_set':
> | src/SWIG/_m2crypto_wrap.c:11826:88: error: 'fd_set' has no member named=
 '__fds_bits'; did you mean 'fds_bits'?
> | 11826 |       for (; ii < (size_t)1024/(8*(int) sizeof(__fd_mask)); ++i=
i) *(__fd_mask *)&arg1->__fds_bits[ii] =3D *((__fd_mask
>  *)arg2 + ii);
> |       |                                                                =
                        ^~~~~~~~~~
> |       |                                                                =
                        fds_bits
> | src/SWIG/_m2crypto_wrap.c: In function '_wrap_fd_set___fds_bits_get':
> | src/SWIG/_m2crypto_wrap.c:11851:48: error: 'fd_set' has no member named=
 '__fds_bits'; did you mean 'fds_bits'?
> | 11851 |   result =3D (__fd_mask *)(__fd_mask *) ((arg1)->__fds_bits);
> |       |                                                ^~~~~~~~~~
> |       |                                                fds_bits
>
> With workaround f9158ce32fffa6f18eed4008c3295146c build passes.

Thank you for checking.

