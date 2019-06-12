Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id ADB917E727
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 05:33:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45NwWr3ZM5z24;
	Wed, 12 Jun 2019 07:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560317608;
	bh=+QWomHkgyzKp4Bk126o+ocj5atVycPzwNoyy3tLc/E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKjkOUGejSMKwh0QEMXnVza1dumm1+DU8BV6u+oSh+D210rohr37EjuCreIJDRbcj
	T28w0j+/ulaT9F+meENUH66nkLkF9jb5n9f+OaE2iMnEpCdcw3sEAW9Go5AtVqLrQl
	kiqrRJuzutYZSTgmjXf08Bf8chhUjLsFHeGaoLYvoYdIIG60aIBgrCRvnMQ8nw6T/J
	2Ixd0/AyaryHCya3iV1cytQv5lftmemE04epYbCMPYW4t+tsMJ2fStBd5ntCj0DycP
	20DNYAfzLGYQA2zzwcUnU2PJKUQ7TkIjATVdR1aEigBl0Mw6UdrGYXvdzEI+D88h3P
	ovj2mpukJ5i23TZqdw9bR5Y+5mR3mgLg+wLCp/d705NkTaIvuExGJxgQxF9ALEYyC8
	1cg/K8lNOh6tfoecEVhPWv9NmofoyeQEcoLQMEBj6YbCz0yc1sRp1y2FRv8S1ndBfo
	H1ENA63k2tXT5XrwxFmioB1zRazX+stQHdJRo5qsV82Nke8wfjZwn193qXwNP7uDfT
	i1Op4yLAXW+4JMPj1Jkx7FAFIx0IvDQqcyOh41T+bnWbk/IWR+mBnPJYC4xJAZ7o9Q
	TVa/VjlsITnZb4LIkGpbfO7uO6FtsjroLDJhxaKRCDmEn7eP9eTR+AcIqcvGcLT/41
	bXheG4InpC37KLKEaOC4BvOc=
Date: Wed, 12 Jun 2019 08:33:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20190612053326.GA12642@localhost>
References: <1560289312-19244-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1560289312-19244-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mtd-utils: upgrade 2.0.2 -> 2.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2019 05:33:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 11, 2019 at 05:41:52PM -0400, Denys Dmytriyenko wrote:
>...
> * Now requires openssl:
> | In file included from ../git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:25:
> | ../git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h:49:10: fatal error: openssl/rand.h: No such file or directory
> |  #include <openssl/rand.h>
> |           ^~~~~~~~~~~~~~~~
> | compilation terminated.
> | Makefile:3457: recipe for target 'ubifs-utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o' failed
> | make: *** [ubifs-utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o] Error 1
>...
> -DEPENDS = "zlib e2fsprogs util-linux"
> +DEPENDS = "zlib e2fsprogs util-linux openssl"

It doesn't (and should not) require it unconditionally.

Please backport "mkfs.ubifs: fix build without openssl" from
upstream git instead.

>...
> -PV = "2.0.2+${SRCPV}"
> +PV = "2.1.0+${SRCPV}"
>...

This was already wrong before but now is an opportunity to fix:
Since this is exactly the release, it should be
  PV = "2.1.0"

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


