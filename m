Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E6AC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 18:45:00 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.138987.1680720290624146861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 11:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rwbUkuzG;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-944bbbb17f7so77015166b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680720289; x=1683312289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEPhYwjiNLsAyQJm+DTGwEZ+nO/Tk+NVPAiRg7XpZr0=;
        b=rwbUkuzGNOrNm8qEVsXkqjJiUG9N0BVQ98p+g1TnP66/ooqsVpB0V7S7ONlONNU2N8
         jQQYCuVVnJUNWwbw8/NhMIyWaUye7gVUYYKV7sv6QBtOKv3HQ/0oKUOKfgOFx5QXlLSA
         z1rAIB4Fmf5AVGum8ZaUqH7x8EFscg4gUwVPtSwkuUN4cyKARPy6YK9uR54AL/x6qbPB
         LCq2s4bjNceo1CboPimSsHNHnIcUqque4qzK9nI0N3qx/epR1zH/GLMGxHUmu3SrUQg9
         mLND39MsWW6pZ1QnTOxhX9glFiDWFaOPNHRJvPxYoJDBm3g9ji4rJvtgbA6v0A3xzL/e
         UBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680720289; x=1683312289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEPhYwjiNLsAyQJm+DTGwEZ+nO/Tk+NVPAiRg7XpZr0=;
        b=czhaiM25nlhSd+uAmi/2gJbAKCzReJkt5r4JB7Wc2G01eN6DNpNELd+w/NRMoolFMw
         hpftTJUqTZFf5jyb2hVPoItytNozUcfke0LeaIJC1amSfdjUdF+b9WKkRpErasCuaraY
         2niWko/RulWDjLF+gOejqgQwqbgdBxGIwoXF0xC0Lh+bz2rjJ8dQAH7HRqgA1JZ/8VjO
         2JXwppbqcEm0K3E9Zg6HfecYXacGOak76d+Pg/rHVEolAiiJE7E9hvGC38uUlIV5FDb/
         flj/OfCcS5NUU7CymFwDNAtM78RpVADb5hdK7JjhWO40kuLeGcHpv7QtXxs6zZE8DLDg
         Wgeg==
X-Gm-Message-State: AAQBX9fcSO0XHeft0ASCeaPn4f7w7ADFTlVmUqUniHuFBWdnVPvJNmZ4
	wfth0r0ol9Wl3pt2LN0OFjngugc5lW4JelMfhyv9wA==
X-Google-Smtp-Source: AKy350YNNZyhuTd0mUn4/BmlZN6XZ8N1hJFnpagNnNT7gE1jZRpKk5wbWES8H49NZxjFcvgpP+rlhUrcpnJWiDdlfAE=
X-Received: by 2002:a50:8d5d:0:b0:4fa:794a:c0cc with SMTP id
 t29-20020a508d5d000000b004fa794ac0ccmr1703623edt.2.1680720288745; Wed, 05 Apr
 2023 11:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230329100257.1612928-1-rybczynska@gmail.com>
 <CAOSpxdYdF8K7bWcc_DCjEt26-ExdYHMSZt1RJgyRoqj0Zm4TTg@mail.gmail.com> <CAApg2=RANaJm6ZHR1END-rf+pn5yhxfmuVHd+VbKvz=hFQi2PA@mail.gmail.com>
In-Reply-To: <CAApg2=RANaJm6ZHR1END-rf+pn5yhxfmuVHd+VbKvz=hFQi2PA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 5 Apr 2023 08:44:37 -1000
Message-ID: <CAOSpxdau7v6PAtAc2H0g7bVoqyrhaLXjxb+tjtqGVtu4DE+EPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: new CVE database fetcher
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 18:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179747

On Wed, Apr 5, 2023 at 8:43=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.c=
om> wrote:
>
>
>
> On Wed, Apr 5, 2023 at 5:55=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:
>>
>> Hi Marta,
>>
>> Is this safe to backport to the stable branches, or should I let it
>> "age" in master for a while?
>>
>
> Hi Steve,
> I vote to let it age for a little moment. In the meantime I'm trying to f=
igure out when exactly NVD will turn off the old database.

OK, will do!

Steve

