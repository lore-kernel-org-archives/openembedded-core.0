Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B384C71247
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 07:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7U7nUjG032117; Sat, 30 Aug 2014 08:49:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o1B5w8R1MuMt; Sat, 30 Aug 2014 08:49:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7U7nO7p032113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 30 Aug 2014 08:49:25 +0100
Message-ID: <1409384965.29296.214.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Sat, 30 Aug 2014 08:49:25 +0100
In-Reply-To: <540148D5.2040808@pabigot.com>
References: <540148D5.2040808@pabigot.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: armv6k support in OE for raspberrypi and s3c6410
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
X-List-Received-Date: Sat, 30 Aug 2014 07:49:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-29 at 22:45 -0500, Peter A. Bigot wrote:
> Unlike normal builds of a gcc toolchain, OE builds the runtime libraries 
> separately in gcc-runtime and using the machine's tuning flags which 
> include the architecture.  The flags affect how atomic operations are 
> implemented in the libraries.

Which are you trying to fix? The on target gcc or the SDK one?

In the SDK case, we have environment files which do explicitly specify
the compiler flags.

On target is harder however the on target gcc is compiled to a specific
PACKAGE_ARCH so we should be able to put specific tuning into that gcc.
It does sound like the changes to gcc-configure-common.inc were not the
way to resolve this though, I'd misunderstood what the patches were
doing.

Can we fix this by adjusting gcc itself (the on target version)?

Its even a very old bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=139

but we've not actually hit issues due to this before or at least they've
not been reported in these terms.

Cheers,

Richard


