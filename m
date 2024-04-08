Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FE5C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 17:56:03 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.114235.1712598956180890748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 10:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WDWu46aV;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61495e769bdso39510557b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712598955; x=1713203755; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FfklslWFfrVSOjazE/9DAjRX5/XaXQAl6472uBkOK/U=;
        b=WDWu46aV+upUH5H3Vil0V+MIrg+HhqheOHWS9+1QlFnKQ2orLOrXlMAadDzpgCReAx
         evBvgZH3cWc62Ob/CgG/FbAqr/e0A01tL8pGC1ssDoG5I1zyqwDHyihKnQneP/4sVJpZ
         9Tx7H7oWjSh3JwEfz3+GyvIEYGo9W6k9jA55Mfua+EoXa+Dwx8QE9ZIhkIoypSKr3/dC
         cbaMaqI0JfZv4v/pPjkhH6B++vUWX/fAPZLb+2tSAKsJh3RZbx6JpQlgjV0Ek0w2r43z
         Px4RxYyQZQivepptCW2fzapNX9KWEvXTFgUGUH5uuA3g2J26tn1yH4c1Sq5dgX+T5iYe
         GxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712598955; x=1713203755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfklslWFfrVSOjazE/9DAjRX5/XaXQAl6472uBkOK/U=;
        b=R3lTdhseh40qbeb2bO7dC3Kn6pKICQIhKAX6i4H1CvnSyBluu/i1rPvpWt279GAHzE
         +Gs3gTYw3y33f1ftLXPFrtWgUXu0Sb8R8OwFhVFbnd7JCxZsLUj7r2826Qznftezz6pN
         gdU8u+hCeTAAuIvCSeuvH2qdDlZmlrBgy/5zjZGYDaloE76IRXZCZPI/B3O5RA4nrkre
         KLC5l87z5+wnoZQKwt/G3UTRVSl2kGSW1xtYTl1Yfpz//K2asN1jFdHHf3BWZjQPwAEl
         CteNXvg9RZSR7lig8smK9lXCMIagwkNVCuZiing5AT0Y4PjzegxJZ49+hZjYfNdjnTXE
         LfTA==
X-Gm-Message-State: AOJu0YwdDRF7eAg46KsNqCRDyzAJ6NvCdYIBB5YutFODW4nh/K+AY+Nx
	WG2p/MART8oymMQ4AAZWkeqZKp88cw+a3evekx4Ssc+53olNMaNW2+Ez1I7AFQOVmbFoJFQkwfV
	V1/367/B0MDCjsM3J82L70Ui/ZD8=
X-Google-Smtp-Source: AGHT+IFfFf9agB2TH1jQ5gmGB2dvjXAThnbanzv7c0gj1xQRYTW0zGBJURYrYvZhBT4gspA/B+9so/AqDa5xBEkdNI0=
X-Received: by 2002:a81:b718:0:b0:617:ec12:5eeb with SMTP id
 v24-20020a81b718000000b00617ec125eebmr6653102ywh.7.1712598955292; Mon, 08 Apr
 2024 10:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240405171056.3300551-1-danismostlikely@gmail.com> <701a5f11dfc6b236a8765716b2eec5b236b726e8.camel@linuxfoundation.org>
In-Reply-To: <701a5f11dfc6b236a8765716b2eec5b236b726e8.camel@linuxfoundation.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Mon, 8 Apr 2024 11:55:44 -0600
Message-ID: <CACS+7ZRhjZu_+_BVvnS_udKiWc0N79VqErpHGAdvMt8KCERvUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: add fido2 support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 17:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198017

On Sat, 6 Apr 2024 at 01:28, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2024-04-05 at 11:10 -0600, Dan McGregor wrote:
> > From: Dan McGregor <dan.mcgregor@usask.ca>
> >
> > OpenSSH supports FIDO security keys in both the client
> > and server.  Add an option to support them in oe.
> > This change requires a new recipe that I've submitted to
> > meta-openembedded that has not merged yet.
> >
> > Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> > ---
> >  meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
> >  1 file changed, 1 insertion(+)
>
> Which branch is this against?

The intent is master/scarthgap. The change mentioned is now in
meta-openembedded master.

>
> Cheers,
>
> Richard

