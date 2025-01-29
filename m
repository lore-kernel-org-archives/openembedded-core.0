Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10842C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 05:32:54 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.6662.1738128764862581633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 21:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IBBUoPRv;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dcdd9a3e54so63677966d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 21:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738128764; x=1738733564; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QGTZPol/z3gzn5R+WTV/9S1ExiA1l08cdPHQrayRYfo=;
        b=IBBUoPRvLU2E7JLBbUVGyK98iU2+Oe2LMBd44sDHdhYuvsoNBJWCpJf+y11yxhdJXF
         9kpL8IRzmtsYyWFQxvNfz+ngRYXT3zsUmz0x02KUJDhi/p9OGf6ow3S1hDaD0CJdaEq3
         K+9WJu2ktEdemk5a/JO3J9r9oRNfLNMhuWQnE2HO5Dz+1wHB+60L27CrpUZ2HEBDEi5w
         Sp4aUM/Q/ZBek/pTvXV5N0SRbVzoKs9h89xFOm0dEwCxg2tbqc14QIlOW4qAeb/ghAEy
         dtRVeBYn/XNTBx2Yb92K31lbDzSKMpRgjq6A9LtTjJCjxAb0LEB/jouV+wB7SyRZ/N+r
         ojsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738128764; x=1738733564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGTZPol/z3gzn5R+WTV/9S1ExiA1l08cdPHQrayRYfo=;
        b=vaBTQBSrLN+FuMesni+YNmL9Po6u3AkQB0E9mg5GB6n+C01SEyN3UzdvCWbBjt1aMa
         8BhcojXS+xlvlhGwOW6TmVpw5nZf9bPwhCbsFavF1SUniOoxoJjHfIJ6m5ryPw/qLo+b
         BefgZW9PHwcHZi3oRS+UnI+ktNHfxxUXrAeBylS2TvvYaY2tIE0I41eHAkBrsyoZ3xgF
         9gPsqeRLmbVqvmARxQ/8qfXgcZ6qoMCeAN/OvNNlxTCwu64NJAAKdyP9lycSyFes864D
         F4NkMq7mKavdyH576VD6Ty/ds780czpgLwfPk+CMQCip3Oacd4LouNSms0TXyyJGS38c
         9F1A==
X-Gm-Message-State: AOJu0YxXdve4XpxBeXkcZUNkl3ZEBsm2ynrNVfJC3+T7YIhaKlW6F5vY
	de8Vpnvn2BmZZVv98I/RluFVbDh2lMcOJjnFRpneNmnFlNhqUD8616+ExwZ5x7CmYu+Cpm6skir
	ZMSxjhcxlSeu/u5gUmjutmvkJDvI=
X-Gm-Gg: ASbGncvZA+Sq8g9MlU/2Xvf/cm868hOfSmECSQJx115FXgaDTf0x10l3kVI4nE+I2ta
	OgLyd0b53pQeBWQbSkDaK7ThuPPFlMFaeGENckPCGqpS3TqE2Ymem+XtGc3tWwjEjdnFfQ1XXDJ
	6C4HJbNlHvmjRXxwGDca4H81f+8F8KysFHGdnmFHGx+A==
X-Google-Smtp-Source: AGHT+IG1w5OHQ9H8MuQj9TPrUoHF+m7wyQ3+5VqueJZ8iIqDSj+UfsMM1svHFL0k1DnYzZKTVuudYgTnYIAqjxfoCOI=
X-Received: by 2002:a05:6214:242d:b0:6d8:8667:c6c2 with SMTP id
 6a1803df08f44-6e243bb958emr30332236d6.18.1738128763866; Tue, 28 Jan 2025
 21:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20240726133559.1124668-1-sundeep.kokkonda@windriver.com>
 <CANNYZj9V8K5upKxUdA8U4OXsdvt_+TTen=MogiVjJfqkV7jOOw@mail.gmail.com> <74363653-308f-4465-8bf5-4f8aab01379e@windriver.com>
In-Reply-To: <74363653-308f-4465-8bf5-4f8aab01379e@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 06:32:32 +0100
X-Gm-Features: AWEUYZmyMeAnpDegq0WHs17bIvx_b6Wp2g4oILGVzs2BSCHJ5YgWHkpn-1bBu8I
Message-ID: <CANNYZj-egdbGeyLRRQKT2+ewmfNWC6SxJKy-yDDGQtaUZYp4tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: rustdoc reproducibility issue fix
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	harish.sadineni@windriver.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 05:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210344

> I just ran some benchmarks to see how much disabling parallel
> codegen-units affects build times (the parallelism is only at the
> crate level after this change), and unfortunately the increase has
> been significant.
>
> As of current master, rust 1.81.0:
>
> rust-native 527 seconds -> 853 seconds
> rust 1123 seconds -> 1688 seconds
>
> I presume the codegen-units parallel issue can be fixed properly by
> adding a sort somewhere for determinism, but finding that spot is
> probably very challenging. We do need to get to it though.
>
> Can you please point to the request/effort to set up reproducibility
> tests upstream?
>
> Sure Alex, I will look into it the ways to optimize it. As I remember, when the 'codegen-units' count is increased it is causing rustdoc binaries are not reproducible.
>
> I've to re-test it with some higher values of 'codegen-units' on latest rust sources. I'll test that.

You can simply drop the patch and then rust will pick a default value
of 16 for it. On 1.81.0 that still makes rustdoc unreproducible, I
just checked that.

Alex

