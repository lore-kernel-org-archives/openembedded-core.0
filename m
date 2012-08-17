Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T2P2z-0001Ki-Hx
	for openembedded-core@openembedded.org; Fri, 17 Aug 2012 18:05:17 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 51E751ED13;
	Fri, 17 Aug 2012 08:53:20 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org
Date: Fri, 17 Aug 2012 08:53:11 -0700
Message-Id: <1345218791-28891-3-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <1345218791-28891-2-git-send-email-andy.ross@windriver.com>
References: <1345218791-28891-1-git-send-email-andy.ross@windriver.com>
	<1345218791-28891-2-git-send-email-andy.ross@windriver.com>
Subject: [PATCH 2/2] libtool: normalize link paths before considering for RPATH
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
X-List-Received-Date: Fri, 17 Aug 2012 16:05:17 -0000

Libtool may be passed link paths of the form "/usr/lib/../lib", which fool
its detection code into thinking it should be included as an RPATH in
the generated binary.  Normalize before comparision.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
 .../libtool/libtool/norm-rpath.patch               | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/norm-rpath.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 5b9557e..691427e 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://avoid_absolute_paths_for_general_utils.patch \
            file://fix-rpath.patch \
 	   file://respect-fstack-protector.patch \
+           file://norm-rpath.patch \
           "
 
 SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
diff --git a/meta/recipes-devtools/libtool/libtool/norm-rpath.patch b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
new file mode 100644
index 0000000..03a7667
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
@@ -0,0 +1,42 @@
+libtool: normalize link paths before considering for RPATH
+
+Libtool may be passed link paths of the form "/usr/lib/../lib", which
+fool its detection code into thinking it should be included as an
+RPATH in the generated binary.  Normalize before comparision.
+
+Signed-off-by: Andy Ross <andy.ross@windriver.com>
+Upstream-Status: Pending
+
+diff -ru a/libltdl/config/ltmain.m4sh b/libltdl/config/ltmain.m4sh
+--- a/libltdl/config/ltmain.m4sh	2012-08-16 13:58:55.058900363 -0700
++++ b/libltdl/config/ltmain.m4sh	2012-08-16 16:34:54.616627821 -0700
+@@ -7288,8 +7288,13 @@
+ 	      else
+                 # We only want to hardcode in an rpath if it isn't in the
+                 # default dlsearch path.
++                libdir_norm=`echo $libdir \
++                  | sed 's/\/\+\.\(\/\+\|$\)/\//g' \
++                  | sed 's/[^\/]\+\/\+\.\.\(\/\+\|$\)//g' \
++                  | sed 's/\/\+/\//g' \
++                  | sed 's/\(.\)\/$/\1/g'`
+ 	        case " $sys_lib_dlsearch_path " in
+-	        *" $libdir "*) ;;
++	        *" $libdir_norm "*) ;;
+ 	        *) eval flag=\"$hardcode_libdir_flag_spec\"
+                    func_append dep_rpath " $flag"
+                    ;;
+@@ -8027,8 +8032,13 @@
+ 	  else
+             # We only want to hardcode in an rpath if it isn't in the
+             # default dlsearch path.
++            libdir_norm=`echo $libdir \
++              | sed 's/\/\+\.\(\/\+\|$\)/\//g' \
++              | sed 's/[^\/]\+\/\+\.\.\(\/\+\|$\)//g' \
++              | sed 's/\/\+/\//g' \
++              | sed 's/\(.\)\/$/\1/g'`
+ 	    case " $sys_lib_dlsearch_path " in
+-	    *" $libdir "*) ;;
++	    *" $libdir_norm "*) ;;
+ 	    *) eval flag=\"$hardcode_libdir_flag_spec\"
+                rpath+=" $flag"
+                ;;
-- 
1.7.11.2



