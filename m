Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE21C47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:21:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.70386.1705918893456082477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YcfTzYF2;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e67f70f34so2837696e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705918892; x=1706523692; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYlWYCiT5q+R5dwbIbZfDBfJxridNjioMpwmJL/NdE8=;
        b=YcfTzYF2IFffbYLMcRnNtc7olJYQRyzDpEF3IZu/lq1V0O59KTJ73xODBs8FsJqm/d
         kPjWr008pk3WYTrZoVdFEEWLxS6Ef/Pq7YmyHNWjolJvqcbtZJPGBpddYUVswII1l/MU
         SfYdALwXqROFxZOkI6YcA/CkRWWS/7l82vLvu9cCDG4vFuZ/BiZYcAMefRoJJXir1CGi
         OyAkNhUBVMNAxS39ZhqljTaEC3YQ4KjeF0PDkUd5ekywUXg/P1eaC9z7xm8nIgLDCpuY
         MEnYteEx6DKTb7fcUujNhvpRIFjPXsWNmHgjFnOAqzOaG26dw5az9LrXoTBbDgsJWU9x
         xc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918892; x=1706523692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYlWYCiT5q+R5dwbIbZfDBfJxridNjioMpwmJL/NdE8=;
        b=wA2/Qq1qQS9F3dre35GQJ9IXBqAxL/BPmmFKK1odrFEXMhBTWDkKIgdwiSveGqs7s9
         VinmDRFqjNr8UYinmQLR7UtFp8mA4My5Vr+4NkZ+Tu66+Yio/nESTfquVF3s2rhsHfI+
         lEVxrVBBD6Ayh7EFzx+TmUruXyCjNCo4yS38A4EUbrCdk9vaxnadjlZuZTwALFlVx6gd
         a9FqMUf0d7YMNvBGBh6d5yfq1azGDSzBcNKJ9jJ+vZADPK5m6bDk6BCs9ekpVWUejlv5
         PSdQe4bDyPo4oFch3W0S4ohA0t9w4QHIGouI/vFWyhaCcI+1ysY28qhgpMzGhF7Ew4Jm
         uDfA==
X-Gm-Message-State: AOJu0Yz8Kws2CZBIwe67Po2sV1T6vQ+MwkB7d/rgrCRhoUSBT8KlG+yU
	aJqOSFntjPcs9RQWrcqq3kTZWmQnv3vc+boNxt2NhCP2bVT3Y96MxhETlrngyPxetx0wErj160e
	qVjp5uwGOU0o1ekZi3vLn/eVCVig=
X-Google-Smtp-Source: AGHT+IHWgnU8Gh6meiu91jI5QkBaaB5D98H/n6XiYh76zQFqb9+AbWG8G7tm9yH49jyUUQrP8E6B7jELWHqJz9p9+q4=
X-Received: by 2002:a19:6459:0:b0:50e:769b:7165 with SMTP id
 b25-20020a196459000000b0050e769b7165mr1385125lfj.57.1705918891450; Mon, 22
 Jan 2024 02:21:31 -0800 (PST)
MIME-Version: 1.0
References: <20240122085443.637472-2-pavel@zhukoff.net> <20240122085443.637472-4-pavel@zhukoff.net>
In-Reply-To: <20240122085443.637472-4-pavel@zhukoff.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Jan 2024 11:21:20 +0100
Message-ID: <CANNYZj-YMGJQ_9s=GE=6gFWcqrz=+OJdPZnRrzq54Hp=GO=eYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] mdadm: Disable ptest
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194135

On Mon, 22 Jan 2024 at 09:55, Pavel Zhukov <pavel@zhukoff.net> wrote:
> mdadm tests are flaky and cause a lot of failures on autobuilder.
> Disable them for now. Keeping ptest code in the recipe to fix/enable
> in the future
>  SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;branch=master \
> -           file://run-ptest \
> +# Disable ptests for now as they're flaky
> +# but keeping ptest code in case we want to enable them in the future
> +PTEST_ENABLED="0"
> +SRC_URI:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' file://run-ptest', '', d)}"

The correct way to do this is to modify
conf/distro/include/ptest-packagelists.inc. There's a specific
exclusion list made for that purpose in there at the end.

Alex

