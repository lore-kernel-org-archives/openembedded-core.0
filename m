Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1SC7dX-0000dG-Nl
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 12:58:55 +0200
X-IronPort-AV: E=Sophos;i="4.73,649,1325462400"; d="scan'208";a="857138682"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 26 Mar 2012 11:49:43 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>)
	id 1SC7TO-0007a4-VE; Mon, 26 Mar 2012 11:48:26 +0100
Date: Mon, 26 Mar 2012 11:48:26 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120326104826.GA28912@mcrowe.com>
References: <CAHEoWwvDxL4YCD=NNy=wVfWS+xMcSnQDG43Bftrg1jqzpYd5Tw@mail.gmail.com>
	<CAMKF1sqwv=WyUAKzoSc3mGJFzWQvPG3ax=eatLAqT2dfjan6XA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqwv=WyUAKzoSc3mGJFzWQvPG3ax=eatLAqT2dfjan6XA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: mac@mcrowe.com, openembedded-core@lists.openembedded.org
Subject: Re: libtool-cross patch thread : follow up on do_install...
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
X-List-Received-Date: Mon, 26 Mar 2012 10:58:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Mar 25, 2012 at 10:07:17AM -0700, Khem Raj wrote:
> On Sun, Mar 25, 2012 at 8:51 AM, Mike Williamson
> <michael.williamson@criticallink.com> wrote:
> > Hi,
> >
> > I was investigating a build issue using a local recipe inheriting autotools
> > employing libtool (a compile of unixodbc, needed by the new php recipe)
> > and ran into an issue that appears to be solved by modifying the
> > do_install() method of libtool-cross according to comments made
> > in this patch thread:
> >
> > http://patches.openembedded.org/patch/15065/
> >
> > Basically, replace the do_install with "oe_runmake DESTDIR=${D} install"
> > suggested by Khem Raj.   Mike Crowe seemed to think that it cleaned
> > up issues he was having, but the thread seems to die at that point.
> >
> > The current recipe for libtool-cross does not reflect the modification
> > mentioned, so I am wondering if this is not appropriate?
> > Am I doing more harm than good?
> 
> Mike Crowe did not report back so if he saw no issues we should have this patch
> in with required alteration.

I did have some success but I ended up with various other problems
that I never got to the bottom of. I kept hoping I'd be able to
investigate further and solve the remaining problems but that has
turned out not to be the case. :(

I did find that I had to add back the parts from Richard's original
patch that installed stuff in ${bindir_crossscripts}.

But after that it seems that my variables are a mixture of full paths
and relative paths which causes problems when I run make install
whether I use ${MAKE} or oe_runmake and whether I specify DESTDIR or
not.

For example, during do_configure_prepend I have the following:

STAGING_DATADIR=/home/mac/src/oe/build/tmp-eglibc/sysroots/panther/home/mac/src/oe/build/tmp-eglibc/sysroots/panther/usr/share
STAGING_DIR=/home/mac/src/oe/build/tmp-eglibc/sysroots
datadir=/home/mac/src/oe/build/tmp-eglibc/sysroots/panther/usr/share
target_datadir=/usr/share
libdir=/lib

datadir makes its way into libtool's Makefile so I end up
with the /home/mac/... directories in my image. :(

I tried various things to fix the problem (mainly not making datadir
absolute) but I never got anything that completely worked from
clean. I think some of the remaining problems were due to me using
meta-micro's no /usr though.

I hope this is useful and I'm sorry it's not more so.

Thanks.

Mike.


