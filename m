Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T527y-0007nA-DP for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 00:13:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OM17kt017315;
	Fri, 24 Aug 2012 23:01:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15614-09; Fri, 24 Aug 2012 23:01:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OM0xYb017309
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 24 Aug 2012 23:01:02 +0100
Message-ID: <1345845661.14369.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Fri, 24 Aug 2012 23:01:01 +0100
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A617135@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345824924.14369.82.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A617135@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils/steuptools: Fix files layout and unbreak builds
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
X-List-Received-Date: Fri, 24 Aug 2012 22:13:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-24 at 20:48 +0000, McClintock Matthew-B29882 wrote:
> On Fri, Aug 24, 2012 at 11:15 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The last two distutils changes progressively broke the builds. Firstly they
> > moved things from the site_packages directory to being higher up the tree
> > which introduced package QA warnings as a side effect. Secondly, it interacts
> > badly with setuptools which passes in --root=${D} itself.
> >
> > This patch restores the original directory layout, hence fixing the QA
> > warnings and also passes extra options to setuptools to deal with the
> > --root option it passes.
> 
> Hmm, I think you don't need certain bits anymore
> 
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> > index 52a1aa8..c73b24f 100644
> > --- a/meta/classes/distutils.bbclass
> > +++ b/meta/classes/distutils.bbclass
> > @@ -38,7 +38,7 @@ distutils_do_install() {
> >          STAGING_LIBDIR=${STAGING_LIBDIR} \
> >          PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
> >          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> > -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install --install-lib=${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_ARGS} || \
> > +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
> 
> This change should be handled by the bit below? So you could
> 
> s/--install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}//
> 
> ?

Not everything uses setuptools, there are things using just disutils.
I'm open to further cleanup of this but we need to consider both
cases...

Cheers,

Richard

> >          bbfatal "python setup.py install execution failed."
> >
> >          for i in `find ${D} -name "*.py"` ; do \
> > diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
> > index ced9509..ba9cf13 100644
> > --- a/meta/classes/setuptools.bbclass
> > +++ b/meta/classes/setuptools.bbclass
> > @@ -5,4 +5,5 @@ DEPENDS += "python-setuptools-native"
> >  DISTUTILS_INSTALL_ARGS = "--root=${D} \
> >      --single-version-externally-managed \
> >      --prefix=${prefix} \
> > +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> >      --install-data=${datadir}"
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 




