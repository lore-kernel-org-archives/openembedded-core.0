Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.7790.1632232113007906907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 06:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 744351C000E
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 13:48:30 +0000 (UTC)
Subject: Re: [OE-core] [PATCH V2] archiver: Configurable tarball compression
To: openembedded-core@lists.openembedded.org
References: <20210921061517.8235-1-ian.ray@ge.com>
 <6c5ca68319e216177b75f0e3cb6ad8da0bcf8c25.camel@linuxfoundation.org>
 <16A6D8EA388563F3.1316@lists.openembedded.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a06209fe-c772-7a28-bde8-4627fef58296@bootlin.com>
Date: Tue, 21 Sep 2021 15:48:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16A6D8EA388563F3.1316@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 9/21/21 3:20 PM, Michael Opdenacker wrote:
> By the way, zstd seems to be marginally worse (+1%) than xz in terms of
> compressed size, but is orders of magnitude faster (see
> https://archlinux.org/news/now-using-zstandard-instead-of-xz-for-package-compression/).


Actually, this article only mentions decompression speed, but that's
also true for compression speed.

Here are my own tests:

mike@mike-laptop:~/tmp$ time gzip linux-5.15-rc2.tar

real    0m29.293s
user    0m28.712s
sys    0m0.553s

mike@mike-laptop:~/tmp$ time xz linux-5.15-rc2.tar

real    7m2.658s
user    7m1.096s
sys    0m1.280s

mike@mike-laptop:~/tmp$ time zstd linux-5.15-rc2.tar
linux-5.15-rc2.tar   : 16.29%   (1136803840 => 185233271 bytes,
linux-5.15-rc2.tar.zst)

real    0m5.476s
user    0m5.530s
sys    0m0.864s

mike@mike-laptop:~/tmp$ ls -la linux-5.15*
-rw-rw-r-- 1 mike mike 1136803840 Sep 21 15:31 linux-5.15-rc2.tar
-rw-rw-r-- 1 mike mike  198135832 Sep 21 15:24 linux-5.15-rc2.tar.gz
-rw-rw-r-- 1 mike mike  125980548 Sep 21 15:26 linux-5.15-rc2.tar.xz
-rw-rw-r-- 1 mike mike  185233271 Sep 21 15:31 linux-5.15-rc2.tar.zst

So, here the claim that zstd (with default options) is almost as good as
xz in compressed size is not confirmed. However, zstd is a clear winner
in terms of compression speed, and anyway better than gzip. This is
worth switching.

Cheers

Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

