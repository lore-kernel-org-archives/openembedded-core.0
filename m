Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qw2bS-0001Do-Gh for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 03:50:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7O1jGqv014649;
	Wed, 24 Aug 2011 02:45:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13340-10; Wed, 24 Aug 2011 02:45:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7O1j5KL014643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 24 Aug 2011 02:45:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0597F428-97F2-461F-804B-FE793E911BD4@kernel.crashing.org>
References: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D724C903@shsmsx501.ccr.corp.intel.com>
	<0597F428-97F2-461F-804B-FE793E911BD4@kernel.crashing.org>
Date: Tue, 23 Aug 2011 18:45:03 -0700
Message-ID: <1314150303.5939.70.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: why do we poison -Os?
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
X-List-Received-Date: Wed, 24 Aug 2011 01:50:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-23 at 20:32 -0500, Kumar Gala wrote:
> If tinylogin is the only issue why modify/patch gcc?  I see we have
> meta/recipes-core/tinylogin/tinylogin-1.4/use_O2_option.patch to deal
> with this?
> 
> Not allowing -Os at all, which is our current situation on PPC is
> problematic.  So trying to see if this issue is really limited to gcc
> 4.5 or not.  How can I reproduce it with current poky.git?

We were seeing problems when makefiles were putting -Os into compiler
flags without our knowledge. In some cases -Os was silently corrupting
binaries. We therefore ended up adding the poison so if anything was
using the option we knew to generate buggy code, we'd know about it.

If we know gcc to be safe using that option we can drop the patch and
users can enable it where it makes sense to them. I still don't like
makefiles changing compiler optimisations from under us though. Last I
heard, -Os was still very badly supported and not recommended by the gcc
community.

Cheers,

Richard



