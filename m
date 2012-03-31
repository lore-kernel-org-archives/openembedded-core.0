Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SE1lZ-0000KF-Dc for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 19:07:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VGvxNs025042
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 17:57:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24555-04 for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 17:57:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VGvpvh025036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 17:57:52 +0100
Message-ID: <1333213071.18082.249.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 31 Mar 2012 17:57:51 +0100
In-Reply-To: <alpine.DEB.2.02.1203302010020.17135@oneiric>
References: <alpine.DEB.2.02.1203302010020.17135@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: why does "bitbake -e" check the license of a *non*-included recipe file?
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
X-List-Received-Date: Sat, 31 Mar 2012 17:07:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-30 at 20:17 -0400, Robert P. J. Day wrote:
> goofing around with "bitbake -e" and, with a clean oe-core checkout,
> both of the following work:
> 
> $ bitbake -e
> $ bitbake -e core-image-core
> 
>   now, just for fun, i added a trivial recipe file to that images/
> directory to see what kind of error message i would get if i neglected
> to include a license, so i added the rday.bb recipe file (one of the
> files i was using to test assignment):
> 
> RDAY ??= "rday1"
> RDAY ??= "rday2"
> RDAY ?= "rday3"
> 
> then tested:
> 
> $ bitbake -e rday
> Loading cache: 100% |######################################################################| ETA:  00:00:00
> Loaded 1106 entries from dependency cache.
> ERROR: This recipe does not have the LICENSE field set (rday)                              | ETA:  --:--:--
> ERROR: Unable to parse /home/rpjday/oe/oe-core/meta/recipes-core/images/rday.bb: Exited with "1"
> ERROR: Command execution failed: Exited with 1
> 
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
> $
> 
> so that's pretty much what i expected.  what i *didn't* expect was
> that this would still work:
> 
> $ bitbake -e

This only parses the configuration. No recipes are parsed.

> while this would now fail:
> 
> $ bitbake -e core-image-core
> Loading cache: 100% |######################################################################| ETA:  00:00:00
> Loaded 1106 entries from dependency cache.
> ERROR: This recipe does not have the LICENSE field set (rday)                              | ETA:  --:--:--
> ERROR: Unable to parse /home/rpjday/oe/oe-core/meta/recipes-core/images/rday.bb: Exited with "1"
> ERROR: Command execution failed: Exited with 1
> 
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
> $
> 
>   the recipe file "rday.bb" is not being included in any of the other
> images, so why should its lack of a license file cause that kind of
> problem?

The license validity checks are at recipe parse time, not at execution
time.

Cheers,

Richard





