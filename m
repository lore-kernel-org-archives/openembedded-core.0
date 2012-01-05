Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rimt6-0000s2-UN for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 13:57:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05CoKcJ004910
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 12:50:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04692-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2012 12:50:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05CoB8h004904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 12:50:12 GMT
Message-ID: <1325767811.20759.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 12:50:11 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] image-mklibs/package_ipk: Remove bashisms
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
X-List-Received-Date: Thu, 05 Jan 2012 12:57:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We now support using dash but these bashisms triggered build failures for me
when using it. This replaces the code with something which works on dash.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 69dac2f..7623815 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -60,7 +60,7 @@ mklibs_optimize_image_doit() {
 mklibs_optimize_image() {
 	for img in ${MKLIBS_OPTIMIZED_IMAGES}
 	do
-		if [ "${img}" == "${PN}" ] || [ "${img}" == "all" ]
+		if [ "${img}" = "${PN}" ] || [ "${img}" = "all" ]
 		then
 			mklibs_optimize_image_doit
 			break
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index aeabc11..36dedb9 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -72,8 +72,10 @@ package_tryout_install_multilib_ipk() {
 		local ipkg_args="-f ${INSTALL_CONF_IPK} -o ${target_rootfs} --force_overwrite"
 		local selected_pkg=""
 		local pkgname_prefix="${item}-"
+		local pkgname_len=${#pkgname_prefix}
 		for pkg in ${INSTALL_PACKAGES_MULTILIB_IPK}; do
-			if [ ${pkg:0:${#pkgname_prefix}} == ${pkgname_prefix} ]; then
+			local pkgname=$(echo $pkg | awk -v var=$pkgname_len '{ pkgname=substr($1, 1, var - 1); print pkgname; }' )
+			if [ ${pkgname} = ${pkgname_prefix} ]; then
 			    selected_pkg="${selected_pkg} ${pkg}"
 			fi
 		done
@@ -94,7 +96,9 @@ split_multilib_packages() {
 		is_multilib=0
 		for item in ${MULTILIB_VARIANTS}; do
 			local pkgname_prefix="${item}-"
-			if [ ${pkg:0:${#pkgname_prefix}} == ${pkgname_prefix} ]; then
+			local pkgname_len=${#pkgname_prefix}
+			local pkgname=$(echo $pkg | awk -v var=$pkgname_len '{ pkgname=substr($1, 1, var - 1); print pkgname; }' )
+			if [ ${pkgname} = ${pkgname_prefix} ]; then
 				is_multilib=1
 				break
 			fi




