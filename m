Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 582086B39C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 12:13:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMCDRf3015520; Fri, 22 Nov 2013 12:13:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9jJMgQqCQnpc; Fri, 22 Nov 2013 12:13:26 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMCDMV2015505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Nov 2013 12:13:23 GMT
Message-ID: <1385122398.16887.160.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Olof Johansson <olof.johansson@axis.com>
Date: Fri, 22 Nov 2013 12:13:18 +0000
In-Reply-To: <20131122083212.GF20888@axis.com>
References: <cover.1385039538.git.hongxu.jia@windriver.com>
	<0e29f77b1778e75f547289c20e670fc0ffd5e070.1385039538.git.hongxu.jia@windriver.com>
	<528E541B.7000104@linux.intel.com> <528E6199.80306@windriver.com>
	<528E6239.8040507@linux.intel.com> <528EF295.9040704@windriver.com>
	<528EF8E6.9090301@windriver.com> <20131122083212.GF20888@axis.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] qemu: add bash and python to qemu's RDEPENDS
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
X-List-Received-Date: Fri, 22 Nov 2013 12:13:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 09:32 +0100, Olof Johansson wrote:
> On 13-11-22 07:25 +0100, Hongxu Jia wrote:
> > Hi Saul,
> > 
> > The script could not be de-bashed,  it was made by create_wrapper
> > which is bashism:
> > Vim image/usr/bin/qemu-mips
> > ...
> > #! /bin/bash
> > realpath=`readlink -fn $0`
> > export QEMU_RESERVED_VA=0x0
> > exec -a `dirname $realpath`/qemu-mips `dirname $realpath`/qemu-mips.real "$@"
> > ...
> > 
> > The exec's -a option is bashism, so we need to add bash to RDEPENDS.
> 
> 1) Is the wrapper still necessary?
> 
> The comment above the do_install_append in the recipe:
> 
> # The following fragment will create a wrapper for qemu-mips user emulation
> # binary in order to work around a segmentation fault issue. Basically, by
> # default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
> # This will trigger a MMU access fault in the virtual CPU. With this change,
> # the qemu-mips works fine.
> # IMPORTANT: This piece needs to be removed once the root cause is fixed!

Someone could retest it but as far as I know the issue still exists.

> 2) More generally, is -a generally necessary when exec'ing like this? Can't
>    this be solved in another way?

We've gone around in circles on this and yes, execing using -a is needed
and if we don't do that we hit other bugs. See the history of the
create_wrapper function.

Cheers,

Richard





