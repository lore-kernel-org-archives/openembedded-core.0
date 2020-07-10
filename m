Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.345.1594419220019449466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 15:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=UhL6mS56;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=cw8d=av=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B3S3z1MCbzk;
	Sat, 11 Jul 2020 00:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594419216;
	bh=SU9bHK4oSUS2f+eVEGj0NprTY0B8QCWK7cYJrzTPQ1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UhL6mS56DOTwQ7ytlcXdbo/Iko5wYByRpV7FWIObGyMKqLEVWbNP9M0J8oKRQOl+Z
	 FtjLGYU2OW2v1nkJSF7h4CFg71Lk4NnVDmx3PZTqrbhVKnOguBPokOQXVPBe1kDCm5
	 /OBdethqUJrasSKq9RmfmtcXaTLuyM9GDT9PWUnuzh0J0L+PXIo61b7dsa7jRliVK8
	 uyVqAlzlRgHIx1c2koiIVQeRVn8vpNCtkQJTRju8IzSjvUiy70drG6ag0d+rlgd2zv
	 Mmp4zoX/aS+aIoFGC2pr4wLaySJeEWv3Z8inN0YsAPlWGUkH94IPoDX+l0TxoRHP8t
	 GkIrCR5QfaqDA+Xa39WUTszufQ8cD11rrXI9oAGIh0//wnkLJ1fjBi4xesUQy1vDel
	 CdoYR8CjxvYGmRSb1Lr5w4P0CzB9TdpPx7zVKpXlqtnwsUl0l4tHY2jEndLlJrT+qW
	 Va8FaVG700qaqX2AnAkl+7rrrvT5GmWUpUdttZgcJaGdrwquXSOQRXsMbdP65GY2fq
	 m4PuLhiiQhK1Ub2D4yoLCCYJL8ImDzTMySWOofE2x4xoA87c3wJvQLz758fKhGA6KI
	 PizLkj5Hntfp08ygKTcVTVnuxZTd8R17N7lfOhSmoOgtowFogrRTrbDuFKLHXjH47F
	 nUoaEFHWcqt3wWzCLI8Lled8=
Date: Sat, 11 Jul 2020 01:13:32 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: takondra@cisco.com, Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>, xe-linux-external@cisco.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssl: add rdcpu to rand-seed
Message-ID: <20200710221332.GA27369@localhost>
References: <20200710193957.1969769-1-takondra@cisco.com>
 <3d63c868f4e94dee8c7ee05a3afa0f0620f98a15.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <3d63c868f4e94dee8c7ee05a3afa0f0620f98a15.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 10, 2020 at 09:21:26PM +0100, Richard Purdie wrote:
> On Fri, 2020-07-10 at 12:39 -0700, Taras Kondratiuk via lists.openembedded.org wrote:
> > Native[sdk] openssl fails to initialize RNG on systems where native[sdk]
> > glibc is built against pre-3.17 linux-libc-headers, but runs on 4.8+
> > kernel:
> > 140737348333184:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1g/crypto/rand/drbg_lib.c:342
> > 
> > Commit 3ff98f558157 ("Start up DEVRANDOM entropy improvement for older
> > Linux devices.") in OpenSSL 1.1.1d has effectively disabled devrandom
> > seed source for kernels >=4.8. The assumption is that getrandom(2) will
> > be used instead. Getrandom syscall was added in kernel 3.17 by commit
> > c6e9d6f38894 ("random: introduce getrandom(2) system call"). So on a
> > system with 4.8+ kernel and pre-3.17 libc headers both getrandom and
> > devrandom can't be used.
> 
> Where would we find a system where we're building with pre-3.17 libc
> headers?
> 
> We updated to 3.17 in 2014:
>...

Native uses the host one.

In Yocto >= 3.1 old host distributions have to use the 
buildtools-extended tarball for unrelated reasons,
which should fix this problem.

Building Yocto <= 3.0 on Debian 8 (3.16 userspace headers) running the 
optional kernel 4.9 would match the reported problem.

Or building Yocto <= 3.0 in a chroot with an older distribution
on a system running a more recent kernel.

> Cheers,
> 
> Richard

cu
Adrian
