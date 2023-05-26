Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEB2C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 21:16:11 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.5026.1685135768479352994
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 14:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=04TXqGhe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-75b0f2ce4b7so84142485a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1685135767; x=1687727767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kpc7sZ5mT9Tj1isifRo8ViO8Wm8lWgT6dhButQ0pO6c=;
        b=04TXqGheZc8AAL4AS0/UFUR3Nap9JHV3tP6LIAhxx4XpRDan3Ks1hxOkIW0bhUzTEG
         SWNjzwKIiEnWEXdTxuvGZxvaocLOmI3rb+XbxrMYDO19Zwhdi0UCFQBQWQLLILviIObK
         Dge2urVzWMgnZqF3sLpXqVeeRgRskPcSZDX73Vx/aAXNBCeUl2cf5WPjQ7puv6+WnARz
         vQooriRiY++SvsJnqghvTftyZP13hIivmsF02+wnLURXPipQ/smIla2bQUt+Zg6m+FTR
         gVtzg8yMsqhsiRvbjKOWCSJTbex5xN+T6vFCoA6u8zk1eEd6p566nZatdUi+dJpUgTIb
         IUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135767; x=1687727767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kpc7sZ5mT9Tj1isifRo8ViO8Wm8lWgT6dhButQ0pO6c=;
        b=WTjI3u02bgeUOJyrJv42NqkrzyXPjy0WcmtbWdgVhymOHG7q0nj5/AwVIQ27k59CtQ
         imVDRNRdHX+xFC5s8sS65SxC3FxHp8o6c7BaYbqwNOnQ9wzPRo15kR708mUT2TtNYfMK
         BFFjjs3YsP+I2wlhHJZa93n8zGUntXXvj5kPRd5f+AqKHljQbntg12TsY/t9PIGNccR8
         sZSrUOmX/mphsrEUnPwnJWZ8pJ7b0r6tOEIQ4PuehRcEIe5jGsXlBGge5QXO9MjltNuH
         hf6rhDTyt9L7KLWLW0BRyE2/1lkwMGafqJ8Vq5nPOXZ6I/hr0wHQrYd1S2A0+47p/zYr
         VA1w==
X-Gm-Message-State: AC+VfDwNhPTJy6KnhGbmA2sKLKo1Kx903WdUd6WQw3bdtQk94JO9cbAB
	tnldFDEINHfzRfB5Ersa5qpk8A==
X-Google-Smtp-Source: ACHHUZ6z5nkCIOVqS0hlu78CHX4copojXDkPmwHDHF+LyVeztxObIAdg5/+oT+kStgzZ50emHYxHHg==
X-Received: by 2002:a37:a90e:0:b0:75b:23a0:d9c2 with SMTP id s14-20020a37a90e000000b0075b23a0d9c2mr752860qke.24.1685135767539;
        Fri, 26 May 2023 14:16:07 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id t7-20020a05620a004700b0074d4cf8f9fcsm1418120qkt.107.2023.05.26.14.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:16:07 -0700 (PDT)
Date: Fri, 26 May 2023 17:16:05 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Jon Mason <Jon.Mason@arm.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: gcc 13 merged, meta-arm, meta-intel and meta-virt issues
Message-ID: <ZHEhlRXG8GHFCeaS@kudzu.us>
References: <f7d8cdc485e3d75304bd41931292f0cb76083e14.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d8cdc485e3d75304bd41931292f0cb76083e14.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 21:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181780

On Fri, May 26, 2023 at 05:28:21PM +0100, Richard Purdie wrote:
> I just wanted to let people know I merged gcc 13 since I think we'd got
> as far as we were going to without the patches landing. I dropped the
> 5.15 kernel and found ways to fix lttng-tools and glib-2.0 ptest
> issues.
> 
> This leaves a few failures on the autobuilder in other layers:
> 
> meta-arm 5.15 kernel bbappend:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4038/steps/12/logs/stdio

Sorry, I meant to push the fix yesterday.  It's in there now.

Thanks,
Jon

> 
> meta-intel intel-mediasdk do_compile:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4488/steps/13/logs/stdio
> 
> meta-virt xen-tools do_compile:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1691/steps/12/logs/stdio
> 
> Hopefully nothing too difficult to resolve.
> 
> We're now in the process of a uninative release which will hopefully
> fix some of the other autobuilder failures.
> 
> Cheers,
> 
> Richard
> 

