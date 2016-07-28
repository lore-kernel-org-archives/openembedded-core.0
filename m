Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7329E73174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 23:17:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 16:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="1003825106"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2016 16:17:17 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 19:14:21 -0700
Message-Id: <1469672061-11406-3-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1469672061-11406-1-git-send-email-california.l.sullivan@intel.com>
References: <1469672061-11406-1-git-send-email-california.l.sullivan@intel.com>
Subject: [PATCH RFC 2/2] documentation/ref-manual: Update SERIAL_CONSOLES_CHECK description
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
X-List-Received-Date: Wed, 27 Jul 2016 23:17:16 -0000

The previous description was not accurate. Looking at the code,
SERIAL_CONSOLES_CHECK does not act like SERIAL_CONSOLES, as it will not
add consoles to enable but only check and disable consoles defined by
SERIAL_CONSOLES. Also, the previous patch adds aliasing functionality
that needed to be documented.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 documentation/ref-manual/ref-variables.xml | 12 ++++++++----
 meta/conf/documentation.conf               |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 7b1aef0..407b9be 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -11490,15 +11490,19 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
 
         <glossentry id='var-SERIAL_CONSOLES_CHECK'><glossterm>SERIAL_CONSOLES_CHECK</glossterm>
             <info>
-                SERIAL_CONSOLES_CHECK[doc] = "Similar to SERIAL_CONSOLES except the device is checked for existence before attempting to enable it. Supported only by SysVinit."
+                SERIAL_CONSOLES_CHECK[doc] = "Selected SERIAL_CONSOLES to check against /proc/console before enabling using getty. Supported only by SysVinit."
             </info>
             <glossdef>
                 <para role="glossdeffirst">
 <!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
-                    Similar to
+                    Selected
                     <link linkend='var-SERIAL_CONSOLES'><filename>SERIAL_CONSOLES</filename></link>
-                    except the device is checked for existence before attempting
-                    to enable it.
+                    to check against /proc/console before enabling using getty. This variable allows aliasing
+                    in the format: &lt;device&gt;:&lt;alias&gt;. If a device was listed as "sclp_line0"
+                    in /dev/ and "ttyS0" in /proc/console, you would do the following:
+                    <literallayout class='monospaced'>
+     SERIAL_CONSOLES_CHECK = "slcp_line0:ttyS0"
+                    </literallayout>
                     This variable is currently only supported with SysVinit
                     (i.e. not with systemd).
                 </para>
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 51c4116..30edb9d 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -373,7 +373,7 @@ SECTION[doc] = "The section in which packages should be categorized. Package man
 SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
 SERIAL_CONSOLE[doc] = "The speed and device for the serial port used to attach the serial console. This variable is given to the kernel as the 'console' parameter. After booting occurs, getty is started on that port so remote login is possible."
 SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
-SERIAL_CONSOLES_CHECK[doc] = "Similar to SERIAL_CONSOLES except the device is checked for existence before attempting to enable it. Supported only by SysVinit."
+SERIAL_CONSOLES_CHECK[doc] = "Selected SERIAL_CONSOLES to check against /proc/console before enabling using getty. Supported only by SysVinit."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
 SITEINFO_BITS[doc] = "Specifies the number of bits for the target system CPU."
-- 
2.5.5


