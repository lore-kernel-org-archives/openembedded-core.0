Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6DAC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:30:41 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.14755.1682580637241403512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=spfn5EOm;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4edb26f762dso8728216e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682580635; x=1685172635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ7PCGJOEMQMjm26yIRbcju2dEl7/gSjk+VKCFFMbMA=;
        b=spfn5EOm1LF94YGBTY2fDzQ2JTGcXm/PzAsowuVxPLhFHeEitfeJLqWV6JQp0pyaLf
         esI61qMvsdwMyGHdz5wB/1U5sXE4Nyuhnvk20YF+UKMM8q4AE7mmzccjYQcDjuyj+PL2
         QEpjIFZkt97cBNwaorhTvgck31/gjklfyW2UFUSzmuCzIO9ix6n3PTkn3ZPDQ++S2bPN
         v9ayh5iHjvz62glHgIfTz/LbwG1zH5bBR97rNp7nImwGz3TpLYU7AJah0SSKvr/cyv6w
         tc5GJpwoNV/S7Ca7+ABpnLa2eUFQTJrTR37L2viJDZyqI6oS4rmzj8S7HL6hCPStdGfu
         J7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580635; x=1685172635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJ7PCGJOEMQMjm26yIRbcju2dEl7/gSjk+VKCFFMbMA=;
        b=Y4bTdyOdrRlb1ljVixKaqG+fpG6dNPQTfEZFKnm1rQNB/QUSEUnH0Chr7IJk7zVjOf
         opju1FXqPcJE9oIpuNkjMDzNFx+LiifRegGxvy79KWdPqgpKC88/3rqBYHgS4PX9rGGX
         PKQ3/f0e9r9aUtRIZjEr5CmSqgocmLkbPFS3LXO3IBiVcJuwxmpR5rd2obUiUhHiwAE3
         JtyWQbWMkot8iZ+dkNcIiTXfuyRV9lkr+/JslzKWrTxcbR600NqtmFx3D4Rxmp3B3/Us
         yyCyLejgnVsUD2gpcm+OC5wK6Dbv4sEpjYdeSV4Yh0CAychOc6cU7YW5tub2q9jr6WZ+
         CGDA==
X-Gm-Message-State: AC+VfDx4iYeUeJSEJ95uzmqGl8ynczxh0UicerL+AsaplPwoJEKHfyz4
	hj7VI3CmUGL3UZsBHl8huuOiMsdT/5n03+aviB8=
X-Google-Smtp-Source: ACHHUZ79j4aXYnXkmD2ZioFbvWfwcmhvi+xdkmYr2UYThSkDQBNrChlDlJl9t2lY9af7o0nXVkPRTNu9GJonE4RBKe8=
X-Received: by 2002:ac2:5464:0:b0:4ec:81c7:119a with SMTP id
 e4-20020ac25464000000b004ec81c7119amr275516lfn.3.1682580635030; Thu, 27 Apr
 2023 00:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-11-alex@linutronix.de>
 <20230426231815.546f2ad6@booty>
In-Reply-To: <20230426231815.546f2ad6@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Apr 2023 09:30:23 +0200
Message-ID: <CANNYZj8sUt=+jy+ivzD3Ckg5P7emtOe_ZwdmmTe7ALWpg9_z-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/11] insane.bbclass: enable 32 bit time API
 check on affected architectures
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180473

On Wed, 26 Apr 2023 at 23:18, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> >              already-stripped installed-vs-shipped ldflags compile-host-path \
> >              install-host-path pn-overrides unknown-configure-option \
> >              useless-rpaths rpaths staticdev empty-dirs \
> > -            patch-fuzz patch-status-core\
> > +            patch-fuzz patch-status-core 32bit-time \
>
> This line conflicted with another patch you sent earlier and which is
> on my branch. You may want to double check whether
> lucaceresoli/master-next is still consistent with what you had in mind.

The patchsets independently add entries to this list, so yes the
correct resolution is to add them both in any order.

I'll send a newer version of the other patchset now (with recipe
metadata tests).

Alex

