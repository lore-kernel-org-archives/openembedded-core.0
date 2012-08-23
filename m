Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T4bSU-0000wO-Ce
	for openembedded-core@openembedded.org; Thu, 23 Aug 2012 19:44:42 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 229281F459;
	Thu, 23 Aug 2012 10:32:37 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org
Date: Thu, 23 Aug 2012 10:32:30 -0700
Message-Id: <1345743151-2065-2-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1345743151-2065-1-git-send-email-andy.ross@windriver.com>
References: <1345743151-2065-1-git-send-email-andy.ross@windriver.com>
Subject: [PATCH 1/2] libtool: update rpath normalization to use builtin
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
X-List-Received-Date: Thu, 23 Aug 2012 17:44:42 -0000

Use the built-in normalization function instead of the sed hack.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  2 +-
 .../libtool/libtool/norm-rpath.patch               | 22 ++++++++--------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 691427e..95e12a2 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
diff --git a/meta/recipes-devtools/libtool/libtool/norm-rpath.patch b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
index 03a7667..dce1576 100644
--- a/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
+++ b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
@@ -7,33 +7,27 @@ RPATH in the generated binary.  Normalize before comparision.
 Signed-off-by: Andy Ross <andy.ross@windriver.com>
 Upstream-Status: Pending
 
-diff -ru a/libltdl/config/ltmain.m4sh b/libltdl/config/ltmain.m4sh
+diff -ur a/libltdl/config/ltmain.m4sh b/libltdl/config/ltmain.m4sh
 --- a/libltdl/config/ltmain.m4sh	2012-08-16 13:58:55.058900363 -0700
-+++ b/libltdl/config/ltmain.m4sh	2012-08-16 16:34:54.616627821 -0700
-@@ -7288,8 +7288,13 @@
++++ b/libltdl/config/ltmain.m4sh	2012-08-22 11:01:34.191345989 -0700
+@@ -7288,8 +7288,10 @@
  	      else
                  # We only want to hardcode in an rpath if it isn't in the
                  # default dlsearch path.
-+                libdir_norm=`echo $libdir \
-+                  | sed 's/\/\+\.\(\/\+\|$\)/\//g' \
-+                  | sed 's/[^\/]\+\/\+\.\.\(\/\+\|$\)//g' \
-+                  | sed 's/\/\+/\//g' \
-+                  | sed 's/\(.\)\/$/\1/g'`
++                func_normal_abspath "$libdir"
++                libdir_norm=$func_normal_abspath_result
  	        case " $sys_lib_dlsearch_path " in
 -	        *" $libdir "*) ;;
 +	        *" $libdir_norm "*) ;;
  	        *) eval flag=\"$hardcode_libdir_flag_spec\"
                     func_append dep_rpath " $flag"
                     ;;
-@@ -8027,8 +8032,13 @@
+@@ -8027,8 +8029,10 @@
  	  else
              # We only want to hardcode in an rpath if it isn't in the
              # default dlsearch path.
-+            libdir_norm=`echo $libdir \
-+              | sed 's/\/\+\.\(\/\+\|$\)/\//g' \
-+              | sed 's/[^\/]\+\/\+\.\.\(\/\+\|$\)//g' \
-+              | sed 's/\/\+/\//g' \
-+              | sed 's/\(.\)\/$/\1/g'`
++            func_normal_abspath "$libdir"
++            libdir_norm=$func_normal_abspath_result
  	    case " $sys_lib_dlsearch_path " in
 -	    *" $libdir "*) ;;
 +	    *" $libdir_norm "*) ;;
-- 
1.7.11.4



