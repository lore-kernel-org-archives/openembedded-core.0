Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E8AC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 16:40:36 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.48411.1702917628740889443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 08:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cd5n3GQe;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cc7087c6c4so14955861fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702917627; x=1703522427; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HkcMGiZwvICagky8nqm97tUYoJiKqVcofhhxsTKSlMA=;
        b=cd5n3GQeA+2dgrpvyJfAg62k5ZZ94ZD8Cg/p9QqLZkLSDjR5sy6tF11SSM5Aqwy3aM
         ycAGZDD1TKqgGUwcc0XsFYeAKYmLTiybsQGEF8Jgo79fLAnFES8pLWhJcwJp+/42ffOX
         kSESytNKB+SvEqKysigcF1O35T7gpoCV0tNaq3cxmmTpUU68dLnT4/L4F7qoqlrlMR+k
         fyYZJE9znTWW33pTu11DHs/yEkCDiyDV5P4gW5P1AAGY395+oAknaDMMOVTqho4Fwalk
         r/6A8bVxBpElLuQGcNyg3XbtkpWjyq8jQQfPAEIcACbRLOZHdT2dySCnMLUz5JLEb+DP
         Y+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702917627; x=1703522427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkcMGiZwvICagky8nqm97tUYoJiKqVcofhhxsTKSlMA=;
        b=ovJitN46ZCJ9eob89voeqjYL0Fqx0LSHh9JNanwl5s7lbkEOQJXrcOtcZHlqcpQ5wL
         w6GhRk+MDONbZOL+qUTareAIGkPF0y8MwyX3v4JfFWAIhRPoAJNk8m/HBY9PFlCqpa5M
         u6b9PT8DBKspJM9mf6VIzRmKCKwb+UqXZIRQLgd4UJUki8H7E+lUHYF6ze7lNKm9uXyO
         w4SHzRERDGbrZteId6r1L6ol3j9gp2dM0OKTfHojNpxX+DF+j3bhkybKgFibmkC5V8XG
         kIATgsV6Mrh7fH6ERLgLaY8kRuBlTLO/wCo0cnIa+TbTpAgHenFy6wvv8GdCzgrHRSOn
         8mSg==
X-Gm-Message-State: AOJu0Yy+1uGHQF7e+CikIeNkLz5qH0KPvujYcubjfO8jZnD2cvYr/WvI
	txVRpyd9bsgWEWZeHaGIbkCG6etAzfIPt/7RywQ=
X-Google-Smtp-Source: AGHT+IEN/6Cr1Tj7KkXxmOsmJ+zx41dJ/a6L+PsTwBiPwyrtO0QeE/NaMIvFWYSWyFTH6K/phSmELB0/XsdF9k//Y2o=
X-Received: by 2002:a05:651c:2229:b0:2cb:2b30:2022 with SMTP id
 y41-20020a05651c222900b002cb2b302022mr7874282ljq.6.1702917625963; Mon, 18 Dec
 2023 08:40:25 -0800 (PST)
MIME-Version: 1.0
References: <e2ad5c51a48a8c85bae1c9c7e21912e8fb412c77.camel@infinera.com>
 <CANNYZj-+T-uXRwVOkF3YmZJzOKaqogBnNKp+WFA9mpNyW2Y=EQ@mail.gmail.com>
 <e19a55e23d08d670fedb5f290a225f4ed21f82e9.camel@infinera.com>
 <CANNYZj-N0_Jb-J2OE2=R4X4guhhddDEzejxOY_sXT_bTT4NumA@mail.gmail.com> <437e1ea74b65c88fb81e365ac7008defc2903693.camel@infinera.com>
In-Reply-To: <437e1ea74b65c88fb81e365ac7008defc2903693.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Dec 2023 17:40:14 +0100
Message-ID: <CANNYZj_s6o8frRuBb-dpNQQyyECdfvBtmM3A6ML5cZir7VD91g@mail.gmail.com>
Subject: Re: [OE-core] kirkstone: oe-selftest -v -r reproducible.ReproducibleTests.test_reproducible_builds
 broken ?
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 16:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192664

On Mon, 18 Dec 2023 at 17:33, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> I have tried that and there are no A/B dirs in there. I can find u-boot...ipk and some other
> stuff but there is no evidence that the A/B dirs ever existed.

You need to read the test itself as well to see where the directories
are. If the code path is going through their creation and running a
builds with them, then there's no way they can't exist.

Alex

