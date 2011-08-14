Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qsisv-0003vu-HJ
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 00:10:21 +0200
Received: by iyf13 with SMTP id 13so6321018iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Aug 2011 15:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=zTdQhSgbw9oK9woZTrQ+OV5qkAhoBox1uY9ilmCo/s8=;
	b=XFhigzQDXkhCS+KhPnu4EvK40xBTsWrbO+mwURmVgitwBNuy3T8UebJi4V2eDt37HH
	mUl3O8bLeLZ3w9S1mQtuqxaFdULRy60tW8qlxIfsPwriy/C1FUbJiafSAZdT2akC9YP0
	O8HxOGYUc57GI/alw5JjiQjb67Ql9uckafpvA=
Received: by 10.43.46.70 with SMTP id un6mr3070196icb.361.1313359545414;
	Sun, 14 Aug 2011 15:05:45 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q13sm3415506ibi.60.2011.08.14.15.05.43
	(version=SSLv3 cipher=OTHER); Sun, 14 Aug 2011 15:05:44 -0700 (PDT)
Message-ID: <4E4846B6.9080903@gmail.com>
Date: Sun, 14 Aug 2011 15:05:42 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <201108142050.37352.paul.eggleton@linux.intel.com>
In-Reply-To: <201108142050.37352.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.2.1
Subject: Re: Machine specific sysroot issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Aug 2011 22:10:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/14/2011 12:50 PM, Paul Eggleton wrote:
> Hi all,
> 
> I've brought over the Opie recipes from OE in preparation for
> creating a separate layer, and after making a few changes everything
> compiles OK; however I'm finding that the change to machine-specific
> sysroots is causing some problems.
> 
> libopie2, a non-machine specific package, among other things installs
> a file called include.pro into ${OPIEDIR}, which is configured to be
>  ${STAGING_DIR_HOST}. In OE-classic ${STAGING_DIR_HOST} is not
> machine-specific, so if you build libopie2 for machine A then build
> some other package that needs include.pro for machine B, then
> everything is fine. In the OE-core case with machine-specific
> sysroots it's looking for the file in the sysroot for the current
> machine, which if you've been building for several different machines
>  may not be where it has actually been installed.
> 
> What's the correct way to fix this? Is libopie2 now installing this
> file in the wrong place?

I think with shared state it should be able to reuse what was built
before. It does not share the target sysroot like oe.dev
as long as the .pro file is part of a package it should be able to stage
it into machine sysroot and use it without causing a recompile

> 
> Cheers, Paul
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5IRrYACgkQuwUzVZGdMxSvEQCfblKkiL3uZLnwyjI+Nhymj9zf
zRUAn1BjKeIcTkHXvTFzAr2M5G0UK8qd
=6zRI
-----END PGP SIGNATURE-----


