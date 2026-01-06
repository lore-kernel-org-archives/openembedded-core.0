Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83538C47BD1
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:39:47 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86660.1767692379346823757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 01:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQWUX07g;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2d6df99c5so279618685a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 01:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767692378; x=1768297178; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cff3W1kcM813ttnrrB846P7I8vT6NKZTDBFqTMF8CAg=;
        b=iQWUX07g9hwfZT84Pp87ONG7gu3NbJQ3qkbrHmshd0jae9S8OCZP5bu+z+xQNGXadS
         a6JgU/kqZrlSSFsGXQqkOFX83Q/uGy1BiV3IkwTUVkBvXVbXA5TtlrmWmv3TDXy56VtW
         TjG5mYmtfutIAcXSrzXKBZNHCR9lLY5uR4c9dw3pIQME4WWAUpnNFaW1NpHCEXhZW7a6
         ZQNk6b5G+28FeevPDCf5SoIzzW+3RsTkQzQqyKTc8e7PrwUHSEoHVVbVjA90TJJjYFVX
         MFatUfCdj1NvHyrRp/FJAsZfo/rgt8cjnZrPeXsGM/Ex3WFlgXmi1n+xCPAi7hinw5Ig
         +hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692378; x=1768297178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cff3W1kcM813ttnrrB846P7I8vT6NKZTDBFqTMF8CAg=;
        b=Dds5oW9ww7LwjfaCY8vbj9oHs2F6RV4Wplwwbh/SnG+ddB9rM/5zg6l5eNFudl+G5l
         TE0Ar61r0pVbbVDw6AkRDg5ZApns6e21jhlA8I4O/jmrpQRuwogHsy+zTxv9MXdZetgo
         FjbjDdaPhGRCpHXjxNFaxvb8Cxprqc4++zgDHK2yio6y8kYqm1L8ib+aUJHno8I2dXto
         ppdXpV0bWk1ECfYWeOnVqpNAT+t8+okqSGbAG6MkIus8o3Q2Y5MqSZcu7H0jdKMHGHj7
         uAYmrAxZIeGN/NpQ1oy3/aWFD3jUpuumM/WAYzVBORvPZ/T4BSIdo0e2o0pRV3pa8F0O
         nBcw==
X-Forwarded-Encrypted: i=1; AJvYcCUPslcadgEK3WdYN09VBauO0Ib3V1f+ClR78AwZPMCgyIKGF3jJk75c9dPCDJ1F9NkVKHrQ6PeT6vKlzy4yHBsG4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxyE8MpWIyx3qgH/P73soAZDDlnOWYn51RcHGezGqi/dxRIEOU
	tt/3AXQlbEMwAPOIGskOkInrBRLwptDgLd/McZilHc+Eo+W12WOkL/PeZ++a280dZLDT+0p3pO8
	qORRyhyKB8WkR6WP4OrF4NNkdWDEGjzA=
X-Gm-Gg: AY/fxX72R959ZDKc4rbHObotJo/zAOzuRNtQatykpBalQNwan5v0UC5Zx3r47Pp87XT
	UERyi06Po6MQZ5Lnn7XEiEJUisqAxraA0RcGkXoPS9QbaG9/AJvzn3TXwR9UqYeMpFRUGzFbbMf
	AYM7Av+tC7Eq8paVnUlbYHeaUc3O7Ns0qYJ0f2yl7I6/5h0TP6QonMSAKtP95v5ce/KRfSQJHX3
	gp4wF+6ndDj23tIA4WZbhSGy1K9QxTV6E8A5wCOFe3Pag8gEttyfSicf1ZggdK7Xy3mDGgo566+
	HUdLW/Xykh4K974kw8mflzcbtksvFA==
X-Google-Smtp-Source: AGHT+IHivZO7sitm4xLwYHFW4h6rLwagMKoa3EvL61Jg4GKPMqypSt3yCmFMVvHGauc9qOl3uKlT3EH6mM4uo7VhJag=
X-Received: by 2002:a05:622a:486:b0:4ed:70d7:aa5a with SMTP id
 d75a77b69052e-4ffa84d51d3mr25926781cf.25.1767692378276; Tue, 06 Jan 2026
 01:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20251219134734.842422-1-tgamblin@baylibre.com>
 <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com> <adc441a8-e19a-4d61-a3bc-9ec0927b434f@baylibre.com>
 <CANNYZj9+DPHLoWUsNngX12JwA1ZntaVrRmyyOMqiH7mN_5_E6Q@mail.gmail.com>
 <60b08678-6380-4512-a1e6-0518ae4710c4@baylibre.com> <CANNYZj9zAxJpGZ=bZHOZh3FBwU_Mgw=89sR8rS53OC99tCvPvQ@mail.gmail.com>
 <4ec2fab7-4d1a-4d4e-9047-c62a45109341@baylibre.com>
In-Reply-To: <4ec2fab7-4d1a-4d4e-9047-c62a45109341@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Jan 2026 10:39:27 +0100
X-Gm-Features: AQt7F2oWK6WHVbUm4yNtjAecPm2EE1nFvj0QY9Xqt4ez7IPCQhjQF6qth7s-2b4
Message-ID: <CANNYZj9=aiv5HU6i6aw0GfkXSM6qdNEHgHWQEMjej+xA07seGw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 09:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228882

On Mon, 5 Jan 2026 at 15:18, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> >> Maybe. I tried all of this locally (on a F43 system, which includes
> >> 3.14.2 as of writing), and after I sourced the pokysdk script, the
> >> interpreter on my path changed to version 3.13.4. Seems that the
> >> install-buildtools script is (at least for me) resulting in a 3.13.4
> >> version is getting pulled in. I'd think maybe something got contaminated
> >> somehow from my cache, but there'd be newer 3.13.x versions for it to
> >> grab if that were the case.
> > install-buildtools brings in python 3.13 into PATH, as that's what is
> > inside the buildtools tarball. That is expected and won't change until
> > after 3.14 lands in core, and new buildtools is produced with it.
> >
> > The mystery is why the test first gets 3.14 from running python3 (that
> > comes from the sdk installation), then right after that 3.13 from
> > running maturin (that comes from buildtools).
> Ross and/or Tim, any thoughts?

I looked into it a bit. I believe the issue was outdated maturin, with
the 1.9.4 -> 1.10.2 update having landed in master it goes away. This
patchset can be re-taken into testing without modifications.

Alex

