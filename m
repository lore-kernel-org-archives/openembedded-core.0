Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.5381.1592913768253448738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 05:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KG4h3GeP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id o11so12522682wrv.9
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XO0XjcLPzUdJ++KVPLlL4jO0sLC0h+vy0O8ukw9DCOw=;
        b=KG4h3GePjdERs1Qu30x2JKeF5cQQK2nCi79WBLXk8/rEJ7obeYWE1G8KUlhCorHcej
         YwfEtpp3dGPEWU1Mu+lNDUgk8hKMuX7K2nGfQLiVJKhGmposuqzeclZYDjEIyxibltzu
         djhTjiAOqlVC3kFAF+ySDFR1o3RfLxUpATfdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XO0XjcLPzUdJ++KVPLlL4jO0sLC0h+vy0O8ukw9DCOw=;
        b=dB/pgDNO7J2SrhtAOVz0KRvj1SgU1NwJMDIJeF30np8ZovGXxZF8OZZ7KESAIl9Bro
         Z/J+yRgKQySY27I7BA13x7VMYjMobRktcpnsV10lQTeGjP3M3zU7eYjhmZFpgOPovIqS
         A48bcDlR4WqE6/0CFX0DwGRCIZdhpRjjAPAex1e6OndQOmIhSAS160unwOyWm9jy9kE4
         NO4hLqvFWGNUiMouJ8fOb3ch/rszsOji6HAqya7Mtk5F86CtYTmpjzcIUBwi30rtUwwG
         HzVsoAe0qo/72+wbQfGzGJyr21jWYyNQOll/u066h8LxdA7qfAf0SIbKgzL1+dAooyZy
         2uIw==
X-Gm-Message-State: AOAM531U0xDLFRXjKFn6X7Itvh9lX/OypubErGlg/lTV5Or+O4XeKsy7
	5BLsCySpt7VWsG7TDZSh9xv2oA==
X-Google-Smtp-Source: ABdhPJxQ61zSLpOKvPo/x8EqitFsh6gidglYUN8TCBzpCRAYzOCWzIbYarajdINgYskWUv9j19cdxA==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr9239224wrt.159.1592913766772;
        Tue, 23 Jun 2020 05:02:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d24sm3257372wmb.45.2020.06.23.05.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 05:02:46 -0700 (PDT)
Message-ID: <b42a94227a052cb6344788925c7e26566e2a191c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] lib/oe: Split package manager code to multiple files
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, 
	openembedded-core@lists.openembedded.org
Cc: tools-cfpbuild-internal@axis.com, hugo.cedervall@axis.com, Fredrik
	Gustafsson <fredrigu@axis.com>
Date: Tue, 23 Jun 2020 13:02:44 +0100
In-Reply-To: <20200623111328.5838-3-fredrigu@axis.com>
References: <20200623111328.5838-1-fredrigu@axis.com>
	 <20200623111328.5838-3-fredrigu@axis.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-23 at 13:13 +0200, Fredrik Gustafsson wrote:
> Today OE-Core has support for three package managers, even if there
> are many more package managers that could be interesting to use.
> Adding a new package manager to OE-Core would increase the test matrix
> significantly. In order to let users use their favorite package manager
> without need for it to have support from upstream, this patch refactors
> the package manager code so that it's easy to add a new package
> manager in another layer.
> 
> This patch is mostly moving code and duplicating some code (because of
> the hard coupling between deb and ipk).
> 
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/classes/populate_sdk_base.bbclass        |   11 +-
>  meta/lib/oe/manifest.py                       |  149 +-
>  meta/lib/oe/package_manager.py                | 1402 +----------------
>  meta/lib/oe/package_managers/deb/manifest.py  |   31 +
>  .../package_managers/deb/package_manager.py   |  719 +++++++++
>  meta/lib/oe/package_managers/deb/rootfs.py    |  213 +++
>  meta/lib/oe/package_managers/deb/sdk.py       |   97 ++
>  .../ipk/.package_manager.py.swo               |  Bin 0 -> 45056 bytes
>  meta/lib/oe/package_managers/ipk/manifest.py  |   79 +
>  .../package_managers/ipk/package_manager.py   |  588 +++++++
>  meta/lib/oe/package_managers/ipk/rootfs.py    |  395 +++++
>  meta/lib/oe/package_managers/ipk/sdk.py       |  104 ++
>  meta/lib/oe/package_managers/rpm/manifest.py  |   62 +
>  .../package_managers/rpm/package_manager.py   |  423 +++++
>  meta/lib/oe/package_managers/rpm/rootfs.py    |  154 ++
>  meta/lib/oe/package_managers/rpm/sdk.py       |  104 ++
>  meta/lib/oe/rootfs.py                         |  631 +-------
>  meta/lib/oe/sdk.py                            |  311 +---
>  meta/lib/oeqa/utils/package_manager.py        |   29 +-
>  meta/recipes-core/meta/package-index.bb       |    2 +-
>  20 files changed, 3014 insertions(+), 2490 deletions(-)

I'm afraid this patch is basically impossible to review. There are
warning signs like the inclusion of the binary swo file. The hint that
code gets duplicated also worries me, even if you abstract this, there
shouldn't be reason to do that.

If we do this its going to have to be a more granular series where the
patches *just* move code to new locations so we can see/understand what
other changes are being made as I simply don't trust this patch, sorry
:(.

Cheers,

Richard

