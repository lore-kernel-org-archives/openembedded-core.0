Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.259.1614185655310281854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 08:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NnYgQcRd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id d11so2548471wrj.7
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 08:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=e1JhKGNr7wyrZCdEuMveMxss5Xi/tf1Lpj7DVHZYRI4=;
        b=NnYgQcRd9bSSVsQwIwkHF8N/A56rpBeCwJXYzyJa8NRco5LgWdDPvaTGLkyn67Dlhv
         oO2owA4WzoatP1ZPLjG+xI4YheqzL0DDmzJZ6FWCuUti1+EvDGM02aF6kzvRDs926/ov
         wm3HFfgsGPVJA5PSBHgoSW1xDLD2YSies+gdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e1JhKGNr7wyrZCdEuMveMxss5Xi/tf1Lpj7DVHZYRI4=;
        b=Cf2AGuw0vIlCjXqRjJnpICo5dOGr8yqIW5nyj66nuHElnyW3F9AmesyyNum1dfAO9t
         NnYOgBl6tb/U7TJfGgFMlcgmA/ALSW/QvzOcrNWeL2FYpZKvOgs02jIh/9qzDOP70zNx
         tRgeghgpeeTF8ItnOZLusOpnq5sCA0HFbdEZWzO/bLraxNfA0yYSRvW6YQk3KIwlNMzP
         DwlcYG9+RIJViA0MyIN+9Do7tPI6h7VBcujM1LMbWYiA5mhmep74G1u8HIP3biNArd81
         p/TGY81jwsMIRx7QZGi/zE3dB2tXC8LztfOscfqjVU6mNzrPW8Y7xetx3K3dnrGJ4ZWG
         f8HA==
X-Gm-Message-State: AOAM532Fl1PpKan+lDNji2ZTJZODSc76j8Yuq9oc4dfHDfSMwd7ljD/I
	/998ZhclCV8CZQIpFctqxMvIjGQRtYD7QA==
X-Google-Smtp-Source: ABdhPJxf/KBtj9q32ecHBHJ0e+7PkOJ32Sr4yajCWCPiapf6fCAv1MIMuRo/EyDovxsuMImBTEPqSA==
X-Received: by 2002:adf:a406:: with SMTP id d6mr6571132wra.141.1614185653911;
        Wed, 24 Feb 2021 08:54:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4476:47d0:b128:f21a? ([2001:8b0:aba:5f3c:4476:47d0:b128:f21a])
        by smtp.gmail.com with ESMTPSA id a5sm4596182wrs.35.2021.02.24.08.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 08:54:13 -0800 (PST)
Message-ID: <f2bd2b27681faf5c7e73ee0e58fdb1d5d1e457c1.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] wic: Warn if an ext filesystem affected by the Y2038 problem is used
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "florian.bezdeka@siemens.com" <florian.bezdeka@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Feb 2021 16:54:12 +0000
In-Reply-To: <20210223152915.69198-1-florian.bezdeka@siemens.com>
References: 
	<7a7e2ce878209faaaa4ccd75b0d8ce40ffcfa349.camel@linuxfoundation.org>
	 <20210223152915.69198-1-florian.bezdeka@siemens.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-02-23 at 15:30 +0000, florian.bezdeka@siemens.com wrote:
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
> problem. By using `--mkfs-extraopts "-I 256"` we tell mke2fs to use
> inodes of size 256 bytes to be Y2038 safe.
> 
> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
>  
> 
> Changes in v2:                                                                     
>   - Fixed a warning reported by CI system coming from a partition in
>     /scripts/lib/wic/canned-wks/mkefidisk.wks. One of the partitions was
>     already affected by the Y2038 problem.
> 
> Changes in v3:
>   - Moved to "-I 256" to become independent from the /etc/mke2fs.conf
>     file (or even from the mke2fs compiled in defaults)

CI tests are still showing the warnings unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/3079

Cheers,

Richard

