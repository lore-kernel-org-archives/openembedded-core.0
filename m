Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UcCbd-0006YA-9w for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 12:37:19 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4EALxx8001370; Tue, 14 May 2013 11:21:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Htfgmd6a4GDu; Tue, 14 May 2013 11:21:59 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4EALo9p001361
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 14 May 2013 11:21:53 +0100
Message-ID: <1368526728.25898.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Tue, 14 May 2013 13:18:48 +0300
In-Reply-To: <51920240.3070408@r-finger.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
	<1368442968.6920.4.camel@phil-desktop.brightsign>
	<CAJTo0LYSqikcyXKsXA5OpnUNmwbvrRqbi4kQ93r2QzBtEuo2zQ@mail.gmail.com>
	<5190CF63.2030303@r-finger.com>
	<1368456796.6920.23.camel@phil-desktop.brightsign>
	<51920240.3070408@r-finger.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Tue, 14 May 2013 10:37:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-14 at 10:22 +0100, Tomas Frydrych wrote:
> On 13/05/13 15:53, Phil Blundell wrote:
> > On Mon, 2013-05-13 at 12:32 +0100, Tomas Frydrych wrote:
> >> On 13/05/13 12:06, Burton, Ross wrote:
> >>> The problem with bbappends is that they break every time the package
> >>> in oe-core changes version.
> >>
> >> I see this as a good thing; if I maintain a bbappend, I want to know
> >> when the base package changes its a version, and I get an immediate
> >> error due to bbappend to a non-existent file.
> > 
> > Personally, for the .bbappends that I maintain, I would much rather not
> > have to go around renaming a bunch of files every time I merge a new
> > version of oe-core and all the recipes get upgraded. 
> > 
> > But, if you enjoy the errors, you could easily enough get them back even
> > if the filenames didn't change:
> > 
> > python() {
> >     tolerable_pvs = [ '1.0', '1.1', '1.2' ]
> >     pv = d.getVar('PV', True)
> >     if not pv in tolerable_pvs:
> >         bb.fatal("encountered intolerable version %s of underlying recipe, please adjust me accordingly" % pv)
> > }
> > 
> > or something.  One could wrap that in some extra sugar and put it in
> > base.bbclass if having the boilerplate in each .bbappend is unappealing.
> 
> I do like this approach; I'd probably wrap it in a class and let the
> bbappend maintainer to decide if their bbappend deserves this or not.

I'd take a patch adding this form of function to the core. I'd also take
a patch to have bitbake do some primitive wildcard (% along the lines of
PREFERRED_VERSION?) type match on the bbappend filenames. It will add in
a few new interesting corner cases such as one bbappend matching
multiple recipes. We have to keep in mind bitbake has no knowledge of
the filename format, that is metadata defined.

Cheers,

Richard



