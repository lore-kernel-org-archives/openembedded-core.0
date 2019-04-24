Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7EEE57D53E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 09:21:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44pvvk5wvdz4R;
	Wed, 24 Apr 2019 11:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556097700;
	bh=RxirmW1goR5CYyc8FDGoyLXRb/Qk+M8vR1nQIjkytXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJcWfXC6ELWGluXKBDzpoTc3p1H/aEE8ylYV1IcW0ofF80SoFd0GimTZxTS8kBlEc
	ZlaABe1cvKfy+QRNh6rw3xPJvST0xJP3iL4Ti9aoLSCyMtUzwA9uJNlLsjZnmSXe/J
	PxV53GaBVwpkXduAz8VXc0Ia8Xt40Pffo0J0j6G5zZH9KKd7kTOifq6xfJ2S7SSnd0
	tyLVQZRtiuUA4A6UL6kAOVX5JAWS/HsFGTO+1WtdU5OsJYVTm5Hjt6P610HPF18Wz8
	o8WngUcK+dOh5J9HSzi9/SIzfm4VL8BtqA0QZVJ+mMOBqTvtfsHlwU46EXKDSkmc+R
	AP7ErpYrKMhXpe844ne63vDh53sisGSuMitIlTL3ZlKy1GMI1hPROgVlxIRC1f0nu/
	qKoNsT9YTfs0gPEReOsWtUWK+JJfoEEk5xW309NtRDsYlBG+8J1DFIWp9imDeRGQWR
	ByNpCBtY+5EycSwlgtuUEtMJwzGit0H+0ptcDIiSSX1+hgxUwC7aXX4hOypTQbl2gz
	sgTrRjiFjzPD6W7+0LK8jyCqEvhdoPaiO8cP04D8bH09m2+o886H6RDI3ouZqzPuyc
	OObOtC/hvIRMdUjO8XiwBvosAt/oJcAeDBAapuoEoXZAMbOO1bVEujZ1FgsZbVj3ip
	Vq0kJ2bimKXLEV5GiGwwt5ro=
Date: Wed, 24 Apr 2019 12:21:35 +0300
From: Adrian Bunk <bunk@stusta.de>
To: mingli.yu@windriver.com
Message-ID: <20190424092135.GA19130@localhost>
References: <5CB80B5D.40800@windriver.com>
	<1556095261-171895-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1556095261-171895-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/2] nettle: fix the Segmentation fault
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
X-List-Received-Date: Wed, 24 Apr 2019 09:21:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 24, 2019 at 04:41:00PM +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> The commit[8ac8fa8ee1 nettle: update to 3.4.1]
> add CFLAGS_append = " -std=c99" to silence the
> below error for native build:
> | ../nettle-3.4.1/rsa-sign-tr.c: In function 'sec_equal':
> | ../nettle-3.4.1/rsa-sign-tr.c:243:3: error: 'for' loop initial declarations are only allowed in C99 mode
>    for (size_t i = 0; i < limbs; i++)
>    ^
> | ../nettle-3.4.1/rsa-sign-tr.c:243:3: note: use option -std=c99 or -std=gnu99 to compile your code
> | Makefile:263: recipe for target 'rsa-sign-tr.o' failed
> 
> But the above change will trigger below Segmentation
> fault:
>  # echo -n passwd| nettle-pbkdf2 -i 1 -l 16 salt
>  [65534.886509] nettle-pbkdf2[708]: segfault at 1f594260 ip 00007f3332256998 sp 00007fff60d44410 error 4 in libnettle.so.6.5[7f3332244000+1d00]
>  [65534.887525] Code: e8 6d db fe ff 44 01 6d 68 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f 1f 84 00 00 00 00 00 49 89 dc e9 68 ff f
>  Segmentation fault
> 
> So update the logic to CFLAGS_append = " -std=gnu99"
> to fix the issue.
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-support/nettle/nettle_3.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/nettle/nettle_3.4.1.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
> index dd49c30..8375fcf 100644
> --- a/meta/recipes-support/nettle/nettle_3.4.1.bb
> +++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
> @@ -30,7 +30,7 @@ inherit autotools ptest multilib_header
>  EXTRA_AUTORECONF += "--exclude=aclocal"
>  
>  EXTRA_OECONF = "--disable-openssl"
> -CFLAGS_append = " -std=c99"
> +CFLAGS_append = " -std=gnu99"
>...

Nice catch.

Looking at the build log, setting a C mode without GNU extensions 
resulted in

../../nettle-3.4.1/tools/nettle-pbkdf2.c: In function 'main':
../../nettle-3.4.1/tools/nettle-pbkdf2.c:144:10: warning: implicit declaration of function 'strdup'; did you mean 'strcmp'? [-Wimplicit-function-declaration]
   salt = strdup (argv[0]);
          ^~~~~~
          strcmp
../../nettle-3.4.1/tools/nettle-pbkdf2.c:144:10: warning: nested extern declaration of 'strdup' [-Wnested-externs]
../../nettle-3.4.1/tools/nettle-pbkdf2.c:144:8: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   salt = strdup (argv[0]);
        ^

It is obvious why the resulting code crashed.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


