Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6B9CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:22:52 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.492.1760725369163521103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 11:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfmiJZAn;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-87c148fb575so35496556d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760725368; x=1761330168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5E1APJ8ZMQBhk60NimHCi8NgcIZ47SKNHz7pTr0qpE=;
        b=JfmiJZAnqEXyDkzwcQehZzA5II2E8trRyAYTDIQomatog+G89zxVMpBlGx2ZqMRtH0
         bP9xVI4KOMnt3Ko47agNoxfXn9nIbOHzrJs846RNpSAImtsO1eWkvtyiu3pVnbhxUEBY
         zDUZG+7OdAoy2AIr/Ow8OcyJXmw8IWdoNuLwJFTCjKkcO7MDzoC6UQprYFjpkh5rVtjc
         ZpsLNHysxX+8uvNmvooWjECN3AFdDcywmwi2Z9Kfq4p+KJQ1Vm0shrLKOw33PPl1sZ+y
         O9U62Sq5FOwtouM6wuVGtDb4ujKJ6p5qMuHVVzN1Ke3Iib8cNOAebdvqBb8FFEBxjUeK
         5tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760725368; x=1761330168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5E1APJ8ZMQBhk60NimHCi8NgcIZ47SKNHz7pTr0qpE=;
        b=KjaCuZYZJvurA0RdnvMu4tXqwmh90eGccaISaRvInelNX/ezvZNCPfH47carP6OLur
         ZE/RbEIjXMVlc8aQv1K2czYNZ0M41h2V8yZW1+DpgUOhKWzSNAwa9edie2Yp89bFvq3t
         OTe7VgJ/eSnZD47SJBvss3RLnuj5WEQu8UyEWU1LK06tVXy8OE5Gjm1w5sqDrwclRUp5
         svcb0cjHAMI0LAK8Wu1k4RSKtPk8nJt92Q190Ov+U1iv8XSdmG9GBQS4MrP5tQy0Gd9W
         ozeaapMiwlSNxN/FC7Nuv82Lfz0WjQgyPAyiyOhRhzY6ocmhei5PAbOC72Jq21njSi1g
         Q31A==
X-Forwarded-Encrypted: i=1; AJvYcCW939Eu36zTX31OSZKSl7IL+Yuelgmii27suGjvEsflD1U0V2hWauMnp2ltWYKYu8i3Fo74jGbOU8yb1cMhUYenGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRdCJV5BdOzghyABy9VtPU3A680/XsTrV+Wv1RRxuQRZU2J6E8
	PAvRfxPKGwr7JXjkZEaLJ7/4p54XHCtFUfQ1svG4mAWTrueYwH6f/KpCHO00SfN5oVaRdQ/auQD
	d+/hiuuVIWYP7o4Ah6vUCHUM60/D7rblG2Q==
X-Gm-Gg: ASbGncuUSFm3feI2dSfTIi0r+LDZ7J2GVvAUMeIW/4J+5aCejQdJF2d9ELOgSSbrFUX
	tgxOacInBhV67csMIAJet+JAs3/04UI+B2QSjOfQaLzUSFzG8X9vxTsPT1m3o3ee3qGd09zNsgw
	UueE+YokB0Us9lbpRkfZITcDaqRPEQ3oYpUSG/cBkm6/CB2jJy1odOWTcfkwodC1vNzEBEpG3ba
	twQYawgyaIwdLLOk/5nejDJvZUHn1YZBD1N7aXIw8OPHO7KUyLW85xa7kmNGxyanSrhuC9HQD+B
	/SfGPns5C68crmK6EkRTrirH5ou4EUkcJu67Zq5lTjpCZWZn8VFTmhcbJdl8
X-Google-Smtp-Source: AGHT+IE63Etvs6o5JlVclSxWX56bVLJo15LqijnRoNP2ngk5LdzFIsJJ5AlXWSif3wOGnr5lNi52XLFOfc5mE0rc3PE=
X-Received: by 2002:a05:6214:e43:b0:87c:67a:ca69 with SMTP id
 6a1803df08f44-87c2063c1camr85827356d6.61.1760725368014; Fri, 17 Oct 2025
 11:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <DB5PR02MB102130824E86A46D0A830FB03EFE9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <a7d6a359-5a4d-4314-939f-3fa97627bdc2@windriver.com>
In-Reply-To: <a7d6a359-5a4d-4314-939f-3fa97627bdc2@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Oct 2025 20:22:39 +0200
X-Gm-Features: AS18NWCP98JLrq4glvTSKr2OBWXkrOG4-LLF1gmyrPA6TiZ1th742bbdfzgGA2Q
Message-ID: <CANNYZj8i4ksk_8kmDjswjA_pvQw-cCg_jOOCh47PYDu3TXw6Bw@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3 1/2] base-passwd: add clock group
To: Qi.Chen@windriver.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 18:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225031

On Fri, 17 Oct 2025 at 04:56, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> > Why does this have to go here. Why can't you just update the
> > GROUPADD_PARAM:${PN} in the systemd recipe to create the clock group:
> >
> > GROUPADD_PARAM:${PN} = "-r systemd-journal; -r clock;"
> >
> > That way it is only created if systemd is actually used.
>
> I consider this clock similar to the 'wheel' and 'kvm' groups. 'wheel'
> and 'kvm' groups are added here, so I put 'clock' group here.
>
>  From my understanding, such groups are likely to be used by other
> applications (recipes). You can see this from the original commit:
> https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb
>
> It's possible that applications such as linuxptp will use this clock
> group. What systemd (udev) does is to change the device's group to
> 'clock'. This means applications using those devices could be put in
> 'clock' group to be granted access.

But how do classic binary distributions handle this? Can you research
where e.g. Fedora or Debian create this group? We could probably
follow that, and avoid having to carry an Inappropriate patch. Maybe
base-passwd upstream already has a fix?

Alex

