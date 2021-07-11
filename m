Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.5380.1625997227999068704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 02:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OQP8TPk0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id g12so1350401wme.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jul 2021 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+CcQcu4h4ej3+v5tDMtwzF7UhduoPkVKlnbGC9iu3AY=;
        b=OQP8TPk0VDazwqYEUERDpkP2jIMOw7GpjEUraPMC4vMQV26eN8s7iCkzqdfPFDbBK/
         gfol7trYamSQsgI0e0ZcW+/MKzVYvsWsZJ1g2b7pebYwlWCR5O+dEflA5cvrc548lYFo
         5T9Tc0B2n9WRqYt9L3/wrAn9GuBN4uVAQ8uB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+CcQcu4h4ej3+v5tDMtwzF7UhduoPkVKlnbGC9iu3AY=;
        b=c6q3qZ3nIkmB7aoJdsyBu6vgS0YAl4x7xbLgGeoOngSDJyhkfU9KAX9T2uB7cZ8KDf
         s+NRE8/JcNpNQIf6qpepPbcoQo86LWAPZRfuHB2x3DN/jmaiCBK31U91qgVVUNxFO+5k
         irrSD5zcL0WifJN3tBmom66YxmR5gieieQ8w8QnZ2rdJ6TXnkOIxDgl/zakLZy7chTlx
         GDugRpU94nDHRBPLvEaCAwtHz/c4T56gLRrEqhD3VXYoKm4nbaWq+pYBLQ/BbGA2ppBt
         OzfBuJ6AfosYWWtxddHFqHiyYZCpvx62kkUwzQmattn582mlckAEac+jXh7BKup2A1XI
         +7BQ==
X-Gm-Message-State: AOAM533l9AU4O4xdwp/Z7UIQi7t8iVOMs/BK+LVej0WnPlW1SjXoJK++
	zDBGRYqUibZjGw5uUSVk6r93Jg==
X-Google-Smtp-Source: ABdhPJwitJXb8i8se8tlgT8y6URaknKVWwky6NnFsD3R4Haz6eZ7jKV4y9lyvIm8k52ySrQ6KSNtww==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr8677378wmq.149.1625997226495;
        Sun, 11 Jul 2021 02:53:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5e67:1ea9:260d:3e7f? ([2001:8b0:aba:5f3c:5e67:1ea9:260d:3e7f])
        by smtp.gmail.com with ESMTPSA id j21sm6269842wms.2.2021.07.11.02.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 02:53:46 -0700 (PDT)
Message-ID: <d781befb33cb4f3b53e1e7989311ef52ce56e927.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-yocto/5.13: add devupstream support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 11 Jul 2021 10:53:45 +0100
In-Reply-To: <20210706175821.41519-1-bruce.ashfield@gmail.com>
References: <20210706175821.41519-1-bruce.ashfield@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-07-06 at 13:58 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> We are always getting questions about building -stable, or mainline
> master. Rather than introducing a separate set of recipes, we can
> facilitate this sort of testing by using the existing devupstream
> bbclass support.
> 
> To build an unpatched or otherwise modifed -stable of 5.13, simply
> set the linux-yocto preferred version to:
> 
>   upstream+5.13%
> 
> And your wish will be granted, as the build will use v5.13/base
> which matches the main linux-yocto version, simply with no extra
> changes applied.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
> 
> Richard,
> 
> This is the patch that I was talking about earlier in the yocto dev
> meeting.
> 
> I personally find this the easiest to maintain, since it is just
> a variant of linux-yocto_<version>, and ends up just being a
> different branch versus anything radically different.
> 
> I am open to making this a different / named recipe to make the
> distinction more clear, but I'm worried about the impression
> that we were doing extensive testing on the bare -stable branches
> when most of the testing (which is transient to the base -stable)
> happens on our standard/base branch.
> 
> Either way, I'll work on getting this and the -dev tweaks I sent
> earlier added to some part of our AB testing to make sure that
> they stay in good shape.

Sorry for the delay on this one, I wanted to try something. I have a
tweak to propose and since patches speak louder than words:

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index cd51e04b95d..ab81a977b8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -25,13 +25,13 @@ SRCREV_machine_qemumips64 ?= "b74fe3dcca0653609fcb75aad883b1db07619081"
 SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
 SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
 
-# set your preferred version of linux-yocto to 'upstream+<version>%', and you'll
+# set your preferred provider of virtual/kernel to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
 SRCREV_class-devupstream = "62fb9874f5da54fdb243003b386128037319b219"
-PV_class-devupstream = "upstream+${LINUX_VERSION}+git${SRCPV}"
+PN_class-devupstream = "linux-yocto-upstream"
 KBRANCH_class-devupstream = "v5.13/base"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel

Basically this does what you were doing but brings with it the advantages
of having the target in it's own recipe namespace by changing PN.

This means you'd set:

PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-upstream"

to enable and the advantage is that if multiple linux-yocto recipes have 
this, you can do:

PREFERRED_VERSION_linux-yocto-upstream = "5.13%"

or whatever, it all works as normal.

This drops the hacked up PV field and I think makes things work nicely.

Does that seem reasonable to you? It should work just as well with your workflows?

Cheers,

Richard


