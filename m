Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56530C8303C
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 13:14:24 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.17284.1751721257507331004
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 06:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i+IWJOha;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e87c86845d9so1268084276.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751721256; x=1752326056; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uNhp8IbcycVkLzZ4olZwfwoH2721H4xKj41HNhm3lM=;
        b=i+IWJOhacaPvmdIrmpTskkr466BxzzrZFCqf8WyoVdcqt+y6nRZMpE90JE5PUmqTcN
         /877lSIhyDWbI6ohT3i1Ek1/HGB2/i9bxIUTcDwxxkNa2TLSzFm064IjegZH7jrzWhZ4
         ROYEoFgvSGsd0u412rJG774A/UpgnADpTjCVYr0so23qmn8pNm9j/X/8F/2o/R+uWJ/O
         J8uZRGhsoPmwagU+jl1lKScJoCB0P2jh5AUvWB9fRhjdNltnBLEKH6sQALpMJSgv85YA
         xtsoZoU+SzO/Zvde/YJCR59Xzyurogn4CtCbqGTvyFR5P9mpP92m1IW08gU+GUelS1Zm
         sYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751721256; x=1752326056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uNhp8IbcycVkLzZ4olZwfwoH2721H4xKj41HNhm3lM=;
        b=YIk3eCdnbGrfPrm1fu/BEsoC3brrtMqxiZYiHKqxJ1YD2AXEQ/9xB0dDJkIMNcwYWs
         9RPyooS3sber54DE99i0pxv7M0SAIV+97EUoUByrs6N67tNn5QmLn4BU5+d6+4VZdTVS
         3r0DBmHOhTRfS30E5NHDxYEEFlJ8rKaI/ldqrOWUjZzttiK41PkVGV7meInEgZOTzm4v
         LNASmyM336OYO2R6cu1LW427tVgXaysU9UWPgOyE6K13nw0U+mNBL2Z16FFIOk9Jod3S
         yb3nmjSgbwuIvW8k5YTjtlqjkAaFpFgY6zhujxSXBovWTxtDr5UlVqTevp0Qo1ILU+ro
         lb4g==
X-Gm-Message-State: AOJu0YzCPfSVprAMidWzE8qyXQyf9qpWw4xB+PfIZ/szCUAkBdSy3wYN
	gKXQU3YeOLvs9hz6dEKgJfi/wH7nF7vxgjXxXueqPKtgdJzptDrt6pK7tAEt21aMwsspAjJ94/U
	DaSW/CC3qD7KVpLEu/Qh9eR+wnC7ZkLMV4qD2rthljQ==
X-Gm-Gg: ASbGncsl+DEKElpM1OQzP36btShCdjH41dRa5rho3zLYo8fedbD9osueZj3cyCYB/yY
	UlUKiY+50E1n5TAaa57z6fIxmxhq4J+9EHIX9uVtnPb/BIksW3O6wBZM+t6gTeN1mWLkr4/oIrN
	ptw95Ba/wCW77QSbFAmKvpEnAhFbv35jgvyk42COPmrn5dl61LcAgOtukp+I45cjHK6X93wTXZY
	gE=
X-Google-Smtp-Source: AGHT+IFFuMgN1Q+MGYoPUkpCRhnRFurb2PTDleR22P2kXO0+az9dnruEKFfWEGxZ9RhIRAIEBZZWBZzyYv1jePd53js=
X-Received: by 2002:a05:690c:6ac7:b0:711:16d4:60dd with SMTP id
 00721157ae682-7176ccc637bmr27162127b3.19.1751721256384; Sat, 05 Jul 2025
 06:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751641924.git.steve@sakoman.com> <24cf72e0fac261e335016e0b490f1fc10992bbbf.1751641924.git.steve@sakoman.com>
 <bacc969b-dbe2-4256-92ff-4701a5853390@gmail.com>
In-Reply-To: <bacc969b-dbe2-4256-92ff-4701a5853390@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 5 Jul 2025 06:14:05 -0700
X-Gm-Features: Ac12FXwgCj-PHRwM5gUF3P1FoQ4YU9ZMBtzyRDfUqLXfaw9kIol7ZVeuhrI877M
Message-ID: <CAOSpxdYVYjSDWAgx0MRW0xqE9hi+bkd5-w-uNSfTrXvwAxeG9w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 8/9] xwayland: fix CVE-2025-49178
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 13:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219953

On Sat, Jul 5, 2025 at 3:01=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:
>
> >  .../xwayland/xwayland/CVE-2025-49179.patch    | 69 +++++++++++++++++++
> >
> Minor typo-nitpick: off-by-one error in the subject. The subject says
> CVE-2025-49178, but it fixes CVE-2025-49179. Wouldn't reject the patch
> due to this though.

Thanks for reviewing!  I've fixed this.

Steve

