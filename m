Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4763C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 07:18:51 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.8204.1634368730757297242
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 00:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R6/W5rIj;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id u21so48433366lff.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 00:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=jSgDMe4/5/O66enkRipxuipp1AYL/GIZIgbsBDPPVtY=;
        b=R6/W5rIjc3yN4ed5qwzJrJgRSiqkjBtyKg0jHuh94rrxM4KQ4bD0t27rVRMjErHsRB
         l/ydZb5tFcdAkgJIp7CXTx/pTb+pNhs4WXmp/4GkfY7blMIgbtbmOcvQllOc6c7m9oy8
         ZayLxx05sTKmnekyY8WlXcxKUm6LvhWjicvA5t4L2kBebwCkCt7i4fmKV69ke/sKOa8h
         XtAC3FFhqWnYRHPBfpgam0gbvBTkbFWIc5WY2sgZvCRD2VaHQDJM4fQgFmqqbXLc2gKT
         qW9pwE271VLH4OXCpIkrXLuCsMQZKPXsZi5PegzuqJsIJH5MoXZfvvKlKfkKxQvS0clP
         IuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=jSgDMe4/5/O66enkRipxuipp1AYL/GIZIgbsBDPPVtY=;
        b=X0VHlBrA0hNYNUYHDnuZtXueajtRDyQN9YO44ZulGRaSi3sh6yXDX2IhGUlJ57c3oq
         boAzRrUflupZlPUuC7et+zT4McVfcg/KQCKsbEM0N+pI+2CZsLDQnsosL4p9j61J3+4G
         zQTCz4GQR7/cc2fFalHwDgH7leLJzHU7/Wsga/7Hk7Iv5Ygi3PN54oAXFJiWDJ54qDAU
         0YzyzP/zGnMtqUerrMk078dv61j3rTXKi0mMTZSO7QI4HPESg5SJgkYlmoUj1lop26UO
         I454RwWDc8MoT94OjrWu/QVPJ1i6RAJLWMsE9BddYZXL9z/AqoCQHL2lZ2C5zW4nORpP
         V2Tg==
X-Gm-Message-State: AOAM531ThQpg+5u0tcNIcYVMJIkPDpqfDMPb4vRA2tYDo8ZcIz2evFeZ
	lJHvv99Qo14ShmRRot0v30jYsN9SA8n2FM+u
X-Google-Smtp-Source: 
 ABdhPJz9LqjJb3aeFV4a0tRg/wkkzMVAsBX9tEqLKH+AzcTu0hu+7IAolO+apK272euesr3t5RhEhw==
X-Received: by 2002:a2e:a78f:: with SMTP id
 c15mr11533032ljf.119.1634368728652;
        Sat, 16 Oct 2021 00:18:48 -0700 (PDT)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 c1sm822405ljr.111.2021.10.16.00.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Oct 2021 00:18:48 -0700 (PDT)
Message-ID: <c256053f-1b9e-376e-4159-223c9f261407@gmail.com>
Date: Sat, 16 Oct 2021 09:18:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
From: Jacob Kroon <jacob.kroon@gmail.com>
Subject: linux-yocto: Set CONFIG_ATA_PIIX=y by default
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Oct 2021 07:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157011

Hi Bruce,

My Yocto images (which uses the linux-yocto kernel) stopped booting in 
QEMU some time ago, and after some debugging it turns out this was 
because the upstream Linux kernel removed the legacy IDE driver. Instead 
one should use the libata driver. However, I don't think the linux-yocto 
kernel has builtin support for the HW that is emulated by QEMU by 
default (PIIX), instead it is built as a module, CONFIG_ATA_PIIX=m. If I 
set CONFIG_ATA_PIIX=y, my images boot again.

I did a "make ARCH=i386 defconfig" in Torvalds master linux tree, and 
the .config has CONFIG_ATA_PIIX=y.

Do you think it would make sense to have the support builtin in 
linux-yocto aswell ?

Regards Jacob

