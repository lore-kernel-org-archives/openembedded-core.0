Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3514CE7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 11:23:26 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.14715.1736767396655478854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 03:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Am6/lCIB;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6ed9ed5b9so613336885a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 03:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767396; x=1737372196; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2NF2QWedamjuJXRnSCurvcRl9tZwYdS2KNnRSLyWCPM=;
        b=Am6/lCIBEj/WLoknTNly7pW6JEpqxNjsPyb2hQcNOXUtLWx1cXNZjGqA6NxK0cagDT
         kQzkxFnIo6MhvEs+HAhaL3a1nQH6nnkhE/UPspMBUn4IslZITWj+PX8ihaLFDga50qdl
         MTbEYFPiC3rRU5wwxr+aquC1Gb2IpeW10dVEVJ99+3/V7SHGV9TWbrqAulkFDd8sEpsf
         pcDWglrXXIvFfTH5Yph209TYjmfeYrrYR/f0+Fepur1XwfbMmx1k1YYWh4x7I2MrHQnW
         c1gmg6Q1dw4uSj+U5zTgOCn/Q8ijCqWmy6TjThI6QzqgzwUxQNTK0pN/GZqsirT9ONEM
         AQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767396; x=1737372196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NF2QWedamjuJXRnSCurvcRl9tZwYdS2KNnRSLyWCPM=;
        b=IBl1aqakhqjErBnFEO/y/qsUryjUos6esAYSl0DA1j+5tZ2PHRCklmOuGYFW+aRlWr
         iSn2upQ2Nhh63HgaIJpDkAUAJzUNnT9CleAADSwPhfqfj+iK0NexqLAhHcXdwXlnyQAe
         U3g/58FXdZ/RzVPKIao0KrDAjLiI9UgbW8sqfdf4sdj/zeVRcBjK/6929vrQ6l8Mc9As
         nSImO87LSDWKqkCXoXSek9aMnrnt78B+TczGbj7A6lOnHRwWCnG+g1sWr6SASkwDXle0
         iqQ66CWkggrmdovCHMgEQt9DuFvb6VgiqkryqaFF9DjvwshOdgH9cotzLfOHvI1oEpUF
         C35Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyLbqQtggdOv2K+JS43Qg3XgPde7rPmasCmY4H70Dlk2/Zc3DY7IFubL6iBDJBdxvMIifFue1We2J2b9wtnO1QNw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywm5H1ILk4F7iIxVd6iNr6e/cxyVuZUQfM16hXnC2+RxD53Warp
	IbH5qT3cm0Z7O1fHbyC0rk8o2fPRiSsyamxK9r5ur8YK4s9BMMpq52Lwj0JUpZSWQ6rg5ESxtgb
	MLFvr6yK27+kslICQ99YuncoD//M=
X-Gm-Gg: ASbGncu7aQGj4VHwXKE4kubk4CAIvEkHeZn5oTyRDwz7/OzgWVQvBOSlKyIjReA+TqU
	GI17SWT1QWHLWXQhCY9X0UGcJz4ltzFQePs3HGHcyffz/edCgaGEhxbH/6vh75W5+fy+SJeZE
X-Google-Smtp-Source: AGHT+IEyq/PDAB3VFa8ZdBJbJQhFx4FaY4Y+cVmi8ah4fiUZtrsqy8YIYWl3PzuAo56sJV9pLZsaUO+Tdy+8E5Fvuo0=
X-Received: by 2002:a05:620a:2a0f:b0:7b6:ecaa:9633 with SMTP id
 af79cd13be357-7bcd9729fa7mr3470657485a.7.1736767395741; Mon, 13 Jan 2025
 03:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
 <CAOSpxda7RYcaEf-i_=iKuFiEPun6D-xjm7HOc0s+Dc3jdZu-Uw@mail.gmail.com> <08981091-3b9c-4282-b1d5-bd777c69d2e4@leica-geosystems.com>
In-Reply-To: <08981091-3b9c-4282-b1d5-bd777c69d2e4@leica-geosystems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jan 2025 12:23:04 +0100
X-Gm-Features: AbW1kvZ-ZGceu-1sD5oqXrB9N228gI7kCVVa3fMllHJJn8SUL9rGy35ht1Gk8yU
Message-ID: <CANNYZj-LbrGbye1PHktf6CRAeS+RcV07H=TbsESG7s6wmRD2=Q@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file
 shipping from 5.73 to 5.72
To: catalin.popescu@leica-geosystems.com
Cc: Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 11:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209711

On Mon, 13 Jan 2025 at 12:16, POPESCU Catalin via
lists.openembedded.org
<catalin.popescu=leica-geosystems.com@lists.openembedded.org> wrote:
> The error doesn't look like to be related to my patch.
> > rm: cannot remove
> > 'TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/core2-64-poky-linux/etc/bluetooth/input.conf':
> > Permission denied
> > rm: cannot remove
> > 'TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/core2-64-poky-linux/etc/bluetooth/network.conf':
> > Permission denied
> > rm: cannot remove
> > 'TOPDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/core2-64-poky-linux/etc/bluetooth/main.conf':
> > Permission denied

Your patch is handling exactly these files, so it's better to see if
you can reproduce the error.

Alex

