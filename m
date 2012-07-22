Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sstdq-0005uC-3F for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 12:44:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MAWbro027315
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 11:32:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19932-08 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 11:32:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MAWSXw027309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 11:32:29 +0100
Message-ID: <1342953152.21788.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 11:32:32 +0100
In-Reply-To: <lyipdg878m.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1342871746-14583-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1342946469.21788.54.camel@ted>
	<lyipdg878m.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake: do not set CCACHE_DISABLE=0
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
X-List-Received-Date: Sun, 22 Jul 2012 10:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-22 at 11:39 +0200, Enrico Scholz wrote:
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> >> ccache checks for existence of environment; not for its value:
> >> ...
> >> Hence, avoid setting of $CCACHE_DISABLE instead of assigning '0'.
> >
> > Why doesn't CCACHE_DISABLE[unexport] = "1" help here?
> 
> You mean, keeping the
> 
>  | export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
> 
> and requesting explicitly that user specifies
> 
>  | CCACHE_DISABLE[unexport] = "1"
> 
> in his .conf?  Sounds hacky and inconsistent and makes it impossible to
> set CCACHE_DISABLE by external environment.

The idea is that anyone enabling ccache would inherit the bbclass. The
above could therefore be simplified to a hard ??= 1 which the bbclass
resets and unexports.

> > Doesn't the unexport flag stop this entering the environment?
> 
> Perhaps.  In the current bitbake, 'unexport' takes precedence over
> 'export'.  But is this specified somewhere and will perhaps be changed
> in a later version.

I'll happily take a patch specifying that in the bitbake manual. Other
things would break too if this changed behaviour.

Cheers,

Richard




