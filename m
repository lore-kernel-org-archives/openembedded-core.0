Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 389A06CED7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 08:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 88F793C2707;
	Fri, 22 Nov 2013 09:32:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6zcg7KNbJYAO; Fri, 22 Nov 2013 09:32:15 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id CC3B73C2702;
	Fri, 22 Nov 2013 09:32:14 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8A4B95C3;
	Fri, 22 Nov 2013 09:32:14 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 7EF82379;
	Fri, 22 Nov 2013 09:32:14 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 7C8963404E;
	Fri, 22 Nov 2013 09:32:14 +0100 (CET)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0;
	Fri, 22 Nov 2013 09:32:14 +0100
Date: Fri, 22 Nov 2013 09:32:12 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20131122083212.GF20888@axis.com>
References: <cover.1385039538.git.hongxu.jia@windriver.com>
	<0e29f77b1778e75f547289c20e670fc0ffd5e070.1385039538.git.hongxu.jia@windriver.com>
	<528E541B.7000104@linux.intel.com> <528E6199.80306@windriver.com>
	<528E6239.8040507@linux.intel.com> <528EF295.9040704@windriver.com>
	<528EF8E6.9090301@windriver.com>
MIME-Version: 1.0
In-Reply-To: <528EF8E6.9090301@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Fri, 22 Nov 2013 08:32:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13-11-22 07:25 +0100, Hongxu Jia wrote:
> Hi Saul,
> 
> The script could not be de-bashed,  it was made by create_wrapper
> which is bashism:
> Vim image/usr/bin/qemu-mips
> ...
> #! /bin/bash
> realpath=`readlink -fn $0`
> export QEMU_RESERVED_VA=0x0
> exec -a `dirname $realpath`/qemu-mips `dirname $realpath`/qemu-mips.real "$@"
> ...
> 
> The exec's -a option is bashism, so we need to add bash to RDEPENDS.

1) Is the wrapper still necessary?

The comment above the do_install_append in the recipe:

# The following fragment will create a wrapper for qemu-mips user emulation
# binary in order to work around a segmentation fault issue. Basically, by
# default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
# This will trigger a MMU access fault in the virtual CPU. With this change,
# the qemu-mips works fine.
# IMPORTANT: This piece needs to be removed once the root cause is fixed!

2) More generally, is -a generally necessary when exec'ing like this? Can't
   this be solved in another way?

-- 
olofjn

