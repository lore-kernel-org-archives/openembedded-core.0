Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AAACA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 16:13:39 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.42831.1756138415334262957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 09:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxyTjCwP;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333f929adb3so38695001fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756138413; x=1756743213; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JGfNXqOjhQifEqwDGIsqa7iuqKBbMqOeYTul8fzti0=;
        b=LxyTjCwPRYWLrTxQt4Mw7tfomIQDghlfaTMDrlZYC7n7DwUNkdmwkCsa76xWrWsRsW
         WA21WEPCSku+TgdTvShsxvA45twuGXg3qDmB/eK0ntUxlsHb4aZBXyiSzBlItH5ptyxZ
         FN4bfU2bwcGQ1MQJL4F21SKTdVo3PaXJtBI/OxS3ZizFokBo6SNWRdBFPFt/XStYqYIa
         9OT9GamjpExcEScDFpZX/CmGWydEcRKUEKI3ntWWPSNqt4QfF+M7jEkeoKYk8a7If8fK
         99H1wtrMz+WMopO/2B43TTX4QRGTJkqiDIjgVh7EuYDVEkNkS28/CDBBquNVw+da5ivs
         WWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756138413; x=1756743213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JGfNXqOjhQifEqwDGIsqa7iuqKBbMqOeYTul8fzti0=;
        b=g+G+8axl0+Tk7LxN+q1LlhXWqogiZ0CRJQhi5uNheoVQ/Vq83nw8082RISVtYY1+UC
         TdltViRjZvW5qLs+7Fz/cd86VMVpE16e9ycg3YPopC4/tUa748BZgnFNpkga0kGMncye
         KUsNsJMLs/FJZ3noDYjbzzeeGmW507tCjpSIwAEIoVSkKT70JUkvnYGG9IQF+saMWqww
         mLSVCi8oKfBZYSoiHo9V80/lPv6xtaHdcsdgQ6Km/ovN7Hbalo1XGaUOcYkvWiJNnKXb
         KBpYRWCIkFpqYd4ynsiroBSY2QHnjl6hdt41gLRCJXtqGeqIfdAY65S/QJC92dC/DnKo
         v7ow==
X-Gm-Message-State: AOJu0YxYyMJaxSjGACOuQXuEPQiRY+7pBf3d+6PLKGFpT8e8Zhze5lE8
	PoHGw6tS9u15ncgBkLK9Jdb8LE6YuEMEtBMB/k1w6RZzNAg2jYDRLGmAv/yu1XzGttLKzvuF+q5
	Bdt/BDZ7RVhflzvptYvUGRgQZ6qyqTTQ=
X-Gm-Gg: ASbGncuimNjZQUzlsjBVB6NeThDAk4gKXbBOzFG4budeHkwzRCmJM0qXK8Efe2uW7wm
	VBEItCBqXY/bYeU3mcfhsXKgQWYMogWaC/9bgq0f4eXLKRfjsbAgQP6SRsD5UhDTAPgoJaW9oHe
	ZOejPlSzpxX2Mz0863sM4Q6IxI8jwkVEofDCcSzid44tczaXV1IIhB5h8g3DpHMGwwKd43Zponf
	eberXzt6g==
X-Google-Smtp-Source: AGHT+IHGcANfz53du9k84kL/pmkYYakTvQz5pPMVYTLVayjuqYzrJV87SMuMQejD1XLxALcGxd5qSw7zKh14p1xj8nU=
X-Received: by 2002:a05:651c:20cf:20b0:32b:8e4a:5710 with SMTP id
 38308e7fff4ca-33650f65d51mr23010701fa.34.1756138413204; Mon, 25 Aug 2025
 09:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250825161000.2593497-1-peter.marko@siemens.com>
In-Reply-To: <20250825161000.2593497-1-peter.marko@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 25 Aug 2025 18:13:20 +0200
X-Gm-Features: Ac12FXw_R2RV5kRJ8IzdCCNsaF-u0oEnq_l394nB7414pRtYDZBi6lstjT3aaGw
Message-ID: <CA+chaQfHk315c-HTtWzrRvxnpSxJwcAGSy3faz_63zC9zWBz+Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] ibarchive: patch regression of patch
 for CVE-2025-5918
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 16:13:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222414

On Mon, Aug 25, 2025 at 6:10=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>

>
> Picked commit per [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2025-5918
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...2025-5918.patch =3D> CVE-2025-5918-01.patch} |  0
>  .../libarchive/CVE-2025-5918-02.patch         | 51 +++++++++++++++++++
>  .../libarchive/libarchive_3.6.2.bb            |  3 +-
>  3 files changed, 53 insertions(+), 1 deletion(-)

Small nitpick, but the first character is missing in subject (which
makes it harder to find in git log).

