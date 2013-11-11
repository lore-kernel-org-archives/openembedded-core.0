Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 09D776D1BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 10:53:33 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1Vfp7c-0006FD-6n; Mon, 11 Nov 2013 11:53:32 +0100
Message-ID: <1384167211.16718.109.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: ChenQi <Qi.Chen@windriver.com>
Date: Mon, 11 Nov 2013 10:53:31 +0000
In-Reply-To: <52803E72.9010505@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<5bcdd19de289a55e7cc28a1d0d4f09ea6ec4be41.1383974819.git.Qi.Chen@windriver.com>
	<1384037660.3798.42.camel@x121e.pbcl.net>
	<52803E72.9010505@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Mon, 2013-11-11 at 10:18 +0800,
	ChenQi wrote: > On 11/10/2013
	06:54 AM, Phil Blundell wrote: > > On Sat, 2013-11-09 at 13:28 +0800,
	Qi.Chen@windriver.com
	wrote: > >> + install -d ${D}${base_bindir} > >> + mv
	${D}${bindir}/udevadm
	${D}${base_bindir}/udevadm > >> + rmdir ${D}${bindir} > > This will
	fail
	if ${bindir} and ${base_bindir} are the same. > > > > p. > > > > > > >
	> >
	> In udev recipe, they are not defined as the same one. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] udev: fix dependency and location of udevadm
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
X-List-Received-Date: Mon, 11 Nov 2013 10:53:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-11 at 10:18 +0800, ChenQi wrote:
> On 11/10/2013 06:54 AM, Phil Blundell wrote:
> > On Sat, 2013-11-09 at 13:28 +0800, Qi.Chen@windriver.com wrote:
> >> +	install -d ${D}${base_bindir}
> >> +	mv ${D}${bindir}/udevadm ${D}${base_bindir}/udevadm
> >> +	rmdir ${D}${bindir}
> > This will fail if ${bindir} and ${base_bindir} are the same.
> >
> > p.
> >
> >
> >
> >
> 
> In udev recipe, they are not defined as the same one.

Those variables are part of the distro configuration.  Individual
recipes don't, in general, set them.

> And moving something from bindir to base_bindir doesn't seem uncommon in 
> OE, you can grep the project using the following command.
> 
> grep -Ri 'mv.*bindir.*base_bindir' meta/*

A better command to use would be:

grep -C 4 -Ri 'mv.*bindir.*base_bindir' meta/*

which reveals that most of these "mv" commands are enclosed in a
conditional that checks whether the two directories are indeed different
before trying to move them.

It's true that a few of the things in recipes-extended do appear to be
broken.  cpio, for example, was broken by
6dee3050a4a0c4f3cc9fec23a0bc02155d680863; gzip was broken by
e0626a0270fb0f4ff128e761c13d44162723434c; mktemp was broken by
4807d938023ce06f2924c8a0503c32d083be23b5.  All of these three patches
seem to be well-intentioned attempts to improve the handling of
update-alternatives and I guess those recipes are obscure enough that
nobody has noticed before now that there is anything wrong with them.

p.



