Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4wnM-0007mR-Ld for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 18:31:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OGJXL5014399;
	Fri, 24 Aug 2012 17:19:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11916-08; Fri, 24 Aug 2012 17:19:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OGJQOh014393
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 24 Aug 2012 17:19:27 +0100
Message-ID: <1345825168.14369.85.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andy Ross <andy.ross@windriver.com>
Date: Fri, 24 Aug 2012 17:19:28 +0100
In-Reply-To: <5037A36C.8020401@windriver.com>
References: <1345817543.14369.70.camel@ted> <5037A36C.8020401@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Add fix for libtool rpath problems
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
X-List-Received-Date: Fri, 24 Aug 2012 16:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-24 at 08:53 -0700, Andy Ross wrote:
> On 08/24/2012 07:12 AM, Richard Purdie wrote:
> > This avoids problems with libstdc++ having bad rpaths (/usr/lib/../.lib)
> > in its .la file. See the patch for more information.
> 
> Heh, I was just sitting down having discovered the same thing.  Isn't
> the root cause at least partially that gcc is using a different
> libtool implementation than the rest of the build?  I note it's also
> missing the normalization patches that went into the standard libtool
> (though that's benign here as -rpath isn't used).

gcc is one of the few things we don't reautoconf so it doesn't pick up
our libtool. We therefore end up patching libtool in it and binutils
manually which can be a bit of a pain...

I'd love to have a better fix for this. I suspect its taking the path
from some "gcc -print-xxxx" call which returns /usr/lib/../lib on x86_64
so we could try and normalise it at source...

Cheers,

Richard



