Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB3wd-0001f9-5J for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:50:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NCfKtq026677
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:41:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26101-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:41:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NCfDue026671
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:41:14 GMT
Message-ID: <1332506475.9740.409.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 12:41:15 +0000
In-Reply-To: <4DCCC4C4-51F4-43CF-ACF2-BF3D2BAD7BDC@dominion.thruhere.net>
References: <4DCCC4C4-51F4-43CF-ACF2-BF3D2BAD7BDC@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sstate reuse for -native, -cross across different host glibc version, how to make it work?
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
X-List-Received-Date: Fri, 23 Mar 2012 12:50:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 13:22 +0100, Koen Kooi wrote:
> I turned on sstate mirroring for angstrom recently and I'm getting
> reports of build failures due to missing GLIBC_2.14 symbols:
> 
> arm-angstrom-linux-gnueabi-gcc: /lib/x86_64-linux-gnu/libc.so.6:
> version `GLIBC_2.14' not found (required by
> arm-angstrom-linux-gnueabi-gcc)
> 
> The sstate tarballs are built on a Fedora16 VM and the breakage occurs
> when it being used on systems with an older c library (e.g. debian).
> To get rid of this problem there are multiple options, but I think the
> 2 most obvious are:
> 
> 1) inject host distroname and distroversion into the checksums
> 2) build everything against a native libc
> 
3) Use an older version on the VM which is the oldest distro you plan to
build against.

> Would it be appropriate to get 1) into oe-core before the branchpoint?

We've talked about this and its been on the "to fix" list but nobody has
got around to it. Its hard as we need to come up with something that
isn't going to kill performance of the checksum calculations. A cat
operation on a few files for each checksum for example isn't
appropriate. We may need to do something at the bitbake level as there
is also the issue of checksuming local files such as those in file://
urls and including that in the sstate checksums.

So whilst I'd love to see fixes for these and they are bugfixes, they're
going to have to be well written patches and its late in cycle for
invasive changes :(.

Cheers,

Richard




