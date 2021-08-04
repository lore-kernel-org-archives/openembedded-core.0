Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.12333.1628097787889976969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XaoVSSCW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id m19so1666140wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VqWFQi2rDT0U5vS6kj4syhnOw3cFOhprQ5KyrMsKVrQ=;
        b=XaoVSSCWoeTmVB2ywaQ4MAdJl34aoFRLqIIMLRAlUDNiqHwXNifU7SMGiQscgK0VJw
         sg0afSj+5QelaZQqtMZhgubLsMyE1rsaoyFHbnaCpzD4cW6PYr8cxM/YRObApqYgFLvP
         +DruBfWWjJI4WrV7YRAG8bPNhcO+p/w4qKL+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VqWFQi2rDT0U5vS6kj4syhnOw3cFOhprQ5KyrMsKVrQ=;
        b=kwiWBW65oeMyuc/R52o3d5krKQhGCF1O33t59C64cVcAEu6u3gx/4kK0xNK7YISPIF
         jsYF9t2Fr6noITnCp5iA6TPOAT/diiz58VlRgdRkuXe06pcxhN9rj3EqXxcJDtW2G4ce
         N5obhLiv54Zl9kobUAcXGzPxpK4va1P2rwBbpBaZD6KeZfiKkMt6B26YhUlHFCpn5rnN
         oQ+OIRlaMzW7ZC8zwdCJ+CaKNfJeyeJgPzqZBo1VrJc0Urm1Kew5lpdWa8D1HxzmEBL8
         gFGIz8c3s8C+MS1cONUkVwm7j0z4m4gs6YAoHMnYh9flUBXFiDomo9/DsYDKWlJG5tEc
         FN+w==
X-Gm-Message-State: AOAM5304c7qwaKq50ZMgFS/8eEOkW02V9SeFpZm9HQgzuQWf0+dahnav
	m0vFe+4f8ldIXDw/Gtb2gCVrFA==
X-Google-Smtp-Source: ABdhPJye9DfrBlKzZlixxOlYKMFA2dRQK+LjjIfC53+Zduyd46YLr7ilcFGzYy0fJS/opV+vcsuQXQ==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr10838814wmg.130.1628097786559;
        Wed, 04 Aug 2021 10:23:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id k17sm6778418wmj.0.2021.08.04.10.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 10:23:06 -0700 (PDT)
Message-ID: <4f14c07692f4f93e8a0786cdf2f3d0bdf01b2fc8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2] systemd-boot: use ld.bfd as efi-ld even when gold or lld is used in ${LD}
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Wed, 04 Aug 2021 18:23:05 +0100
In-Reply-To: <CA+chaQeyjFEsF1MQYXTBhJh8B+ckkLW6BYevNdjqgXZL1R4_Lw@mail.gmail.com>
References: <1697E299D6012A1A.32176@lists.openembedded.org>
	 <20210804103627.238411-1-Martin.Jansa@gmail.com>
	 <3e567fd7b645657303e7bf2271f8ac1d039709f5.camel@linuxfoundation.org>
	 <CA+chaQeyjFEsF1MQYXTBhJh8B+ckkLW6BYevNdjqgXZL1R4_Lw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 19:20 +0200, Martin Jansa wrote:
> I've tried to reproduce this with:
> 
> BB_VERSION           = "1.51.1"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "genericx86-64"
> DISTRO               = "poky-altcfg"
> DISTRO_VERSION       = "3.3+snapshot-e2e76a4f7f4ff58a51592fdab0e9cbf2a69524bc"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "master:e2e76a4f7f4ff58a51592fdab0e9cbf2a69524bc"
> 
> martin@jama:/OE/build/poky$ git log --oneline | head -n 1
> e2e76a4f7f systemd-boot: use ld.bfd as efi-ld even when gold or lld is used in ${LD}
> 
> and it built fine here, not sure what the autobuilder is doing differently, 
> was it failing only for this poky-altcfg build or some other ones as well?

It was only that build and removing the patch from the next run made the error
disappear. Your config looks like so not sure what is going on...

Cheers,

Richard

