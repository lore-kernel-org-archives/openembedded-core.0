Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BB0CE76E5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 16:18:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 01 Mar 2016 08:18:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,523,1449561600"; d="scan'208";a="756069132"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.3.164])
	by orsmga003.jf.intel.com with ESMTP; 01 Mar 2016 08:18:21 -0800
Message-ID: <1456849101.11442.2.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Tue, 01 Mar 2016 16:18:21 +0000
In-Reply-To: <1456339760.30039.62.camel@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<1456328275.30039.49.camel@intel.com>
	<1456330147.5333.14.camel@intel.com>
	<1456339760.30039.62.camel@intel.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Tue, 01 Mar 2016 16:18:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-02-24 at 19:49 +0100, Patrick Ohly wrote:
> On Wed, 2016-02-24 at 16:09 +0000, Lock, Joshua G wrote:
> > 
> > On Wed, 2016-02-24 at 16:37 +0100, Patrick Ohly wrote:
> > > 
> > > Hello!
> > > 
> > > I haven't had a chance to play with the actual code yet and I
> > > don't
> > > know
> > > yet when I'll be able to. Let me ask for some clarifications
> > > about
> > > the
> > > approach first anyway.
> > > 
> > > On Wed, 2016-02-24 at 14:52 +0000, Joshua Lock wrote:
> > > > 
> > > > 
> > > > Approach:
> > > > An image that inherits the swupd-image bbclass will
> > > > automatically
> > > > have bundle
> > > > 'chroots' created which contain the filesystem contents of the
> > > > specified
> > > > bundles, with the contents of the inheriting image forming the
> > > > default os-core
> > > > bundle.
> > > > 
> > > > The mechanism to achieve this is that several virtual image
> > > > recipes
> > > > are created
> > > > using the swupdbundle class, one for each defined bundle plus a
> > > > 'mega' image
> > > > recipe. The 'mega' image contains the base image plus the
> > > > contents
> > > > of all of the
> > > > bundles, whilst bundle images contain only the base image plus
> > > > the
> > > > contents of a
> > > > single bundle.
> > > Just to be sure, the actual "content" (a term that is a bit too
> > > overloaded to be used precisely in all cases) of a file and its
> > > meta
> > > attributes will come from the mega image, and the virtual image
> > > recipes,
> > > including the base image, are merely used to generate file lists?
> > That's not currently true, no — the file contents for a bundle come
> > from the bundle image and the file contents for os-core come from
> > the
> > base image. It shouldn't be too difficult a change to make, I'll
> > take a
> > look now.
> The prime example that needs to be handled correctly is where
> installing
> additional packages for one of the extra bundles adds a system user
> to /etc/passwd (*). The content of /etc/passwd must come from the
> mega
> rootfs.

Indeed,  I'm working on that issue now and have filed a ticket to keep
track: https://bugzilla.yoctoproject.org/show_bug.cgi?id=9193

> (*) Except that swupd assumes that the distro is stateless and thus
> automatically excludes /etc from bundles. The example is still valid
> because preparing bundles does not need to care about that.

One of the patches I developed for swupd was to turn this into a
configure time option for swupd-server, see: 

http://git.yoctoproject.org/cgit/cgit.cgi/meta-swupd/tree/recipes-core/
swupd-server/swupd-server/0002-Add-configure-option-to-re-enable-
config-files-in-ma.patch

Regards,

Joshua

