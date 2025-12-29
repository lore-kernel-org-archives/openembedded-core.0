Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF38ED3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 11:12:41 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41498.1767006755950265450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 03:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKi/WA7P;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88888d80590so133525906d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 03:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767006755; x=1767611555; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SEBfYMXcvQKf6l/6yFexCOI/EvDUalzEzHEs44abhhQ=;
        b=IKi/WA7PqlWa5b8vZt90x8m/EDcGMseTx96vLNvLVlwQi7vGxMxsMAwZvYhVe+8jGU
         5tjL777/2YEjpO1oBhF/7AwV32FHAKpbIPKP4amnsGbprP4Hb7Q2zDEGfJJtpydB9qIx
         FHyJ3MqqpU/w2NDDzZTsljHUl1jmLfBz5LSWIJQSATmt5Byts+71koeceBsCPF1F2p34
         MFou5L263IuhF7at/IhlKtpxP8sP3SreqoB2aQWK2fRIZUk6NCSl82NZq0W7xCu795si
         wfWDmVnTPIbLpUsnSNEIzZTAxx3UleVnij95PyMA5I21AEGnXjW/9yk4cr2YsjkOdVIH
         u2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006755; x=1767611555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEBfYMXcvQKf6l/6yFexCOI/EvDUalzEzHEs44abhhQ=;
        b=A8/0cvamKKwOs26IcoSD9ttZ6n4datnVrJgHiHXjPo6aNNKG1NrkCdzTpQd8VHpWqW
         9FMWSUMWAcN81PAcEQxvqryZ3x46u/O32ZarqlC57+2BewQL18WEP+unAZ7PyzD1/Igj
         L/A2+KPVQWvlfIHVJt3BWiNi4taZolMpvkd2PWbsOLvArOqRk8Fg+IJbhXHKo1C5tEan
         RIElD+WhUSaQuSQk1D3tSoaZ8KYpZTZAKTqP42U5DegejBfuwG1cibj1QLTf+SrkJ+Zg
         6lkdjdjELOQEZLhXaIOLU5xmLXAjWttwUOfE7HtTAss2A9833ejbNOYWq3xcTH9Qqrp4
         f2WA==
X-Gm-Message-State: AOJu0YxzDxafiKnjdZww5b5fhCJ/9TeV+3xv4TvlWnonbCwvUbVG7OqK
	0h9fzLtnfQWqTtS+JPPGebe8in4GMUQAysrdvA5VE2URC21Y1N+cOh90EkLTJtQMNvuXrKWJ+Vw
	14cfEsJ/0pR6jy4WIjQonBmcIW/RNqnjgrf/0
X-Gm-Gg: AY/fxX5n/+XiuVD5i6eHnZDqIYSbhxCqWo5Q+BUl1se5PJBFWpMpu3fjc9AGEQtXEfE
	Xt2YD6ptY5bux5NKJ3cYXCvMEtb9vp5e47LMkdHc8xZFCwKOoItsaT6sDc6TWnvTjyzYEJCb446
	DJFwX0C42UKeNTMC8OX2smjOBkRFhiVEQGheThp3swNqgPNciHUjVsQ3MP04aStFhgmGuMO8XXc
	5WrdUg0xX7yiLInIzLbGiC3pdn5KAKo57UmlMXYdi/gMBw5EesnSISqI7jGvqd8CdpodWR27AM2
	XTgZ/GXzGavw6HGpbvSZmStFI95TZQ==
X-Google-Smtp-Source: AGHT+IFb2CbVERBQDx4ubF4+TCjv42dw+4rvlhmgYLX3BCRNxFVvdHrw689p5sNTyhAwNCykm+eFTTUmVBHochpObYg=
X-Received: by 2002:ad4:5b8a:0:b0:880:5a05:925f with SMTP id
 6a1803df08f44-88d851fd7f5mr548235096d6.13.1767006754962; Mon, 29 Dec 2025
 03:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
 <20251222200739.2278706-47-alex.kanavin@gmail.com> <CAMKF1soo1kGa9XhE=Ti+fmycHXPLWnr2b7Sj3wfQ_bVqau5Usw@mail.gmail.com>
In-Reply-To: <CAMKF1soo1kGa9XhE=Ti+fmycHXPLWnr2b7Sj3wfQ_bVqau5Usw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Dec 2025 12:12:23 +0100
X-Gm-Features: AQt7F2qkRuwws5Y_9lRRiKBD-2mhUH_jbXbH5DrlPEhQiujgrNFc-zn7AbapYx8
Message-ID: <CANNYZj8mWMsrrUNyBSpvv=nxdnG6OGNQOqVYcQ61rtg=oMxvJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 047/114] ovmf: upgrade 202508 -> 202511
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 11:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228596

On Wed, 24 Dec 2025 at 00:07, Khem Raj <raj.khem@gmail.com> wrote:
>
> meta/recipes-core/ovmf/ovmf-shell-image.bb also needs to narrow down COMPATIBLE_HOST to respond to this change.

I don't think that's needed, the error is already specific enough:

ERROR: Nothing RPROVIDES 'ovmf-shell-efi' (but
/srv/work/alex/openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image.bb
RDEPENDS on or otherwise requires it)
ovmf RPROVIDES ovmf-shell-efi but was skipped: incompatible with host
i686-poky-linux (not in COMPATIBLE_HOST)

Alex

