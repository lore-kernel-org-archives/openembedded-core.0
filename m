Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81412C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 14:14:27 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.8688.1690812864471381689
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 07:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JeTMSULC;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so7033114e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690812863; x=1691417663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cNR6HBJTf7IQHP/og4bI20+CZz92G2PJJEv6B2viqOQ=;
        b=JeTMSULCERhS5H0/XfTbKP+ErcIGH3H8EVCJoEYRFJ1/n/ENwl0beYPmH0h5cqRvfT
         qwIQjZbLI4eXnM5iyrhiUIvzQlcIOg56j1N1qqjeuIc9vUAxs2eC0fx3otlfPabWbk0k
         zIdYk1Hqj1woGyFeMy3lw+zBowQsqEKtmqXVEEkzV1dc5lI2WYxVqTDAaPcHb03Jcw2M
         i7ncKleDhNflyA8kFIr2SbI96o/Y5fYznQKV7qvVpfVnzdIi8NLIu2o2PIMPDVe96o2Y
         +AB7TWPZyWVSRJWji5CDFDk35kaoqLuC+T78GSzoTGA23do50mRIG+5gaUwCJSYGA2Lr
         /qNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812863; x=1691417663;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNR6HBJTf7IQHP/og4bI20+CZz92G2PJJEv6B2viqOQ=;
        b=iTaaHWvWrcvVNoTja8Hy9Y92kaEiKHJSFIvX0bAtGMJEBTbNykmHIFq4PMezfDtxrn
         BLsZoamnp2YtTvg+4zsBMFULFcPGj0KktEazey0q0dVwd26BSO9Yr8xD99Y0hisjG/mv
         XimBYObmysacsGq6ymWPeJEJaxQbH4jTU86onxvDlcDYlWi0ULQo7SxJtKzGJpaVJEc3
         4/O0zxp8nNxmXATpDnbRxi+IUg8gTiOTD2IPlONuzCYoS4v+FmDsF/YBJkRilD4r+ZV6
         9A/P4KR+ttof4apMwNE2u4iJwbirsoQ8W6VWNALCs8YMaeDi9jx8DM+sGiTcNj7HM8ut
         YgNw==
X-Gm-Message-State: ABy/qLaqEULBBqBJ1+AMoO9ByxXWrJIPIKwy7Vs4AnLxahJrpUhDycrB
	5UZ/AGlExUVjx1Irc8k8SC3cCq6NAHHXvUXSKCk=
X-Google-Smtp-Source: APBJJlFe2H70N+bH+Sa/Lc9zojQ5e3D7icnOi6By74lOBnrznw6fcxiLTeTP0RKweEZUrXrmwzOBOiO5K8Y17mFPn7o=
X-Received: by 2002:a05:6512:3403:b0:4fa:da4f:636f with SMTP id
 i3-20020a056512340300b004fada4f636fmr7195030lfr.32.1690812862356; Mon, 31 Jul
 2023 07:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230510095726.4090311-1-alex@linutronix.de> <20230510095726.4090311-2-alex@linutronix.de>
 <ea898c7901735eee11dd07ee5ad3ab976cd44b95.camel@rpsys.net>
 <CANNYZj95L_pLLeL_-bUrMLSAVaG0NgSWBSNnpF9KjK5wpXYA-A@mail.gmail.com>
 <2039c55f7149d1a362e324751626fc2f032cdec2.camel@linuxfoundation.org>
 <CANNYZj9oqW=8zrEsQ5nNPsQo816q3L6gLR=wc82rO1PB18D=Ww@mail.gmail.com> <58e78aac200248a3be371f6ee54c67a66b51013c.camel@linuxfoundation.org>
In-Reply-To: <58e78aac200248a3be371f6ee54c67a66b51013c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 16:14:10 +0200
Message-ID: <CANNYZj9yxqxMB4NfEpvJnb3KxBXpVTVJZ_dppMjmd5XQRapzUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 14:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185143

On Mon, 31 Jul 2023 at 14:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > Yes, getting the layer name means parsing but we can likely handle that
> > > at this point as we're in python.
> >
> > You mean getting BBFILE_COLLECTIONS value out of conf/layer.conf? That
> > should be fairly easy with standard python, yes.
>
> I think we should be able to use bits of bitbake to help too?

But how? To use bitbake a build must be set up first. The script sets
up the build. When the script executes, bitbake won't yet run.

> The conf-notes.txt has a specific purpose and I don't like the idea of
> trying to make it to two things badly. We therefore need to put this
> information into which is likely a new location, probably a new conf
> file within each template directory?

So perhaps:
conf-description.txt - a short (one line ideally) description of what
the configuration is for, shown by oe-setup-build to help the users
choose one configuration from several.
conf-notes.txt - a kind of freeform 'readme' for the configuration
explaining how to use it, and which are the key bitbake targets etc,
shown after the selection is made, when a build is set up from a
selected template.

Alex

