Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 14DF965FDB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 12:17:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,997,1389740400"; d="scan'208";a="50770609"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 06 May 2014 14:17:45 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Tue, 6 May 2014 14:17:45 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 6 May 2014 14:17:44 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 14:17:47 +0200
Message-ID: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH 1/7] *.bbclass (shell): avoid pipe with sed
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
X-List-Received-Date: Tue, 06 May 2014 12:17:56 -0000
Content-Type: text/plain

Replace:
cat <file> | sed -e xxx
By:
sed -e xxx <file>

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/classes/binconfig.bbclass    | 2 +-
 meta/classes/buildhistory.bbclass | 2 +-
 meta/classes/kernel-grub.bbclass  | 2 +-
 meta/classes/sip.bbclass          | 8 +++-----
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 7158c8c..cbc4173 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -57,7 +57,7 @@ binconfig_sysroot_preprocess () {
 	for config in `find ${S} -name '${BINCONFIG_GLOB}'` `find ${B} -name '${BINCONFIG_GLOB}'`; do
 		configname=`basename $config`
 		install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-		cat $config | sed ${@get_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${bindir_crossscripts}/$configname
+		sed ${@get_binconfig_mangle(d)} $config > ${SYSROOT_DESTDIR}${bindir_crossscripts}/$configname
 		chmod u+x ${SYSROOT_DESTDIR}${bindir_crossscripts}/$configname
 	done
 }
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d75e7e6..20382ce 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -360,7 +360,7 @@ buildhistory_get_installed() {
 
 	# Produce dependency graph
 	# First, quote each name to handle characters that cause issues for dot
-	cat ${WORKDIR}/bh_installed_pkgs_deps.txt | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp && \
+	sed 's:\([^| ]*\):"\1":g' ${WORKDIR}/bh_installed_pkgs_deps.txt > $1/depends.tmp && \
 		rm ${WORKDIR}/bh_installed_pkgs_deps.txt
 	# Change delimiter from pipe to -> and set style for recommend lines
 	sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=dotted]:' -e 's:$:;:' $1/depends.tmp
diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
index 85721ff..a63f482 100644
--- a/meta/classes/kernel-grub.bbclass
+++ b/meta/classes/kernel-grub.bbclass
@@ -67,7 +67,7 @@ pkg_postinst_kernel-image_prepend () {
 		if [ "${grubcfg##*/}" = "grub.cfg" ]; then
 			cat "$grubcfg"
 		elif [ "${grubcfg##*/}" = "menu.list" ]; then
-			cat "$grubcfg" | sed -e '/^default/d' -e '/^timeout/d'
+			sed -e '/^default/d' -e '/^timeout/d' "$grubcfg"
 		fi
 	}
 
diff --git a/meta/classes/sip.bbclass b/meta/classes/sip.bbclass
index 711f851..6ed2a13 100644
--- a/meta/classes/sip.bbclass
+++ b/meta/classes/sip.bbclass
@@ -42,11 +42,9 @@ sip_do_generate() {
 		echo "calling 'sip4 -I sip -I ${STAGING_SIPDIR} ${SIPTAGS} ${FEATURES} -c ${module} -b ${module}/${module}.pro.in sip/${module}/${module}mod.sip'"
 		sip4 -I ${STAGING_SIPDIR} -I sip ${SIPTAGS} ${FEATURES} -c ${module} -b ${module}/${module}.sbf \
 			sip/${module}/${module}mod.sip || die "Error calling sip on ${module}"
-		cat ${module}/${module}.sbf 	| sed s,target,TARGET, \
-						| sed s,sources,SOURCES, \
-						| sed s,headers,HEADERS, \
-						| sed s,"moc_HEADERS =","HEADERS +=", \
-		>${module}/${module}.pro
+		sed -e 's,target,TARGET,' -e 's,sources,SOURCES,' -e 's,headers,HEADERS,' \
+			${module}/${module}.sbf | sed s,"moc_HEADERS =","HEADERS +=", \
+			>${module}/${module}.pro
 		echo "TEMPLATE=lib" >>${module}/${module}.pro
 		[ "${module}" = "qt" ] 		&& echo "" 		>>${module}/${module}.pro
 		[ "${module}" = "qtcanvas" ] 	&& echo ""		>>${module}/${module}.pro
-- 
1.8.5.4


