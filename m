Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C9DC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:41:27 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.13215.1707489684085192038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aefbTjf4;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d0d799b55cso14707451fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 06:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707489682; x=1708094482; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4xMyjLP2Pk6IW7DwYd8EsI31SDBCQkrSr8G3QE8saec=;
        b=aefbTjf4a5gU2JAdz/XxVscUjo+LOjRsXp5EAeHVzehTbej18OiipBHD9OK5RKKWio
         vo+WPQkfY7t8SY+Gml2dh2Z6vRSKtXGCuV0/hO7R7Y1gv782DDZhubcuSBjNRKuCoilw
         HUn8z8LhxJ7mZjF10otOVDf87ALej1x09l9awRuILKlcbyZrZLYX8NNJyyU4DvjPqIu/
         3oW6o3An2b+8haJHS0eesqQ7L26pXwwnczW1Cmk3Ymr9zJkDfYSBZHJJna8v8u1181W3
         rSOn6DC201BM30VV9itmTElE3vuXwrwGFisdA0MGBvtrZSmMqolhjyGkG69CZgFvJOQF
         eelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707489682; x=1708094482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xMyjLP2Pk6IW7DwYd8EsI31SDBCQkrSr8G3QE8saec=;
        b=rtKvA2L9wev9YYa7VkaD6KhPQ72z8H6WqcT/5bxCuBBwgcT4LtdjbGZEU1Zz4YaKGY
         AtFO6eYQiZX2KWtbwyE9wsiNIgKFdEFl/hu6O59/p+rBpqJ2orGJj16JUEPVcCWYtMfj
         mK9AsajPB8Td3xmGempcBEGL2ZNc80eZDXdktXfLy+O1o/ibSjG+owO40ZyRYoYLWc/z
         XkNAmnPHdWZ+lvCICLzepPu98EHol1qB3T54VPC9/G4D0C1Kp5GXxteO8AuADsMkyBAW
         kv/+AFnN3AtHqh8KkByuVg8jggmK8fhye6aNK1oMo6IRUkQLxlutiUU3plZ52IFcucs6
         8S/g==
X-Forwarded-Encrypted: i=1; AJvYcCV1pJWO8KVZmXL4aW0dYZ3noOQsh0LaBPNhkpmrT5aGNgxwN6lUjYzTysEUe2Yod+d4PiCt9U3TB76qNIFtXw4sGvxdqu7zus0PEJmcWA5en15lKxfxDWhj
X-Gm-Message-State: AOJu0YxTe5I284ztuyof9jLyyVyo5dWN5/RmC+YdMueJudTEoaLarjWt
	/j6z77Fxs00GHw3/9Yy6hZn6ztEMuk62tEXkGFM5YsXhBWjaxEGBnXhTk2Sh/03SKJJKFb7JyJX
	KP1GLVOdf3+wIINmrLtNwyknoykU=
X-Google-Smtp-Source: AGHT+IFfBrEZO8te0xnj95mPpbJ7yX6PrBT+xOshtHL5N71WjOf5/paHVfiixyMY/EtECl4XRGQvayo8tkT33gdNgrM=
X-Received: by 2002:a2e:3505:0:b0:2d0:4c41:695 with SMTP id
 z5-20020a2e3505000000b002d04c410695mr1518109ljz.37.1707489682045; Fri, 09 Feb
 2024 06:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20240208185641.2969396-1-alex@linutronix.de> <C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
 <CANNYZj9uH+0Uhj9GN6wxKHXuZzGvnkzjydUJ4eD1xu_mi4V_WA@mail.gmail.com>
 <QJDL8S.L5SFWUB1B9X8@t-online.de> <CANNYZj_Ludt4Cr68KnVCDz-U51WvpyE1qLFwhM10ePAXR7zKkw@mail.gmail.com>
 <CEFL8S.5THERGNQN4KV3@t-online.de>
In-Reply-To: <CEFL8S.5THERGNQN4KV3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Feb 2024 15:41:10 +0100
Message-ID: <CANNYZj-jPcpUqr6YSABTMj9K8PKMpJxyUwyQ=6VCrXO6r1Ax7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: f_l_k@t-online.de
Cc: Ross Burton <Ross.Burton@arm.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195224

On Fri, 9 Feb 2024 at 15:39, <f_l_k@t-online.de> wrote:
>
> On Fri, Feb 9 2024 at 03:13:40 PM +01:00:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> You also need to check how it worked in previous versions. Why would we want to enable it, if it wasn't even available previously, and things were still working well?
>
>
> According to the documentation it will read from logind instead of utmp if enabled.  This is also set to be default.
> https://github.com/shadow-maint/shadow/commit/fb35ad15aef6190914a939b299e10c343e3e4c2a
> https://github.com/shadow-maint/shadow/issues/674

Thanks. RP already sent a patch.

Alex

