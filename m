Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88E0671AD9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 08:39:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 01:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,285,1496127600"; d="scan'208";a="1166542349"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2017 01:39:30 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id E44955801BC;
	Fri, 30 Jun 2017 01:39:29 -0700 (PDT)
Date: Fri, 30 Jun 2017 11:37:17 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20170630083717.GA788@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
	<20170628073121.GA11425@linux.intel.com>
	<CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
	<20170629083942.GA14649@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170629083942.GA14649@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Fri, 30 Jun 2017 08:39:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 29, 2017 at 11:39:42AM +0300, Ed Bartosh wrote:
> On Wed, Jun 28, 2017 at 10:32:27AM -0300, Otavio Salvador wrote:
> > On Wed, Jun 28, 2017 at 4:31 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > > On Tue, Jun 27, 2017 at 05:41:45PM -0300, Fabio Berton wrote:
> > >> The last patch I sent is here:
> > >> https://patchwork.openembedded.org/patch/139252/
> > >>
> > >> We're using this patch internally with Pyro branch. I can rework to
> > >> apply on master.
> > >>
> > >> On 06/27/2017 05:35 PM, Otavio Salvador wrote:
> > >> >On Tue, Jun 27, 2017 at 10:28 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > >> >>The patchset also fixes long standing bug: wic updated fstab
> > >> >>inplace in rootfs directory. This causes other tasks working with
> > >> >>rootfs directory to produce incorrect results or crash. This is
> > >> >>fixed by copying rootfs to the temporary directory before updating
> > >> >>fstab.
> > >> >
> > >> >As you is working on this, please also include Fabio's patch on the
> > >> >patchset. It includes a command like option to disable fstab change at
> > >> >all. For delta-based updates this is imperative.
> > >> >
> > >> >Fabio, could you point him the last patch revision?
> > >> >
> > >
> > > Do we really need that?
> > >
> > > JFYI: Mount point in .wks is an optional field. It makes sense to use it only
> > > if partition needs to be mounted on boot. fstab will not be updated
> > > unless it's explicitly requested by specifying mount points in .wks
> > 
> > It should have support to not touch it. For images which we intend to
> > do delta updates, the content cannot be changed besides the original
> > rootfs generation. So yes, we need that.
> 
> I'm not sure I understand this. If you don't want fstab to be changed
> you should not specify mount points in .wks
> There is only one reason to have mount points in .wks: to make wic to
> change /etc/fstab, which you apparently don't want. So, don't specify
> mount points and you'll have what you want.
> 
> Having additional option for this looks redundand to me.

After thinking a bit more about it I'd propose to have global wic option
to avoid rootfs content changes. Not just fstab updates, but any
changes. For now this option (--no-rootfs-update ?) should prevent creating
images if either mount points are specified or --exclude-path is used in .wks
In future if any other rootfs changing functionality is added to wic it must
conflict with this option.

Does this make sense?

--
Regards,
Ed

