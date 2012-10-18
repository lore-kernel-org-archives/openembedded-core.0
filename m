Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TOryw-0006of-Oj for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 17:26:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9IFCYdh020788;
	Thu, 18 Oct 2012 16:12:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20644-02; Thu, 18 Oct 2012 16:12:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9IFCQJ5020782
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 18 Oct 2012 16:12:27 +0100
Message-ID: <1350573146.2520.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 18 Oct 2012 16:12:26 +0100
In-Reply-To: <7b8c12ae454f69996f935aef35cccc6d352b0964.1350571171.git.bruce.ashfield@windriver.com>
References: <cover.1350571171.git.bruce.ashfield@windriver.com>
	<7b8c12ae454f69996f935aef35cccc6d352b0964.1350571171.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel.bbclass: remove explicit version.h target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 15:26:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-18 at 10:47 -0400, Bruce Ashfield wrote:
> The compilation routine for the kernel has an explicit call to
> build version.h, which works fine for most kernels, but the
> location of it has recently changes.
> 
> commit d183e6f5 [UAPI: Move linux/version.h]
> commit 10b63956 [UAPI: Plumb the UAPI Kbuilds into the user
>                  header installation and checking]
> 
> moves the file to include/generated/linux/version.h and then to
> include/generated/uapi/linux/version.h.
> 
> As a result kernel builds of 3.7 or bisection builds of intermediate
> kernel commits will fail with:
> 
>   make[2]: *** No rule to make target `include/linux/version.h'.  Stop.
> 
> Making the explicit version.h build conditional on the version, or
> via a file test would fix the problem, but it introduces some complexity
> to the build.
> 
> Even without an explicit call to build version.h, it is always produced
> by the kernel build, so it can simply be removed.
> 
> Note: it isn't clear why the explicit build of version.h was originally
> required, but the prep phases of the kernel have changed significantly,
> so it should no longer be required.

I had a look through the archives. I think this is a throwback to 2.4,
we had to build the version.h file to figure out if we had a 2.6 or a
2.4 kernel, then we could do the right thing to build it.

Since we don't support 2.4 anymore, this can die!

Cheers,

Richard



