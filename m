Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 41F0B6011C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 08:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44RrgZ3jHwz6R;
	Sun, 24 Mar 2019 09:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553417403;
	bh=BB/cqgkrAv3qPRje3+7krIgazuVTFK3afSch6s12XUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I6S5S0tC4Usj43cT93uBtj5HJfFQdjmTPy+Fp27P5rkorx1XuixNhFumLZ5ryLWkj
	5gu06UkCDK+6mAKTOB5xVHqZpK/kRm3WEmTCakGezMlH+ZsiM8fKNT3Fj7D6X1ycD6
	ayxoX90qlNYddndaLtxMBHrQcA+UHBUYqqfcCJlPxXmHn+6UjojvmoPRvHbYwomd6g
	Q2UF/mijPjVqXTpDMUmJJ0SDQVadhdj6sq096w36qiUvcfS92hyya0iq2A5Eb5Iwpu
	8CeNVG5EhxTDJwJBMGB4Qs+1xz+0U1LxVjRcyd03gsKjagfXEezZRr4DLCah5eQG4M
	QLxAUXicoQe3OsIvknKKM5eRk+rPPJPIZ+/pxVvH1FNOiipKBSrKY6ahPRRlK3iUQC
	coozfWp8zS0nd/MTZnsj60Q/jnuzqBVaBLpgqOn+A/zn0h70YiWpjjeKzzzsEES8i7
	eM4OIc7ABTTEIZ/i6zmkzFzyF5LIJtSlgNM5A8MO2yrE95EUBGzaUn+zyOFt3KU8P1
	/kKvPIol27Ve6aCAvOi1jdhPfi06cm221KT6MZayZTjiYrXu1N13JMHAvV5PmhJD4x
	zG0/qRHoIOPWWuCLMDSTJ6AqPesf2SwcZk0Uh+vhVAPHjVa/PRhJ6JIAexmcy8/lVA
	ua4u5XCYwzr1VTwXi5KBOP2o=
Date: Sun, 24 Mar 2019 10:50:00 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alex Kiernan <alex.kiernan@gmail.com>
Message-ID: <20190324085000.GA484@localhost>
References: <1553372992-3009-1-git-send-email-alex.kiernan@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1553372992-3009-1-git-send-email-alex.kiernan@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wget: Convert EXTRA_OECONF to PACKAGECONFIG, extend PACKAGECONFIG
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
X-List-Received-Date: Sun, 24 Mar 2019 08:50:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Mar 23, 2019 at 08:29:51PM +0000, Alex Kiernan wrote:
> Convert existing EXTRA_OECONF and DEPENDS to PACKAGECONFIG, fill out
> remaining PACKAGECONFIG options. Note we pass in --without-libpsl, which
> we didn't previously, but all this actually ends up doing is silencing a
> warning from the configure script, the code still uses an internal
> implemention when using this option.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>  meta/recipes-extended/wget/wget.inc | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> index 3cff656a68d9..99af039f417a 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
>...
> -EXTRA_OECONF = "--with-ssl=gnutls --disable-rpath --disable-iri \
> -                --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
> +EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
> +                --disable-rpath ac_cv_header_uuid_uuid_h=no"
>...
> +PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
>...

Can't the ac_cv_header_uuid_uuid_h hack be removed when this is now 
handled with PACKAGECONFIG?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


