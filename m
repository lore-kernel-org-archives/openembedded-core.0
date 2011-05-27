Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPsrk-0002oG-OO for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 10:57:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4R8sn2p000647
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 09:54:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32732-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 09:54:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4R8sg3Q000640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 09:54:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <FD9AE248-A10D-4079-B66F-8F4AB94B94F7@dominion.thruhere.net>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<1306452822.27470.220.camel@rex>
	<FD9AE248-A10D-4079-B66F-8F4AB94B94F7@dominion.thruhere.net>
Date: Fri, 27 May 2011 09:54:37 +0100
Message-ID: <1306486477.27470.253.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Fri, 27 May 2011 08:57:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 09:14 +0200, Koen Kooi wrote:
> Op 27 mei 2011, om 01:33 heeft Richard Purdie het volgende geschreven:
> 
> > On Thu, 2011-05-26 at 13:41 -0700, nitin.a.kamble@intel.com wrote:
> > I've suggested something like:
> > 
> > TARGET_CC_ARCH_arm_pn-mesa-xlib := "${@'${TARGET_CC_ARCH}'.replace('armv7','armv5')}"
> > 
> > which whilst ugly, should do what we need it to.
> 
> So how do I opt out of that? I don't use gcc 4.6 and suddenly mesa gets compiled for a suboptimal architecture.

Good question. I guess you're just changing the gcc version but using
the rest of that file?

This is a tricky problem as we do want to include that for anyone using
gcc 4.6 as otherwise things break but as you say, can't impact someone
using that file but changing its values.

I guess the solution will be to turn it into anonymous python checking
if we're:

* using gcc 4.6
* building for arm
* using armv7 optimisations
* building mesa-xlib

The other way is to add a conditional to that statement on the gcc
version variable which is perhaps going to be easiest.

Cheers,

Richard




