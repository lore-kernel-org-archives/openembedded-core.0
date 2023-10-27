Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94794C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 12:54:46 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.6038.1698411281914119069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 05:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HvDRB094;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso28619521fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698411280; x=1699016080; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=azy8ifb8Zky1XHd4YN6aUDlUgBN85DiOP1pUV2yJdc4=;
        b=HvDRB094X7X84TyCBoJcIFIsNtVYPPgXlLW+glDJ1tCE8qA+1hdPhC5lYCSi8/nv5f
         qQqax2Mi9HM3X86Jy44ZSSO0KcxRerrSmPhjgMa9knoqLSod9yL1PF8Cyw+dJsha8cpc
         isHwNAvHG6QMIn8AGQ752FLm5ivHQlEfvQjFiWHMSkmP1awMzhVxumMbfPsh7G8GK+wh
         lWKqZy6fszlizdIL1nyVBQG5yw2wa83rSeM25PCr3TpYyicAzJz5TnymoPARHjlWl73i
         3y5DHRCCoxm44pfek3mnjlOZJbL6WXdUjJ0JheLvxd0h4butR8oTmeld3xS17BjXndJ4
         Vowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698411280; x=1699016080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azy8ifb8Zky1XHd4YN6aUDlUgBN85DiOP1pUV2yJdc4=;
        b=ex7Njwlil2lP2OFmC4uB/669etLGCs8w+850iVTV08lI0ZfapG29wbS3ds5/mfMKGh
         bvzlg3tFSLnUANS8spOyYtIMZ5LTVS90eMhjuv5mTuOfzEi97V8gAttOTHpdjTSIFND+
         BNJepVzUQmmJsvZ3fQzfKMfybc+sWOJfkaAS/elV+7/SoknI/eGyvTME1PUNRD50QnEm
         ONX5VOyfZbMszhA8NehMpafqMcBGUmpz2rg5fDAZKg71aV5Yf0g3ofrmRvEW0dsQxffq
         dXJoyT6YHdnnOcV+2dzNWGBvhV7ro7gDTGXoS5tnYulMDyWjNabdHNyQLDV1hc/r9Nxk
         /K7w==
X-Gm-Message-State: AOJu0Yw1xKognjD7SaooBPpsYWUkZkCQAMpIJ7o79pV+aXeKNhYQD8uE
	y076BqWe02C2D9LytQUnYJCxZPKnlM3jcTbN0hg=
X-Google-Smtp-Source: AGHT+IH2RE1MEWoJ+5swDrPKbYG0/frsESDxHzeombT0MFRhW9a4zklShHYlWVeTY7ZPKoZeM3CTFvdolCbe29CcPcM=
X-Received: by 2002:a2e:84d0:0:b0:2c5:74b0:5c31 with SMTP id
 q16-20020a2e84d0000000b002c574b05c31mr1994041ljh.26.1698411279802; Fri, 27
 Oct 2023 05:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231023110618.3525311-1-alex@linutronix.de> <20231023110618.3525311-3-alex@linutronix.de>
 <20231024103345.306b9171@booty> <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
 <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
 <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com>
 <ec16e182f9a2ca5452920f6bbf8d7cdb96bfdc71.camel@linuxfoundation.org>
 <CANNYZj8+FTOO4cDsPzE_g4Hdfw7qtHvnYvK1WwFYdRRLKhJbWA@mail.gmail.com>
 <973f1bdb68a371c54826efc9ed6ebbeb6c0c98b0.camel@linuxfoundation.org>
 <CANNYZj-HbxPewRCJ_44F4FhCcMQ-fmbP=o4=4fE-srQf+QQD_w@mail.gmail.com> <a42209bfa5e02dd7b906631184f698e5bfdfd77d.camel@linuxfoundation.org>
In-Reply-To: <a42209bfa5e02dd7b906631184f698e5bfdfd77d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Oct 2023 14:54:28 +0200
Message-ID: <CANNYZj9NdBe-3VmMkaTJspRP1iRqtHrvzxTiGDxPvM+RqrJvsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 12:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189744

On Thu, 26 Oct 2023 at 18:13, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Lets make the test print the hashes it can't find?
>
> It would be useful to know if they're perhaps delayed somehow on the
> CDN?
>
> Seems odd it is the same list of things though.
>
> We need to find the hashes we build, and the ones we can't find and see
> if they're the same. If we get the siginfo files for them, we can
> compare and see why they're changing.

I've just submitted a modified patch for the test that prints hashes
that were requested if the test fails.

I've also done two run-throughs of the standalone builder for it:
https://autobuilder.yoctoproject.org/typhoon/#/builders/158

The first one failed (which was expected), then I ran two standalone
qemuarm64/qemux86-64 jobs (which did actually rebuild the missing
stuff like perf etc.), and the second run succeeded.

So let's see it fail mysteriously again in a-full or a-quick; there
should now be more info to try and dig into that.

Alex

