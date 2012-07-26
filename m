Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SuBpo-0007rE-0g
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 02:21:44 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:58305 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SuBeh-0002wh-2C for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 20:10:15 -0400
Date: Wed, 25 Jul 2012 20:10:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1343251261.29991.4.camel@ted>
Message-ID: <alpine.DEB.2.02.1207252009070.14124@oneiric>
References: <alpine.DEB.2.02.1207251558160.15120@oneiric>
	<1343251261.29991.4.camel@ted>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: how to properly use "EXTRA_ASSUME_PROVIDED"?
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
X-List-Received-Date: Thu, 26 Jul 2012 00:21:44 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 25 Jul 2012, Richard Purdie wrote:

> On Wed, 2012-07-25 at 16:06 -0400, Robert P. J. Day wrote:
> > what is the proper way to use EXTRA_ASSUME_PROVIDED, and is the
> > effect of that visible in the bitbake environment?
> >
> >   as in, based on the current version of bitbake.conf, i can see this
> > with "bitbake -e":
> >
> > ASSUME_PROVIDED="bzip2-native git-native grep-native diffstat-native
> > patch-native perl-native-runtime python-native-runtime tar-native
> > virtual/libintl-native"
> >
> >   if i add the following silliness to my local.conf,
> >
> > ASSUME_PROVIDED += "rday-native"
> >
> > i can see that in the env as well:
> >
> > ASSUME_PROVIDED="bzip2-native git-native grep-native diffstat-native
> > patch-native perl-native-runtime python-native-runtime tar-native
> > virtual/libintl-native  rday-native"
> >
> >   but is it correct to run the following:
> >
> > $ bitbake -I EXTRA_ASSUME_PROVIDED="rday-native" -e core-image-minimal
> >
> > and if it is, should i be able to verify that anywhere in the
> > environment?  doesn't seem so.  from bitbake/lib/bb/cooker.py, it
> > looks like whatever i put there is being processed thusly:
> >
> >   ignore = self.configuration.data.getVar("ASSUME_PROVIDED", True) or ""
> >   self.status.ignored_dependencies = set(ignore.split())
> >
> >   for dep in self.configuration.extra_assume_provided:
> >       self.status.ignored_dependencies.add(dep)
> >
> > so is there any way to see that?  thanks.
>
> Where did you come to believe EXTRA_ASSUME_PROVIDED did anything?

  um ... from the output of "bitbake -h":

 -I EXTRA_ASSUME_PROVIDED, --ignore-deps=EXTRA_ASSUME_PROVIDED
                        Assume these dependencies don't exist and are already
                        provided (equivalent to ASSUME_PROVIDED). Useful to
                        make dependency graphs more appealing

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


