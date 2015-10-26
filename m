Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 327D26013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 21:35:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9QLZeHl029835
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 26 Oct 2015 14:35:40 -0700
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 14:35:39 -0700
To: Phil Blundell <pb@pbcl.net>
References: <562E3896.6080405@windriver.com>
	<1445875841.5251.107.camel@pbcl.net> <562E58BE.9060003@windriver.com>
	<1445878220.5251.110.camel@pbcl.net> <562E5AF1.3080807@windriver.com>
	<1445894299.6900.8.camel@pbcl.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <562E9CAA.7000805@windriver.com>
Date: Mon, 26 Oct 2015 16:35:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445894299.6900.8.camel@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Prelink problems -- need help!
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
X-List-Received-Date: Mon, 26 Oct 2015 21:35:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 10/26/15 4:18 PM, Phil Blundell wrote:
> On Mon, 2015-10-26 at 11:55 -0500, Mark Hatle wrote:
>> -last- time I got concrete numbers on a complex boot process.  It was on the
>> order of 1-5% boot time.. and a fairly large number of pages saved.. (which
>> reduced fragmentation as well as saved memory.)
> 
> I'm slightly surprised at the 5% figure.  Martin Jansa posted some
> statistics in another thread earlier today which showed an improvement
> from prelink of just under 0.5% (0.24 seconds saved out of 49.51 seconds
> total) and that's more like what I would have expected.  What sort of
> binaries were you running on the system you measured?

At the time, it was systemd, X11, a custom control module and a custom UI
program.  The custom UI program was written in C++ and had a heck of a lot of
libraries attached, and lots of RPC via dbus.

> I also don't entirely understand the fragmentation argument.  We're not
> talking about a no-mmu configuration here, are we?

Fragmentation takes time and can slow down memory allocation.  We've got both
the kernel page allocation, as well as the internal glibc memory allocation.
They work together, but are not the same.  (glibc will grab pages of memory from
the kernel and then dish them out.  As this memory fragments, it has to pull
more from the kernel to compensate... as well as free blocks to get more
contiguous memory allocated).. It's a bit of a viscous cycle of some small systems.

--Mark

> p.
> 
> 


