Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9A8C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:41:03 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.8765.1749721260198564351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BphjOJKp;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: fbberton@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so458673f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749721258; x=1750326058; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MAxCcTCcMSt/W8EEuiKNyrABGt7ATerGiby73nXiQY=;
        b=BphjOJKpZucxYY3s8FuXEJi1jeOkVgoXsTPKM1t8wX3cd5bNtvIzZ8XnZJR1HhrYka
         14x9MvD/MKWoLhMV9k5UmdNYcE/gH7AzfKzqHfafTuLC+45IRqhxykjQ0OnxX8NeunTK
         g0Aw7vL/yJyG+r4KA4EClD5+y1CoiNBhlnpgdswveWXDkH+OVh06v7r0BESfHVdsJTK8
         fVn0h1fa1oJcnJWoXc1jDjFZ4ix8dDTBdVYY/e5DCkX5l15ZtwvhOiNkEmta78FL3hHj
         Gxp6ctAR7S8L+JP8icQw/WwaxxPzCCM8g21qxKZXFtYGeZNGEPrgZYX+P/pkwEjWobAb
         BRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721258; x=1750326058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MAxCcTCcMSt/W8EEuiKNyrABGt7ATerGiby73nXiQY=;
        b=NXdWzsMrgBkn1MVzY3JwCWJ/uO3eMYsC428qy+anqJR00A3ik/EZ1nVvUqTwqebOG9
         8IdUPR81cLOr8MXum3o1vpzhxW1yrLI8lX1T5qtywG1KqjOlGL+/wMKk/fGX4puIrVV8
         7mZtRs7k5/8APNn0Bi7gqm9Pl5ZGPSIBYSHaF1G3YEkOh75Mv5YfBPXNJxp9um5tirkU
         ADeXjFm56uMeNjtoP1OEt78v37VNHJX+EC7CXVLd5Z+/4+5dCjQJNiziiopUBCw8pORP
         m6ZNS9scFHDIzR4mRM9kwUb2isic0Sgh3BJ4AGlFpEEE2eVK+I6+0DF3kyw9o7D3AS7d
         LQfg==
X-Forwarded-Encrypted: i=1; AJvYcCVkVfVnVsJs6Tvb1W7uK10uUEShAkjMvP4418KzZeKvF18Br26Oj9hMx7u9C2CJGt9Wr63Z6jN6TwWgXMK327rXiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywo7tK4UcjTNnaYWR+6dxLp9FqMmCTxao8QJ7P3+OlpyGMZIcuk
	rlnSI8tce+cZO7mrZRjb7PSbWEjgDQqQUSUHy+hdPJA0H1QsVEuMbkyT
X-Gm-Gg: ASbGnctIP9fXENzyCv82lxFt9bPVOXoxfU4ENsGojVa8qMtMHY9zhXqlnZZJ+DOCY/T
	2yZH50Piln/7sgU5kJlJvsnyw+eVRatK1NLxGhC7oSg6/cRdhjuF98KMr8vajzQxf5h+Si3XGd0
	lMbIEwW3aV2dUR2okwza1LtWBQI/S3MS3bbCsv6P4eRNKVeJi5pQ0CVn5Pw4+zdi9Lyb4/gNzfP
	rICMH7SS6nuQNMV1Hq4iTwdGAPK7Wvws1DIGFUUbBUr7vPd0sxjWtpPx7hSN2/4A0ZswttC+jKA
	Y8xsCRNmnaFe+Q0Bugze6UPbmiJqoDGoGE5V0i0eU+4qb8Wl2UrpCuNSRg==
X-Google-Smtp-Source: AGHT+IHbpDMkleCMeJdkdnVatBVXCvAFSsVZMwS3QOhe6ygm4Jo1azcdfmOWqwMMFE+O5sOKr05wtg==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:f936:7882 with SMTP id ffacd0b85a97d-3a560761a96mr2341524f8f.55.1749721258293;
        Thu, 12 Jun 2025 02:40:58 -0700 (PDT)
Received: from localhost ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b65abfsm1472526f8f.92.2025.06.12.02.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 02:40:57 -0700 (PDT)
Message-ID: <67d3c290-563c-4429-8c37-58fbfd3868d8@gmail.com>
Date: Thu, 12 Jun 2025 10:40:57 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] classes-recipe/image: Add variable to create
 rootfs with a exact size
To: Quentin Schulz <quentin.schulz@cherry.de>,
 richard.purdie@linuxfoundation.org, openembedded-core@lists.openembedded.org
References: <20250602213004.2123954-1-fbberton@gmail.com>
 <31284b0f55e3c18957c9340cc399f1c0c9a8410a.camel@linuxfoundation.org>
 <daf0b71a-c495-4a1c-88db-d841761fb866@cherry.de>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <daf0b71a-c495-4a1c-88db-d841761fb866@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218491

Hi Quentin,

On 6/3/25 10:15, Quentin Schulz wrote:
> Hi all,
> 
> On 6/2/25 11:37 PM, Richard Purdie via lists.openembedded.org wrote:
>> On Mon, 2025-06-02 at 22:30 +0100, Fabio Berton via lists.openembedded.org wrote:
>>> From: Fabio Berton <fabio.berton@criticaltechworks.com>
>>>
>>> Add the IMAGE_ROOTFS_EXACT_SIZE variable to allow the creation of a root
>>> filesystem with an exact size as specified by the user. This bypasses
>>> the default size calculation done by the get_rootfs_size function.
>>>
>>> This feature is useful for creating a small ext4 filesystem with a block
>>> size of 1k. The get_rootfs_size function uses a block size of 4k to
> 
> That's just the default, the function directory_size takes a blocksize argument.
> 
> I'm wondering now if it really makes sense to have IMAGE_ROOTFS_ALIGNMENT not be a multiple of the blocksize passed to directory_size (well I guess the issue is that we then apply an overhead percentage on it, which may misalign it...).
> 
>>> determine the size of IMAGE_ROOTFS, which may be larger than the value
>>> set in IMAGE_ROOTFS_SIZE. If an ext4 rootfs with a block size of 1K is
>>> nearly full, the .ext4 file generated by Yocto will be larger than
>>> expected due to the way get_rootfs_size calculates the size.
>>>
> 
> From my understanding, this means we'd be exceeding IMAGE_ROOTFS_MAXSIZE? Does Yocto fail the build because of that? If not, then I'd say we should fix it somehow indeed. If yes, this feels just like misconfiguration to me?

The problem is that the image is always larger than what is defined in IMAGE_ROOTFS_SIZE, because directory_size always uses a 4k block size. So IMAGE_ROOTFS_MAXSIZE doesn't help here.
> 
>>> By using IMAGE_ROOTFS_EXACT_SIZE, users can specify the exact size
>>> required. Users should ensure that the size is set correctly according
> 
> To have the exact size, isn't it just IMAGE_OVERHEAD_FACTOR = 1 and IMAGE_ROOTFS_EXTRA_SPACE = 0? Though I assume you need some extra space for the ext4 journaling for example?
Yes, both variables need to be changed. But if I know the partition layout I can set the size in IMAGE_ROOTFS_EXACT_SIZE, at least that's what I'm assuming, correct me if I'm wrong. What I did was to set only IMAGE_ROOTFS_EXACT_SIZE instead of changing IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE.
> 
>>> to the filesystem requirements. It is not easy to predict the block size
>>> that is used by a filesystem because it can be set by a parameter or it
>>> can be added automatically by the tool that creates the file system.
>>>
> 
> Should we have a get_rootfs_size that is specific to different images? e.g. if you generate an ext4 with a given block size, and then another file system with another block size, get_rootfs_size would need to report something different for both?
What we could do is get the blocksize from EXTRA_IMAGECMD.

> 
> But I agree with Richard that we already have too many variables there and this feels a bit like a hammer solution for now?
> 
> FWIW, we recently had contributions to the documentation for this piece of code and this was one of the contributions that took the longest because the code is already not that straightforward to read and understand so adding yet another exception/variable will not help with that. Maybe that's the only option but maybe not, maybe we need a bigger rework to simplify all this.

Ok, I understand your points. Thanks for the comments!
> 
> Cheers,
> Quentin


