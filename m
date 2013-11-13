Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 049D06D7E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:23:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD1Nxdk024253
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:23:59 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 12 Nov 2013 17:23:58 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Nov 2013 19:23:25 -0600
Message-ID: <fcfe6fde528fe9556928a4c24e12a3659b76594c.1384305535.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1384305535.git.mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/6] package_rpm: Allow translation of requirement to package name
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
X-List-Received-Date: Wed, 13 Nov 2013 01:23:57 -0000
Content-Type: text/plain

In the translate oe to smart function, we only translated package names.
However, it's allowed that people can put in a dependency name in the
IMAGE_INSTALL.  So on a failure to translate a package name, we fall back
and attempt to resolve based on a package's provide.

Note: it may be possible to generate an unsolvable install solution.  If the
dependency is provided by one or more things that conflict with something else
set to be installed.  We can't determine this until smart is run.

If this occurs, file a bug and we'll have to identify a way to deal with the
RCONFLICTS and RREPLACES.  As a workaround replace the conflict REQUIRES with
actual package names.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass | 79 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 31265d9..64da1f5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -166,6 +166,7 @@ translate_oe_to_smart() {
 	[ ! -e ${target_rootfs}/install/tmp/fullpkglist.query ] && smart --data-dir=${target_rootfs}/var/lib/smart query --output ${target_rootfs}/install/tmp/fullpkglist.query
 
 	pkgs_to_install=""
+	not_found=""
 	for pkg in "$@" ; do
 		new_pkg="$pkg"
 		if [ -z "$sdk_mode" ]; then
@@ -184,7 +185,6 @@ translate_oe_to_smart() {
 				fi
 				subst=${pkg#${mlib}-}
 				if [ "$subst" != "$pkg" ]; then
-					feeds=$@
 					while [ -n "$1" ]; do
 						arch="$1"
 						arch=`echo "$arch" | tr - _`
@@ -197,6 +197,76 @@ translate_oe_to_smart() {
 					done
 					if [ "$pkg" = "$new_pkg" ]; then
 						# Failed to translate, package not found!
+						not_found="$not_found $pkg"
+						continue
+					fi
+				fi
+			done
+		fi
+		# Apparently not a multilib package...
+		if [ "$pkg" = "$new_pkg" ]; then
+			default_archs_fixed=`echo "$default_archs" | tr - _`
+			for arch in $default_archs_fixed ; do
+				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$' ${target_rootfs}/install/tmp/fullpkglist.query ; then
+					new_pkg="$pkg@$arch"
+					# First found is best match
+					break
+				fi
+			done
+			if [ "$pkg" = "$new_pkg" ]; then
+				# Failed to translate, package not found!
+				not_found="$not_found $pkg"
+				continue
+			fi
+		fi
+		#echo "$pkg -> $new_pkg" >&2
+		pkgs_to_install="${pkgs_to_install} ${new_pkg}"
+	done
+
+	# Parse the not_found items and see if they were dependencies (RPROVIDES)
+	# Follow the parsing example above...
+	for pkg in $not_found ; do
+		new_pkg="$pkg"
+		smart --data-dir=${target_rootfs}/var/lib/smart query --provides=$pkg --output ${target_rootfs}/install/tmp/provide.query
+		grep '^[^@ ]*@[^@]*$' ${target_rootfs}/install/tmp/provide.query | sed 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' > ${target_rootfs}/install/tmp/provide.query.list || :
+		prov=`echo $pkgs_to_install | xargs -n 1 echo | grep -f ${target_rootfs}/install/tmp/provide.query.list || :`
+		if [ -n "$prov" ]; then
+			# Nothing to do, already in the list
+			#echo "Skipping $pkg -> $prov, already in install set" >&2
+			continue
+		fi
+		if [ -z "$sdk_mode" ]; then
+			for i in ${MULTILIB_PREFIX_LIST} ; do
+				old_IFS="$IFS"
+				IFS=":"
+				set $i
+				IFS="$old_IFS"
+				mlib="$1"
+				shift
+				if [ "$mlib" = "default" ]; then
+					if [ -z "$default_archs" ]; then
+						default_archs=$@
+					fi
+					continue
+				fi
+				subst=${pkg#${mlib}-}
+				if [ "$subst" != "$pkg" ]; then
+					feeds=$@
+					smart --data-dir=${target_rootfs}/var/lib/smart query --provides=$subst --output ${target_rootfs}/install/tmp/provide.query
+					grep '^[^@ ]*@[^@]*$' ${target_rootfs}/install/tmp/provide.query | sed 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' > ${target_rootfs}/install/tmp/provide.query.list || :
+					while [ -n "$1" ]; do
+						arch="$1"
+						arch=`echo "$arch" | tr - _`
+						shift
+						# Select first found, we don't know if one is better then another...
+						prov=`grep '^[^@ ]*@'$arch'$' ${target_rootfs}/install/tmp/provide.query.list | head -n 1`
+						if [ -n "$prov" ]; then
+							new_pkg=$prov
+							break
+						fi
+					done
+					if [ "$pkg" = "$new_pkg" ]; then
+						# Failed to translate, package not found!
 						echo "$attemptonly: $pkg not found in the $mlib feeds ($feeds)." >&2
 						if [ "$attemptonly" = "Error" ]; then
 							exit 1
@@ -210,9 +280,10 @@ translate_oe_to_smart() {
 		if [ "$pkg" = "$new_pkg" ]; then
 			default_archs_fixed=`echo "$default_archs" | tr - _`
 			for arch in $default_archs_fixed ; do
-				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$' ${target_rootfs}/install/tmp/fullpkglist.query ; then
-					new_pkg="$pkg@$arch"
-					# First found is best match
+				# Select first found, we don't know if one is better then another...
+				prov=`grep '^[^@ ]*@'$arch'$' ${target_rootfs}/install/tmp/provide.query.list | head -n 1`
+				if [ -n "$prov" ]; then
+					new_pkg=$prov
 					break
 				fi
 			done
-- 
1.8.1.2.545.g2f19ada


