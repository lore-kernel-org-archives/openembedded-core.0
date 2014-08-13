Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 416686FDE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:19:07 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id l13so11610236iga.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bxDIdSlAjOK1N1nGREDsAfG+VttjUym+7iDDD6zvcE8=;
	b=MNyCMpMnOJ/nSkP4KtOBl6znW2jqaKxkaNIKw9yPDoTI0G8of13GtcJL7K15OQhOsR
	h3CIzAXvguYLsjooCyaHxDkcYH0PCAdkYuebRx0485ZnbMuCjUXUrbQYYvbnCzR7zY6L
	oUQjdkwec9sCw+M2IbtzXtPTY/b5SaVtABSBDCe/OksIMn6GfxuTmTvNtgbXtrjn/lJ6
	htDNLJja9ZFMe0jUFpacpTep6OQKKdbm2sw6o3zg6aF4kR1waxVQVTKLQC/CiifmZT+c
	tD/FDwDzAGXVC7PvTEr/gufV1A1v/bXgKzgLFwED6RIDDnKvzqvvhgvo/3tgowGnU8oz
	Zudg==
X-Received: by 10.42.65.200 with SMTP id m8mr9398154ici.29.1407964748059; Wed,
	13 Aug 2014 14:19:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 14:18:38 -0700 (PDT)
In-Reply-To: <53E9134F.7040108@pabigot.com>
References: <53E9134F.7040108@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2014 14:18:38 -0700
Message-ID: <CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Wed, 13 Aug 2014 21:19:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 11, 2014 at 12:02 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> The program below built on the target with the MACHINE=beaglebone gcc-4.9.1
> compiler from Yocto/OpenEmbedded poky master produces this error:
>
> beaglebone[52]$ g++ -std=c++1y -pthread test.cc && ./a.out
> starting
> joining
> pure virtual method called
> terminate called without an active exception
> Aborted (core dumped)
>
> When the program is recompiled with the defines for
> __GCC_HAVE_SYNC_COMPARE_AND_SWAP_X enabled as suggested at
> https://groups.google.com/d/msg/automatak-dnp3/Jisp_zGhd5I/ck_Cj6nO8joJ it
> works:
>
> beaglebone[53]$ g++ -std=c++1y -pthread test.cc && ./a.out
> starting
> joining
> doit
> done
>
> Preliminary analysis confirms that the built-ins for those defines are not
> being added by the compiler because it thinks the target doesn't support
> those operations.  Nonetheless, it doesn't use the substitutes that are
> obviously available.
>
> Can anybody recall anything about the way GCC is built under OE that would
> explain this?

Can you add -mcpu=cortex-a8 to your cmdline and see if it solves the problem ?

>
> Peter
>
> /* g++ -std=c++1y -pthread test.cc && ./a.out */
> #if 0
> #define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1
> #define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2
> #define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
> #define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8
> #endif
>
> #include <iostream>
> #include <thread>
>
> void
> doit ()
> {
>   std::cerr << "doit\n";
> }
>
> int main (int argc,
>           char * argv [])
> {
>   std::cerr << "starting\n";
>   std::thread thr{doit};
>   std::cerr << "joining\n";
>   thr.join();
>   std::cerr << "done\n";
>   return 0;
> }
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

