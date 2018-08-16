Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5118179272
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 10:33:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7GAXgeG013040
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 03:33:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 16 Aug 2018 03:33:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 18:37:58 +0800
Message-ID: <ff26a8565e39359ed0247b3c12bfd80eb6021223.1534415298.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1534415298.git.Qi.Chen@windriver.com>
References: <cover.1534415298.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glibc: re-package for libnss-db
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
X-List-Received-Date: Thu, 16 Aug 2018 10:33:41 -0000
Content-Type: text/plain

On other distros like ubuntu/centos, libnss-db usually provides:
- The libraries
- The Makefile to create database
  (in /var/db for centos, /var/lib/misc/ for ubuntu)
- The makedb command (it's in glibc-common for centos7)

What we had is:
- The libraries are in glibc-extra-nss
- The Makefile is removed
- The makedb command is in glibc-utils (lack of dependency)

So when glibc-extra-nss is installed but glibc-utils is not,
we see error like:
nscd[165]: 165 checking for monitored file `/var/db/group.db': No such file or directory
nscd[165]: 165 checking for monitored file `/var/db/passwd.db': No such file or directory

And there is not an easy way to create these databases.

To fix the issue:
- Re-package the libraries into libnss-db
- Don't remove the Makefile and add it in libnss-db
- Add RDEPENDS for libnss-db on glibc-utils
- Provide a shell script, makedbs.sh, to generate the db files.
  This is to avoid dependency on 'make'.

Notes:
1. For external toolchain, an extra package 'libnss-db' need to be provided
   If replacing glibc from core.
2. I've check the git history of nss/db-Makefile, the last two functionality
   fix is as below.
   - fix non-portable `echo -n` usage   --  Date:   Thu Aug 6 04:14:20 2015 -0400
   - Fix db makefile rule for group.db  --  Date:   Fri Nov 11 14:43:36 2011 +0100
   So I think this file is stable enough. And using makedbs.sh which is crafted according
   to that file is not likely to cause maintanence problem.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc |   6 +-
 meta/recipes-core/glibc/glibc/makedbs.sh  | 177 ++++++++++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb     |   1 +
 3 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-core/glibc/glibc/makedbs.sh

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 07ce75d..9ea41b7 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
@@ -23,6 +23,8 @@ FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
 FILES_libmemusage = "${base_libdir}/libmemusage.so"
+FILES_libnss-db = "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_db-*.so ${localstatedir}/db/Makefile ${localstatedir}/db/makedbs.sh"
+RDEPENDS_libnss-db = "${PN}-utils"
 FILES_glibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
 FILES_sln = "${base_sbindir}/sln"
 FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
@@ -59,7 +61,6 @@ inherit libc-common multilib_header
 
 do_install_append () {
 	rm -f ${D}${sysconfdir}/localtime
-	rm -rf ${D}${localstatedir}
 
 	# remove empty glibc dir
 	if [ -d ${D}${libexecdir} ]; then
@@ -95,6 +96,7 @@ do_install_append () {
 	install -d ${D}${localstatedir}/db/nscd
 	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
 	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
+	install -m 0755 ${WORKDIR}/makedbs.sh ${D}${localstatedir}/db
 	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}/init.d/nscd
 	sed -i "s|\(enable-cache\t\+netgroup\t\+\)yes|\1no|" ${D}${sysconfdir}/nscd.conf
 
diff --git a/meta/recipes-core/glibc/glibc/makedbs.sh b/meta/recipes-core/glibc/glibc/makedbs.sh
new file mode 100755
index 0000000..7d51a67
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/makedbs.sh
@@ -0,0 +1,177 @@
+#!/bin/sh
+
+#
+# Make passwd.db, group.db, etc.
+#
+
+VAR_DB=/var/db
+
+# Use make if available
+if [ -x /usr/bin/make -o -x /bin/make ]; then
+	make -C $VAR_DB
+	exit 0
+fi
+
+# No make available, do it in hard way
+
+# passwd.db
+if [ -e /etc/passwd ]; then
+target=$VAR_DB/passwd.db
+echo -n "passwd... "
+awk 'BEGIN { FS=":"; OFS=":" } \
+ /^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { printf ".%s ", $$1; print; \
+	   printf "=%s ", $$3; print }' /etc/passwd | \
+makedb --quiet -o $target -
+echo "done."
+fi
+
+# group.db
+if [ -e /etc/group ]; then
+target=$VAR_DB/group.db
+echo -n "group... "
+awk 'BEGIN { FS=":"; OFS=":" } \
+ /^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { printf ".%s ", $$1; print; \
+	   printf "=%s ", $$3; print; \
+	   if ($$4 != "") { \
+	     split($$4, grmems, ","); \
+	     for (memidx in grmems) { \
+	       mem=grmems[memidx]; \
+	       if (members[mem] == "") \
+		 members[mem]=$$3; \
+	       else \
+		 members[mem]=members[mem] "," $$3; \
+	     } \
+	     delete grmems; } } \
+ END { for (mem in members) \
+	 printf ":%s %s %s\n", mem, mem, members[mem]; }' /etc/group | \
+makedb --quiet -o $target -
+echo "done."
+fi
+
+# ethers.db
+if [ -e /etc/ethers ]; then
+target=$VAR_DB/ethers.db
+echo -n "ethers... "
+awk '/^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { printf ".%s ", $$1; print; \
+	   printf "=%s ", $$2; print }' /etc/ethers | \
+makedb --quiet -o $target -
+echo "done."
+fi
+
+# protocols.db
+if [ -e /etc/protocols ]; then
+target=$VAR_DB/protocols.db
+echo -n "protocols... "
+awk '/^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { printf ".%s ", $$1; print; \
+	   printf "=%s ", $$2; print; \
+	   for (i = 3; i <= NF && !($$i ~ /^#/); ++i) \
+	     { printf ".%s ", $$i; print } }' /etc/protocols | \
+makedb --quiet -o $target -
+echo "done."
+fi
+
+# rpc.db
+if [ -e /etc/rpc ]; then
+target=$VAR_DB/rpc.db
+echo -n "rpc... "
+awk '/^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { printf ".%s ", $$1; print; \
+	   printf "=%s ", $$2; print; \
+	   for (i = 3; i <= NF && !($$i ~ /^#/); ++i) \
+	     { printf ".%s ", $$i; print } }' /etc/rpc | \
+makedb --quiet -o $target -
+echo "done."
+fi
+
+# services.db
+if [ -e /etc/services ]; then
+target=$VAR_DB/services.db
+echo -n "services... "
+awk 'BEGIN { FS="[ \t/]+" } \
+ /^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { sub(/[ \t]*#.*$$/, "");\
+	   printf ":%s/%s ", $$1, $$3; print; \
+	   printf ":%s/ ", $$1; print; \
+	   printf "=%s/%s ", $$2, $$3; print; \
+	   printf "=%s/ ", $$2; print; \
+	   for (i = 4; i <= NF && !($$i ~ /^#/); ++i) \
+	     { printf ":%s/%s ", $$i, $$3; print; \
+	       printf ":%s/ ", $$i; print } }' /etc/services | \
+makedb --quiet -o $target -
+echo "done."
+fi
+
+# shadow.db
+if [ -e /etc/shadow ]; then
+target=$VAR_DB/shadow.db
+echo -n "shadow... "
+awk 'BEGIN { FS=":"; OFS=":" } \
+ /^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { printf ".%s ", $$1; print }' /etc/shadow | \
+(umask 077 && makedb --quiet -o $target -)
+echo "done."
+if chgrp shadow $target 2>/dev/null; then
+	chmod g+r $target
+else
+	chown 0 $target; chgrp 0 $target; chmod 600 $target;
+	echo
+	echo "Warning: The shadow password database $target"
+	echo "has been set to be readable only by root.  You may want"
+	echo "to make it readable by the \`shadow' group depending"
+	echo "on your configuration."
+	echo
+fi
+fi
+
+# gshadow.db
+if [ -e /etc/gshadow ]; then
+target=$VAR_DB/gshadow.db
+echo -n "gshadow... "
+awk 'BEGIN { FS=":"; OFS=":" } \
+ /^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { printf ".%s ", $$1; print }' /etc/gshadow | \
+(umask 077 && makedb --quiet -o $target -)
+echo "done."
+if chgrp shadow $target 2>/dev/null; then
+	chmod g+r $target
+else
+	chown 0 $target; chgrp 0 $target; chmod 600 $target
+	echo
+	echo "Warning: The shadow group database $target"
+	echo "has been set to be readable only by root.  You may want"
+	echo "to make it readable by the \`shadow' group depending"
+	echo "on your configuration."
+	echo
+fi
+fi
+
+# netgroup.db
+if [ -e /etc/netgroup ]; then
+target=$VAR_DB/netgroup.db
+echo -n "netgroup... "
+awk 'BEGIN { ini=1 } \
+ /^[ \t]*$$/ { next } \
+ /^[ \t]*#/ { next } \
+ /^[^#]/ { if (sub(/[ \t]*\\$$/, " ") == 0) end="\n"; \
+	   else end=""; \
+	   gsub(/[ \t]+/, " "); \
+	   sub(/^[ \t]*/, ""); \
+	   if (ini == 0) printf "%s%s", $$0, end; \
+	   else printf ".%s %s%s", $$1, $$0, end; \
+	   ini=end == "" ? 0 : 1; } \
+ END { if (ini==0) printf "\n" }' /etc/netgroup | \
+makedb --quiet -o $target
+echo "done."
+fi
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 95e333d..0ebbaf9 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
+           file://makedbs.sh \
            \
            ${NATIVESDKFIXES} \
            file://0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
-- 
1.9.1


