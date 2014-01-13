Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DF81A6B446
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 12:42:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0DCfxsq009860; Mon, 13 Jan 2014 12:42:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gVZg2TEnkKJV; Mon, 13 Jan 2014 12:41:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0DCfuSw009857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 13 Jan 2014 12:41:57 GMT
Message-ID: <1389616915.14987.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Mon, 13 Jan 2014 12:41:55 +0000
In-Reply-To: <52D3DDFB.8080803@gmail.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Mon, 13 Jan 2014 12:42:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2014-01-13 at 13:37 +0100, David Nyström wrote:
> Just to clarify bug 5354:
> If I understand the bug correctly, this would arise when first building 
> the nativesdk tarball on a MACHINE with ABI linux,
> and then building the nativesdk for another MACHINE(with the same the 
> same TUNE) after altering ABIEXTENSION to linux-gnuspe ?
> 
> If I understand bug 5354 correctly, perhaps the tmp/sdk/tarball.here 
> can be ABI specific ?

The idea behind the changes to cross-canadian were to have just a single
gcc/binutils which generated all of the appropriate targets for a given
architecture.

I understood this to be possible but it looks like we may need to tweak
things a bit.

> i.e. a generic rule that all nativesdk builds are invalidated if the 
> ABI changes. I guess that would mean:
> cross-canadian.bbclass: TARGET_ARCH[vardeps] += "ABIEXTENSION"
> + Adding ABIEXTENSION to the nativesdk tarball name.
> 
> PPC '=mabi=spe' seems to be one-way compatible,  I could not get the 
> non-SPE configured compiler
> to work with the SPE sysroot.
> Another possible solution would be to always configure the compiler to 
> SPE, and use compile time flags in the
> environment file to do the selects. + symlinks for the compiler paths.

Can we configure the compiler to include SPE support without changing
the paths/OS string?

> However, even if we fix it this way for powerpc, we will still have 
> this issue with thumb f.ex.

Keep in mind the target sysroot still varies for each different target.
The thing we're trying to keep in common is the gcc/bintuils and only
have one copy for each target architecture. Is that possible in this
case if we somehow enable SPE support in gcc-cross-canadian?

Cheers,

Richard


