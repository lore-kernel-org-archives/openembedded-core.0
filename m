Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625B9C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 08:38:33 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.15197.1678696704235185930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 01:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lU4gRrjn;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id s20so14624405lfb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678696702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/boxd6hvihLeCCVW5EBOnACsiFwf5rP9Bp6kDkL03k=;
        b=lU4gRrjnLHHY702Nte7MeZVwUeGOWPagIPN4Ex9EAgkTG5B1qVrCsrTH19K8WeLQOl
         dPKT6AHeH6oNbaQAQXYH2Y4qptyXi0897vYRlaGpqsUl2SsVlb+CzuWp1FDbKXrPYVMm
         MllE0sYFU3qtZaq0TEuAr4Qz9RxpVqFGipIBK/v57jtJZp/rzTEzmZNnaUg2p7wD/C75
         4HLgVuIYzDr+FmAZd/sGbQzAcv6nFBQIYxkb/wTJkY48QCasHzxbvLkMxpckh+ALhZ1u
         AiDqLxVcK208fJwN8WFtYkkh3eZQ9wuB6KixJmpph04IHWKmrV/GwUZSnV7VOPBEvv1+
         8EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678696702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/boxd6hvihLeCCVW5EBOnACsiFwf5rP9Bp6kDkL03k=;
        b=mcWZqYXjUF1+uEpehUZf+kBPlDq8wLsWUGQ6q76h+31SdXiTBXAe3pw5gEonejNNaJ
         js7OsC7FC+QIVlM+4IgNmEwI7cMs7F0kT64EWDhKN5Ly2aaXpfkoXmnPDkefcHmJyity
         y7oCtLkwQCmZM8X8G7hFvlQbMFzd5kg08AxY/18u/fd9hX3yGlnqo58jXOV2Y8HnxnS9
         3HmJDySYZBIq6Uqh3jLDUxdllJ1XM8gddp1Bm4Xl83tMyTKhl3uoyQQOTOj1MqwVpfAr
         AzLzFkN9Uq29E1Ej1WA5dzewtm4cSQbt42hMiDFnTe60CLUn0k9xhhHBTJryUpzUfop6
         6P7A==
X-Gm-Message-State: AO0yUKUagPZueKSsqR4lfmWLZS7nqOtafRhiDMNeuTb69KxVg0j3nEjW
	q3QZjIi6K9ltyZ+e9IyOukqUUE3XCnmxAvyAwNE=
X-Google-Smtp-Source: AK7set/EMfzbJgkvNfbAh9/Xn74Fu2eGaphRJEcZmcpFo8Rqlb7CFfP038OhRBQOKsgk2cyfalaRY8NlHEQJmPv+VFw=
X-Received: by 2002:ac2:55bc:0:b0:4e8:2173:ee0 with SMTP id
 y28-20020ac255bc000000b004e821730ee0mr5442013lfg.11.1678696702457; Mon, 13
 Mar 2023 01:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com> <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
In-Reply-To: <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Mar 2023 09:38:11 +0100
Message-ID: <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 08:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178415

On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
<frederic.martinsons@gmail.com> wrote:
> But the compile step tried to git clone anyway and so it failed like I
> showed in my first email.

You need to figure out why this happens, because it should not. We
have plenty of recipes that list crates in SRC_URI in oe-core, so you
could start by studying how they work.

Accessing network anywhere except do_fetch is not allowed for
reproducibility and license compliance reasons (both break if that
happens).

'cargo bitbake' is a 3rd party project with questionable maintenance
status that we do not support. The official way is to use
cargo-update-recipe-crates class.

Alex

