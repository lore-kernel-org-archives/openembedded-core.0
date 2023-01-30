Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FF9C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 08:31:46 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.36422.1675067499960330709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 00:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DY49xCds;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id c3so11828051ljh.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 00:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kqyJTJBXVxS0te0aGjduATjaWOXs9MDYjMfeGFCKAJU=;
        b=DY49xCdseSlEjUwTv779YrNFM4ceJgvgPsVmppesm9h29AC0qLiN+ot8/8Dg5sQnVt
         c2udJoqgHA7cGA2nEooYd8TLsI5xblP0ebtltynVNRb92XX+9mKTPFKBWppc9PF4QCpt
         gpkT2m7/F1yAeycBnvRX7cVH6RD4aNiIzlS03YjbFYFmlMRKqcfT6juD6TAj0SVYfu1M
         9jzqbOHimiKHniTENd/UGR4SaTLB0LbCyEdh0Iu+fumq4SMxVvosraRiJJmEaWzs4SDU
         veilatb5ZSOKMOt/zv4V8H/xlYNeAiVgA7SJ/MoApR6VIZ+jR78jHCygmJzu35EegIZA
         vZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqyJTJBXVxS0te0aGjduATjaWOXs9MDYjMfeGFCKAJU=;
        b=zKkGqSKXic0HllUASlKQ0kp6MEqbM/0CUUD2VcxVZpo5tjKQ61Iw/aj7Q2spHjwuF/
         b4bMVRmAsiSP9+Nl+6drM06OuHUDEPKp+sBkp/v228F2/piKsjfI+kLqrsnIiTmEm+gR
         F6m0nXvJtIit013GeXlMoCEnrKTmiJ2exENtykfTT+D/FzA8Pxe7EFOdSe1n1UF5VZxO
         aUd3R1gqhCKnlwK1Y39c7PD3/o/i3vbA6OUR9D/hf1Nae32tWM3RercbOR62gyG6Hie5
         /8WBLK9gs1F5q3gZJD9LG1pPvfbDHfqCkrDJk8fkBVVtbED70RfrNjcpx9l3OLrAP59R
         49Gg==
X-Gm-Message-State: AFqh2krIZyXdl5Q0aCgBlMil/nmqz7qM5BDL2OgOls9b+CuHSF53d0WD
	mS3n/3yZKBFQCBFKILAiSyERpt90kRWPrpdP6xY=
X-Google-Smtp-Source: AMrXdXtTMilmeRdeuc6ms1hdKKqXb3lcf49WS8hOU3n9yjTXmq+KyyyoiNavrxKOZcm0pSJ+gAt+X/D4SX0m1mRVQK4=
X-Received: by 2002:a2e:bd13:0:b0:287:4eeb:53dc with SMTP id
 n19-20020a2ebd13000000b002874eeb53dcmr3358727ljq.27.1675067498010; Mon, 30
 Jan 2023 00:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
 <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma> <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma> <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma> <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
 <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma>
In-Reply-To: <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jan 2023 09:31:27 +0100
Message-ID: <CANNYZj_=pLpH0+SVZE2DezpuPVkj2VjyteLKFYV_LuJYCPKZZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
To: Ravineet Singh <ravineet.a.singh@est.tech>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 08:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176481

On Mon, 30 Jan 2023 at 09:25, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > Can you also try to determine what are the specific missing items
> > needed by entries in test_disallowlist and see if they can be easily
> > provided on target via adding to RDEPENDS:${PN}-ptest?
> >
> Well, these are not package dependencies, rather local file dependencies (pem files, etc)

Those local files are provided by something, so you should find out
what that something is. Is it gnutls source tree itself? Or some other
component? Do we have a recipe for it?

Alex

