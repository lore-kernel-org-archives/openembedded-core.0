Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F043C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 15:40:39 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.1497.1664811638183953853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 08:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wqHYUE5K;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id 13so23042483ejn.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Oct 2022 08:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9h1fm7xX2Pv+9dbimA5g9py/AmRqlQ7+n5OsWh+OvZM=;
        b=wqHYUE5KvK37aeiDi6KRccsEm2dyk93XWDOj9yzq399RpReSXwLP8I0b9AhJZAfCz3
         Ga/EKIz/7GV+Kw1CDPoKq/NKH3nWE99UCwmO32YACzCl3Kc9J0PYQAKgiIeVGeNrXBvb
         vXZD6sEbmdORgZX7QycZ4PkYvbCdr2S/mlO+iZGlyliuBTzEf+aY3wP8UUEfA+10SQca
         PShIxed6lRFAUyr2n21GJouu6OyQbYIUHIihXB/5c6l//BdKozaquGC4bBRkuD7mXs+0
         d1ZBUZ0jKs4sM+FjZakjmrCNhrMDHUGzO0bpPnGVdXsTwkSqMVFY1sLSiQaP/6KbpPy2
         7ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9h1fm7xX2Pv+9dbimA5g9py/AmRqlQ7+n5OsWh+OvZM=;
        b=bpCx3kZcPIwUdcLSphMsv1ia5c+FFa3+RwO79hOWqFO2p3QiHxhvevqOeVTgBisGIQ
         8uEJUfiJSJvED2rhEtUxTxWCtsYZzdNJGqWOEM8bMgo5nqDk56RLllA/+Tddbxgcj4s5
         2LaAvHi/g5spz9M1Xl7DF7NeNgNncBwYXhOkVkoFtEIutnmp1SxZvpnZfAcfHdl3E5R5
         98oj3viPfv9DCUj5w7MDnbriZp3rWP31UIjPf9ZH++XJFCNhs200vi+pq04ETkxVQ7GM
         5daEJIwk6fP0h856cpWNLxCjVTfUxeD6EpDSD30zpbqVqdSO2WzvDKihH9pLX95t4azp
         dHcg==
X-Gm-Message-State: ACrzQf1AKgn2iXai0SF33vCIRudTRddkyARAcl6KZdzsjXF/RwE/kIkT
	TRScwRlbkHDOofKcufXhkLqz4B2ENaTl0/NFXjgJ1g==
X-Google-Smtp-Source: 
 AMsMyM567kDcbRHEHSsIuU+mRbCVdw6JryuWYWx9f8grTpBzFRD/s0kn6AXyDZp4oGYy6khmWnXmN+ku1VdkEasbsGo=
X-Received: by 2002:a17:907:31c9:b0:740:ef93:2ffd with SMTP id
 xf9-20020a17090731c900b00740ef932ffdmr15419017ejb.584.1664811636564; Mon, 03
 Oct 2022 08:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221003112812.866-1-mbriand@witekio.com>
 <27374.1664796584592040677@lists.openembedded.org>
In-Reply-To: <27374.1664796584592040677@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 3 Oct 2022 05:40:25 -1000
Message-ID: 
 <CAOSpxdbNUPxrjD_XxF8z_iwWVSv8p-=2oDfUpemy7yZUsjjLjg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] bind: Fix CVEs 2022-2795, 2022-38177,
 2022-38178
To: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
Cc: openembedded-core@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Oct 2022 15:40:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171362

On Mon, Oct 3, 2022 at 1:29 AM Mathieu Dubois-Briand
<mathieu.dubois-briand@hyprua.org> wrote:
>
> Hi,
>
> This PR intend to fix 3 CVEs:
>
> - https://nvd.nist.gov/vuln/detail/CVE-2022-2795
> - https://nvd.nist.gov/vuln/detail/CVE-2022-38177
> - https://nvd.nist.gov/vuln/detail/CVE-2022-38178
>
> All fix patches were cherry-picked from bind v9_16_33. The first patch can be
> merged without conflict and the second one with a minor (curly braces) conflict.
>
> The third one (CVE-2022-38178) is a bit trickier as one of the code section
> corrected by the patch does not exist in bind 9.11.37:
> - https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_11_37/lib/dns/openssleddsa_link.c#L327
> - https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6c4165fbd3d
>
> Basically, on 9.11.37 `siglen` is not verified to be different of 0, because the
> value is always set, so I believe this is OK. However, as I did modify the
> patch, I'm not sure if there is some best practice or extra documentation that I
> need to apply here.

This seems ok to me too.

Copying Armin since he is listed as the bind maintainer, just in case
he would like to comment on this.

Steve

