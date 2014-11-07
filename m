Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 910 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Nov 2014 13:45:16 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C716665CA0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 13:45:16 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Xmjc3-000694-P7 for openembedded-core@lists.openembedded.org;
	Fri, 07 Nov 2014 14:30:03 +0100
Received: from p57A56213.dip0.t-ipconnect.de ([87.165.98.19])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 14:30:03 +0100
Received: from patrick.ohly by p57A56213.dip0.t-ipconnect.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 14:30:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 7 Nov 2014 10:12:02 +0000 (UTC)
Message-ID: <loom.20141107T110211-131@post.gmane.org>
References: <1415088547.4530.142.camel@intel.com>
	<9989828.c0GAiu1EUm@chl500346>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 87.165.98.19 (Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.1.0)
Subject: Re: runqemu + dhcp server
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
X-List-Received-Date: Fri, 07 Nov 2014 13:45:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Adrian Freihofer <adrian.freihofer@...> writes:
> Personally I would prefer a slightly different implementation.
> I consider the 192.168.7.2 network interface as development, debugging
> and testing interface which should just work.

Agreed, and it doesn't work at the moment when the image has an Ethernet
configuration mechanism that wasn't adapted to use the ip kernel parameter. 
What you are proposing goes beyond just fixing that. I don't have any strong
opinion about the right way forward.

> By the way, where does your solution make use of the DHCP server?

When Connman starts up, it finds eth0 and obtains an IP address for it via
DHCP. Without the DHCP server, the guest ends up without an IP address. I
have not checked if the ip parameter was ever used.

Note that this is what the default Tizen Connman config does, not what Poky
would do when building and installing Connman. The whole point was the
ability to use production images without special tweaks. 

> The 
> eth0 IP configuration is assigned by kernel boot parameters in
> runqemu-internal. If this configuration gets changed later on the NFS 
> rootfs will break...

I haven't tried NFS rootfs. My hope is that it would still work because the
ip parameter and the DHCP server assign the same IP address and thus nothing
changes inside the guest when switching from one to the other.




