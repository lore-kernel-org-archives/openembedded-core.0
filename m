Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BD0C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 18:08:17 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.228.1702922891113773588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 10:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nZtHIuOG;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-20373729148so2235428fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 10:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702922890; x=1703527690; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr/0nIogFEkcTbBaxFLRk7TeJ0e2C0wgWJ0zNK5q/9w=;
        b=nZtHIuOG1f/im63gbumXJ0KHdCREsQOjLajMB6kINVLHKDG0086tQMjmo5ZDnJguC+
         oEnWPx0+PXObG8Y5sp7ibXpqEY8ZtIsN2LkxqnJVRVzt64teIzAg5pJh2iLzTQge+W4+
         JE4VKplV4VKwQ1xpyahJopy1PAnYX0wQ6odNTMOj41MbMv6oF7XwOhn1vDSv2ctNDF2X
         pnsA6jlMg8OItVxz/NzZsUXnwLoOoeOuEkoFkZL7oWnAr7DnheUbQltkTKWvABaph2M9
         KDpEDIAU3oeTLqLraLP6eQjzaF7ju5Nfwi2ZSGSlP9PjLXYpTYh/EKLrnscpXw758MKE
         MuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702922890; x=1703527690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rr/0nIogFEkcTbBaxFLRk7TeJ0e2C0wgWJ0zNK5q/9w=;
        b=IQvd6o7PnzpA8RkBb9IYl9Vteen7KqWb6RzawKAfI+v7u5EkHLgJF67Vjt7MHB/kwr
         VSFwuTjzS1bp2iRn7U+jiXGTPQve/PNw/gtBNwcqDl2f+AkvOyTUkQWOKDu0pel6+HNw
         SDBEciGysy9L+eispo1emdJNgMAKBXOQpEiFgVD6xoZxBIBJFA3FI6BEgARozu9hplec
         L0afP5K9/sA7XskUAjts1eIVBq9B731nMwrROTSQGkkal8lzQqI4vANuHrXaW4WVJjpM
         tVZPkYQ8STle0tBN7bMRiYvvknVpFFX1dVr5IPo6btL/+X+XregwmnvKEPv9aT6CIb6e
         WeuA==
X-Gm-Message-State: AOJu0YyzLncXEbhKEugHUujVhjCyaJoF3iKwHsyo8NpirK6OhUSX8k4E
	qKGaxjRJwJvWRHVeXpmvYtBQIOTd0cyn0fdaNeg=
X-Google-Smtp-Source: AGHT+IHjUBLQktNni9THe4q6PZanHEvLQMDx/9Zdg19R1hRsgcfTmIpPlqvR+7UC7E1PF2b1lHeIMlcNhRGR1JbT1t8=
X-Received: by 2002:a05:6870:ab08:b0:1fb:75a:de87 with SMTP id
 gu8-20020a056870ab0800b001fb075ade87mr21861143oab.117.1702922890348; Mon, 18
 Dec 2023 10:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com> <09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
In-Reply-To: <09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Dec 2023 10:07:44 -0800
Message-ID: <CAMKF1srWbpjj7ojaQ-0fdtu5XAW3qA04bbjvqZWekYRqp0s=5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 18:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192675

On Mon, Dec 18, 2023 at 9:58=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-12-18 at 09:45 -0800, Khem Raj wrote:
> > I tried the two patches in this series. It did improve the situation
> > but I am still getting SSH timeouts. But this time its 13 tests
> > earlier it used to be 40+
> > btw. my images are using systemd. So it might be good to see if we see
> > this with poky-altcfg as well or not.
>
> Do you have the log.do_testimage and the ${WORKDIR}/testimage/ files?

yes, further I ran the failing tests in loop one after another still
one test gzip fails with ssh timeouts

https://busybox.net/~kraj/log.do_testimage.503
https://busybox.net/~kraj/testimage/

there are two runs in the testimages folder. In one you see the RCU
stall and in second you do not
but it fails with same ssh timeout issue.

>
> Did you still see rcu stalls in the logs?
>
> Cheers,
>
> Richard

