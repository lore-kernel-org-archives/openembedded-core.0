Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CA6C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 23:37:19 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.32762.1736811432064197426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 15:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNGxb9py;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: hiagofranco@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f2d7868ef0so1193702eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 15:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736811431; x=1737416231; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0BGPNWGW7K+lkRl2Plp5XXYMCpqtP2DZjKfnTZRezQ8=;
        b=NNGxb9pyO2KC+8uy1mGrtUUOhgOlJ+NCQfEHZytIvod0tlYedm1uNNYz1JMEIn7vOq
         ned3zgit/C4u36Lnlq0z/Ex4UtJS/4t+pC2LSeKnSbjgZ0oxSavvDjxiAUR4JIt6xmN9
         vLjdsUW3S/BhUp6Re8z+W7Ykk0BTnR/XJQ93gcj33+qOLX8/ac5tytKTiycFnLGhB9PO
         nbRdme7XUJXxWlxtI8hcxMkef3GqRZr9l4IsLBzY6FrT97QCPdYXJ420KILjp0saEfMN
         S0tLJS0maWqs61VBUGlEYKwqYjhldFdi2t9NxcNz9wSdoPk91UZDhCzpvkTQThTQ3Q16
         3WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736811431; x=1737416231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BGPNWGW7K+lkRl2Plp5XXYMCpqtP2DZjKfnTZRezQ8=;
        b=QVHIJCJk2ul54NNr+Lqer44lP9dfMvAkrDPnL2wO8Hi5Hlx3TH4DELxp/8KDt6rRfd
         ujnhS5uOXma4rI6Xv1guborggJtgg9lWyTgQKl9xqLUJJn/qik6BzC4QeIepL7o71VjH
         NhvPN2wfP2noiir5OcUVqHJv63EMHEuRjQdzCuEz2Aw/ewhArTKvJAqwxJax8ASr5MaM
         ef/rAQhch8cBcH//9BT9HZyFbXBRZ+yw/K+VRMEmgcg06wsNdPQe/N6I+Jl9yc4rqjf4
         /UDqP9Y0098uz1rsVUQtlE0orT5wCzF1pYU0bEiIKEjWkoHD/xngMaLcbYdjUpNXXPn0
         TVJg==
X-Gm-Message-State: AOJu0YzSXHzy3yGBRJH/Q0AKjy1S7VqbByAPKEXnbMAYlMRTg2ESCsEr
	HlXpYt0Nhb7GJHSgYqiYMn3OKXuk0yaKlAt+9LZaxmhPa06d5hLHI04brQ==
X-Gm-Gg: ASbGncuh+8BzmfXuKIoRbwsBNbEJWEzZug9WT6LioLjHaL08iy5dwQH6i9uQ/7S7O44
	DFXjwIfYKXrfW1tycS3dPodYn4I1Ue1TWYtRr8XiJFTKlAYIuH6W4tZySUo5knBmm0FzlfQSQDs
	jthgIyQBRmUovxPe5fmWBVHTV1q5Mso/BgfOJY94Bbl+yvpni+qUK64RVJV2Kk7XoUe/nv7rIyT
	DoSsSlMU5lfqzaQ0n7kMSJBVyMY3MYVTCbtzsbLY/01fysMUmu6ysw7
X-Google-Smtp-Source: AGHT+IHx8UfzFmyCIn76K4kGDIhWYWxsVPuqDRdAGZS3hWqjKUJgO2dMXMJ64WyfpEcssqXv3gnm2g==
X-Received: by 2002:a05:6871:6103:b0:29e:1b72:7586 with SMTP id 586e51a60fabf-2aa066d6831mr13029472fac.18.1736811431227;
        Mon, 13 Jan 2025 15:37:11 -0800 (PST)
Received: from hiago-nb ([2804:1b3:a7c0:f217:8a6e:d86d:fdd8:a559])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad809ad7ccsm4454849fac.40.2025.01.13.15.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:37:10 -0800 (PST)
Date: Mon, 13 Jan 2025 20:37:06 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] libxkbcommon: remove locale dependecy
Message-ID: <20250113233706.3jxpqlqqvghgr62e@hiago-nb>
References: <20241212213429.250224-1-hiagofranco@gmail.com>
 <A468A018-CE0F-4C18-8189-4190498A8051@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A468A018-CE0F-4C18-8189-4190498A8051@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 23:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209768

On Mon, Jan 13, 2025 at 04:45:38PM +0000, Ross Burton wrote:
> On 12 Dec 2024, at 21:34, Hiago De Franco via lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > The error described does not occur in all cases where libxkbcommon is
> > used. As example, a Qt application that depends on libxkbcommon might
> > not require any locales to be installed.
> 
> This breaks the use of the Compose key, as this needs the data in the locale files.  I suggest making this a recommends instead, which you can then not install.

Sure, I will prepare a v2.

> 
> Ross

Cheers,

Hiago.

