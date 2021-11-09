Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008EAC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 10:26:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.10389.1636453590788329314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VqnOfNi5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d3so32067912wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tc29NCsDKBqcIFDR+0ru+ht/Hkk7tgYiiddOu3rkI8c=;
        b=VqnOfNi5lAansyGz8mgrv2ejhO+HMTaDqx/WkEHquBxec0q454OFwUxlMjSgutoeu4
         /KsTSFYGS3OUuqx2fTKqmlGczAhObpNK5G7808zQX386P5m8tkm9KYDHLVhibzmGzsmm
         9Ks6n8MjmvpI1u3s2yzbESNdbPxKxrp57NTH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tc29NCsDKBqcIFDR+0ru+ht/Hkk7tgYiiddOu3rkI8c=;
        b=cW6eI4yVywfW7JJ6a2BB/GPfABzSnSjDawu8BxcVcv2RdIpx5TFHqctOoFmfiifUuS
         jSYjwwVNiqGcYYJZzFz8w9DcNhS8eKGYGPBfHVTYVn12lJ1zpf4XhOkYv3XRWMzUdNfM
         61AoE/eWwcLlUYE6BcaZHOUYswHpxHhuJwZkplSny+xM53eIr+dkXtU1uRzhPklfFotE
         eA17eJ3bBAUE5wyrpoUe4a80mRoGBqSZtuIXFbhe10ULHJavL2Ux7yTiNwvtlCbF4wp0
         YqRCOxC6w4zFs2hON8IOe3zPIhWdQaT+LjK1A4ygebtCBqrCylfBG12zOxslIJ7suzFk
         b4rQ==
X-Gm-Message-State: AOAM530UNT8kNjxcMe+iOvR+s5UTRj6hQniQXU1/XcDaJITcanMTvmip
	xLiHt3mP269QchCuZEG5pd7CHg==
X-Google-Smtp-Source: 
 ABdhPJwOxc3KKqK6USczAz4CwDE6UARbSKHEA8XDFfH2x2ceU0uC5DUg5AduEmoG25HILA09urK3tQ==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr7910272wrd.420.1636453589259;
        Tue, 09 Nov 2021 02:26:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:10b7:e9c6:d1a:6f7c?
 ([2001:8b0:aba:5f3c:10b7:e9c6:d1a:6f7c])
        by smtp.gmail.com with ESMTPSA id
 l18sm20347028wrt.81.2021.11.09.02.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 02:26:28 -0800 (PST)
Message-ID: 
 <4cea3606226d54d229d0103281160343b041eb3f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Robert Yang
	 <liezhi.yang@windriver.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Nov 2021 10:26:28 +0000
In-Reply-To: 
 <CANNYZj9RmumFVXjgoLzEM9eUAk0-rc6+oWjuDUfk+m6uFqP1jQ@mail.gmail.com>
References: <cover.1636447679.git.liezhi.yang@windriver.com>
	 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
	 <AM9PR09MB46429C45C98E52EAF652EBF0A8929@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <f4b8c857-395d-2091-00c5-5c96a2ce536a@windriver.com>
	 <CANNYZj9HcjwtHKqLwY2icgTrvK_SJzD5ue-4Gf38hrwPH8Yo3g@mail.gmail.com>
	 <dc06a051-c271-892f-ef5d-ce265ac45151@windriver.com>
	 <CANNYZj9RmumFVXjgoLzEM9eUAk0-rc6+oWjuDUfk+m6uFqP1jQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 10:26:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158009

On Tue, 2021-11-09 at 10:56 +0100, Alexander Kanavin wrote:
> On Tue, 9 Nov 2021 at 10:51, Robert Yang <liezhi.yang@windriver.com> wrote:
> > > Maybe, but once we start doing tweaks like this, where do they stop? Hey,
> > I'd 
> > 
> > I think that it's not only a performance tweak, but this should be
> > considered
> > as
> > a bug since it would be failed to build on powerful machine, which isn't
> > good
> > for oe-core's user experience.
> > 
> 
> 
> I managed to bring down a powerful machine just yesterday by building webkit
> and llvm together at the same time. They together ate all the RAM, and someone
> in the office had to go and reset the box.
> Do I see it as a bug? Absolutely not: it's in fact my fault for not ensuring
> system resource consumption doesn't overwhelm the machine. This is the same:
> if you do not have RAM to match the cores on your specific rig, add RAM or
> limit the threads.

I can see both sides of this. If we had a pool for all the threads and the
pieces of the system all used the same pool, it would work well as implemented.
Sadly the bitbake threads, the make processes and now the compression threads
are all separate.

We do see the autobuilder break due to load issues too and on that we have
scaled back some of the defaults but not ZSTD as yet that I recall.

As such I think limiting the upper value on number of threads may be a good
compromise, both for compression and maybe for parallel make too.

Cheers,

Richard


