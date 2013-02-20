Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U82uD-0000BH-S6
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:11:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K5tdxe020699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 21:55:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 19 Feb 2013 21:55:38 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 13:55:33 +0800
Message-ID: <5ef28960f6e00cda4b04bbe53399053704921d2d.1361338900.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1361338900.git.Qi.Chen@windriver.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V2 4/5] populate-volatile.sh: improve the handling of link config items
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
X-List-Received-Date: Wed, 20 Feb 2013 06:11:56 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, if there's a link config item in the config file like

	    l root root 1777 /tmp /var/tmp

and /tmp has existed, the symlink will not be created correctly.

Another example is the /run directory. If /run directory has been
created by some recipe or script before populate-volatile.sh runs,
the symlink of /run to /var/run will not be created correctly.

This patch ensures that the system creates symlinks exactly as the
config file tells it.

[YOCTO #3404]
[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/populate-volatile.sh           |   37 +++++++++++---------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index c4bf70e..24daeb4 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -68,20 +68,27 @@ mk_dir() {
 }
 
 link_file() {
-	EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1" 
+	EXEC="
+	if [ -L \"$2\" ]; then
+		[ \"\$(readlink -f \"$2\")\" != \"\$(readlink -f \"$1\")\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
+	elif [ -d \"$2\" ]; then
+		for f in $2/* $2/.[^.]*; do [ -e \$f ] && cp -rf \$f $1; done;
+		rm -rf \"$2\";
+		ln -sf \"$1\" \"$2\";
+	else
+		ln -sf \"$1\" \"$2\";
+	fi
+        "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache.build
-	[ -e "$2" ] && {
-		echo "Cannot create link over existing -${TNAME}-." >&2
-	} || {
-		if [ "$ROOT_DIR" = "/" ]; then
-			eval $EXEC &
-		else
-			# For the same reason with create_file(), failures should
-			# not be logged.
-			eval $EXEC > /dev/null 2>&1 &
-		fi
-	}
+
+	if [ "$ROOT_DIR" = "/" ]; then
+		eval $EXEC &
+	else
+		# For the same reason with create_file(), failures should
+		# not be logged.
+		eval $EXEC > /dev/null 2>&1 &
+	fi
 }
 
 check_requirements() {
@@ -148,10 +155,8 @@ apply_cfgfile() {
 
 		[ "${TTYPE}" = "l" ] && {
 			TSOURCE="$TLTARGET"
-			[ -L "${TNAME}" ] || {
-				[ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
-				link_file "${TSOURCE}" "${TNAME}" &
-			}
+			[ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
+			link_file "${TSOURCE}" "${TNAME}"
 			continue
 		}
 
-- 
1.7.9.5



