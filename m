Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TWhdw-0004yL-Ea
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 07:00:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA95koSH016550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Nov 2012 21:46:50 -0800 (PST)
Received: from chenqi-OptiPlex-760.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 8 Nov 2012 21:46:50 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Nov 2012 13:47:21 +0800
Message-ID: <e4558ca77d64a8f3702c05599a630a00ddc0170f.1352439901.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352439901.git.Qi.Chen@windriver.com>
References: <cover.1352439901.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] autotools.bbclass: use relative path for acpaths whenever possible
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
X-List-Received-Date: Fri, 09 Nov 2012 06:00:40 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

When the TMPDIR is very long, say, 410 characters, aclocal would
fail because the argument list is too long. This patch is an effort
to use relative path for acpaths whenever possible, aiming at
making the build system work correctly when the sanity check says OK.

With the current implementation of autoreconf, it's impossible to
thoroughly replace absolute path with relative path. Therefore, we
use relative path when there's on subdirectory to configure; otherwise,
we use absolute path.

[YOCTO #2766]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/autotools.bbclass |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index b97d74b..86d8939 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -123,8 +123,11 @@ autotools_do_configure() {
 		rm -f `dirname $ac`/configure
 		done )
 	if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
+               [ -e configure.in ] && CONFIGURE_AC=configure.in || CONFIGURE_AC=configure.ac
 		olddir=`pwd`
 		cd ${S}
+		# Determine whether there's subdirs to configure
+		grep -q -m 1 AC_CONFIG_SUBDIRS $CONFIGURE_AC && sub_cfg=1 || sub_cfg=0
 		# Remove any previous copy of the m4 macros
 		rm -rf ${B}/aclocal-copy/
 		ACLOCAL="aclocal --system-acdir=${B}/aclocal-copy/"
@@ -132,6 +135,11 @@ autotools_do_configure() {
 			acpaths=
 			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
 				grep -v 'acinclude.m4' | grep -v 'aclocal-copy' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
+			        # If no subdirs to configure, we use relative path
+			        # This is used for supporting long TMPDIR in Yocto
+			        if [ $sub_cfg == 0 ]; then
+				        i=`echo $i | sed -e 's#${S}#\.#'`
+				fi
 				acpaths="$acpaths -I $i"
 			done
 		else
@@ -161,11 +169,7 @@ autotools_do_configure() {
 		if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
 			rm -f aclocal.m4
 		fi
-		if [ -e configure.in ]; then
-			CONFIGURE_AC=configure.in
-		else
-			CONFIGURE_AC=configure.ac
-		fi
+
 		if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
 			if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
 				: do nothing -- we still have an old unmodified configure.ac
-- 
1.7.9.5



