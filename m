Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.36757.1614009576198724423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 07:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I7he1Gn6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id p3so3868396wmc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 07:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/W1CzFdluXeDXqS19LVVRuwGUVVrX7bBSRvFHy+38vI=;
        b=I7he1Gn6mhjguTsLZZ9riiSfFHO4kbdYSevlZ9LaRioF0qvwkeZpmQRAAWPJ+8NkNd
         YsPJQNOxE6sR6nwIyK8a+2ry9XFl2a9mgC+AQIK8yz7NiaVNIAf8UirlPiTrl53ZGG97
         9zLfUKjQISx/+OR9yRnHl5cwqHo4PWAdJE98Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/W1CzFdluXeDXqS19LVVRuwGUVVrX7bBSRvFHy+38vI=;
        b=qUCQeXkhsrMKFg7ZaGa41RMkg0xK4vIT1HbOZl4OjHkCzGq3m6G6TDNMVQ9CRlik0j
         9WDS9wanMnS4aTKzym2Z2cG9GtkeAEiyQRVgRDMIGJhdaJRPi+9R9ff44gTPohHxBDu2
         ZWD6xdax53B5n6QVvOsxq8zVvxPzBoVgceRumdossQKseX/CtjTUZ4zOGu6FJ2a/L54L
         ztJm8mBHOTJdqvSRSjlfqWIdBIY8U4hvDqfFuC+CQG4Xi1pXhvtXJZwLcTRRLLs9exxz
         mn111RnPLEvmQjOi8LJndAhVMfuHE0ZFTcPE1OKLxL+cMLoDPtqvDEfbKXC96dF6Fg0Z
         6HLQ==
X-Gm-Message-State: AOAM530B7/UeFmovT8jOqJpYKBeiR/sOrN80OZjMRqsVr7bpa9kGuFoA
	Sx86DXW3SA4U74gcneeRcRVd0Q==
X-Google-Smtp-Source: ABdhPJzFSE84wMHY+8IuobLO95tYBwnbihAQ+ixmUTBwGcr994ykXMxepsz5jpzsbhR77f+Z/ygfyg==
X-Received: by 2002:a1c:e143:: with SMTP id y64mr19883056wmg.109.1614009574686;
        Mon, 22 Feb 2021 07:59:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6747:849:8224:46bc? ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id r15sm10323301wmq.47.2021.02.22.07.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:59:34 -0800 (PST)
Message-ID: <7a7e2ce878209faaaa4ccd75b0d8ce40ffcfa349.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] wic: Warn if an ext filesystem affected by the Y2038 problem is used
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "henning.schild@siemens.com" <henning.schild@siemens.com>, 
	"jan.kiszka@siemens.com"
	 <jan.kiszka@siemens.com>
Date: Mon, 22 Feb 2021 15:59:31 +0000
In-Reply-To: <20210222114120.32592-1-florian.bezdeka@siemens.com>
References: 
	<5b5b7cb71b40268712a8bf9d18e33bf6901cebd4.camel@linuxfoundation.org>
	 <20210222114120.32592-1-florian.bezdeka@siemens.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 11:42 +0000, florian.bezdeka@siemens.com wrote:
> From: Florian Bezdeka <florian.bezdeka@siemens.com>
> 
> We are getting closer and closer to the year 2038 where the 32 bit
> time_t overflow will happen. While products (= embedded systems) with an
> expected life time of 15 years are still save the situation may change
> if your system has to survive the next 20 years.
> 
> ext2 and ext3 file systems are always affected by the time overflow, so
> let's warn the user if these file systems are still being used.
> 
> If ext4 is affected depends on the inode size chosen during file system
> creation. At least 256 bytes are necessary to be safe. As ext4 is
> used very often (and partitions may be created small first and extended
> later) this might be an issue for many users.
> 
> One partition of mkefidisk.wks was already affected by the Y2038
> problem. By using `--mkfs-extraopts "-T default"` we tell mke2fs to use the
> default usage-type, so disabling the auto-detection of some tuning
> parameters that were dependent on the file system size.
> 
> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
> 
>  Changes in v2:
>   - Fixed a warning reported by CI system coming from a partition in 
>     /scripts/lib/wic/canned-wks/mkefidisk.wks. One of the partitions was
>     already affected by the Y2038 problem.

I added this and reran but its still showing some warnings unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/3065

Cheers,

Richard

