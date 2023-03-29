Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9A6C761A6
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 08:38:04 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.19389.1680079082596236615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 01:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LQo1BDag;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id y20so19179179lfj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 01:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680079081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9+VSk6DRt8rUHWYOG+n8MzclWrhVms7ZS24lXx9Ahyk=;
        b=LQo1BDagWCILzxEjPfnhnkjLYWLTGjCUiT2tmmxCcm99vTU4JD3aLyeK1Z/iWgDIJ/
         EJsriZTwwe1bChX1+TL8cu5mYlpCVOYm3jGaBOxEiXTathfrfhOYw5OiFnVpsFFxoDDL
         d2YOjZ/tQ5gMpW4dIjZGskN/5HMW/O33bNgbjHlOka8syhUVnDDgRqyphO4ntLUYTfCr
         ixPNp3BNVbeTYZ7o/1Vib3d7nZWekgWElDSOSOlwaDe1tCo5wK1wESn/N3i4jRpc6x90
         rrY33VbexPOHH6ycaEOZiy96C0o63ur4AiaOa8WXEAvUtIenyjLrSH6jrirzzu2nnxc0
         BcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680079081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+VSk6DRt8rUHWYOG+n8MzclWrhVms7ZS24lXx9Ahyk=;
        b=lalx5AowxWZ9FVOLssDo1q+ffVSrFWR7TT7Aqe9KU6+SyCjqVLGT/w4wb/KOLKD/3x
         nOqlt1D3a82eYmejFSfBVQtNkmxNyYeraMIe8tk7JCSl8G7DnW+48qCbdO8sV+zTBRZ8
         iE36Ky17h4uUvUQXL0jGqBLFA3qcU+Q73BtJbqcCsWqFpYzJ3+dDDcFZ27Oozu67iaoV
         4jendOEqzpSf5KSLWHz+rYw9w/XZkmaaJoLK7R1yCOZXHVFpkgSNysqYxPuZNJv1gR7d
         8eUgwm0CBoSSsJk61WpWeVhX3KXLRVPn0C2RUH/yWoe1OyFIMyYAjZbf+HIAIX1Fk01/
         mkCg==
X-Gm-Message-State: AAQBX9ctKZh4PcEStda4rcDmmBUezKwLHJg6MwSCnc75XaI9T5BpFuzO
	1NfgMKC1ARDH9lcUdrXorXetp/KY95SA5DZ/kU8=
X-Google-Smtp-Source: AKy350Zl5F9WDPnfUFeQql8ootzX4QM/LoRk8DxLlbKuuytVTeTGT4IKlwnMp05cU1PGXbLsTMgUSFIToJNUS0+H71k=
X-Received: by 2002:a05:6512:23a3:b0:4d8:86c2:75ea with SMTP id
 c35-20020a05651223a300b004d886c275eamr719210lfv.3.1680079080668; Wed, 29 Mar
 2023 01:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230328214351.3666478-1-raj.khem@gmail.com>
In-Reply-To: <20230328214351.3666478-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Mar 2023 10:37:49 +0200
Message-ID: <CANNYZj8zb4PnnhFUpPKsmcWRHJjjv7ATWzi61EU+YuaJrNLGvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Fix build on 32bit platforms without
 64bit atomics
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179268

On Tue, 28 Mar 2023 at 23:43, Khem Raj <raj.khem@gmail.com> wrote:
> +Subject: [PATCH] ANGLE: Remove static_assert for 64bit atomics
> +
> +This will make sure that it can be built on 32bit platforms e.g.
> +mips32/ppc32
> +
> +This partially reverts https://chromium-review.googlesource.com/c/angle/angle/+/4205892
> +the suggestion to remove the assertion is from the author of the patch
> +itself
> +
> +Upstream-Status: Inappropriate [32-bit specific]

32-bit specificity is not in itself inappropriate for upstream
submission, can you please either submit upstream or open a ticket and
refer to it in the patch?

Alex

