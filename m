Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 556227D415
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 06:52:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44h57G1PBQzPV;
	Sat, 13 Apr 2019 08:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555138378;
	bh=uCCF7iKmfFJE16zh3d4rvNtDNzYMnti4WSEfaBe/TlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gHWCEqtDztGNlBu9W3sFIQjmnUnAj0pQvzQn2g8j+fyJx9KpUBZnZ/nJpuXs5EUii
	ObdV1+aAQfgkvtuPGQGBwqcucHuv3dxKqWJqiW3ztbv6oey9hIBOHFHrY/eDvmGdha
	8Vya+4BGGE2N4Brg9ib6nrmcxKsIdYcxM3YLN8ZBghP9EC7SFHS/PVZyPjNUpstdIP
	0QWjNhAqn4KhSrCX/XFU3DjnbGAEKMAGgUkzVewJghKT02kMQv2wgSnW6oSJ6qh9ai
	EeDi9iZzu06cT0c0R5uewgf5LqSjBZ4gjnAXEkZjvvh+FNAZ8ln7bMWFOGwEdBNW01
	uYXGvnQ8x6S3PxVSxG8iju6Nj/iMHOjyy/Dh/N4pnvXqQuWwZQ7D8u9yXnnLy6DFFH
	tkwdkuQHSaaENslghx38HIl/Sj7ZqzQwU+nxlhFlD1UlZxRthB8PWOgdhsbv+kp/uP
	M2K7GvlmWMjMEtv3Ywt1iM+07Cn5bym8qeQk6R7z66CNnrtX6HTR2r4v+ArvkYb2/Y
	lJWWJ/IpagV5YvQEae6MHbH9BW48zz7bX07q11om0DIyTyWQYl+/x4b624unmVXGCg
	cTa+/9oyhTQGirhE11RFbcKQS+/y8coxF9Z9jFHKnoLQEjSS7sZmFQZFAhbbwmFSUS
	YUaxlh7FhdtxlMFrYrSPo01s=
Date: Sat, 13 Apr 2019 09:52:56 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190413065256.GB10988@localhost>
References: <20190412210912.21432-1-bunk@stusta.de>
	<CAMKF1srHOayZ_MVHrwEA=54XD7HS5D5jT_fYmqF84mYuJ-cjEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srHOayZ_MVHrwEA=54XD7HS5D5jT_fYmqF84mYuJ-cjEw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set XZ_COMPRESSION_LEVEL to -9
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
X-List-Received-Date: Sat, 13 Apr 2019 06:52:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 12, 2019 at 04:12:19PM -0700, Khem Raj wrote:
> On Fri, Apr 12, 2019 at 2:09 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > It is consistent with other compressors also using their
> > best compression.
> >
> > xz is currently the option that offers best compression,
> > using settings even lower than the default is surprising
> > and makes it harder to choose the best available compression.
> >
> > For anyone who cares about compression time using a different
> > option like gzip or bzip2 is the logical choice.
> >
> > For decompression, better compressed is actually faster
> > to decompress.
> 
> I worry about resources we need to spend when creating these archives.
> Can you post some comparisons
> along to assess the performance.

On my laptop single-threaded compression of an image I am frequently
building takes 20s with -3 and 55s with -9.

Building the whole image from scratch takes more than 2 hours.

If you care about resources spent, I remember it saved me around 10 
minutes build time when I changed OPKGBUILDCMD from the default "xz -6" 
to "gzip -1" - for the common case where package feeds are not used 
there is no point in spending time on compression and decompression.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


