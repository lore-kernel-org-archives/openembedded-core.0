Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 94DCD6FB6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 14:47:12 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jun 2014 07:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,487,1400050800"; d="scan'208";a="446052790"
Received: from lakaruna-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.8])
	by azsmga001.ch.intel.com with ESMTP; 16 Jun 2014 07:47:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Mon, 16 Jun 2014 15:47:05 +0100
Message-ID: <5258152.VaR4PfleNb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1402411999.28622.3.camel@phil-desktop.brightsign>
References: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
	<53971878.5090300@linux.intel.com>
	<1402411999.28622.3.camel@phil-desktop.brightsign>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 16 Jun 2014 14:47:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 June 2014 15:53:19 Phil Blundell wrote:
> On Tue, 2014-06-10 at 07:38 -0700, Saul Wold wrote:
> > On 06/10/2014 04:57 AM, Phil Blundell wrote:
> > > On Thu, 2014-06-05 at 17:09 -0700, Saul Wold wrote:
> > >> These dependcies are needed to ensure that thier packages are created
> > >> correctly since these classes have runtime dependiences in their
> > >> packages
> > >> but they are not actually created yet at rootfs time.
> > > 
> > > Can you be more specific about why these
> > > dependecies/dependcies/dependiences are required?  I can't, offhand,
> > > think of any reason why update-rc.d requires initscripts for example.
> > 
> > It's more about having initscripts-funtions package built so that it's
> > available for the dynamic addition to the RDEPENDS later in
> > populate_pacakges_updatercd().  If initscripts is not built and we add
> > initscripts-functions to the RDEPENDS, the final rootfs will fail with
> > an unsatisfied dependency.
> 
> It seems to me that, if a given package ships an initscript which
> requires /etc/init.d/functions, it ought to be the responsibility of
> that package to rdepend on initscripts itself.  I'm not sure it's
> entirely desirable for update-rc.d to drag that dependency in.

It should be, however:

a) There are a bunch of recipes that don't currently do that, and you'll only 
find out there's a problem at do_rootfs time (or worse, if we went a step 
further and didn't even dynamically add the RDEPENDS, at runtime when the 
service fails to start).

b) Saul's patch adds a build-time dependency, not a runtime one, and the 
initscripts recipe only packages files so the impact is fairly trivial even if 
it's not going to be built through other dependencies anyway.

> > > Also, what's going on with the PACKAGESPLITFUNCS_remove_class-nativesdk?
> > 
> > We don't need to run that funtion to create the nativesdk sysroot, so
> > don't run it.
> 
> Fair enough, but this seems like an unrelated change (and one which
> isn't covered by the patch summary or description).  Shouldn't that be
> in a separate commit?

The patch has been merged now, but FWIW it seems like it probably should have 
been a separate one.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

