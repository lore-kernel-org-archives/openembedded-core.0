Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19323D7831A
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 12:59:39 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.172299.1733144370166776657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 04:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xhy2JzO0;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d87f7f2f5bso26977436d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 04:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733144369; x=1733749169; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NpzsKyZEt5xyeQ2APwOC1DWyb9E/aNU5b8IDEhSpjQE=;
        b=Xhy2JzO0r0nua1+4JQ1d4RCN8KOnPW+fpVXyHKNxZ+1QTJQ4zZPS7F80qI3h4w5F0g
         hqvlDCVF3ViM/i98FPduzNfuMF3zxCHXp2MQkSiybQkcH8Bz00gnCZg8x9MuXWre/Ul2
         1eCOMqKsvSTcdPxfwuXLQxxJvIpsVyWDt2btLQKu6GVLvqFEzfi8x9qGI04IWrey9xZJ
         bt4F7qgTnEmBig2Uv6c4Zc+QatNTnGnoRkByz3XPaXqXNA/FtOBEjYaW9xh2OQ2K+RVH
         Cn3xzmIhkLn5o9LJnp+X2cfdc7/YtMSpCJtiy1waLo+8vt/CxOQgzPIp3jWlEbd/HjaL
         xI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733144369; x=1733749169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpzsKyZEt5xyeQ2APwOC1DWyb9E/aNU5b8IDEhSpjQE=;
        b=bxpGp2kbH6FieppfIxxc338ejvCqua+KQPRfhRSI3bx5asLFHhBz5XUXqlH4Lbje4U
         hnIiuOaCsnH/N9R2JpRl1OkHwDk3kwUpXLTBE8TVtN4z29NZWsy1jPbznk8KBlxf4Chy
         KfklRMXkUcUgj/7tNAsV1X7xHAr6wpZqAivXe/two7qs7YlE2tkRU67GznhVYkhHjUDF
         nCDUReVcN+ra3xAQNkdKkzAkIlUVPjyzY9I2ylsS+SjorGU4Ld0x0Gti0wTYmxPCYclW
         0TuyLkaps6Dkgnv9ttXHm166p9g+IaZqNpHJoLFTnheJb8oOvT5Im+vLFeS80z5yOBWk
         RjKg==
X-Gm-Message-State: AOJu0YxLe/FvdMAQ2NurynThdHT12CPz7FEzIEcUtHW7xRZOwJWqPgib
	W3hlNglWcKmk6m/IKn20h6IB602d2kGevx5BTlnZoscYxKm4y03kSvROsLdDZ+jjrx4Zvj5wJ4b
	ijJpssryI+adr/PY3wwsFVx11CQ8=
X-Gm-Gg: ASbGncupgT2ONBKywxsSQrO0e2M8mckpn/4eZjo4j3oyiWv+8V7BX5I5arLNOVLL6XZ
	JAr0KjC7iVLlGens1yYn8zV2PZEQJTup2LDjDpEnSVEEMGDPp4V9aJ99Zb487KUb2pw==
X-Google-Smtp-Source: AGHT+IHs6WWdpMCazEG2nFMrBpH+R+jf7C1QL7wEvRVs/bkZrr8BPaCt2wdm8d0YsJMP6bQz4i0gqQHTJEVTaTrcT8s=
X-Received: by 2002:a05:6214:529b:b0:6d8:838f:8b54 with SMTP id
 6a1803df08f44-6d8838f8dcdmr264042246d6.39.1733144369146; Mon, 02 Dec 2024
 04:59:29 -0800 (PST)
MIME-Version: 1.0
References: <dA0U.1733143237002092564.h5iC@lists.openembedded.org>
In-Reply-To: <dA0U.1733143237002092564.h5iC@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2024 13:59:18 +0100
Message-ID: <CANNYZj_kb7hF-8C_uqt=spiXw-jurvKNrWBXD_dNG2NuW89cOg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][backport] rootfs: Ensure run-postinsts is
 not uninstalled for read-only-rootfs-delayed-postinsts
To: nicolas.gillen@agregio-solutions.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 12:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208146

You can simply do the backport yourself and send the patch with
[scarthgap] prefix.

Alex

On Mon, 2 Dec 2024 at 13:40, Nicolas Gillen via lists.openembedded.org
<nicolas.gillen=agregio-solutions.com@lists.openembedded.org> wrote:
>
> Hello,
>
> I need to have postinstall scripts working on a read-only file system on scarthcap.That's why I would like to have the commit 60f587475dda99eaa07848880058b69286b8900e from master backported to scarthgap.
>
> Please let me know if there is a better format to request this.
> Thank you!
> --
> Nicolas Gillen
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208143): https://lists.openembedded.org/g/openembedded-core/message/208143
> Mute This Topic: https://lists.openembedded.org/mt/109878651/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

