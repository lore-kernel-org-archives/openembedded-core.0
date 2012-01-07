Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RjMF0-0008QP-1f
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 03:42:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Jan 2012 18:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93309611"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by azsmga001.ch.intel.com with ESMTP; 06 Jan 2012 18:35:15 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1325902364.git.tom.zanussi@intel.com>
References: <cover.1325902364.git.tom.zanussi@intel.com>
Date: Fri, 06 Jan 2012 20:34:50 -0600
Message-ID: <1325903690.15053.81.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: paul.eggleton@linux.intel.com, philb@gnu.org
Subject: Re: [PATCH 0/5] LICENSE_FLAGS, a replacement for COMMERCIAL_LICENSE
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
X-List-Received-Date: Sat, 07 Jan 2012 02:42:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Oops, missed an important comment in PATCH 1, ignore this version...

On Fri, 2012-01-06 at 20:27 -0600, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
> 
> This patchset is a replacement for COMMERCIAL_LICENSE called LICENSE_FLAGS.
> 
> Please see the commit message for '[PATCH 1/5] base.bbclass: add support
>  for LICENSE_FLAGS' for an explanation of the LICENSE_FLAGS mechanism.
> 
> v2 changes, reflecting comments from Phil Blundell and Paul Eggleton:
> 
> - This version converts all the existing packages listed in COMMERCIAL_LICENSE
> to the equivalent "commercial_${PN}" LICENSE_FLAGS.  This allows each package
> to be added to or removed from the whitelist instead of the previously
> too-broad 'Commercial' flags for those packages.
> 
> - Changes all values to lowercase.
> 
> - The new commit message should explain the mechanism and how it can be
> used a little better.
> 
> 
> For some background on these changes, the original proposal for the
> functionality covered by this replacement was drafted by Saul Wold -
> the relevant details of that proposal are copied below:
> 
> ***
> 
> There has been some issues raised with the initial implementation of
> COMMERCIAL_LICENSE and we are looking for ways to address this.
> Currently COMMERCIAL_LICENSE (C_L) is defined in default-distrovars.conf
> to contain a list of packages that have additional license requirements
> when used commercially (such as royalty requirements, or acknowledging
> some type of commercial T&Cs). These packages are skipped during parsing.
> 
> It currently contains a number of Audio and Video packages that require
> additional licensing terms when used commercially. As we add additional
> layers, some of these layers want to add additional package to the C_L
> list, but how to easily enable them.
> 
> Since local.conf, where you would normally override things like this, is
> read in before base.bbclass, which contains tools like oe_filter_out()
> to modify lists, we can't use that mechanism.
> 
> That's the background, now for the proposal.
> 
> Do away with C_L and C_*_PLUGINS, move to a "Named Bit Flag" list in
> LICENSE_FLAGS, each recipe can then maintain their flags directly,
> instead of in a shared location like default-distrovars.conf.
> 
> LICENSE_FLAGS_WHITELIST would be set in local.conf with the values
> that are acceptable to include in this image, by default it would be
> blank.
> 
> Possible values for LICENSE_FLAGS could be:
> - Binary - provides some kind of binary with no source
> - Patent - provides a potential infringing item, that some may not want
> - Commercial - include recipes that may have commercial T&C
> - Commercial_${PN} - commercial licenses specific to ${PN}
> - License_${PN} - include a recipe that has a specific license
>                  - maybe similar or different than Commercial_${PN}
> 
> ***
> 
> [T&C = Terms and Conditions]
> 
> [NOTE: the above are only 'possible values' that particular license
> flags could take.  The above are not proposals for specific flags
> that will be implemented - it's completely up to the package maintainers
> to define appropriate flags for their packages.]
> 
> Note that there's no policy attached to any of the above license types
> - this is simply string-matching that can be used for the purpose of
> screening packages - if the strings match, the recipe gets in, if not,
> it doesn't i.e. during parsing, we would inspect the recipe's data for
> LICENSE_FLAGS and if it has a value then try to match against the
> WHITELIST - if it matches it gets added to the parsed list, if there
> is no match then it gets Skip_Package()'ed.
> 
> The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:
>   Dongxiao Xu (1):
>         command.py: add parseConfigurationFiles API
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/license-flags.v2
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=tzanussi/license-flags.v2
> 
> Tom Zanussi (5):
>   base.bbclass: add support for LICENSE_FLAGS
>   Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
>   base.bbclass: remove COMMERCIAL_LICENSE code
>   default-distrovars.inc: remove COMMERCIAL_LICENSE et al
>   documentation-audit.sh: remove COMMERCIAL_LICENSE warning
> 
>  meta/classes/base.bbclass                          |   24 +++++++++++++++-----
>  meta/conf/distro/include/default-distrovars.inc    |    5 ----
>  .../gstreamer/gst-fluendo-mp3_0.10.16.bb           |    1 +
>  .../gstreamer/gst-openmax_0.10.1.bb                |    1 +
>  .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    1 +
>  meta/recipes-multimedia/lame/lame_3.99.3.bb        |    2 +
>  meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
>  meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |    1 +
>  meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    1 +
>  meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |    1 +
>  scripts/contrib/documentation-audit.sh             |    3 +-
>  11 files changed, 29 insertions(+), 12 deletions(-)
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




