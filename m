Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B23C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 12:55:27 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.4557.1652878524548988860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 05:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mKDo58wU;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id q130so2416073ljb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=6AyJAtxJ194LOwCYgnhfUdZjYI1jdb/a1dZjSY3SFaQ=;
        b=mKDo58wUI/EernAj/4BhKUKDERV5fZyxOLkP98GpKhRwcEV6CvvPfKVYPocEueg2A1
         9+AMd5515lQmgO03Tbp5yk4ZBAu8TOYoR/mn8ufKyGKdJbNPsWXUubdKov68sB6UBdCM
         2mltIwugtOwPwnOzyIetQM0TUZO+hhxQ5B0ahxNRwTVdE8Wc3RiCr3zZUbaprlaratUn
         yxUwWhCt8bN+FFq4PjaNtKF3pBnUcWWnVA2ny/CZQiaFhqr2pOIKatDkR3qyc1WpJunr
         4rlIH4tqnzcp7HGPyYAS/WahEl3QUe71OqQIpRUPm5SuQ3abGeW4MaVMD3ZI8RxEpWn/
         yeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=6AyJAtxJ194LOwCYgnhfUdZjYI1jdb/a1dZjSY3SFaQ=;
        b=YSC9t2EH8yZJPhPLe2a9buhxKXoYOIH7WSMMzjUd4W1XnAyWU410G5dMngPhG3As4c
         PlzLyVTknnWnSfAI8pgOH5UyVv/KHRKbNbLOuLWv0evYNwSJZdistKkuerBGf4MOxYJd
         vh642guI5PAYKBrrBr0NfcolFJ0BUmFfJdxgLde8bB20SYOmA4cY5lTqrlWIzQcrOJij
         nDBx471P/KReg3L3+7ia2OsOabFerHWFQg5cAER+yJG8V5Dr043zriOeNzndrMESx3E5
         Uqp+v8KTQ9ftIeoSw+ZBXdpfSnn/n/cxJwFnilLvRGiNm6TjXC09cSO8SPBPDrwI2ZsO
         elYA==
X-Gm-Message-State: AOAM532W6JmPqiiUfhdPozk4Ia2C0M60buA3IkEQoK1GJGQXDKUPdVpF
	iHgZIQ6WGUPjbfKsk2LWM3Yce0fj+p0=
X-Google-Smtp-Source: 
 ABdhPJyCZLekffO7y8MNwuZVKza7mqJsDUTZmjSulxJnXRw5BvPMeFS0y4AJjs3n9vAy9/II9ySYUw==
X-Received: by 2002:a2e:9bc5:0:b0:24f:b2c:6dc0 with SMTP id
 w5-20020a2e9bc5000000b0024f0b2c6dc0mr16576694ljj.280.1652878522267;
        Wed, 18 May 2022 05:55:22 -0700 (PDT)
Received: from clst-linux ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id
 m1-20020ac24241000000b0047255d2118asm203396lfl.185.2022.05.18.05.55.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 05:55:21 -0700 (PDT)
Message-ID: <0bc27fbcd5ead0feaef26e96be12bd6115b5593c.camel@gmail.com>
Subject: Is BOOTDD_EXTRA_SPACE from misc.py used correctly?
From: claus.stovgaard@gmail.com
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2022 14:55:20 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 12:55:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165852

Hi folks.

I think the BOOTDD_EXTRA_SPACE is used incorrectly in bootimg-efi.py
and bootimg-pcbios.py?

The background is that I am forced to create a rather small efi
partition of 25 MB. Not a big problem I thought, as the kernel, plus
initrd is only 12 MB. But the resulting partition was 28 MB.

After some digging I found this identical part in bootimg-efi and
bootimg-pcbios.

    blocks = int(out.split()[0])

    extra_blocks = part.get_extra_block_count(blocks)

    if extra_blocks < BOOTDD_EXTRA_SPACE:
        extra_blocks = BOOTDD_EXTRA_SPACE

    blocks += extra_blocks
    logger.debug("Added %d extra blocks to %s to get to %d total
blocks",
                 extra_blocks, part.mountpoint, blocks)

So we calculate some extra blocks and if the extra blocks is less than
the requested extra space we add BOOTDD_EXTRA_SPACE.

Why the value of 16 MB.

My guess was that it is for forcing mkdosfs to do a fat16 and not a
fat12, it need minimum 16 MB

A quick test showed that 8 MB gives fat12 and 16 MB gives fat16.

clst@clst-linux:~$ mkdosfs -n test -C test.img $(( 4096 * 2 )) -v
mkfs.fat 4.1 (2017-01-24)
mkfs.fat: warning - lowercase labels might not work properly with DOS
or Windows
test.img has 64 heads and 32 sectors per track,
hidden sectors 0x0000;
logical sector size is 512,
using 0xf8 media descriptor, with 16384 sectors;
drive number 0x80;
filesystem has 2 12-bit FATs and 8 sectors per cluster.
FAT size is 8 sectors, and provides 2041 clusters.
There are 8 reserved sectors.
Root directory contains 512 slots and uses 32 sectors.
Volume ID is bbbd3650, volume label test       .


clst@clst-linux:~$ rm test.img 
clst@clst-linux:~$ mkdosfs -n test -C test.img $(( 4096 * 4 )) -v
mkfs.fat 4.1 (2017-01-24)
mkfs.fat: warning - lowercase labels might not work properly with DOS
or Windows
test.img has 64 heads and 32 sectors per track,
hidden sectors 0x0000;
logical sector size is 512,
using 0xf8 media descriptor, with 32768 sectors;
drive number 0x80;
filesystem has 2 16-bit FATs and 4 sectors per cluster.
FAT size is 32 sectors, and provides 8167 clusters.
There are 4 reserved sectors.
Root directory contains 512 slots and uses 32 sectors.
Volume ID is bc573a89, volume label test

So would a better solution not be to rename it to BOOTDD_MINIMUM_SIZE
or something like this, and change the code to something like below:


    blocks = int(out.split()[0])

    blocks += part.get_extra_block_count(blocks)

    if blocks < BOOTDD_MINIMUM_SIZE:
        blocks = BOOTDD_MINIMUM_SIZE

    logger.debug("Set %s to %d total blocks", part.mountpoint, blocks)

Can see the current behavior is pretty old - from 2014
https://git.yoctoproject.org/poky/commit/?id=df634f3b1e02aa18f84b4b74f13c7260a21691aa

Please comment about the BOOTDD_EXTRA_SPACE
What do you think about my proposal.

Regards
Claus




