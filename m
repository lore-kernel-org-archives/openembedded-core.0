Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SobJR-0000V6-VF for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 16:21:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AEA3ed017709
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 15:10:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17419-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 15:09:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AE9sqk017696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 15:09:54 +0100
Message-ID: <1341929395.24837.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 15:09:55 +0100
In-Reply-To: <alpine.DEB.2.02.1207101001080.2594@oneiric>
References: <1341927124.24837.8.camel@ted>
	<alpine.DEB.2.02.1207101001080.2594@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 14:21:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 10:02 -0400, Robert P. J. Day wrote:
> On Tue, 10 Jul 2012, Richard Purdie wrote:
> 
> > Originally, git was something new, not installed everywhere and had commandline
> > stability problems. This has changed and git it no longer makes sense to
> > continually build this when the system installed version is likely sufficient.
> >
> > This speeds up build since recipes no longer have to wait for git-native to build
> > if they're fetched from a git:// SRC_URI.
> >
> > Also add git to the sanity checks and drop the no unneeded svn reference.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 6ed1e6f..ffd59e9 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -2,7 +2,7 @@
> >  # Sanity check the users setup for common misconfigurations
> >  #
> >
> > -SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo svn bzip2 tar gzip gawk chrpath wget cpio"
> > +SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
> >
> >  def raise_sanity_error(msg, d):
> >      if d.getVar("SANITY_USE_EVENTS", True) == "1":
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 76ee65f..c94012e 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -152,6 +152,7 @@ DATETIME = "${DATE}${TIME}"
> >  # its own in staging
> >  ASSUME_PROVIDED = "\
> >      bzip2-native \
> > +    git-native \
> >      grep-native \
> >      diffstat-native \
> >      patch-native \
> 
>   possibly a dumb question, but is this the sort of thing one could
> extend in one's local.conf file if they were fairly sure their
> installed versions were compatible?

For some things like git-native, it would be safe. For others like
perl-native or python-native, you could seriously shoot yourself in the
foot. subversion-native needs to be 1.7+ as an example.

The general idea is correct though, you can extend this from local.conf,
yes.

Cheers,

Richard





