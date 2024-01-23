Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8C8C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 19:03:13 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.2628.1706036583286738438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 11:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lF0sHTFd;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e6ee8e911so6286666e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 11:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706036581; x=1706641381; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cp59KE2IvAFIMEgk9n3XBf6tLNB8rim/ZvgN5dHhCGc=;
        b=lF0sHTFdxCNz6Cc8IakepYK7CDXBtE9JnLWUr5teNI304bTPXJzQTUXEBlasaYeaBq
         DzvFvYaIMnbJPpypUaM+LrD5e/8EyVpqyKb5LlQNJs+WrfYwJ3ro8s6nCfuvPulrlq6p
         10Ga8E7Bcb/bYPclbqlDC4LXSMk3P6/s/jkg/RppGUkZLvHwCs9DX5S5b0tqbXFoZI8Y
         RBtoj+OF/6f6uk+mX4oZtwsgNVqvNLr1cz/v3iEId9mnJwyEzsW2irCrTwAcQ4SVbGM3
         xMNdPoQUCpiPHhvP1QUleoS8SjpvvKMG/Hgo+YhY3/aSuek6GS+i3JIRst+PudjqTVFN
         otrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706036581; x=1706641381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cp59KE2IvAFIMEgk9n3XBf6tLNB8rim/ZvgN5dHhCGc=;
        b=Bc+yptQ9wwGDaAJ1afV2jmKL8PLf3rD9BlFZJm8FQXZTw+7foP18Flc8EJ0dg0WsLV
         enpjmPt5LJIpewF8dJm98gcqECQAxEcVxDyF/afQ2FMGD4j7t7usuAe1mqQ3eoj01M3Q
         RUoHO90bi7I/gT0Wnt905if0s1JmYPXRHeEhPyAz1aM4Rgd2noJJZ69Un0azDNW9+okS
         WTheVNLvrabbX5QuNmCGtiGeEjY9ESXDb3HEafqDnbGRrgx29hQjcFQDOCexdaKxfqhO
         lB6ZeSaVV6e30hZRhjnBtvJRWT05tMz9A9HEXmEAxCndWb3K+Mh9xMJ8zOrCpAgf9Gbc
         FFYQ==
X-Gm-Message-State: AOJu0YxIeiRWIyqeY0I75f2g9jxqXNDtMfmuWTEjhR9RmC3VUrI0ELgd
	FSf931px5r8efNJDlTcOHvnZylNoW48AzUOM+eFjQS3JaOhJm3oT+Nqej/Wi6Mph2ZGewa1oQsW
	KkdzOA4DTwFrEl02lWEVCF1jNEqY=
X-Google-Smtp-Source: AGHT+IHvUuNHDJu7LkXEjC8HQnGupzKKGSvu8h5Nm0pKU+vujW2SHZ+7+mYMub46ZGO54hoMqH4E4vbBvDyz42hOufg=
X-Received: by 2002:a19:ee07:0:b0:510:6cb:ce22 with SMTP id
 g7-20020a19ee07000000b0051006cbce22mr780462lfb.117.1706036580900; Tue, 23 Jan
 2024 11:03:00 -0800 (PST)
MIME-Version: 1.0
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
 <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com>
 <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
 <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com>
 <d92a64cfcbffc58821e70eba2c61e403f5002ec3.camel@infinera.com>
 <CANNYZj9HK0rmThC_uzN5vaNCYyWx2dfOuA2CH340ATavho1MHQ@mail.gmail.com> <e28167217b5f0404b81bb87d15c8a1df5e2cc938.camel@infinera.com>
In-Reply-To: <e28167217b5f0404b81bb87d15c8a1df5e2cc938.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jan 2024 20:02:49 +0100
Message-ID: <CANNYZj-25pTodtkz-qZsZb4GX-D4Y4+QE=93EqRWhzGo9jd2aQ@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest -v -K -r reproducible.ReproducibleTests.test_reproducible_builds
 always succeeds, even when pkg is non-reproducible
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 19:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194248

Host tools can influence reproducibility of target items too, so I
would not want to use the same set in both builds. Checking for
reproducibility is simply something that needs a powerful machine.

Alex

On Tue, 23 Jan 2024 at 19:52, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
>
> On Mon, 2024-01-22 at 21:39 +0100, Alexander Kanavin wrote:
> > On Mon, 22 Jan 2024 at 17:49, Joakim Tjernlund
> > <Joakim.Tjernlund@infinera.com> wrote:
> > >
> > > On Mon, 2024-01-22 at 17:19 +0100, Alexander Kanavin wrote:
> > > > On Mon, 22 Jan 2024 at 16:59, Joakim Tjernlund
> > > > <Joakim.Tjernlund@infinera.com> wrote:
> > > > > Maybe but what about the missing reproducibleA/tmp and reproducibleB/tmp ?
> > > > > Would these be missing if sstate is used for both?
> > > > > In the log there is this:
> > > > >   INFO - Building reproducibleB (sstate NOT allowed)...
> > > >
> > > > It's possible your local/distro config somehow overrides all of the
> > > > test settings, including the separate TMPDIR directories, and simply
> > > > builds things twice in the same directory. The log does seem to
> > > > indicate that:
> > >
> > > That was my though too but I cannot find what is doing that, grepping
> > > has not found TMPDIR changes. Is there something else that might influence
> > > TMPDIR ?
> >
> > You can find out with 'bitbake -e' perhaps.
> >
> > Alex
>
> Finally found it, was:
> -       @echo 'BBPATH = "${BINARY_DIR}"' >> $@
> +       @echo 'BBPATH = "$${TOPDIR}"' >> $@
>
> Now it at least does the right thing: Tanks!
> Off to try optimizing the build somehow, don't want to rebuild all host tools etc.
>
> Seems like I should be able to use OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS but
> unclear how to populate that list, any pointers?
>
>  Jocke
>

