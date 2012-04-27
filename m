Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNipw-0002E2-6J for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 12:55:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RAjxmX014871;
	Fri, 27 Apr 2012 11:46:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12808-08; Fri, 27 Apr 2012 11:45:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RAjnKm014865
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Apr 2012 11:45:50 +0100
Message-ID: <1335523550.20130.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Zhai, Edwin" <edwin.zhai@intel.com>
Date: Fri, 27 Apr 2012 11:45:50 +0100
In-Reply-To: <20120427082009.GH1450@edwin-gen>
References: <20120426075321.GG1450@edwin-gen> <20120427082009.GH1450@edwin-gen>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Pango multilib issue
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
X-List-Received-Date: Fri, 27 Apr 2012 10:55:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-27 at 16:20 +0800, Zhai, Edwin wrote:
> Any comments?
> I'd like a agreement before any patch:)
> 
> Thanks,
> Edwin
> 
> 
> On Thu, Apr 26, 2012 at 03:53:22PM +0800, Zhai, Edwin wrote:
> > RP,
> > 
> > I have found one common issues for multilib when system config file differ 
> > between multilibs.
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=2356
> > This bug caused by modules mechanism in pango:
> > 
> > pango utils, pango-querymodules produce a system config file to indicate where
> > to find the modules when 1st boot, like /usr/{lib64|lib}/pango/1.6.0/modules/
> > for {x86-64|lib32}-pango respectively. 
> > 
> > When installing lib32-pango on sato-image-qemux86-64, lib32 version of
> > pango-querymodules override x86-64 version and produce a system config file
> > with path for lib32 version of modules. Then x86-64 matchbox-desktop failed to
> > open these modules and loaded corrupted fonts.
> > 
> > To resolve this conflict, one possible solution is put the config file and 
> > binary under different dir: $LIBDIR for config file, and 
> > /usr/{libexec|lib64exec} for config binary(or create different dir under 
> > /usr/bin/ for different multilib)
> > 
> > Any comments for this?

/libexec and /lib aren't really the correct locations for a
configuration file like this.

I think in the mutlilib cases I'd like to move the config file a
directory deeper so /etc/pango/${baselib}/pango.modules in the mutliib
cases. The standard system file would remain in its existing location.

Cheers,

Richard




