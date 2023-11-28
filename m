Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE38FC07E97
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 14:42:56 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.34093.1701182570840039520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 06:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RouOCOk/;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso68120801fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 06:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701182569; x=1701787369; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh0xryP7VmElnkuB9pmarZLV6fB/nIocQrf30phBvvo=;
        b=RouOCOk/jyuu0c0llGmzY44QewuK+XEIKSvVJzHc40MgycwnwjaqKV3G+yGT+2vTP0
         ZmhrSnKtcqG+ZiWJJD1ks5ziJmpKa35egmd9/vFQBkdWpHOBw3lxAKWifN8pdBl1jcrl
         P+1oyxahPrjZru1KvRgLFRqx8M57j/b3lZ64v1LzQyGDovsALbSPE/G5Fy7wa1F3mt6x
         evTgJDIQSR97udNgIppO2vtzpgP0e7RRo4XEOsg81KgJsUfNZj4cmgXbj42ZJwE3e5AL
         d79n28Dmn23v0xGMISF5dsYy8PFObcv7bLBhNByeTAhyv3jznKaiuj9thbmChLMsSDEk
         qHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182569; x=1701787369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wh0xryP7VmElnkuB9pmarZLV6fB/nIocQrf30phBvvo=;
        b=dcJtxQU/tGxSAkCiKh/R9khZcLLRNH3ZkpcKyWEdzfUjmq4rNp7I1Y8ODPrT3Om3ui
         miRuEC4wjGLxR63zKD9Z5l0wBlIzY4weBjelGtuFcG9Fbh/VJ8UVJ8uT7qw2bOKxhmA7
         mJvblDjv8kLK9L7xGvKThTVpMJsXLgeR4mlrqjlEtgW22wjdgeQQC4k97IN3DrlNR7xp
         Y1si8It3wVxRB8mq73DWkuP1xXtlazXxAdX38oCK5PFyY+UxmEvcjoWnzf095VGRBKtw
         ux7gkKerQPiq6dmNryN36LzIFCf6IUu3U8N7aiAK9i/WqMCTrRDfu0s+i7p6Is1KkTo9
         2GSw==
X-Gm-Message-State: AOJu0Yw3EV92VCmSl559gan7/VeKgla+9I+THIeg66TyflYAUEkGgIcF
	gmM/LM/Cg3No9Jl4WaBpuo3PFZonnHlKKzAr708=
X-Google-Smtp-Source: AGHT+IHGQYrtlPaXekrxrz//37o8Bdoq6XWFfX0wBD2SEIbD6QZ3JyVDr9pbYtP1+wyOo45F8pBxqFc6mctGUXvm1O4=
X-Received: by 2002:a2e:3310:0:b0:2c9:b2e6:43d8 with SMTP id
 d16-20020a2e3310000000b002c9b2e643d8mr1215275ljc.24.1701182568897; Tue, 28
 Nov 2023 06:42:48 -0800 (PST)
MIME-Version: 1.0
References: <20231128131954.337015-1-alexander.sverdlin@siemens.com>
 <CANNYZj92XtmcpJpyo1eo04X1dpqPmU6cCKVhpP7aJnMK6RWPTQ@mail.gmail.com>
 <e0c37461b71d6159a2867726388fbc052bb4f624.camel@siemens.com>
 <CANNYZj9PeVWsM9SFoTG_F7rPjB5dhq8ZN0uGMP9hqU0XumCDpg@mail.gmail.com> <cc6779d618a32fba9f9265f697aef7635a6da9e9.camel@siemens.com>
In-Reply-To: <cc6779d618a32fba9f9265f697aef7635a6da9e9.camel@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Nov 2023 15:42:37 +0100
Message-ID: <CANNYZj9XFKQD4tB93LBmq4LGMYJ1HM4Wx18VMFb+Z5kXVxZ3Lg@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: use install-nodedup make target
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Marko, Peter" <Peter.Marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191377

On Tue, 28 Nov 2023 at 15:32, Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
> > So once someone sends an update to 20231111, they should also backport
> > the patch that introduces the new make target, and use that target.
> > And if there's an update to an even newer version, then the new target
> > can be used without any patching. But for now, I think nothing needs
> > to be done?
>
> It would be the case if this particular patch gets accepted.
> That is the whole point. Distros need adaptation for the new "solution" in
> linux-firmware, default behaviour has been changed.

I do not understand why this change is needed, if linux-firmware
version is not being changed at the same time. It would merely try a
non-existing make rule and fall back to the one already there.

For the future version updates, the correct fixes are those that I
have described. The rule to use is deterministic because the recipe is
using an exact upstream version, and we don't need to try them one
after another.

Alex

