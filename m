Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TQnbG-0003JZ-3g
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 01:09:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9NMu3mQ029756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 15:56:03 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 23 Oct 2012 15:56:02 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2012 17:56:00 -0500
Message-ID: <129b97530dfe06d3d3865efe865ba89541ce2f96.1351032844.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1351032844.git.peter.seebach@windriver.com>
References: <cover.1351032844.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insane.bbclass and friends: Fix sanity checks and multlib headers for n32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 23:09:30 -0000
Content-Type: text/plain

The n32 architecture is odd, in that it's a mips64 ABI which happens
to be 32-bit. To handle this, we need something in the environment
which can be used to distinguish it. The obvious place to stash this
is the ABI suffix, so we use "n32" as an ABI suffix. This allows
a couple of improved checks:

1. In insane.bbclass, we can use "linux-gnun32" to discern that it's
okay for a mips64 binary to be a 32-bit binary in some cases.
2. In multilib_header, we can check for the n32 ABI, and use a distinct
value.
3. In siteinfo, add linux-gnun32 as a synonym for linux, similar to
what's done for linux-gnux32, and tell the mips*-linux-gnun32 variants
to pick up the corresponding mips-linux site configs.

Note that the multilib header wrapper already has n32 hooks in it, there
was just nothing creating -n32 header variants.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/insane.bbclass                  |    4 +++
 meta/classes/multilib_header.bbclass         |   32 +++++++++++++++++--------
 meta/classes/siteinfo.bbclass                |    5 ++++
 meta/conf/machine/include/mips/arch-mips.inc |    1 +
 4 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 29b122e..2dc9ba3 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -105,6 +105,10 @@ def package_qa_get_machine_dict():
             "linux-gnux32" :       {
                         "x86_64":     (62,     0,    0,          True,          32),
                       },
+            "linux-gnun32" :       {
+                        "mips64":       ( 8,     0,    0,          False,         32),
+                        "mipsel64":     ( 8,     0,    0,          True,          32),
+                      },
         }
 
 
diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index 867bce4..639ed4b 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -1,16 +1,29 @@
 inherit siteinfo
 
-# If applicable on the architecture, this routine will rename the header and add
-# a unique identifier to the name for the ABI/bitsize that is being used.  A wrapper will
-# be generated for the architecture that knows how to call all of the ABI variants for that
-# given architecture.
-#
-# TODO: mips64 n32 is not yet recognized in this code
-# when that is identified the name of the wrapped item should be "n32" and appropriately
-# determined int he if coding...
+# If applicable on the architecture, this routine will rename the header and
+# add a unique identifier to the name for the ABI/bitsize that is being used.
+# A wrapper will be generated for the architecture that knows how to call
+# all of the ABI variants for that given architecture.
 #
 oe_multilib_header() {
-	# Do nothing on ARM, only one ABI is supported at once
+        # We use
+        # For ARM: We don't support multilib builds.
+        # For MIPS: "n32" is a special case, which needs to be
+        # distinct from both 64-bit and 32-bit.
+        case ${TARGET_ARCH} in
+        arm*)   return
+                ;;
+        mips*)  case "${MIPSPKGSFX_ABI}" in
+                "-n32")
+                       ident=n32   
+                       ;;
+                *)     
+                       ident=${SITEINFO_BITS}
+                       ;;
+                esac
+                ;;
+        *)      ident=${SITEINFO_BITS}
+        esac
 	if echo ${TARGET_ARCH} | grep -q arm; then
 	    return
 	fi
@@ -20,7 +33,6 @@ oe_multilib_header() {
 	      continue
 	   fi
 	   stem=$(echo $each_header | sed 's#\.h$##')
-	   ident=${SITEINFO_BITS}
 	   # if mips64/n32 set ident to n32
 	   mv ${D}/${includedir}/$each_header ${D}/${includedir}/${stem}-${ident}.h
 
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index aab0867..e09d16a 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -51,6 +51,7 @@ def siteinfo_data(d):
         "linux": "common-linux common-glibc",
         "linux-gnu": "common-linux common-glibc",
         "linux-gnux32": "common-linux common-glibc",
+        "linux-gnun32": "common-linux common-glibc",
         "linux-gnueabi": "common-linux common-glibc",
         "linux-gnuspe": "common-linux common-glibc",
         "linux-uclibc": "common-linux common-uclibc",
@@ -66,6 +67,10 @@ def siteinfo_data(d):
         "arm-linux-uclibceabi": "arm-linux-uclibc",
         "armeb-linux-gnueabi": "armeb-linux",
         "armeb-linux-uclibceabi": "armeb-linux-uclibc",
+        "mips-linux-gnun32": "mips-linux",
+        "mipsel-linux-gnun32": "mipsel-linux",
+        "mips64-linux-gnun32": "mips-linux",
+        "mips64el-linux-gnun32": "mipsel-linux",
         "powerpc-linux": "powerpc32-linux",
         "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
         "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 9f12920..c390ff9 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -17,6 +17,7 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "o32", "-mabi=32", "", d)}
 
 TUNEVALID[n32] = "MIPS64 n32 ABI"
 TUNECONFLICTS[n32] = "o32 n64"
+ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "n32", "n32", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n32", "-mabi=n32", "", d)}"
 
 TUNEVALID[n64] = "MIPS64 n64 ABI"
-- 
1.7.0.4



