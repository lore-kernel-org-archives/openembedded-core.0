Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SA0Wd-0003Ox-VZ for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 15:59:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2KEo46P011221;
	Tue, 20 Mar 2012 14:50:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09853-10; Tue, 20 Mar 2012 14:50:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2KEnsr2011205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 20 Mar 2012 14:49:55 GMT
Message-ID: <1332254996.9740.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wolfgang Denk <wd@denx.de>
Date: Tue, 20 Mar 2012 14:49:56 +0000
In-Reply-To: <20120320103520.22B00202A50@gemini.denx.de>
References: <20120319215934.5336A206060@gemini.denx.de>
	<1332203843.9740.76.camel@ted>
	<20120320103520.22B00202A50@gemini.denx.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: specific version dependenciews
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
X-List-Received-Date: Tue, 20 Mar 2012 14:59:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-20 at 11:35 +0100, Wolfgang Denk wrote:
> Dear Richard,
> 
> In message <1332203843.9740.76.camel@ted> you wrote:
> ...
> > > Some MACHINEs require a package A (some library), but in specific
> > > versions: say machine X needs version A-1.2, while machine Y needs
> > > version A-1.5.
> > > 
> > > Package A itself depends on another package B (another library).
> > > 
> > > The problem is, that different versions of A require specific versions
> > > of B.  For example, to build A-1.2 we must use B-4.5, but to build
> > > A-1.5 we must use B-8.2.
> > > 
> > > I am aware that I can describe the dependencies at the top leven,
> > > stating for example that machine X needs A-1.2 and B-4.5, while
> > > machine Y needs A-1.5 and B-8.2.
> > > 
> > > However, this seems clumsy, as the version depency A->B is something
> > > that is only defined by the implementation of A, and I would like to
> > > keep it encapsulated at this level.
> > > 
> > > 
> > > Is there a clever way to describe such a multi-level dependency chain?
> > 
> > If you mark A and B as machine specific, the system should be able to
> > cope with the problem and set the preferred versions at the machine
> > level.
> 
> I'm sorry, but I don't understand what you mean.
> 
> How do I mark a package as machine specific?

PACKAGE_ARCH = "${MACHINE_ARCH}"

> And would setting "the preferred versions at the machine level" not be
> exactly what I am trying to avoid?
> 
> I don't want to make the machine descriptions aware of any version
> dependencies between A and B.  I would like to put this information
> into the description of A, so that when a specific version of A gets
> built, automatically the matching version of B will be chosen.
> 
> Can this be done?

You could write the dependency A in the form:

DEPENDS = "B-1.2"

where 1.2 is version of B you want. This has been known to work in the
past but isn't well supported/well tested. It can work since B PROVIDES
"${PN}-${PV}".

Cheers,

Richard



