Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA905C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 12:24:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.10945.1709036641781494939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 04:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ho8eT3tW;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so52573761fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 04:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709036640; x=1709641440; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=St3BRXtCYzp41E4A0bdN2t8pEAMz9zuhJl+yFrmjZgc=;
        b=ho8eT3tWiJUm0TZo6UnPiPIn9fTRdMX6sLUOH8mqM+5kJCH84UuDp3V1mo6xzg0TPd
         FDFEfoYKyfOO40UUiLc2tbJurLZSXt36H9wFYdKK3sFM7HB2eDzDfLwgLhGroO0YrRcE
         l63jtv45kZWxuQzwyKU9BjEZchP9MGp/XaCIU405p4idYM2TX61Ni9tUQ2xZ0esVyMVk
         pa7LMdXyWoKmUHii9ox+d9D9gi5BHRDT6MJQzZw363jL7oLlpHuXeT9qGeeL+NVPJcEj
         71nPRGoo5wS0jwk3PhjtkEunjC3o1ehZ4do6LNvT+nMj4wOsgC2CVJ8yhgTG3eq5x/h2
         xGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709036640; x=1709641440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=St3BRXtCYzp41E4A0bdN2t8pEAMz9zuhJl+yFrmjZgc=;
        b=FuA5pGbcLNdVfVOlC6h2nKPVBnihARtbd29eT4xD+CBUArJpxwhZmhXJ+tUowhz/KD
         OCPgNpBs/yxn7ozy9hbPeFd4il0RowNd4T3uKtJGGpi1p5W3CtmHK8K/IZMbKj8J/xcw
         PwlVC+uHFSnjEynPk3YkOu6+l3Ggb1GdTp7DSx0ZD7HlZimxjswPHpD2DqvsKoPWZULw
         Uw5zlXESGrzf/0iLDNMNX3dkMVmBiQbmcbY0SwmxXDqtHa63ae3qEqHCtt7jQOQptlmO
         vajUeWmEFlEUYcJv89miNXe32KK8AxjNS9vUaj0I/jOfp3a9eVMQ1aIpnrVR69sXJsu+
         A+5A==
X-Gm-Message-State: AOJu0YxhbJhaCho9cxc9cqT3g09xzglkmL8f0zBgHzI/aIqmYNocCFYP
	mJkLIMd6JvjVYQfc7A971keV08njVHrEZ9SZOCWfp1G2FUzAhqZbHh00FLazqQY=
X-Google-Smtp-Source: AGHT+IG214Lpt8J+qB9yJKwjfZOxjtkSEQ9DFYLr61Db0LDXS7wiUN08cWfEHZpNv1z3w4dX/UUIqg==
X-Received: by 2002:a2e:808d:0:b0:2d2:a3f5:d4d7 with SMTP id i13-20020a2e808d000000b002d2a3f5d4d7mr667331ljg.3.1709036639886;
        Tue, 27 Feb 2024 04:23:59 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id v2-20020a2ea602000000b002d11c55fee2sm1232682ljp.127.2024.02.27.04.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:23:59 -0800 (PST)
Date: Tue, 27 Feb 2024 14:23:57 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH] wic partition.py: add --apparent-size to du
 calls
Message-ID: <Zd3UXd9ks9FWKH8Q@nuoska>
References: <20240227112357.2455578-1-mikko.rapeli@linaro.org>
 <d7abf62f2c7e7312c93ce6ad066aa16f81f519c9.camel@linuxfoundation.org>
 <Zd3NolrDmgFmAOG5@nuoska>
 <81f85c74599c856e7cadb31352340532dfa26504.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81f85c74599c856e7cadb31352340532dfa26504.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 12:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196269

Hi,

On Tue, Feb 27, 2024 at 12:06:41PM +0000, Richard Purdie wrote:
> Should we break it for others so it works for you?
> 
> If I merge this patch and then I get other reports in of issues, I'm
> going to be left to somehow fix those other problems. Since your case
> will work you will object if I revert this but you likely won't have
> time to work on the resulting other issues, or be able to reproduce
> them since you're building on zfs.
> 
> So you can see my dilemma? :/
> 
> Most people don't build on zfs which is probably what I need to balance
> this on.

What if I make this optional for zfs? If build directory type is zfs, then
--apparent-size is added, else not.

Cheers,

-Mikko

