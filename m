Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0808DC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 13:41:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.90048.1677505280536759236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 05:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M8rs0zvr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so3346684wmq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 05:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G/Jzgzqldyhac1cNkNRS3c/0Fjlu2sCEYHOkpB7Pw5k=;
        b=M8rs0zvrSBBL04+b8NY4p2qf5lqAZT5okl+ujDqLHUWimqNxQjaftjYc2+o1R5jjRG
         AMsgmQeBHyeGJOcHqLD6IB8Qep+3V/th3LXc+O1GFS+x616P+2XYxL/vqAGVHVaNtpjg
         iaIocRi0skrR8MNTQ88Q/vtZ5hUk3KcFlR2vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/Jzgzqldyhac1cNkNRS3c/0Fjlu2sCEYHOkpB7Pw5k=;
        b=p6v9e02jTXW/ivSQ5GcwxzRhuH3eO5uZE8EGnP/K25saf4DP3y3W83JRdoEUpd+XoU
         tSu4f4oW4DQZ6WJoOzbmO7eJ4D7JGi15DbepwT8W1We3cI0XgelT1It8y01u8IlBgDhv
         3qJy0MI/Eb6io3NfqnAGYeY0Q/zGIvFmR8/ZqKlCPbc+eI/EOLukPmcZDKyu8EBGbZP3
         fxddxV8ZuvscI2V3DDDdsmyvzaEkrf6zM/mlAuwgDextYlcIDVXkJOrqUnWTggNWvoww
         WutJAPoAZEu3qD4Vd97oobDazwt/tPFtq8UGzaQuTxxCaatztUmM3GXd5jOXuCqhcZmt
         NXQQ==
X-Gm-Message-State: AO0yUKXUjy4Y92bT49lMkp6T/VgFSXCgQp2c5+gMVNpvMwp8Pnif44ZT
	xStgD8BFnLlbVkq9iNnTyNcm1A==
X-Google-Smtp-Source: AK7set+/4O8VJ8ZHXp4fQ9TP11NcBIXP/C6vqHP7yjM70k2aVfKPFT5+14xuJk2+DAQ0HnN0VLTuEw==
X-Received: by 2002:a05:600c:3147:b0:3eb:3998:36f7 with SMTP id h7-20020a05600c314700b003eb399836f7mr4221373wmo.8.1677505278809;
        Mon, 27 Feb 2023 05:41:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b7e8:d302:d51:7008? ([2001:8b0:aba:5f3c:b7e8:d302:d51:7008])
        by smtp.gmail.com with ESMTPSA id q8-20020a1ce908000000b003e70a7c1b73sm8944316wmc.16.2023.02.27.05.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:41:18 -0800 (PST)
Message-ID: <21797903f8c9f9aff60f43ed5db34d2ef16ca4c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 0/6] scripts/resulttool/regression: add
 metadata filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexis =?ISO-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Date: Mon, 27 Feb 2023 13:41:17 +0000
In-Reply-To: <3070708a-ac01-a3a9-31c8-e319027fb44b@bootlin.com>
References: <20230224164555.67634-1-alexis.lothore@bootlin.com>
	 <1746D4E8592324E9.29542@lists.openembedded.org>
	 <1747067DAE80068A.29542@lists.openembedded.org>
	 <4560f34639cc5c794b0f15edae10aeba0da5e570.camel@linuxfoundation.org>
	 <684f07d3-6ae3-9932-26e6-edab46bb0ec7@bootlin.com>
	 <e40c7fea9d2d3ec508c5b5a73315a8429422e2cf.camel@linuxfoundation.org>
	 <3070708a-ac01-a3a9-31c8-e319027fb44b@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 13:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177795

On Sun, 2023-02-26 at 16:42 +0100, Alexis Lothor=C3=A9 wrote:
> > I'm hoping we don't have many of these quirks. We have a huge history
> > at this point so it would be sad if the tool can't work with it. From
> > what I've seen so far, we can manage with the code in the regression
> > module itself. I've tried to add some comments.
> >=20
> > I wondered what to do with this series since I needed to get M3 built.
> > Since this series was available and mostly usable, it would be better
> > to have a nicer report this time, it is a good test of the code.
> >=20
> > In the end I've merged most of it, along with my two tweaks to handle
> > LTP and the bigger ptest results issue. I couldn't take one set of the
> > selftests since they simply don't work. This will give us a useful
> > realworld test of the M3 report.
>=20
> Ok, great. For the selftest failing, my bad, adding proper logging was on=
e of
> those "one last change before sending", and obviously I did forget to re-=
run the
> tests before sending.
> >=20
> > I'm working on the assumption you'll send a follow up series with the
> > tests, the oe-core check and some of the other issues I've mentioned in
> > other emails?
>=20
> Absolutely. Besides the tests, oecore check and the improvements mentione=
d in
> this mail thread, the next thing I was keeping in mind is fixing the repo=
rt
> generation against "master-next" branches you have mentioned a few weeks =
ago.


FWIW, here is the result from M3 rc1:

https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/testresults/test=
result-regressions-report.txt

It looks like a couple of runs were mismatched so the ltp issue isn't
quite resolved with my tweak. All in all it is definitely a lot more
readable than it was though so progress :)

Looks like dbus may need the same fix as curl.

Cheers,

Richard


