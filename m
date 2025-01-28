Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B634C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 11:57:57 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.15833.1738065471378666462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 03:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzVjJHiL;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8e773ad77so46452706d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 03:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738065470; x=1738670270; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk+h0pEVw80PWaAHHWBB7ay95jJQ1BbVPCz2frcQ/wg=;
        b=GzVjJHiLpZ10dPlpybPdGuv9lhT69Ksa46qBVKgodCxxKcbvPp/zVJqsSGnlj2diLC
         yAQLz9P/2LLrxZRd7E/R6hGvqjrTiNtQKxSE4N4RqRS95tk2ao5oW6va/7O/gH6yQs2P
         X6R4I9r+rk7JMt7NrEKlaHbf57Vagmk2kqX5eYVgauUGUs2I4FEWsRQM2jMC1XEUzmp2
         K3Qt20Mj2H5QtZfVpMi1s7ql9WmatCDS1cTUvUct/AgXr0DMvNofaQoC7tkVD4zDKEEe
         1wpTD4adHDXO/SUnPlGkSUQ3FCuuxP28vLEDmzc3YaEvf4qcrDSGRGV7tE5vLB8RoSw0
         Nikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065470; x=1738670270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk+h0pEVw80PWaAHHWBB7ay95jJQ1BbVPCz2frcQ/wg=;
        b=WjYHUXWnww0/pqA8uUpfr0MR2/XUXmrjdRjwy1P0gG2u6MnDyC/Y5T9mvLFH+upydi
         uC5Vpy1ZEfbWsDHbQ+lIOSoNg2vpTR72oxu8d8JOEMJgmCLZV8SZXRbypdA0mBlNdiC7
         iV+jwezf92SgizPpmZrkUjzPEOXFNy0zSgvcIlaaZpn9P12hA1+dL6+B2nXKk3OY046K
         KGhh+ErMYqZeSBx5ymLvhSZoIs+ZeA/zrw4mO/Rrj1I4QlvOMNSsc3/aw4MdRNurqcBv
         sMLRaYMKxD4phYiYQGeu4iHLWGNQrYDwtq5aQqQutGZX6iCOlfFoFvKttbzIgGDXCjXW
         V4sg==
X-Gm-Message-State: AOJu0YxQDn4h5rBHzqRKBrrUGtm+L6kXVOLODoQr5Vk6qTZ2xd37lbEt
	HiPyU9D+rz1VgERSNKpaNWtrLQ0aPFQfLwcsYBioRkY4esnqYllVpfiHoxMCTzKrCB7zDh5xuan
	iqTUY1nJyiGzwsQfL8NmgahaAAKk=
X-Gm-Gg: ASbGnctEl7yt368uz+knJNX5kY1aq/bKASkbCC8ew+kDwCATcIts6uuH+mswIbRZuyA
	syHnG74cd4WTpdWspV2YC7jLeYsAxr+QUlqIg38rxDge2PTpYEEnZPWm+9xk/DjZCkk/PfxiqiM
	KxsNj/ADCuKEFfLx2m5ublvQ010H2r6/U=
X-Google-Smtp-Source: AGHT+IGnjA8X+bRRQlSNOj2T71hWjDVRDTLDRB5hbyJtw8MTzWepGwyUoYxOKgy3dlhStCyT8+97/ag9qxuMmbIARpc=
X-Received: by 2002:a05:6214:5191:b0:6da:dc79:a3c3 with SMTP id
 6a1803df08f44-6e1b2168e65mr696875456d6.5.1738065470448; Tue, 28 Jan 2025
 03:57:50 -0800 (PST)
MIME-Version: 1.0
References: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
 <CANNYZj-CNT8_yXKLB6PApG=Mknx=TKz2TAosgh17LiH1LQ0_fg@mail.gmail.com> <f8de4060-bba3-4a5c-93f5-eb4685223a73@gmail.com>
In-Reply-To: <f8de4060-bba3-4a5c-93f5-eb4685223a73@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Jan 2025 12:57:39 +0100
X-Gm-Features: AWEUYZlVPH53hu6q2oiRsDN_-MZWpOwR2j6PioXpr_pTnaQydiFiZwW4fKLdjdQ
Message-ID: <CANNYZj-tW3k01HstKJymLz4A9WOmMY6EhugyrhzZVEoH96pHkg@mail.gmail.com>
Subject: Re: [OE-core] RPM signing errors in Yocto master
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 11:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210321

On Tue, 28 Jan 2025 at 12:53, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> >   Which is
> >
> > - written in rust
>
> rust is in core.
>
> > - needs libclang.
>
> There was a motion to merge meta-clang into core,
> what happened to it?

The effort to move clang to core is ongoing. Patches were posted and
reviewed, with a significant number of issues to be addressed. If you
want it to happen sooner, please do help out with them.

Even once clang lands, we likely won't re-enable signing by default,
as having both rust and clang on the way to do_package (which uses
bits of rpm) will lengthen build times to unacceptable levels. I just
posted some unfortunate benchmarks for rust-native in particular. But
you might get the rpm signing oe-selftest working again.

Alex

