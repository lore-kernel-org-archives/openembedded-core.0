Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F79C4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 12:34:37 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.20901.1702557275184359317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 04:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Guux3bhY;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ca0c36f5beso105544441fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 04:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702557273; x=1703162073; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7du3yYjNyfx7Ed2zNNEUIIikUQAZVZKL8/WTffpdjqQ=;
        b=Guux3bhYVSLMG1skDgCrCMTqP1JNSdx0h7US48SaHGlsw9mq+3TvBe6GbtJH11HnCB
         r4NiFeZWiCVGCuIsPzfPcKud+O5ph93JFdQKKCh5QCdcwa/9LslmScAcp/Av5e6Gft4m
         mlz5r9S/HxwoZP2uxSKxtB99WcsfgqfkHzF3jfsW6kzXE2WHiXxT2zW62DuHx0lwxxdB
         S/X5wyAAXSBbYTQVq1HXYpxy7HEvavpjCaIycXCqvzKeTAt6Xg6KAsmRPPYDCwQvE3za
         4z27NB2Frxytz95QDXm2l4mo6/RQqIXM5dvCKuJwJbc+h+avD6MaJLmZmDn1qW8Cujv/
         fMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557273; x=1703162073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7du3yYjNyfx7Ed2zNNEUIIikUQAZVZKL8/WTffpdjqQ=;
        b=BIpLXIyPCSEWTPNIFvzzQ58X7AiPf4sQV9FBQ++gW/KijYk6Zky6tLHWthQGmiipOT
         fw2aUm5q8B9+enckgBQZX2Rldcb+jHt1ivP1afyDSWSB3oYZf2AVyuN0Hlb9eAvTrcgw
         qQzpHj/fNgkhOrUvQjT3C0TuGrqnzseNYi6cuts5L0FuLqULyaZUTGCQZfnINhFHRop7
         BAa6Zx7uLKTEpoksf01fQ95Gr3XTsKChheF/To6PtgvmoxFmyhpHLUubpxmYiwP3FDav
         MEp+stFghMBdj76woC8e5kyLsuqilvu1KEye3jlVNIwKuWvyPN3nbV3t1y9Ak1e/I7/Z
         xSew==
X-Gm-Message-State: AOJu0YxUJAq6mlhQ0z4fauTS2fvT11+g85tq6jDJMJ1WYQ03S98nqto8
	hs65KNoMcl5HK4tKIO+GpsRB1fiejavkdVg3jVU=
X-Google-Smtp-Source: AGHT+IFZ+UcYau5UQQLSFpBFluBTTPqHZpo6kWHEiJZcvql7HsLS6fSNQ+ddfvlLCudIDqlXV8e5aETGMV/TMgEU4CM=
X-Received: by 2002:a2e:3210:0:b0:2cc:45b0:6a82 with SMTP id
 y16-20020a2e3210000000b002cc45b06a82mr343611ljy.42.1702557273157; Thu, 14 Dec
 2023 04:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
 <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
 <CANNYZj8iD+LQRz8Sqb=QbYEXd6W_rnXz11pEVmzk9mGFKywfyA@mail.gmail.com>
 <7924018e34e7e6e76d5e1be046e8aa65481e15af.camel@linuxfoundation.org>
 <CANNYZj8bin4UjXK=gj-aR35t=ajQmNFsD8LKsiX_7x2-z08fYg@mail.gmail.com> <32526832f7e19b83551e786f0ab185cf7b879d1b.camel@linuxfoundation.org>
In-Reply-To: <32526832f7e19b83551e786f0ab185cf7b879d1b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 13:34:21 +0100
Message-ID: <CANNYZj9umd8trnf1BaBC0TBxtE44oYzkHUNAmVj+is7mP94Tnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	Tim Orling <ticotimo@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 12:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192363

On Thu, 14 Dec 2023 at 13:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I think it would have a huge impact on the throughput of patches :( An
> hour or two before the majority of the tests even start.

Then the only remaining idea I have is adding more hardware. So that
there's enough of it to rarely if ever have a situation where several
builds run on the same worker.

Alex

