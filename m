Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0922872491;
	Wed, 17 Jun 2015 08:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5H8AaKY030080; Wed, 17 Jun 2015 09:10:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mJyhdlfuK5aa; Wed, 17 Jun 2015 09:10:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5H8ALNA030077
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Jun 2015 09:10:32 +0100
Message-ID: <1434528621.14710.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Wed, 17 Jun 2015 09:10:21 +0100
In-Reply-To: <5581216F.7080503@dresearch-fe.de>
References: <55802EE1.6040703@dresearch-fe.de>
	<3080821.5ZItofk0yx@peggleto-mobl.ger.corp.intel.com>
	<5581216F.7080503@dresearch-fe.de>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: multiple git repos vs. AUTOREV?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 08:10:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-06-17 at 09:27 +0200, Steffen Sledz wrote:
> On 16.06.2015 16:20, Paul Eggleton wrote:
> > On Tuesday 16 June 2015 16:12:49 Steffen Sledz wrote:
> >> For development purposes we use this method to build always from the HEAD
> >> revision of a git repository.
> >> ...
> >> Now we like to do the same in one recipe which uses sources from two git
> >> repos.
> >> ...
> > 
> > I believe this should work:
> > 
> > -------------> snip <--------------
> > SRCREV_FORMAT = "foo_bar"
> > SRCREV_foo = "${AUTOREV}"
> > SRCREV_bar = "${AUTOREV}"
> > PV = "gitr${SRCPV}"
> >  
> > SRC_URI = " \
> > 	git://git@bitbucket.org/.../foo.git;protocol=ssh,name=foo \
> >  	git://git@bitbucket.org/.../bar.git;protocol=ssh,name=bar \
> >  "
> > -------------> snap <--------------
> 
> Thanx.
> 
> Now we have a similar but little different problem definition. We like to integrate the code of an own kernel driver into the current linux-boundary recipe. Because the driver is under development we like to use the HEAD revision of this repo. My first try was this bbappend.
> 
> -------------> snip <--------------
> SRCREV_FORMAT_append += "_mydriver"
> SRCREV_mydriver = "${AUTOREV}"
> PV_append = "gitr${SRCPV}"
> 
> SRC_URI_append = " \
> 	git://github.com/.../mydriver.git;protocol=https;destsuffix=git.mydriver;name=mydriver \
> "
> 
> ...
> -------------> snap <--------------
> 
> But this leads to an error.
> 
> ERROR: ExpansionError during parsing /.../meta-fsl-arm-extra/recipes-kernel/linux/linux-boundary_3.10.53.bb: Failure expanding variable pkg_postrm_kernel-devicetree: ExpansionError: Failure expanding variable KERNEL_PRIORITY, expression was ${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 +                        int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 +                        int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])} which triggered exception ValueError: invalid literal for int() with base 10: '53gitrAUTOINC'
> 
> Without the PV_append line everything builds well but the resulting package version does not contain a part for the additional repo version. :(
> 
> Any ideas on this one?

What value of PV does the recipe have originally? That code (from
KERNEL_PRIORITY in kernel.bbclass) is meant to be stripping off the base
version and computing values from it:

d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]

however if you don't have a "good" base PV value, its likely its getting
confused. If you use a form like:

PV = "x.y.z"
(in the base recipe)
PV_append = "+gitr${SRCPV}"
(in the append)

then the code above should work ok.

Cheers,

Richard


