Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266DED1624A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:43:06 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.53012.1728906180071078756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZKRxhFFq;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539d0929f20so3201110e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728906178; x=1729510978; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yttb+4k2P/Hrd6xHPp2v2p27n0gF/+Gb4ZH6TcVu2fI=;
        b=ZKRxhFFqrV7TCkLsxzRyiI4ndQkrY7D2tSPbb8Wxio6cP7yK824LNDOZUnUuw3QIrH
         BUPMv1zB5sFODtBGl4ulWn0CMusdvJ8isaArA00eDIxei1+zeZPP1fs3QWuLzowZtCdA
         KWnaG91e/KPRIh7xvG5bHlY4/rIMFNv5dmxmeWRG1NgA4QYq2MPsUZeQj1A7IrMsszex
         6v0nOeQTXAOZDMHGnZyWN/SfFu7p/VNhul8i5qUwxWMHgsFCKI+kaMo/RebSPczXnc5E
         Rh9P4kocyvftDoFtVCjOZevSzPDch22nDRI2zgFSabCGyxSXkiERSkzPXGps3uz4whPq
         0t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728906178; x=1729510978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yttb+4k2P/Hrd6xHPp2v2p27n0gF/+Gb4ZH6TcVu2fI=;
        b=dELDhgF6qnsmuUVZhGcXENyRg3jecOWoLvY1Ub5+csPIFEuailH8PPqMLs3X5nSu3j
         oUBiOegVS5g9l3XlYnN0m+OtaNxegp5VwSvOVeDcqtx1z8qLXgfch4Wk/WFaAEGTo4BQ
         puz3ZXQIUaKeC+fzcT4T2lkrR1ryrW9FuAlq+8EYeHKK65NEDLS2GbJXWeLUmfmnhXZt
         vAu6JNg6ePGfHH6xc3xj5IpDxmGNSlCeGme+ReZZB61Fip2gb6oQgg5R4iSDbWusDIRT
         MNuhVMx4Hsca1/k5fuwdNGpnlvchWCZnMqLLi8dt0B0ANUDj+Pa6EkXTJwZMs7CKNeo1
         uqng==
X-Gm-Message-State: AOJu0YxBJ+Z3Fa0YfjrMFUR2cf1jTsJGIT2a6Z99E9nvCDkHDdwrODfz
	7W1ofPCd9apeo2V9R1QZy/CS5u4woxzc+VzcY6pcv0sVEPpv4UGhpLhSVBzDVUjA0/ItVz538fE
	yEUMyhKeUdUWmFiL9tF+t/zNewAxABg==
X-Google-Smtp-Source: AGHT+IFhApggvp2XT/Qf6jEDxIcYkGYO5YbbJ6xN72kCyWRHcBF0qob5hCMasB3UVs6Wvig6taC5yv0Qb9lxdrYZG30=
X-Received: by 2002:a05:6512:640f:b0:539:e1a7:345d with SMTP id
 2adb3069b0e04-539e1b6779bmr3034933e87.10.1728906177979; Mon, 14 Oct 2024
 04:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241014102817.40298-1-mikko.rapeli@linaro.org>
 <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com>
 <Zwz-urTA8Jj69agg@nuoska> <CANNYZj8vi7A_BSLTewb_LNLnPxzrmhn5fpxG8_OeOA_k-AhoXQ@mail.gmail.com>
 <Zw0C45RZmAqiS06R@nuoska>
In-Reply-To: <Zw0C45RZmAqiS06R@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 13:42:46 +0200
Message-ID: <CANNYZj-Ehb-nQfeJ0sKX0rACDbWPT5820weVNtQ9psd800d6yA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ovmf-native: remove .pyc files from install
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205759

On Mon, 14 Oct 2024 at 13:39, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> No, I'm not able to reproduce the problem. Maybe I'd need to share the sstate
> to another machine or user to trigger this. Just changing build paths
> doesn't trigger the problem on my build machine.

Can I see the link to the autobuilder failure where this was observed?

Alex

