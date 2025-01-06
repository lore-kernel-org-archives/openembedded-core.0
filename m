Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6301FE77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:39:31 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.56646.1736159968631879617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 02:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HXjSwuj8;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8f65ef5abso120571616d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 02:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736159967; x=1736764767; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5HoahYEfknN4xVDWawtTjCtYDrw5sYsJHhDVp0Czyz0=;
        b=HXjSwuj8xfeHB6652YY4ZxK9Vumzkp+qxjx9lHMX44PE7EcnfnAao7xsRkCzRoeUf+
         UNiIUFMjDh4E2R0wKPkU9OZnFV530U4mbjiLp8zgShNuplSRdaIvmWkhoQhwVEdFwKVg
         s7/tnwDrkmnJ4V3tzwPnvMGmTneOIzUQq1uC8uZ6AC9YnFSEtPHcMFytPV3BASPRDaHd
         NNUzAGqJ/todONd4dSBJFgjDlGKH2npT/lrkp0brU8I6DlGMv5DYwPrCIUx1DSqBMIbQ
         TY07RDcnWmMctqlu6zPM0utab2yZ+Iei0z8u/k5GDj+S5hvOoZQ74aaTgQUpW+l6fA/P
         I7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736159968; x=1736764768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HoahYEfknN4xVDWawtTjCtYDrw5sYsJHhDVp0Czyz0=;
        b=VFOltVXG3AVkTpjZWDYkAML49oAd/EDbUUkcV/U2B8TRri9FK9PkjE58U4oRsC9qtJ
         VYNgreuoF0EstV3DXEW654WjYz/CmtM7AEzZdrobolT7qwhHOL2Hoz0MFM0l8WRuR4GC
         SmZ6I8nPotKOarsUcjSsr2q5ydQM6nB3w3fdUoT0JeA2k41EO8TfJihEEk/0DzmRav9f
         TXKH2tnW/ypre4cHkgvffydO0NWCJmGiiFIVRpDvN98MD6+VulvLc1DwXUedI/0HPQEc
         BhDlie73xSfMX1PCwdjghtK5R+egCseReYowbw7d/LewnGAl/Ds4a4GDk0biFwW5r0pO
         2W0A==
X-Forwarded-Encrypted: i=1; AJvYcCVYMz5lWIjidqnavkvY90gg1trXK+XmSy4O5W7wWNk/3p25m88GUR7xkBqALgKnb8TbmeiaTIPv2sO2ijeCKaZNsQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyC4FJawOpApAxpcL3fV6cSvqiasTj5TKZylUN0F5xrnnWoBceA
	KbU1wpls4Jz7pE5zZZQlRISjTADW8OCNK01qNcawX2NgW6pcni3/moa89JUXz2SzUn73Ha5hE9g
	WoS1Pb+5sPW5/PM/Of8qF1lEkwEc=
X-Gm-Gg: ASbGncusIjPjr46K2Z4B8acHeUGBmLYx8gcjoDQ3XgawMz8oJcipdMDVtuN2FhdlIFX
	r3hvckTyNnuGp2X68/bcL7X4nqrKZs65YRpTaURtT7EjCmePGagkyFbB7+VMv6zKaRtBN55AS
X-Google-Smtp-Source: AGHT+IG+ppucKOGzwkjKl7KngjdowXzdxsBQTBGdA70ViuIBDcc4fVd5SHjI7ERzZWCOuEz2lb2NqEnHuizPJdN4iEs=
X-Received: by 2002:a05:6214:1d0d:b0:6d8:9be9:7d54 with SMTP id
 6a1803df08f44-6dd233a0237mr916172086d6.35.1736159967677; Mon, 06 Jan 2025
 02:39:27 -0800 (PST)
MIME-Version: 1.0
References: <17206ef3-ac44-4b07-b881-a639fb94f6fc@beims.me>
 <CANNYZj_V66Nzntuxx7jKgBjRxBKXJKkN_hgsFYTSRJ36j+030A@mail.gmail.com> <20250106103416.GA15108@francesco-nb>
In-Reply-To: <20250106103416.GA15108@francesco-nb>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Jan 2025 11:39:16 +0100
Message-ID: <CANNYZj-qYGebbQWn1AXf6tVkLTg8fVWJPpFi8J2onHdk7-KDBA@mail.gmail.com>
Subject: Re: [OE-core] Possible upgrade of Bluez in Scarthgap branch
To: Francesco Dolcini <francesco@dolcini.it>
Cc: rafael@beims.me, openembedded-core@lists.openembedded.org, 
	anuj.mittal@intel.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 10:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209425

On Mon, 6 Jan 2025 at 11:34, Francesco Dolcini <francesco@dolcini.it> wrote:
> > > We found a problem related to key exchange that affects Bluez 5.72. This
> > > problem was already resolved on Bluez 5.79
> > > (https://github.com/bluez/bluez/commit/366a8c522b648f47147de4852c5c030d69b916b3),
> > > and now we're wondering whether it would be acceptable to update the
> > > Bluez recipe to the newer version on the Scarthgap branch since we don't
> > > know the version policy regarding this recipe.
> > >
> > > We can prepare a patch if this kind of change can be made on the
> > > released version.
> >
> > The LTS version policy is bug and security fixes only, for all
> > components.
>
> I would say that what Rafael pointed out should qualify as a bug fix, in
> such a case would you bump the whole bluez package or just add a
> specific patch?

You can send a backport for the specific patch, without bumping the version.

Alex

