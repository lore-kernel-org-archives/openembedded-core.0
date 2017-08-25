Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id E9F91783C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:39:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3xdx2H34dDz1qy0r;
	Fri, 25 Aug 2017 11:39:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3xdx2H0Svvz3hhTK;
	Fri, 25 Aug 2017 11:39:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id VY405Z317qJY; Fri, 25 Aug 2017 11:39:18 +0200 (CEST)
X-Auth-Info: 7FjJ8DMqUUjFFoKbhOUTv8Hh0QMDv4exDV37rmnuBNcVRi41kgOwDShru1JaOMVU
Received: from [10.0.0.72] (host-141-40-253-38.customer.izb-online.de
	[141.40.253.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 25 Aug 2017 11:39:18 +0200 (CEST)
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <20170824181946.4529-1-o.mandel@menlosystems.com>
	<1765670.s4Evp06e0l@peggleto-mobl.ger.corp.intel.com>
From: Olaf Mandel <o.mandel@menlosystems.com>
Message-ID: <fa27449a-ffe7-c742-3d2f-6bcac9cac20f@menlosystems.com>
Date: Fri, 25 Aug 2017 11:38:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1765670.s4Evp06e0l@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] (PRE)MIRRORS: add pattern for npm:// without slash
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
X-List-Received-Date: Fri, 25 Aug 2017 09:39:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Paul,

Am 24.08.2017 um 22:53 schrieb Paul Eggleton:
> On Friday, 25 August 2017 6:19:46 AM NZST Olaf Mandel wrote:
>> For URLs with the npm:// transport but with no other slash in it,
>> the common MIRRORS and PREMIRRORS pattern of npm://.*/.* fails to
>> match. Add a new pattern in the mirros.bbclass and
>> own-mirrors.bbclass classes for these URLs.
- -Snipp-
> 
> Couldn't we just do away with npm://.*/.* ?
> 
While that would fix my specific problem, it would introduce a
backwards-breaking change: if someone _did_ have a SRC_URI with a
slash in it, this would change where on the mirror the package is
searched for:

SRC_URI = npm://foo.tld/bar;name=baz;version=0.1.2
npm://.*/.* =>     baz-0.1.2.tar.xz
npm://.*    => bar/baz-0.1.2.tar.xz

So keeping both lines is the better solution. But while testing this I
found that the order I chose (first npm://.*, then npm://.*/.*) is
wrong: this first tries the changed (wrong) location on the mirror and
only then the original (correct) one. It is much more efficient to
sort the lines the other way around: this prevents extra network
traffic, if the mirror is not local. I will send an updated batch soon.

Best regards,
Olaf
- -- 
Olaf Mandel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZn+/7AAoJEFS9nbRiUh3/0EMIAJTUoXVsvSLWDUm8phbAEoXb
jQZW7hfP+CHzn1V7X6kTu4CZlQWhxOzYbv07sd2cz/4+Hr2U/7JJCul2QTQGizc/
NxVKaixR8V0tM0irn8NeAHexLXLj+dKdmbvaG/H/BeHhFZc4eQOt6gmbGZ1F7V2g
njcP7nui13HbYpHViGFKMT5hnU9B2gKWQ0FAtY6kGZFS1UDvyGFXyHXn1kU0hzjl
6nRuG0q18uueUEEFxqjo4Cb5BTNEjC/QIGIKbSTsqBIU1r3t7uaPSHIYihnRGZ9M
bCpoFKB2PFgi8qFl+cUaFBmtGMeh+loEIDIi1eZ1HmRO7ST0glDmxB0SKM1N06I=
=QS0a
-----END PGP SIGNATURE-----

