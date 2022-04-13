Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6820C38A2C
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.4372.1649886098879115952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 14:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ojzo32jP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id r64so1890829wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 14:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zHPW26+2fHa24RP6bh9l9qmHiGs5bBC/LvPF7RbHx8w=;
        b=Ojzo32jPNs71uaUnWrZBV0TypBQQKu2/EqNTZh38Eu/Dz8Jys5OK66cKDyApFJcK9b
         kCs4sgbl2BPzuqLrtS8IANN8Aa4mDq576gUnqRapLrPQrNq8wK1gsZmCL/FatBQ4J5cn
         7K3Y0L3WaegwdIv33z0ITO0sxcLGI9lj9Vajg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zHPW26+2fHa24RP6bh9l9qmHiGs5bBC/LvPF7RbHx8w=;
        b=imgseBY5YS6XTV89iSenc4oORcnztFto/ekyBVglHF1LnAoVnDQVDF2dF8MMPJlM4l
         FWpJCPOIlnOZraLxzySWwS31fClT78xXI2RE8RE5O30lsE48tyBG5bYZjQ+0OLwcEfFk
         N3Q2OaLUOOljwKB3iobRjaD/kxgYd9D1fpADDCDRVokGt9zd4dSi85+sUNftMjHJC8Js
         6CYyzZEQVnKdfRrF7qHGFxbJnYSM/7ckzvT/XfV8aRaWB6FU1gkJoMxGkNsr/ff73alz
         Emn+c32C+1U50i21I3+n2a9FzOofUC6PgklLWPURACR8V91WDOcLEIXWxJIwT5fuPlIa
         WRhQ==
X-Gm-Message-State: AOAM5329XGtclWZDjlt+K+QB7hs5sgKAS1xbDFaKqU4sgnswHFzJuh78
	SzCrdmo149kfXowxvwhiEZR9TQ==
X-Google-Smtp-Source: 
 ABdhPJx7nSiMhc3v6w3yD8AL7Xdze2nRHgxkiNA+ZAZdM46cfroKbUXrgK1l9uQOFdFK3KX9fANBjg==
X-Received: by 2002:a05:600c:5c9:b0:38e:d44a:4cc1 with SMTP id
 p9-20020a05600c05c900b0038ed44a4cc1mr575422wmd.124.1649886097244;
        Wed, 13 Apr 2022 14:41:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:353f:5203:2a56:f190?
 ([2001:8b0:aba:5f3c:353f:5203:2a56:f190])
        by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm166430wrg.62.2022.04.13.14.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 14:41:36 -0700 (PDT)
Message-ID: 
 <a1cdc686221db8350663e75acd3ac1fb147d4599.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Ralph Siemsen
 <ralph.siemsen@linaro.org>
Cc: Mike Crowe <mac@mcrowe.com>, Ross Burton <ross@burtonini.com>, "Mittal,
 Anuj" <anuj.mittal@intel.com>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Apr 2022 22:41:34 +0100
In-Reply-To: 
 <CAOSpxdZXfKhnmJm3TsZkbNb=Mqkj2=W4F4SSAoq8ne=RyJRr2Q@mail.gmail.com>
References: 
	<CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
	 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
	 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
	 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
	 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
	 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
	 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
	 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
	 <16E57E79FD292EFA.13992@lists.openembedded.org>
	 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
	 <Ylb9RoAyRpDHTaqe@mcrowe.com>
	 <CANp-EDZbeheyJWo_xwqPa4A24PJJghfZOuqG7sJX2DC1UfAPEA@mail.gmail.com>
	 <CAOSpxdYeNPZRo2LLZQ0-EZHoXmaSeXFHsONCTF+2MLwfZ_RO+g@mail.gmail.com>
	 <CANp-EDbCsrFazNTjpYbvZx-eRKhQ8GJeZH0VkL8Hco8p2w9oug@mail.gmail.com>
	 <CAOSpxdZXfKhnmJm3TsZkbNb=Mqkj2=W4F4SSAoq8ne=RyJRr2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164372

On Wed, 2022-04-13 at 11:39 -1000, Steve Sakoman wrote:
> On Wed, Apr 13, 2022 at 9:05 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> > 
> > On Wed, Apr 13, 2022 at 2:19 PM Steve Sakoman <steve@sakoman.com> wrote:
> > 
> > > Yes, and it appears they had a quite similar bug in the past!
> > > 
> > > https://lists.debian.org/deity/2006/07/msg00074.html
> > 
> > Interesting find... though it seems that is in a different sha256
> > implementation than the one being used here ("Gifford").
> 
> I did another experiment, where I disabled generation of the sha256
> entries in Release (by adding --no-sha256 to the apt-ftparchive
> command)
> 
> As a result we get past this first hash mismatch in Release, but then
> get later hash mismatches when it tries to download .debs.
> 
> https://errors.yoctoproject.org/Errors/Details/654717/
> 
> So it really does seem that apt sha256 generation is broken on
> non-debian distros.
> 
> > The other factor is that it behaves on ubuntu, but not fedora. Do the
> > native packages get built with the host gcc (11.2 on fedora 35,
> > whereas 9.3 on ubuntu 20.x)? Or does yocto also build a native
> > toolchain to build host packages with?
> 
> Perhaps Richard can answer this question!

Native recipes are built using the host gcc so this could be host gcc dependent.
We do use buildtools-tarball on some hosts where the gcc is too old. You can see
what is used where in config.json in autobuilder-helper near the end.

Cheers,

Richard


