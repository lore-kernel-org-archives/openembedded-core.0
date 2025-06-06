Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F5FC5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 07:52:39 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.28675.1749196353124786095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 00:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4V5dIua;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so20201036d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749196352; x=1749801152; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nRoafzCqUM7gpDSfyFeaMrjiefSe1N2bIdQ50BgpxCY=;
        b=m4V5dIua+Dj9ZvHDTFbWvq8PoLR0fKMyULfwJ+Hpq/1LaEGVcH5J22cWZdmcNatPIO
         /a7lirpLilRLdI+EMeK0KpUDTjU3f7aq+ER5lo0Cm99agRDMrYxnJIfV2apfZzuOEaz/
         XOSed/ds5cVEqwhgsa144LE0Or65bF22hYP35rpdlRg8vUzy/RwNVizphGbcJ6bTe8gL
         lNjEMZrIsiVIxayO3xQy1Yp/x7A6NVyVbUPAwsn1Pds+WBAKjzX92jjIEiOyxSB0jgLe
         nPo7AKetghSNHeGmE6/PjZwYeJ/0Vs9jycxykL7xrdMACimq53MdJfukNHDZns1IQe4f
         uk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196352; x=1749801152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRoafzCqUM7gpDSfyFeaMrjiefSe1N2bIdQ50BgpxCY=;
        b=t0e1L+P4GNnbP1PBphx1u+e4BspDwkv/slYihZbz1UDVY+UfSmCNebd/gQ0cBmuzhu
         9W2X/gFrVyP90s8MF38K1sz8k+wOQ6pca4r3u5+Y1garq9JPTkIJl3PVtVTBSWkRLmOj
         CyPVhKJgLYcyqnanbsFc/zFyylAorbi3WdXlI9aZDfF2YC3MGC/4dRUFpzE1ZpKE0YdB
         9Uk8kNXCEBfBydTE1lNqznl8ra++8uP01OFXAQSLQijhRWIO1lezLzX4csjwln/PITEg
         Ypq6QMnJhSlXWWS7g7cxfwZ4+wa3aqyEBfc0L9qyd8nl9RRhby0YgzYlqkDYrC6w9IBm
         wgwQ==
X-Gm-Message-State: AOJu0Yy12LZj/xetCCXePkG7SsFhDd1zImI9030SWYbVF5gTnGahbzVZ
	M5WfBT1Skvu62exJs159sso2GIZvZ3ROUdkb1KkZfSSgPyvXkQP9TYFsgbIBcQY2QcJ3PS96sM0
	FfViozcPaWI3RUcq9RRMjKv2Ad2TvL++w9xA8
X-Gm-Gg: ASbGncvrlBRg5MOnKH9+Yv2d4LairAxdJR04EE+mNMZIyCgcP3TNcYLZLW+iTzNBvOF
	unbRd3tRkAZKHEkNsezoljqjPjk38PiUCGpooVeCPvBkca8a5iA9v4jUaR2TcZ/vHAL0jIxeHvH
	YG+PnsYRwcZ8rsQCNQ2HXWu9hv+iqmBeD692reY3/kjS/7x6hicRKwV5sDglFU8q5nPOg=
X-Google-Smtp-Source: AGHT+IFp9XfcujMnAcPULlOd7CJzxaF5x1tFl9PqF+9oEwhPvyu+6PmLiG9hJj9LMmC+iYk0kkvZP/0golp3HBtERZE=
X-Received: by 2002:a05:6214:2022:b0:6f5:4dfa:6944 with SMTP id
 6a1803df08f44-6fb0921374emr35816916d6.3.1749196352101; Fri, 06 Jun 2025
 00:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250605125442.364888-1-dixitparmar19@gmail.com> <18466489471A9D1F.10724@lists.openembedded.org>
In-Reply-To: <18466489471A9D1F.10724@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jun 2025 09:52:21 +0200
X-Gm-Features: AX0GCFsF4FakpbjpUHAz3J5OVBmqBr8kYtzqZfjzCOv0roYDPwXQiBX9gQ8pgi4
Message-ID: <CANNYZj96SV2mxOkEjKtQJ=4NFDj_nMdntXeWH0_3ZPQd1XCnrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] meta/meta-selftest: add selftest-hello-mod recipe
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 07:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218116

On Fri, 6 Jun 2025 at 09:47, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Thu, 5 Jun 2025 at 14:54, Dixit Parmar via lists.openembedded.org
> <dixitparmar19=gmail.com@lists.openembedded.org> wrote:
> > +++ b/meta-selftest/recipes-test/selftest-hello-mod/files/COPYING
> > @@ -0,0 +1,340 @@
> > +                   GNU GENERAL PUBLIC LICENSE
>
> This is provided in meta/files/common-licenses/. No need to carry another copy.

And you can access that via ${COMMON_LICENSE_DIR}.

Alex

