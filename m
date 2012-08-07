Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SynHO-0008V7-Ga for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 19:09:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77GvT6J013790;
	Tue, 7 Aug 2012 17:57:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13088-07; Tue,  7 Aug 2012 17:57:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77GvMx7013784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 17:57:23 +0100
Message-ID: <1344358644.9756.293.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 17:57:24 +0100
In-Reply-To: <20120806092903.GG3267@jama.jama.net>
References: <cover.1343124846.git.liezhi.yang@windriver.com>
	<7affb352c173c353df0b69002f3ca0f5ee0502cf.1343124846.git.liezhi.yang@windriver.com>
	<1343126992.22222.11.camel@ted> <20120806092903.GG3267@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] package-index: inherit pythonnative
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
X-List-Received-Date: Tue, 07 Aug 2012 17:09:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-06 at 11:29 +0200, Martin Jansa wrote:
> On Tue, Jul 24, 2012 at 11:49:52AM +0100, Richard Purdie wrote:
> > On Tue, 2012-07-24 at 18:19 +0800, Robert Yang wrote:
> > > The native python binary has been moved from usr/bin/python to
> > > usr/bin/python-native/python, the recipe which needs python-native
> > > should "inherit pythonnative", otherwise there would be errors when the
> > > python script runs.
> > > 
> > > [YOCTO #2822]
> > > 
> > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > ---
> > >  meta/recipes-core/meta/package-index.bb |    2 ++
> > >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > Which part of this recipe needs python-native? Shouldn't scripts which
> > need pythonnative be using the path to the python interpreter
> > explicitly?
> 
> This fixes my opkg-utils related issues too
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026333.html
> 
> The problem is that with pythonnative in opkg-utils it's still using 
> #!/usr/bin/env python
> in tmp-eglibc/sysroots/x86_64-linux/usr/bin/opkg-make-index
> 
> And when python-index executes this:
> | + [ -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/ ]
> | + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages
> | + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages.flock -c opkg-make-index -r /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/
> | Traceback (most recent call last):
> 
> It depends on PATH of package-index not opkg-utils.

I think the right fix here is to remove the PYTHONPATH line in
package-index.bb. We should no longer need that and that should fix the
problems but its going to be a while before I can test this on a system
showing the problem.

Cheers,

Richard



