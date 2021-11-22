Return-Path: <daniel.diaz@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606DFC433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 17:23:54 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web08.895.1637601833595725376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 09:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LEMT3tvn;
 spf=pass (domain: linaro.org, ip: 209.85.161.44,
 mailfrom: daniel.diaz@linaro.org)
Received: by mail-oo1-f44.google.com with SMTP id
 e17-20020a4a8291000000b002c5ee0645e7so6614431oog.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 09:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KOrfqrUrrm46RVoOds6SMMrooBShm/vjAxUhJIXZbOc=;
        b=LEMT3tvnY5SQXjbiEflCzVu0t6F0MPNRa4GDcAWn8e9JxvFxGvYxpppm5vBQVHbNp1
         N6yj4MRmCmfy9Nbi3u/iT3jaD+OgCrK7lG+4UjE2EaNBKCyoFo4lAkIpt2yU2Ol1w/nX
         MEacL+MazDj3SNhe/rz+DLl04MHJdVL7Yk3U3khxk+Kzj7vgYmuMgdw++DHunihzvxDu
         PL5HzhODRdnbUaZRfqLNCO049q1OjZb37jTLJPOvXLCD/7zeRKpl2eNyA+n/REnZpu9P
         oD0lpel11eDnH4nfEPcDNKt9niJPqUoNRJlozPa8VoiC5Zqlr1r4ki0zvIpdZWe4az1c
         ybFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KOrfqrUrrm46RVoOds6SMMrooBShm/vjAxUhJIXZbOc=;
        b=8DifbeWjm2+aDg8DDcTj08uqsiEnkjZwfyKPz1X5LwBt9ehwrG3LhPaHOE+vhwdSoI
         KGvxf2bmy+Rypd4Ju2rMscrjJBzYYLfWHkR9P8uxm6bLNfHoke0aPt7e/82ydyeCCq71
         zCU26dsXA4x5WpKQQSVbIeh/Kmtzy56iFHSC0hz+hTRxNHiz4Cr5hCHAWvLJLCPn4i1L
         Ezbs2YRiIq4NppRHs7Zui0muQF3ppQT8fmHJGyXAHUGxZnyYC+bjS9HCwhfGAvKcZNqX
         b5KRviTNqPBUSAeen6RDGR2AyNDc33rhhzbXMQryGFqPkKvFAhmgMUgTEpjLiMUGBHk3
         B4XQ==
X-Gm-Message-State: AOAM531ivkrfqGzkkFAJyC9O8bdRs5L60Av5d/hp7nSQFx7AshS4XuNO
	gkjrMiI71jqYwiuTcouFYC3Xw5QKMa7UOSaRrPyxew==
X-Google-Smtp-Source: 
 ABdhPJzfNjexh6TW3EYunWc22SiG6CMPjMPBGCCjMWY9PM7VIQn3NNfCo2Hq/Rj5+yl//MkFfw1EQuXARzdRs/o6iJA=
X-Received: by 2002:a4a:85cf:: with SMTP id u15mr31770641ooh.45.1637601832806;
 Mon, 22 Nov 2021 09:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
 <CADkTA4N0kF36bOyQu=jOkT_253zQy9sXqnywv9z_E5GZeewpJw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4N0kF36bOyQu=jOkT_253zQy9sXqnywv9z_E5GZeewpJw@mail.gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Mon, 22 Nov 2021 11:23:41 -0600
Message-ID: 
 <CAEUSe7_pESAniiBwAv2oASHi6je67zf7sMw1F2TNcas_1raspA@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 17:23:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158586

Hello!

On Mon, 22 Nov 2021 at 10:51, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
> On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com> =
wrote:
[...]
> > Note that the kernel itself doesn't build either as after 5.15 it now
> > does try to run the dt_binding_check for which the kernel recipe does
> > not provide whatever stuff is needed.
> > I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> > DT schema checks for %.dtb targets") to get over that.
>
> I have a fixefor that particular problem (the bindings),  so you can
> safely continue to ignore it .. but I hadn't gotten around to fixing
> perf yet.
[...]

I don't mean to hijack the subject, but do you have some quick
pointers on that? We're seeing the same on linux-next and
linux-mainline since that patch landed in those trees, and have
soft-reverted the commit for now. This (incomplete) recipe has not
helped us get through that:

  https://github.com/mrchapp/meta-lkft/blob/d/add-dtschema/recipes-devtools=
/python/dtschema_2021.10.bb

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

