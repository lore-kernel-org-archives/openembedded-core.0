Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuIog-00029f-5O for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 09:49:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6Q7bWET018910
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 08:37:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17674-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 08:37:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6Q7bJiP018904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 08:37:22 +0100
Message-ID: <1343288238.29991.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 08:37:18 +0100
In-Reply-To: <alpine.DEB.2.02.1207252009070.14124@oneiric>
References: <alpine.DEB.2.02.1207251558160.15120@oneiric>
	<1343251261.29991.4.camel@ted>
	<alpine.DEB.2.02.1207252009070.14124@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 26 Jul 2012 07:49:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-25 at 20:10 -0400, Robert P. J. Day wrote:
> On Wed, 25 Jul 2012, Richard Purdie wrote:
> 
> > On Wed, 2012-07-25 at 16:06 -0400, Robert P. J. Day wrote:
> > > what is the proper way to use EXTRA_ASSUME_PROVIDED, and is the
> > > effect of that visible in the bitbake environment?
> > >
> > >   as in, based on the current version of bitbake.conf, i can see this
> > > with "bitbake -e":
> > >
> > > ASSUME_PROVIDED="bzip2-native git-native grep-native diffstat-native
> > > patch-native perl-native-runtime python-native-runtime tar-native
> > > virtual/libintl-native"
> > >
> > >   if i add the following silliness to my local.conf,
> > >
> > > ASSUME_PROVIDED += "rday-native"
> > >
> > > i can see that in the env as well:
> > >
> > > ASSUME_PROVIDED="bzip2-native git-native grep-native diffstat-native
> > > patch-native perl-native-runtime python-native-runtime tar-native
> > > virtual/libintl-native  rday-native"
> > >
> > >   but is it correct to run the following:
> > >
> > > $ bitbake -I EXTRA_ASSUME_PROVIDED="rday-native" -e core-image-minimal
> > >
> > > and if it is, should i be able to verify that anywhere in the
> > > environment?  doesn't seem so.  from bitbake/lib/bb/cooker.py, it
> > > looks like whatever i put there is being processed thusly:
> > >
> > >   ignore = self.configuration.data.getVar("ASSUME_PROVIDED", True) or ""
> > >   self.status.ignored_dependencies = set(ignore.split())
> > >
> > >   for dep in self.configuration.extra_assume_provided:
> > >       self.status.ignored_dependencies.add(dep)
> > >
> > > so is there any way to see that?  thanks.
> >
> > Where did you come to believe EXTRA_ASSUME_PROVIDED did anything?
> 
>   um ... from the output of "bitbake -h":
> 
>  -I EXTRA_ASSUME_PROVIDED, --ignore-deps=EXTRA_ASSUME_PROVIDED
>                         Assume these dependencies don't exist and are already
>                         provided (equivalent to ASSUME_PROVIDED). Useful to
>                         make dependency graphs more appealing

So its not a variable, its a parameter. You probably mean to run
something like:

bitbake -I rday-native -e core-image-minimal
or
bitbake --ignore-deps=rday-native -e core-image-minimal

Cheers,

Richard



