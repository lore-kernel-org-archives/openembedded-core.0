Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEQ-0005O8-Ff
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 00:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550378"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:29:46 -0700
Message-Id: <0a5c1d3a021e288374ca47ccc2b2b1ed132ce884.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 20:56:35 -0700
Date: Wed, 27 Apr 2011  0:29:46 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 25/52] perl_5.12.2.bb: Undefine features not found in uclibc
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:18 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.12.3.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index 584d643..07b8eac 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -134,6 +134,12 @@ do_configure() {
                        -e "s,\(getnetent_r_proto=\)'\w+',\1'0',g" \
                        -e "s,\(d_sockatmark=\)'define',\1'undef',g" \
                        -e "s,\(d_sockatmarkproto=\)'\w+',\1'0',g" \
+                       -e "s,\(d_eaccess=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdio_ptr_lval=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdio_ptr_lval_sets_cnt=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdiobase=\)'define',\1'undef',g" \
+                       -e "s,\(d_stdstdio=\)'define',\1'undef',g" \
+                       -e "s,-fstack-protector,-fno-stack-protector,g" \
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
@@ -148,6 +154,16 @@ do_configure() {
 	       -e 's,/perl5,/perl,g' \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
+	case "${TARGET_ARCH}" in
+		x86_64 | powerpc | s390)
+			sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
+				config.sh-${TARGET_ARCH}-${TARGET_OS}
+			;;
+		arm)
+			sed -i -e "s,\(d_u32align=\)'undef',\1'define',g" \
+				config.sh-${TARGET_ARCH}-${TARGET_OS}
+			;;
+	esac
         # These are strewn all over the source tree
         for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
             echo Fixing: $foo
-- 
1.7.1.1



