Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDB2EB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 14:13:38 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.624.1689084816894345927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 07:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tKvDQBmE;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.41, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso8444813e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689084815; x=1691676815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhU+cWth5tMHCwilqaeakJfVPBRIIQJ3QoPzJkW8e/8=;
        b=tKvDQBmECDbGK8copZpJCxdScu94+M3ZImDxXgf+MaATWnuhkiOTlZ4jQhKopWVOIy
         HgiaQPW9QrEluIY4U00aANCW7I3i85N805AASBn9unHmFnErO2HwzJWWgYUClYa8oAh/
         mTHkBdtmbELp5ibEvZzs6yT4NmI8f/vSOMV1uUwxHQmUN0W330mfQVh31bVi5Yyjr5Kz
         rlTeUZRZRKxMun7uqxYjfK8/Bh7VlBIa5vQjLUhOSZpaALK7JGZXGtwdaBjuedBwMCsk
         SKEaNJVJC4qyzANDRvBIPI1lhbu0UMum5ttYIqmSYvIOqaLJi5zCiHnw+ta4xj9HxwF8
         Sllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689084815; x=1691676815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhU+cWth5tMHCwilqaeakJfVPBRIIQJ3QoPzJkW8e/8=;
        b=awwwnEmM2YAiHnliDmlSkKFF3l1nUSZhh5ESXmmxfu6AWn9fI3xnFbTN9JZGYbzbYm
         Hn5gIzpOwZVGGBUPjkq8SrX7EbCmY6ft0PZFZSbXygubp9tXi0Fp+KDxF6MlxWahqRwZ
         rgcAQGAYeZGO6ag1JdSECAHOJ0xRodhu1ja6/Fj2jX9T/FgIlTJx4/KdAd/WDi6ey7Cr
         DTuUWxViNJhM67XBKlMHIKuOFM3zeH49LJK7W5aZ4xZ508Rpwa88KbGZ+LQqYi5tauIN
         MHNpkR//M1M+F8nlPgAPszts9IsaLTV7ETrufuEEeZ5Unu2ewK0oa43gcin5xYbLr8Im
         4+zQ==
X-Gm-Message-State: ABy/qLZpXIMljs73je54gggAsynGi+YgQI4Cq8/OXARApYeybCGU+fGH
	ceMoEdcqA85wDb2uPhrahjngdWAk7zwyadY1XTxghA==
X-Google-Smtp-Source: APBJJlHuPfrbduDuBk5Fl+T1m6U2p1gWCpvo+1dj1CVwoS8Q9syICgabN+prOgyc4j+rcPRyjHsQuAKtIhfLIMgcDwY=
X-Received: by 2002:a19:e008:0:b0:4fb:8948:2b8e with SMTP id
 x8-20020a19e008000000b004fb89482b8emr14704091lfg.8.1689084814873; Tue, 11 Jul
 2023 07:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR04MB4666B31ACC5187EEB96B8940C531A@DB7PR04MB4666.eurprd04.prod.outlook.com>
 <2cf5874fbe01c796046db4698cab3ea823d39137.camel@linuxfoundation.org> <DB7PR04MB46661EA7BA222A26C2BAFBEDC531A@DB7PR04MB4666.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB46661EA7BA222A26C2BAFBEDC531A@DB7PR04MB4666.eurprd04.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 11 Jul 2023 04:13:23 -1000
Message-ID: <CAOSpxdZf2YBPCumT5v2hPAgLteojBE0pStiPxk6AhWwV4Rwamg@mail.gmail.com>
Subject: Re: [OE-core] Merge process?
To: aplanas@suse.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 14:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184139

On Tue, Jul 11, 2023 at 2:25=E2=80=AFAM Alberto Planas via
lists.openembedded.org <aplanas=3Dsuse.com@lists.openembedded.org>
wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> > I thought the second patch was merged and in master:
>
> Ouch ... indeed. Seeing the first one in mickledore but not the second on=
e confused me.

If you think the second one should be taken for mickledore please
submit a patch to the list. IIRC there was a merge error when
cherry-picking the version in master.

Steve

