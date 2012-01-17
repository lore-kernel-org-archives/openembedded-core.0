Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4aj-0006gw-Cx
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632825"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:49 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:31:46 -0800
Message-Id: <0327cd1099f6af41f2cae86b8205b794e2486e2f.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/62] base.bbclass: add support for LICENSE_FLAGS
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:29 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

LICENSE_FLAGS are a per-recipe replacement for the COMMERCIAL_LICENSE
mechanism.

In the COMMERCIAL_LICENSE mechanism, any package name mentioned in the
global COMMERCIAL_LICENSE list is 'blacklisted' from being included in
an image.  To allow the blacklisted package into the image, the
corresponding packages need to be removed from the COMMERCIAL_LICENSE
list.  This mechanism relies on a global list defined in
default-distrovars.inc.

The LICENSE_FLAGS mechanism essentially implements the same thing but
turns the global blacklist into a per-recipe whitelist.  Any recipe
can optionally define one or more 'license flags'; if defined, each of
the license flags defined for a recipe must have matching entries in a
global LICENSE_FLAGS_WHITELIST variable.  Typically a recipe will have
a single license flag specific to itself, which allows it to be
individually toggled on and off.  For example, a package named 'foo'
might define a single license flag, 'commercial_foo':

LICENSE_FLAGS = "commercial_foo"

This says that in order for the foo package to be included in the
image, the string 'commercial_foo' must appear in the
LICENSE_FLAGS_WHITELIST variable:

LICENSE_FLAGS_WHITELIST = "commercial_foo"

Because the typical case is indeed to create LICENSE_FLAGS containing
the package name, the LICENSE_FLAGS could just as well have been
specified as:

LICENSE_FLAGS = "commercial_${PN}

which would pick up the package name automatically.

The mechanism has the word 'flags' in the name because although the
typical case is to specify a single string to match as above, the user
can add additional strings that might be thought of additional
'attributes' of a license that also need to be matched.  This allows
for the creation and specification of license categories that could be
used to flexibly match sets of packages that match certain attributes
without forcing them to all be specified individually.  For example, a
particular set of recipes that are typically used together might all
contain a 'commercial_video' flag.  Additionally, some of them might
specify an additional 'binary' flag meaning that it's not possible to
get the source for those packages.  Specifying both 'commercial_video
and binary' in the LICENSE_FLAGS_WHITELIST would allow them all to be
pulled in, but if 'binary' was missing, it would only allow those
packages that had source to be allowed in to the image.

The current behavior of COMMERCIAL_LICENSE is replicated as mentioned
above by having the current set of COMMERCIAL_LICENSE flags implement
their using LICENSE_FLAGS = "commercial_${PN}.

That being the case, the current COMMERCIAL_LICENSE can equivalently
be specified in the new scheme by putting the below in local.conf:

 # This is a list of packages that require a commercial license to ship
 # product. If shipped as part of an image these packages may have
 # implications so they are disabled by default.  To enable them,
 # un-comment the below as appropriate.
 #LICENSE_FLAGS_WHITELIST = "commercial_gst-fluendo-mp3 \
 #                           commercial_gst-openmax \
 #                           commercial_gst-plugins-ugly \
 #                           commercial_lame \
 #                           commercial_libmad \
 #                           commercial_libomxil \
 #                           commercial_mpeg2dec \
 #                           commercial_qmmp"

The above allows all of the current COMMERCIAL_LICENSE packages in -
to disallow a particular package from appearing in the image, simply
remove it from the whitelist.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/base.bbclass    |    7 +++++++
 meta/classes/license.bbclass |   30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f0c358e..085bb36 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -349,6 +349,13 @@ python () {
     if license == "INVALID":
         bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
 
+    unmatched_license_flag = check_license_flags(d)
+    if unmatched_license_flag:
+        bb.debug(1, "Skipping %s because it has a restricted license (%s) not"
+             " whitelisted in LICENSE_FLAGS_WHITELIST" % (pn, unmatched_license_flag))
+        raise bb.parse.SkipPackage("because it has a restricted license (%s) not"
+             " whitelisted in LICENSE_FLAGS_WHITELIST" % unmatched_license_flag)
+
     commercial_license = " %s " % d.getVar('COMMERCIAL_LICENSE', 1)
     import re
     pnr = "[ \t]%s[ \t]" % pn.replace('+', "\+")
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4b98e29..bc638fc 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -282,6 +282,36 @@ def incompatible_license(d,dont_want_license):
 		return True
     return False
 
+
+def check_license_flags(d):
+    """
+    This function checks if a recipe has any LICENSE_FLAGs that aren't whitelisted.
+
+    If it does, it returns the first LICENSE_FLAG missing from the whitelist, or all the
+    the LICENSE_FLAGs if there is no whitelist.
+
+    If everything is is properly whitelisted, it returns None.
+    """
+
+    def all_license_flags_match(flags, whitelist):
+        """ Return first unmatched flag, None if all flags match """
+
+        for flag in flags.split():
+            if not flag in whitelist.split():
+                return flag
+        return None
+
+    license_flags = d.getVar('LICENSE_FLAGS', True)
+    if license_flags:
+        license_flags_whitelist = d.getVar('LICENSE_FLAGS_WHITELIST', True)
+        if not license_flags_whitelist:
+            return license_flags
+        unmatched_flag = all_license_flags_match(license_flags, license_flags_whitelist)
+        if unmatched_flag:
+            return unmatched_flag
+    return None
+
+
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-name] = "populate-lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
-- 
1.7.6.5



