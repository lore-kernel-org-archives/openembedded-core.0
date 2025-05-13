Return-Path: <alon.barlev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B3CC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 16:03:33 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.80456.1747152210264246655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 09:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NOjpWgfg;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: alon.barlev@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3feaedb4d2cso4148969b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747152209; x=1747757009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9TYZXZ2J3BHbfrSTLVSMeCi1zJdgZ9hnPeNEFTCKsg=;
        b=NOjpWgfghyNv5G5dJzbB8T/cVr915wJ7LSStCwLRlXuLzj8XKdTTMrzKwiqHpYa8uC
         5qI/j84mJyeukNLAkLgpqDi31YAOad31HnxzikJj1ihiE3ogtpG5GK+HFfbJoat/N7Qe
         5O++lXWr+e/Wst9UGZmXuDb2gmQtWS3PVQ5bCzSusBag8ioU1LxiW6egrClSqXWtP+Sy
         WIMhXK6fFVkpTKBztaGXWtbR5K9KZXlUfXZ49s5L3l8HPq0sMAJgpV/kUh+6z0WSmyO+
         hFsTMN4ypORS6ve6sy2+IXEWzUkAJhS5qAIHYQAC4DdRhR1QL0w3BUCEyqJSNaC//ML6
         vNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152209; x=1747757009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9TYZXZ2J3BHbfrSTLVSMeCi1zJdgZ9hnPeNEFTCKsg=;
        b=C94xOiXc3fLSPA7k/pOId+TDIK4ZQSR6I3Z+kTecv1hU8Vq3nns9bEWoe/t/Iqu7IP
         EyzI9/8Sgr/SoYcziSgtykWV2n9rO57qnXK0Ne2UCEvHvQV2AiOBuRgQfPYRbwcua8/E
         jzm5l/qkvHUONxCJn4U1YQk8rmaq1m22ytdYWa16K3YC9f/A5kVYqyMSRKNwUTHsZ3tJ
         WIzXIBFGsZtoIk56YL+EPrBMPyFKSH7A393lJCCTfB/6/x1bMqSPjlXmoCGW5+9BB5S1
         b1vVuZUUkpRTmpLCPvLMG49CF8SP15WVYn3RNK9XPVAeQQOUI3SQxghcCEue93YvrxAm
         W3Lg==
X-Gm-Message-State: AOJu0YwzjlAHj/MUvqFTLbmNMXnjyRZlhBjb4zhgbIJLpCxZDTZxqPyd
	jya4McL3faG+AtipjDK/GrRFpKg7SMPrYUkREaJ0EpEMDLwTeqX4fLjAa190pG7Mag0mNp7gqbY
	XoEoX0PqpCcW75P/rgTH8Zb/CftM=
X-Gm-Gg: ASbGnctrpOkJUpenVKhMhyfFtEsrDywFIYNuEcDkGdm4fWNfk9GwyEGkYVGCQn4lTdO
	eaFyaN1Z2Az3YS+2A8Ip2i/+qwA4c2vkix3CronE1rGUf4sr29fSYcI4Zg559xc6P6Aucqdoy0S
	lbgpkfY2AV2kxSMA0FJ2nB+ACioTFrS6SQ
X-Google-Smtp-Source: AGHT+IHMnIaTWeVMdxCAGNbUEQM/ja55qj1pD505b7no2+s4CYxpWc6FPlI+ZivEJtflF4Hcc+tmXl46Yq38BeClLog=
X-Received: by 2002:a05:6808:3318:b0:401:ea33:a888 with SMTP id
 5614622812f47-404c200a3dfmr76592b6e.13.1747152209292; Tue, 13 May 2025
 09:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOazyz0qBLixP2bfONcMs=HfSf6G_rxfz5AHoV+EZ+q8J7Q+8A@mail.gmail.com>
 <CAMKF1sogaVV_UjftSwAadqT0jgcK1ctTeXBrA6YBo-SDM+S3pA@mail.gmail.com>
In-Reply-To: <CAMKF1sogaVV_UjftSwAadqT0jgcK1ctTeXBrA6YBo-SDM+S3pA@mail.gmail.com>
From: Alon Bar-Lev <alon.barlev@gmail.com>
Date: Tue, 13 May 2025 19:03:12 +0300
X-Gm-Features: AX0GCFsz01kfIu8iHAkuevwArUnDiecAexL1zkKwvqI_JLgrl42-eI3hkyXRf5s
Message-ID: <CAOazyz1htgkecaWkTyeSQV6C_XgUo3EXdn8rSHvG0RZEihGq9Q@mail.gmail.com>
Subject: Re: [OE-core] [backport] [PATCH] module.bbclass: add
 KBUILD_EXTRA_SYMBOLS to install
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216431

Hello Khem,

On Mon, 12 May 2025 at 23:13, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, May 12, 2025 at 6:49=E2=80=AFAM Alon Bar-Lev via
> lists.openembedded.org <alon.barlev=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Hello,
> >
> > Please consider backporting "module.bbclass: add KBUILD_EXTRA_SYMBOLS t=
o install"[1] trivial patch to Scarthgap and Walnascar, it will allow build=
ing kernel modules with dependencies without linkage breakage also in stabl=
e branches.
> >
> > Master commit hash: 483c6067eb1ee9562c0b21cea0d375c7f521bede
> > Into [at least]: scarthgap, walnascar
>
> It will be faster if you can send the backported patches to the
> mailing list after testing them out on the releases you propose them
> for prefixed in the subject line

The patch cleanly applies (cherry-picked) to both scarthgap, walnascar
and tested.

Regards,
Alon

