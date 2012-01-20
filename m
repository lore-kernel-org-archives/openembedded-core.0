Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RoJhj-0007hk-O0
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 20:00:52 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Jan 2012 10:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100948679"
Received: from unknown (HELO localhost) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 10:53:09 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 12:52:51 -0600
Message-Id: <c6e9e1ecaf59db9149ce4570435f48c927acb29c.1327084753.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1327084753.git.tom.zanussi@intel.com>
References: <cover.1327084753.git.tom.zanussi@intel.com>
Subject: [PATCH 1/5] license.bbclass: add support for LICENSE_FLAGS
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
X-List-Received-Date: Fri, 20 Jan 2012 19:00:52 -0000

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
global LICENSE_FLAGS_WHITELIST variable.

The definition of 'matching' is simple, but there are a couple things
users need to know in order to correctly and effectively use it.
Before we test a flag against the whitelist, we append _${PN} to it,
thus automatically making each LICENSE_FLAG recipe-specific.  We then
try to match that string against the whitelist.  So if the user
specifies LICENSE_FLAGS = 'commercial' for recipe 'foo', the string
'commercial_foo' should be specified in the whitelist in order for it
to match.

However, the user can also broaden the match by putting any
'_'-separated beginning subset of a LICENSE_FLAG in the whitelist,
which will also match e.g. simply specifying 'commercial' in the
whitelist would match any expanded LICENSE_FLAG starting with
'commercial' such as 'commercial_foo' and 'commercial_bar' which are
the strings that would have been automatically generated if those
recipes had simply specified LICENSE_FLAGS = 'commercial'

This allows for a range of specificity for the items in the whitelist,
from more general to perfectly specific.  So users have the choice of
exhaustively enumerating each license flag in the whitelist to allow
only those specific recipes into the image, or of using a more general
string to pick up anything matching just the first component(s).

Note that this scheme works even if the flag already has _pn appended
- the extra _pn is redundant, but doesn't affect the outcome e.g. a
license flag of 'commercial_1.2_foo' would turn into
'commercial_1.2_foo_foo' and would match both the general 'commercial'
and the specific 'commercial_1.2_foo' as expected (it would also match
commercial_1.2_foo_foo' and 'commercial_1.2', which don't make much
sense as far as something a user would think of specifying in the
whitelist).  For a versioned string, the user could instead specify
'commercial_foo_1.2', which would turn into 'commercial_foo_1.2_foo',
but which would as expected allow the user to pick up this package
along with anything else 'commercial' by specifying 'commercial' in
the whitelist, or anything with a 'commercial_foo' license regardless
of version by using 'commercial_foo' in the whitelist, or
'commercial_foo_1.1' to be completely specific about package and
version.

The current behavior of COMMERCIAL_LICENSE is replicated as mentioned
above by having the current set of COMMERCIAL_LICENSE flags
implemented using LICENSE_FLAGS = "commercial".

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
remove it from the whitelist.  To allow them all in, you could also
specify LICENSE_FLAGS_WHITELIST = "commercial".

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/license.bbclass |   63 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4b98e29..10a937b 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -282,6 +282,69 @@ def incompatible_license(d,dont_want_license):
 		return True
     return False
 
+
+def check_license_flags(d):
+    """
+    This function checks if a recipe has any LICENSE_FLAGs that
+    aren't whitelisted.
+
+    If it does, it returns the first LICENSE_FLAG missing from the
+    whitelist, or all the LICENSE_FLAGs if there is no whitelist.
+
+    If everything is is properly whitelisted, it returns None.
+    """
+
+    def license_flag_matches(flag, whitelist, pn):
+        """
+        Return True if flag matches something in whitelist, None if not.
+
+        Before we test a flag against the whitelist, we append _${PN}
+        to it.  We then try to match that string against the
+        whitelist.  This covers the normal case, where we expect
+        LICENSE_FLAGS to be a simple string like 'commercial', which
+        the user typically matches exactly in the whitelist by
+        explicitly appending the package name e.g 'commercial_foo'.
+        If we fail the match however, we then split the flag across
+        '_' and append each fragment and test until we either match or
+        run out of fragments.
+        """
+        flag_pn = ("%s_%s" % (flag, pn))
+        for candidate in whitelist:
+            if flag_pn == candidate:
+                    return True
+
+        flag_cur = ""
+        flagments = flag_pn.split("_")
+        flagments.pop() # we've already tested the full string
+        for flagment in flagments:
+            if flag_cur:
+                flag_cur += "_"
+            flag_cur += flagment
+            for candidate in whitelist:
+                if flag_cur == candidate:
+                    return True
+        return False
+
+    def all_license_flags_match(license_flags, whitelist):
+        """ Return first unmatched flag, None if all flags match """
+        pn = d.getVar('PN', True)
+        split_whitelist = whitelist.split()
+        for flag in license_flags.split():
+            if not license_flag_matches(flag, split_whitelist, pn):
+                return flag
+        return None
+
+    license_flags = d.getVar('LICENSE_FLAGS', True)
+    if license_flags:
+        whitelist = d.getVar('LICENSE_FLAGS_WHITELIST', True)
+        if not whitelist:
+            return license_flags
+        unmatched_flag = all_license_flags_match(license_flags, whitelist)
+        if unmatched_flag:
+            return unmatched_flag
+    return None
+
+
 SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-name] = "populate-lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
-- 
1.7.0.4



