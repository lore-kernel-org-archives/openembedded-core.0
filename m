Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNq1m-0007KT-M1 for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 19:04:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8HvnZS003357
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 17:57:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02911-08 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 17:57:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8Hvd9Q003351
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 17:57:40 GMT
Message-ID: <1320775061.10843.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 17:57:41 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] classes: Remove various bashisms
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
X-List-Received-Date: Tue, 08 Nov 2011 18:04:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 350c29d..53ef47e 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -24,7 +24,7 @@ prelink_image () {
 	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
 
 	# Remove the prelink.conf if we had to add it.
-	if [ "$dummy_prelink_conf" == "true" ]; then
+	if [ "$dummy_prelink_conf" = "true" ]; then
 		rm -f ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
 	fi
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 42543e0..dc711f2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -152,7 +152,7 @@ kernel_do_install() {
 	#
 	cp -fR * $kerneldir
 	cp .config $kerneldir
-	if [ ! "${S}" == "${B}" ]; then
+	if [ "${S}" != "${B}" ]; then
 		cp -fR ${S}/* $kerneldir
 	fi
 	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index ba4feee..e8bdcae 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -87,22 +87,22 @@ package_generate_rpm_conf_common() {
 	shift
 
 	printf "_solve_dbpath " > ${rpmconf_base}.macro
-	o_colon=false
+	o_colon="false"
 
 	for archvar in "$@"; do
 		printf "_solve_dbpath " > ${rpmconf_base}-${archvar}.macro
-		colon=false
+		colon="false"
 		for each in `cat ${rpmconf_base}-${archvar}.conf` ; do
-			if [ "$o_colon" == true ]; then
+			if [ "$o_colon" = "true" ]; then
 				printf ":" >> ${rpmconf_base}.macro
 			fi
-			if [ "$colon" == true ]; then
+			if [ "$colon" = "true" ]; then
 				printf ":" >> ${rpmconf_base}-${archvar}.macro
 			fi
 			printf "%s" $each >> ${rpmconf_base}.macro
-			o_colon=true
+			o_colon="true"
 			printf "%s" $each >> ${rpmconf_base}-${archvar}.macro
-			colon=true
+			colon="true"
 		done
 		printf "\n" >> ${rpmconf_base}-${archvar}.macro
 	done
@@ -214,7 +214,7 @@ package_install_internal_rpm () {
 				ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 				ml_pkg=$pkg
 				for i in ${MULTILIB_PREFIX_LIST} ; do
-					if [ ${ml_prefix} == ${i} ]; then
+					if [ ${ml_prefix} = ${i} ]; then
 						ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 						archvar=ml_archs
 						break
@@ -238,7 +238,7 @@ package_install_internal_rpm () {
 			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 			ml_pkg=$pkg
 			for i in ${MULTILIB_PREFIX_LIST} ; do
-				if [ ${ml_prefix} == ${i} ]; then
+				if [ ${ml_prefix} = ${i} ]; then
 					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 					archvar=ml_archs
 					break
@@ -273,7 +273,7 @@ package_install_internal_rpm () {
 			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 			ml_pkg=$pkg
 			for i in ${MULTILIB_PREFIX_LIST} ; do
-				if [ ${ml_prefix} == ${i} ]; then
+				if [ ${ml_prefix} = ${i} ]; then
 					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 					archvar=ml_archs
 					break
@@ -364,7 +364,7 @@ package_install_internal_rpm () {
 			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 			ml_pkg=$pkg
 			for i in ${MULTILIB_PREFIX_LIST} ; do
-				if [ ${ml_prefix} == ${i} ]; then
+				if [ ${ml_prefix} = ${i} ]; then
 					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 					archvar=ml_archs
 					break




