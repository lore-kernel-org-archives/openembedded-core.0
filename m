Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UInna-000344-Ja for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 23:17:28 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LM9tfw006392; Thu, 21 Mar 2013 22:09:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KbsrApFZzA1X; Thu, 21 Mar 2013 22:09:55 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LM9mYw006381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 21 Mar 2013 22:09:51 GMT
Message-ID: <1363903217.16482.148.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Mar 2013 22:00:17 +0000
In-Reply-To: <20130321205008.GB3219@jama>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
	<20130321205008.GB3219@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/16] distro: Add separatebuilddir.inc
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
X-List-Received-Date: Thu, 21 Mar 2013 22:17:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-21 at 21:50 +0100, Martin Jansa wrote:
> On Thu, Mar 21, 2013 at 03:55:14PM +0000, Richard Purdie wrote:
> > Going forward its going to be useful to separate build data from source data
> > in those autotooled projects which support it. Unfortunately there is a lot
> > of breakage so for now, this starts the creation of an opt in list which
> > we can iterate over enable more recipes over time.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/distro/defaultsetup.conf            |    1 +
> >  meta/conf/distro/include/seperatebuilddir.inc |  772 +++++++++++++++++++++++++
> >  2 files changed, 773 insertions(+)
> >  create mode 100644 meta/conf/distro/include/seperatebuilddir.inc
> > 
> > diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> > index be28510..5eb6275 100644
> > --- a/meta/conf/distro/defaultsetup.conf
> > +++ b/meta/conf/distro/defaultsetup.conf
> > @@ -1,6 +1,7 @@
> >  include conf/distro/include/default-providers.inc
> >  include conf/distro/include/default-versions.inc
> >  include conf/distro/include/default-distrovars.inc
> > +include conf/distro/include/seperatebuilddir.inc
> 
> Why not add .inc file without including it in defaultsetup.conf so that
> people who want to use it can play with it without influencing others?

This change as it stands should be safe for everyone. My worry is that
people won't test with it and the people using it will have to fix bugs
as they get introduced. If we want to do the opt in approach, we can do
that though (its plan B).

I didn't make the change universally apply since it will break meta-oe
quite badly as things stand today and I know first hand the effort
needed to clean up a batch of recipes.

I should also mention why this is important. With this code enabled, the
build output is cleaned when a package reconfigures so builds become a
bit more stable (e.g. the libpng issue doesn't occur with this applied).

> >  include conf/distro/include/world-broken.inc
> >  
> >  TCMODE ?= "default"
> > diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
> > new file mode 100644
> > index 0000000..e1789e0
> > --- /dev/null
> > +++ b/meta/conf/distro/include/seperatebuilddir.inc
> > @@ -0,0 +1,772 @@
> > +# List of autotools recipes which support building with external build directories
> > +# i.e. ${B} != ${S}
> > +SEPB = "${WORKDIR}/build"
> > +
> 
> Is there some plan to move this information to recipes? It would be much
> easier to extend this list in layers. Something like set SEPB in recipe
> and then set B = "${SEPB}" in .inc if it's not empty.

That is something we need to think about. I'd really like to make
separate B the default and then add information to the recipes about the
exceptions which don't work. Its going to be a bit of work before we get
there though so this is a stopgap solution.

Cheers,

Richard



