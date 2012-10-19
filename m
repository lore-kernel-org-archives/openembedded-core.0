Received: from smtpout.karoo.kcom.com ([212.50.160.34])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mac@mcrowe.com>) id 1TPJu2-0006RF-UW
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 23:14:47 +0200
X-IronPort-AV: E=Sophos;i="4.80,615,1344207600"; d="scan'208";a="667373381"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 19 Oct 2012 22:01:25 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.72)
	(envelope-from <mac@mcrowe.com>)
	id 1TPJh7-0005NF-AS; Fri, 19 Oct 2012 22:01:25 +0100
Date: Fri, 19 Oct 2012 22:01:25 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20121019210125.GA20436@mcrowe.com>
References: <20121019153834.GA13159@mcrowe.com>
	<CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
	<20121019165738.GC14620@mcrowe.com>
	<CABcZANkCuggDC-rmqBA=N3GaWqTYWAPr+9eOoECiTSGVVgQN7A@mail.gmail.com>
	<20121019183301.GA17013@mcrowe.com>
	<CABcZAN=CsirVoiVEnYGwVDMP3QGTi+jz-gjO_Y9RkwqAVX_hLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=CsirVoiVEnYGwVDMP3QGTi+jz-gjO_Y9RkwqAVX_hLw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 21:14:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 19, 2012 at 12:03:09PM -0700, Chris Larson wrote:
> On Fri, Oct 19, 2012 at 11:33 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > Thanks for your reply.
> >
> > After correcting ${LSBNATIVESTRING} to ${NATIVELSBSTRING} that worked!
> >
> > I'm still somewhat baffled as to why that one doesn't require PATH but
> > the general one does but that no longer matters to me.
> 
> The file://.* in the other one dose a replacement of the full url
> contents, so you have to add back the directory component. The other
> one I showed you just does a search/replace on the leading component,
> leaving the rest alone.

Thanks again Chris. That makes sense now. I would now expect:

 file:// file:///private/sstate-cache

to work just as well as:

 file://.* file:///private/sstate-cache/PATH

I'll try that later.

Anyway, I ended up with:

 SSTATE_MIRRORS = "\
 file://Debian-[^/]* file:///private/sstate-cache/Debian-6 \n \
 file://Ubuntu-[^/]* file:///private/sstate-cache/Debian-6 \n \
 file://.* file:///private/sstate-cache/PATH \n \

along with a tweaked version of your lsb_distro_adjust hook from
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/tree/conf/distro/include/sstate.inc
to collapse Debian minor versions.

This seems to do exactly what I want.

Thanks to everyone who responded.

Mike.


