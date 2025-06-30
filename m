Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31664C8302E
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:46:39 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.35688.1751276792624438634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fYd/lfSF;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d4495753a7so230346185a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276792; x=1751881592; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=21Eus+zmRxYNKu35QCzuWaEnjTE1pdIBU7u/UmNy52w=;
        b=fYd/lfSFT2/PHLXPz9fBLQWCa2NeejA3K+zfJ9OAhV6FRsn7ElcOOUcdZYt1u8LwbZ
         DOU2L7wdZuozuGAu620iQP8Z50OURmbIlCCtUW+aRA7zq9/SjOMJ0VgXbqmSjzNmgch5
         HkGDiS0h+juJOW13Gow3eXDuVoLcburRqjrKN2h+2nrV2A/DfbVVmj4taDElrJXj5Hc6
         /oej76GElyMEXc/TRrtAvKLuzxsrWHQe5Jck3og+VeflJss+J+e2XUn0wDg0jeby6Ton
         pag9gNcpIXV9MFJq+NUfUur1pWYFXbMwyRyb5YiErn+YE8syZN/FKFPqTguYH1QQrVkh
         o3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276792; x=1751881592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21Eus+zmRxYNKu35QCzuWaEnjTE1pdIBU7u/UmNy52w=;
        b=qzO1JS7kA3qxuxtYxiMPb0XMI1G3LYd8zmAyLN73dBXu/d1m2FAazrcSYrv0TuvpEH
         CCPvmLxOPRvtNkFoKbc0nXMtXi3jwhiCjpta5UU1eg1rgL+uhJJ+iZZ/HNHCAi3S5MKa
         oweZEth6qQSVzcw2BoYCtvvdCSolB4++AtrWhkOFYn1DMSTO4RyMO2WXuU5FwOeKBlbm
         Jc+EmGKpzRJdM8WznDZa3laTTa/4b3sB4y/qOAwVoM219GVhGIgulaSPxb2FqZZZYoEd
         0JNr7bKfa39A0IdSRCnka2ae6RAhfv+7ZpNkMCVUYw3oMZGbeauqU0J3WkiDIGrxOiVh
         ApGw==
X-Gm-Message-State: AOJu0YxpufefsK3Kwv8EsIAj1aGtVb2KidAY9mV2qQT+cJanOVCD/G1J
	wXC36813lFYA5QKbJJ914ouyyFzi/6qxotVOub5wJssA34QszEgWPjK8fNDek8qr1axDG8438lb
	KOLaslQLeL0lHpPmeG90LRpVHOTrf6ew=
X-Gm-Gg: ASbGncuzA2+OX91kFDGAAbw3QKceBhD5L+yI+nlcMp4ZYUfCSu/8mqZximKE/SvhCRb
	qj62TWk1fsgayuooe8ppjXTh7t5sS0jHkYktVwEgtX0vOTfVjSPb+11KnUnzLG5hTdbQatNpBLh
	/6scTKfV2k9ApQDd+CN22A3eQ5twXiUOYT2VnprdX3kpMHDKjuhZsbkAbbHhJsxujz/cvoldTMR
	smFkQ==
X-Google-Smtp-Source: AGHT+IEuu04gs74XNrA9P9Vse3phmR1eASR1E3xRs8LsKAD9z/20jormkXtfyXMJ4mUkI0nS7X21NX5Z524XYx8JTBk=
X-Received: by 2002:a0c:f413:0:b0:6fa:fbb4:6408 with SMTP id
 6a1803df08f44-70000add1d9mr213694066d6.7.1751276791552; Mon, 30 Jun 2025
 02:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250630091315.1897-1-wangmy@fujitsu.com> <20250630091315.1897-37-wangmy@fujitsu.com>
In-Reply-To: <20250630091315.1897-37-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jun 2025 11:46:19 +0200
X-Gm-Features: Ac12FXyVuzUPMyabFwyXBQ7bYTzqgXTh1_1yAz2EsuPxVMcrIF6nje3vJXwWVgk
Message-ID: <CANNYZj8AQm78UjypxUAe_c8EaBHhoJqOvwNU9DzHbFQZrAn_JQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 37/37] ttyrun: upgrade 2.37.0 -> 2.38.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219502

On Mon, 30 Jun 2025 at 11:14, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>  SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
> -SRCREV = "793c037ded98cd001075cdb55a9c58e122380256"
> +SRCREV = "660bab6e68fded26b2117e1dcec0844549a22fed"

It would be good to add a tag parameter together with the update.
There are other updates in the set you sent which could do this too.

Alex

