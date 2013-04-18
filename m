Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USmM6-0006aZ-Mn for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 12:46:24 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IATF5s029999; Thu, 18 Apr 2013 11:29:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NMah6LGfAyhw; Thu, 18 Apr 2013 11:29:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IAT8lW029990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 18 Apr 2013 11:29:10 +0100
Message-ID: <1366280909.10502.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 18 Apr 2013 11:28:29 +0100
In-Reply-To: <ly38uoywcw.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1366211991.25282.34.camel@ted>
	<ly38uoywcw.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup: Add init-manager sanity check
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
X-List-Received-Date: Thu, 18 Apr 2013 10:46:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-18 at 12:19 +0200, Enrico Scholz wrote:
> 
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> > Currently, you can set VIRTUAL-RUNTIME_init_manager to an init system
> > that isn't in DISTRO_FEATURES. This leads to head scratching over
> > unbootable images.
> 
> Because this sanity check is placed into an anonymous function, this
> change affects also images which do not not include packagegroup-core*
> in their images and are not using VIRTUAL-RUNTIME_init_manager at all.

Affects in that it runs the anonymous python fragment but does nothing? 

If you're worried about that overhead, there are fragments elsewhere
which have a much more significant overhead.

> It would be probably better to execute this check only, when the package
> gets built.  Or add
> 
> DEPENDS += "${@some_check(d)}"
> 
> where some_check(d) evaluates to 'broken-virtual-runtime' or so when bad
> configuration has been detected and empty else.

I did give this quite a bit of thought and couldn't come up with a
better way to handle it. The DEPENDS change above would certainly
trigger an error but it wouldn't be obvious to the user what happened or
how they might fix it. Making that approach give a better error message
would be much more invasive and have worse performance impact.

Other proposals for solutions are welcome. I thought it better to catch
a common user misconfiguration than generate broken images silently
though.

Cheers,

Richard



