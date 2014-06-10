Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7E460703
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 14:53:19 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WuNQO-0001e0-3Z; Tue, 10 Jun 2014 16:53:20 +0200
Message-ID: <1402411999.28622.3.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 10 Jun 2014 15:53:19 +0100
In-Reply-To: <53971878.5090300@linux.intel.com>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
	<1402013345-24930-2-git-send-email-sgw@linux.intel.com>
	<1402401428.10715.132.camel@phil-desktop.brightsign>
	<53971878.5090300@linux.intel.com>
X-Mailer: Evolution 3.8.5-2+b1 
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
	Content preview:  On Tue, 2014-06-10 at 07:38 -0700,
	Saul Wold wrote: > On 06/10/2014
	04:57 AM, Phil Blundell wrote: > > On Thu, 2014-06-05 at 17:09 -0700,
	Saul
	Wold wrote: > >> These dependcies are needed to ensure that thier
	packages
	are created > >> correctly since these classes have runtime
	dependiences
	in their packages > >> but they are not actually created yet at rootfs
	time. > > > > Can you be more specific about why these > >
	dependecies/dependcies/dependiences
	are required? I can't, offhand,
	> > think of any reason why update-rc.d requires
	initscripts for example. > > > It's more about having
	initscripts-funtions
	package built so that it's > available for the dynamic addition to the
	RDEPENDS
	later in > populate_pacakges_updatercd(). If initscripts is not built
	and we add > initscripts-functions to the RDEPENDS,
	the final rootfs will fail
	with > an unsatisfied dependency. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] update-rc.d/useradd: Add additional dependecies
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
X-List-Received-Date: Tue, 10 Jun 2014 14:53:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-10 at 07:38 -0700, Saul Wold wrote:
> On 06/10/2014 04:57 AM, Phil Blundell wrote:
> > On Thu, 2014-06-05 at 17:09 -0700, Saul Wold wrote:
> >> These dependcies are needed to ensure that thier packages are created
> >> correctly since these classes have runtime dependiences in their packages
> >> but they are not actually created yet at rootfs time.
> >
> > Can you be more specific about why these
> > dependecies/dependcies/dependiences are required?  I can't, offhand,
> > think of any reason why update-rc.d requires initscripts for example.
> >
> It's more about having initscripts-funtions package built so that it's 
> available for the dynamic addition to the RDEPENDS later in 
> populate_pacakges_updatercd().  If initscripts is not built and we add 
> initscripts-functions to the RDEPENDS, the final rootfs will fail with 
> an unsatisfied dependency.

It seems to me that, if a given package ships an initscript which
requires /etc/init.d/functions, it ought to be the responsibility of
that package to rdepend on initscripts itself.  I'm not sure it's
entirely desirable for update-rc.d to drag that dependency in.

> > Also, what's going on with the PACKAGESPLITFUNCS_remove_class-nativesdk?
> >
> We don't need to run that funtion to create the nativesdk sysroot, so 
> don't run it.

Fair enough, but this seems like an unrelated change (and one which
isn't covered by the patch summary or description).  Shouldn't that be
in a separate commit?

p.



