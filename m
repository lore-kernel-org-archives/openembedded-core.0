Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Rhnga-0001Ra-Uq
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 20:36:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jan 2012 11:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92237800"
Received: from unknown (HELO localhost) ([10.255.13.35])
	by orsmga001.jf.intel.com with ESMTP; 02 Jan 2012 11:29:23 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Mon,  2 Jan 2012 13:29:24 -0600
Message-Id: <cover.1325526807.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5][RFC] LICENSE_FLAGS, a replacement for COMMERCIAL_LICENSE
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
X-List-Received-Date: Mon, 02 Jan 2012 19:36:45 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Hi,

This patchset is a first cut at a replacement for COMMERCIAL_LICENSE
called LICENSE_FLAGS.  The original proposal was drafted by Saul Wold
and is copied below:

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

LICENSE_FLAGS would be set in local.conf with the values that are 
acceptable to include in this image, by default it would be blank.

Possible values for LICENSE_FLAGS could be:
- Binary - provides some kind of binary with no source
- Patent - provides a potential infringing item, that some may not want
- Commercial - include recipes that may have commercial T&C
- Commercial_${PN} - commercial licenses specific to ${PN}
- License_${PN} - include a recipe that has a specific license
                 - maybe similar or different than Commercial_${PN}
- Click-Through_${PN} - Future requirement to have a click-through 
acknowledged before continuing to use ${PN} recipe

***

[T&C = Terms and Conditions]

So Saul's draft describes the LICENSE_FLAGS themselves; the only thing
missing is a description of how the user specifies which LICENSE_FLAGS
are OK to use in an image.  For that, the LICENSE_FLAGS_WHITELIST variable
is introduced, which simply lists the LICENSE_FLAGS that are OK.

This version converts all the existing packages listed in COMMERCIAL_LICENSE
to the equivalent "Commercial" LICENSE_FLAGS.

So to get the same functionality you'd currently get by setting
COMMERCIAL_LICENSE = "", you'd add this to your local.conf:

LICENSE_FLAGS_WHITELIST = "Commercial"

Similarly, if there was a package that included only binaries with no source
and additionally required a specific license, it could specify LICENSE_FLAGS as:

LICENSE_FLAGS = "License_${PN}_${PV} Binary"

In this case for the foo_1.4.bb package to be built and included in the image,
the expanded LICENSE_FLAGS for the package would be added to the whitelist:

LICENSE_FLAGS_WHITELIST = "Commercial License_foo_1.4 Binary"

Note that there's no policy attached to any of the above license types - this is
simply string-matching that can be used for the purpose of screening packages - if
the strings match, the recipe gets in, if not, it doesn't i.e. during parsing, we
would inspect the recipe'ss data for LICENSE_FLAGS and if it has a value then try
to match against the WHITELIST - if it matches it gets added to the parsed list, if
there is no match then it gets Skip_Package()'ed.

This RFC patchset implements the above, with the exception of whatever
would need to be implemented for the 'Click-Through' variant, which I'll
be thinking about for the next version of the patchset.  In the case of a
click-through license, the check needs to deferred until after download and
unpacking, since the EULA that needs to be clicked-through can't be executed
until after that, and additionally that typically only needs to happen the
first time - subsequent runs don't need the click-through, so it should be
automatically promoted to the same license Type but with the Click-Through
part removed.  Any ideas on how to implement that would be welcome...

In addition to the "Commercial" license replacement above, this version has
also been tested with a recipe that uses a "License_${PN}_${PV}" string, and
multiple flags.

The following changes since commit f5aa3bbda623c8fae3a761d72fddc95631ad0706:
  Saul Wold (1):
        coreutils: ensure --color works so DEPEND on libcap

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/license-flags.v0
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/license-flags.v0

Tom Zanussi (5):
  base.bbclass: add support for LICENSE_FLAGS
  Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
  base.bbclass: remove COMMERCIAL_LICENSE code
  default-distrovars.inc: remove COMMERCIAL_LICENSE et al
  documentation-audit.sh: remove COMMERCIAL_LICENSE warning

 meta/classes/base.bbclass                          |   24 +++++++++++++++-----
 meta/conf/distro/include/default-distrovars.inc    |    5 ----
 .../gstreamer/gst-fluendo-mp3_0.10.15.bb           |    1 +
 .../gstreamer/gst-openmax_0.10.1.bb                |    1 +
 .../gstreamer/gst-plugins-ugly_0.10.17.bb          |    1 +
 meta/recipes-multimedia/lame/lame_3.99.3.bb        |    1 +
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |    1 +
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    1 +
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |    1 +
 scripts/contrib/documentation-audit.sh             |    1 -
 11 files changed, 26 insertions(+), 12 deletions(-)



