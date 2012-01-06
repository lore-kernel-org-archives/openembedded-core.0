Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RjD2Y-00031v-8v
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:53:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2012 08:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="93695260"
Received: from unknown (HELO localhost) ([10.255.13.145])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2012 08:45:49 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 10:45:21 -0600
Message-Id: <4c91ccffa882d1c01bd7abc18b662dce388192be.1325867350.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325867350.git.tom.zanussi@intel.com>
References: <cover.1325867350.git.tom.zanussi@intel.com>
Subject: [PATCH 1/5] base.bbclass: add support for LICENSE_FLAGS
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
X-List-Received-Date: Fri, 06 Jan 2012 16:53:14 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

LICENSE_FLAGS are a per-recipe replacement for COMMERCIAL_FLAGS.  Any
flags listed in a recipe's LICENSE_FLAGS variable must have a match in
the global LICENSE_FLAGS_WHITELIST variable.

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
- Binary - provides some kind of binary with no source
- Patent - provides a potential infringing item, that some may not want
- Commercial - include recipes that may have commercial T&C
- Commercial_${PN} - commercial licenses specific to ${PN}
- License_${PN} - include a recipe that has a specific license
                 - maybe similar or different than Commercial_${PN}

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

Similarly, as another example, if there was a package that included
only binaries with no source and which additionally required a
specific license, it could specify LICENSE_FLAGS as:

LICENSE_FLAGS = "License_${PN}_${PV} Binary"

Assuming there was a 1.4 version of a package called foo, in this case
for the foo_1.4.bb package to be built and included in the image, the
expanded LICENSE_FLAGS for that particular version of the foo package
would be added to the whitelist:

LICENSE_FLAGS_WHITELIST = "Commercial License_foo_1.4 Binary"

Similarly, if a single license could be assumed to cover any foo
package regardless of version, the recipe could simply specify license
flags as:

LICENSE_FLAGS = "License_${PN}"

etc...

Note that there's no policy attached to any of the above license types
- this is simply string-matching that can be used for the purpose of
screening packages - if the strings match, the recipe gets in, if not,
it doesn't i.e. during parsing, we would inspect the recipe's data for
LICENSE_FLAGS and if it has a value then try to match against the
WHITELIST - if it matches it gets added to the parsed list, if there
is no match then it gets Skip_Package()'ed.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/base.bbclass |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e65a722..4aeba1b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -349,6 +349,25 @@ python () {
     if license == "INVALID":
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
+    def skip_package(pn, flag):
+        bb.debug(1, "Skipping %s because it has a restricted license (%s) not"
+             " whitelisted in LICENSE_FLAGS_WHITELIST" % (pn, flag))
+        raise bb.parse.SkipPackage("because it may require a special license"
+            " to ship in a product (listed in LICENSE_FLAGS)")
+
+    def all_license_flags_match(flags, whitelist):
+        for flag in flags.split():
+            if not flag in whitelist.split():
+                return False
+        return True
+
+    license_flags = d.getVar('LICENSE_FLAGS', True)
+    if license_flags:
+        license_flags_whitelist = d.getVar('LICENSE_FLAGS_WHITELIST', True)
+        if not license_flags_whitelist or not all_license_flags_match(
+                license_flags, license_flags_whitelist):
+            skip_package(pn, license_flags)
+
     commercial_license = " %s " % d.getVar('COMMERCIAL_LICENSE', 1)
     import re
     pnr = "[ \t]%s[ \t]" % pn.replace('+', "\+")
-- 
1.7.0.4



