Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8684577D3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:58:02 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 30 Mar 2017 09:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,247,1486454400"; d="scan'208";a="81060323"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.13.125])
	by orsmga005.jf.intel.com with ESMTP; 30 Mar 2017 09:58:01 -0700
Message-ID: <1490893081.1227.5.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>, 
	Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 30 Mar 2017 17:58:01 +0100
In-Reply-To: <58DD3595.1060209@linux.intel.com>
References: <1490823850-20782-1-git-send-email-anibal.limon@linux.intel.com>
	<1490823850-20782-2-git-send-email-anibal.limon@linux.intel.com>
	<1490853745.6396.439.camel@gmx.de> <58DD2C5B.8010704@linux.intel.com>
	<1490890422.6396.459.camel@intel.com>
	<58DD3595.1060209@linux.intel.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Cc: saul.wold@intel.com,
	OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] scripts: Add yocto-compat-layer-wrapper
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
X-List-Received-Date: Thu, 30 Mar 2017 16:58:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-30 at 10:43 -0600, Aníbal Limón wrote:
> 
> On 03/30/2017 10:13 AM, Patrick Ohly wrote:
> > On Thu, 2017-03-30 at 10:03 -0600, Aníbal Limón wrote:
> > > 
> > > On 03/30/2017 12:02 AM, Patrick Ohly wrote:
> > > > On Wed, 2017-03-29 at 15:44 -0600, Aníbal Limón wrote:
> > > > ...
> > > > > +show_help() {
> > > > > +	printf "Usage: %s [-o output_log] [-h] LAYER_DIR
> > > > > ...\n" $0
> > > > > +}
> > > > > +
> > > > 
> > > > ...
> > > > > +env_dir=$(mktemp -d -t yocto-compat-XXXX)
> > > > > +echo "The environment will be setup at $env_dir"
> > > > > +echo ""
> > > > 
> > > > The directory gets created, but not removed.
> > > 
> > > I didn't remove the temp directory because may be the user wants
> > > to
> > > access the dir after the check.
> > 
> > I think that this should be something that the user explicitly
> > needs to
> > request. As it is now, accumulating directories in /tmp when
> > invoking
> > the script is just unexpected and not the normal behavior of tools
> > creating something in /tmp.
> 
> Ok, i will add an option to don't delete and change the default
> behavior
> to delete after check.
> 
> 
> > 
> > > > > +echo "Cloning oe-core..."
> > > > > +git clone $oe_core_repo $env_dir
> > > > > +if [ $? -ne 0 ]; then
> > > > > +	echo "Failed to clone oe-core repository"
> > > > > +	exit 1
> > > > > +fi
> > > > > +
> > > > > +echo "Cloning bitbake..."
> > > > > +git clone $bitbake_repo $env_dir/bitbake
> > > > > +if [ $? -ne 0 ]; then
> > > > > +	echo "Failed to clone bitbake repository"
> > > > > +	exit 1
> > > > > +fi
> > > > 
> > > > Cloning bitbake and OE-core each time the script runs will be
> > > > fairly
> > > > slow. There's also a chicken-and-egg problem: if you don't have
> > > > bitbake,
> > > > where's the script?
> > > > 
> > > > I'd prefer to use an existing checkout of both, just as for the
> > > > layers
> > > > which are to be tested.
> > > 
> > > I choose to clone the oe-core/bitbake to ensure there are a clean
> > > environment, without any previous layer added.
> > 
> > I don't quite get that argument. When using existing bitbake and
> > OE-core
> > directories, how can they have layers added to them? I understand
> > that
> > the existing checkout might contain additional modifications and/or
> > might not match current master, but I consider that a feature. As
> > it
> > stands now, the caller of the script cannot test against Yocto 2.3
> > once
> > it is released, because the script will always check out master.
> > 
> > Control over that can of course also be added to the script, but I
> > just
> > don't see the need for all this additional complexity. Just my 2
> > cents.
> 
> That's the original issue to create this script, if a user tries to
> validate a layer and has modifications in configuration (bblayers,
> local, auto), the check will be contaminated in some how.

Those are all build-directory state, not items which are tracked in the
git repository.

Rather than cloning repositories to ensure clean state your script
could ensure a unique/new build directory by sourcing oe-init-build-env 
with a non-standard build directory, perhaps checking whether the
directory exists first and adding random characters until you get
something new?

Joshua

