Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RoJhg-0007hf-Ie
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 20:00:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 10:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="98832970"
Received: from unknown (HELO localhost) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2012 10:53:06 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 12:52:53 -0600
Message-Id: <cover.1327084753.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] LICENSE_FLAGS, a replacement for COMMERCIAL_LICENSE, v5
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
X-List-Received-Date: Fri, 20 Jan 2012 19:00:49 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset is a replacement for COMMERCIAL_LICENSE called LICENSE_FLAGS.

Please see the commit message for '[PATCH 1/5] license.bbclass: add support
 for LICENSE_FLAGS' for an explanation of the LICENSE_FLAGS mechanism.

v5 changes, reflecting comments from Richard Purdie:

- instead of having each recipe add _{PN} to its license flags, have the
  license code do that instead, and change the implementation to match
- update the commit descriptions and comments in the code to match

v4 changes, reflecting comments from Saul Wold:

- move the main functionality to license.bbclass as check_license_flags()
- keep the call to check_license_flags() in base.bbclass

v3 changes:

- add back an accidentally-stripped comment in PATCH 1.

v2 changes, reflecting comments from Phil Blundell and Paul Eggleton:

- This version converts all the existing packages listed in COMMERCIAL_LICENSE
to the equivalent "commercial_${PN}" LICENSE_FLAGS.  This allows each package
to be added to or removed from the whitelist instead of the previously
too-broad 'Commercial' flags for those packages.

- Changes all values to lowercase.

- The new commit message should explain the mechanism and how it can be
used a little better.


For some background on these changes, the original proposal for the
functionality covered by this replacement was drafted by Saul Wold -
the relevant details of that proposal are copied below:

***

There has been some issues raised with the initial implementation of
COMMERCIAL_LICENSE and we are looking for ways to address this.
Currently COMMERCIAL_LICENSE (C_L) is defined in default-distrovars.conf
to contain a list of packages that have additional license requirements
when used commercially (such as royalty requirements, or acknowledging
some type of commercial T&Cs). These packages are skipped during parsing.

It currently contains a number of Audio and Video packages that require
additional licensing terms when used commercially. As we add additional
layers, some of these layers want to add additional package to the C_L
list, but how to easily enable them.

Since local.conf, where you would normally override things like this, is
read in before base.bbclass, which contains tools like oe_filter_out()
to modify lists, we can't use that mechanism.

That's the background, now for the proposal.

Do away with C_L and C_*_PLUGINS, move to a "Named Bit Flag" list in
LICENSE_FLAGS, each recipe can then maintain their flags directly,
instead of in a shared location like default-distrovars.conf.

LICENSE_FLAGS_WHITELIST would be set in local.conf with the values
that are acceptable to include in this image, by default it would be
blank.

Possible values for LICENSE_FLAGS could be:
- binary - provides some kind of binary with no source
- patent - provides a potential infringing item, that some may not want
- commercial - include recipes that may have commercial T&C
- commercial_${PN} - commercial licenses specific to ${PN}
- license_${PN} - include a recipe that has a specific license
                 - maybe similar or different than commercial_${PN}

***

[T&C = Terms and Conditions]

[NOTE: the above are only 'possible values' that particular license
flags could take.  The above are not proposals for specific flags
that will be implemented - it's completely up to the package maintainers
to define appropriate flags for their packages.  Also the implementation
now adds ${PN} automatically, so the specific potential values may be
obsolete - the above is just for context.]

Note that there's no policy attached to any of the above license types
- this is simply string-matching that can be used for the purpose of
screening packages - if the strings match, the recipe gets in, if not,
it doesn't i.e. during parsing, we would inspect the recipe's data for
LICENSE_FLAGS and if it has a value then try to match against the
WHITELIST - if it matches it gets added to the parsed list, if there
is no match then it gets Skip_Package()'ed.

The following changes since commit 967de59f35acef7fb258524973473f3d154e4a37:
  Paul Eggleton (1):
        buildhistory_analysis: include related fields in output

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/license-flags.v5
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/license-flags.v5

Tom Zanussi (5):
  license.bbclass: add support for LICENSE_FLAGS
  Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
  base.bbclass: replace COMMERCIAL_LICENSE code with LICENSE_FLAGS code
  default-distrovars.inc: remove COMMERCIAL_LICENSE et al
  documentation-audit.sh: remove COMMERCIAL_LICENSE warning

 meta/classes/base.bbclass                          |   12 ++--
 meta/classes/license.bbclass                       |   63 ++++++++++++++++++++
 meta/conf/distro/include/default-distrovars.inc    |    5 --
 .../gstreamer/gst-fluendo-mp3_0.10.16.bb           |    1 +
 .../gstreamer/gst-openmax_0.10.1.bb                |    1 +
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    1 +
 meta/recipes-multimedia/lame/lame_3.99.3.bb        |    2 +
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |    1 +
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    1 +
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |    1 +
 scripts/contrib/documentation-audit.sh             |    3 +-
 12 files changed, 80 insertions(+), 12 deletions(-)



