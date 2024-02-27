Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72253C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:55:20 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.10340.1709034918730713629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ai4zxY8n;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d2509c66daso59781081fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 03:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709034917; x=1709639717; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BuZacEUDBBbWTKCoYqOZqA1wl1Q1EX5ahAdn96bLKi8=;
        b=Ai4zxY8ndOaODpzwzXOvfJwTxlPe6x/wcO3ILTiuHXrgijsZIVglC5OGDnCJFzdSQL
         KOPGOAlCMVT2ONWKbZ3tAYlBz4aZVIB0sJQkoQNof7KjVyDuy33p3aB1ktALy69aDe9Z
         b4Z2mjWH6p71yTZPk01fGqyG1isFPmGyRdSltVv/BaJit/8ThxreozZNlf+bQ9aBLdq9
         3F/YUFgY1ggm61i/F7eV+uwQP+Rydp2q/mFXlt/4tBOgDdtILcF1jUg05BHvS6a12hLo
         nmt10HkYgBklzMRWw4E8aM2wib/HVu4RXk1XQD9Qej4L81TEwYVkk1iQSdkTMqQmVlVg
         c4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709034917; x=1709639717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuZacEUDBBbWTKCoYqOZqA1wl1Q1EX5ahAdn96bLKi8=;
        b=b+YKu1IqzvulVgtH+EFsWK/p8UoJWYnQA0qX49HrN4UWUQ3vWLGPg39KvlFUp7e2Cv
         RUnjkTtVqZoZfxm3e+RaaYxsAQCZ5ft2CdYw8pVI1lK7Xs4m76zEodGbwjMuFbS3lGCf
         zcKl7I/zCpoY7vAej8g/XW2zwuTtswI2b34c/HQEONgKGw2v111p1AUk1vw50QeIGzV4
         J+jKi5DKtbkw8g6hx+qGkunkbqQehbukuow82Iooxj+s+bG5ruGMR+D2N3aTFFcAvLn4
         8yiOIJtTrbAGl8V+H5Rw48WbH+dEW9FFn2jatSh6/ZOd4orvRmGn7NoCsm6kt6wLtq2T
         HOPg==
X-Gm-Message-State: AOJu0YxTq18qMxp6kewbJ6yt0j2bd9AMhBWRgoj/8nMMZq8GP8tS8gUe
	ovuTbVqtNIBM/KvjgLQxBLh1TToU+UbgE1/3M5OJz+vB7CQam2Yj7lUnQZ++LkY=
X-Google-Smtp-Source: AGHT+IGuCN+S9EPG8VuZ7r6/bQsNFQqcSGe1oTm5lciE7FC5OK30OsqWA4//KI0O0mkMNv/L9ANgcQ==
X-Received: by 2002:a05:6512:3f04:b0:512:d5c7:60d9 with SMTP id y4-20020a0565123f0400b00512d5c760d9mr8314211lfa.3.1709034916827;
        Tue, 27 Feb 2024 03:55:16 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id t3-20020ac24c03000000b00512cb12fdb3sm1151573lfq.208.2024.02.27.03.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 03:55:16 -0800 (PST)
Date: Tue, 27 Feb 2024 13:55:14 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH] wic partition.py: add --apparent-size to du
 calls
Message-ID: <Zd3NolrDmgFmAOG5@nuoska>
References: <20240227112357.2455578-1-mikko.rapeli@linaro.org>
 <d7abf62f2c7e7312c93ce6ad066aa16f81f519c9.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7abf62f2c7e7312c93ce6ad066aa16f81f519c9.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196267

Hi,

On Tue, Feb 27, 2024 at 11:48:27AM +0000, Richard Purdie wrote:
> On Tue, 2024-02-27 at 13:23 +0200, Mikko Rapeli wrote:
> > If build happens on zfs filesystem with compression enabled,
> > then image size calculations in do_image_wic task can fail:
> > 
> > output: mke2fs 1.47.0 (5-Feb-2023)
> > Discarding device blocks: done
> > Creating filesystem with 351999 4k blocks and 176000 inodes
> > Filesystem UUID: 6091b3a4-ce08-3020-93a6-f755a22ef03b
> > Superblock backups stored on blocks:
> > ������� 32768, 98304, 163840, 229376, 294912
> > 
> > Allocating group tables: done
> > Writing inode tables: done
> > Creating journal (8192 blocks): done
> > Copying files into the device: __populate_fs: Could not allocate
> > block in ext2 filesystem while writing file "service-2.json"
> > mkfs.ext4: Could not allocate block in ext2 filesystem while
> > populating file system
> > 
> > du --help says:
> > 
> > ����� --apparent-size�� print apparent sizes, rather than disk usage;
> > although
> > ������������������������� the apparent size is usually smaller, it
> > may be
> > ������������������������� larger due to holes in ('sparse') files,
> > internal
> > ������������������������� fragmentation, indirect blocks, and the
> > like
> > 
> > du -b already includes --apparent-size.
> > 
> > Same issue reported also in
> > https://lists.yoctoproject.org/g/poky/message/12389
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> 
> From memory we've gone around in circles on this. In some cases we do
> really want the size in bytes but in others we want it rounded up to
> block size for each file. I think this was why what bug was never fixed
> as you can address one set of issues but create a new set.
> 
> So for that reason I'm extremely cautious about this, particularly this
> late in the release cycle. I don't really know what to do with this
> change.

I have a build machine with zfs and this issue pops up ever now and then.
Right now I can't build there without this change. I don't see a way to
fix this issue in my build/host specific configuration.

Cheers,

-Mikko

