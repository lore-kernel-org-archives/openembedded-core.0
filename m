Return-Path: <komar@komar.bionik.tu-berlin.de>
X-Greylist: delayed 1682 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Oct 2018 09:45:01 UTC
Received: from mo4-p05-ob.smtp.rzone.de (mo4-p05-ob.smtp.rzone.de
	[85.215.255.135])
	by mail.openembedded.org (Postfix) with ESMTP id BA2966003C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1540806302;
	s=strato-dkim-0002; d=evologics.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=xzOFR+SBQbpjI7Zc9xl4CbTYKiD7wegsd7m1+NAVdj0=;
	b=HyBU5cv9o3XaHxFe4aAA/CIDm+Pe4LQJ/8xs3dejJomHStnGx4jnyXPSQ4VHCnDHdz
	21nN/19oRpT2rUgZbIRRrVbaiGTyLE6GhwjMYSBHb7PeTy7WMcPqlrYrrI84JNlq/5bZ
	ohM448mJwLJ0TTowv0coqf62TYyrwr4yUOaGkO6Pp0YSiy5gOhK94xbhzFSCLRtyBJR8
	AmcjT71coO0zxA/sUkduZmjxQFm1I+lB7QIMCayI4h24+/wGagbq88z0UOodWvbY6PvX
	FmTMwQE8zW2eh87CYwkRJntjxtNpVVAfhUq0XaVHdkD/q3fsZ9GkOCprk0HzSHFIe63j
	759A==
X-RZG-AUTH: ":J2MJdFKIfukmJ5nsom3zZ+ltBBdf17KM5HzjHmp4NmADxfPX8Dr7rqYKTooAxquaF9JVog=="
X-RZG-CLASS-ID: mo05
Received: from komar.lab.evologics.de by smtp.strato.de (RZmta 44.3 AUTH)
	with ESMTPSA id z0780fu9T94n9gF
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Mon, 29 Oct 2018 10:04:49 +0100 (CET)
Received: from komar by komar.lab.evologics.de with local (Exim 4.89)
	(envelope-from <komar@komar.lab.evologics.de>)
	id 1gH3Tc-0006cF-ST; Mon, 29 Oct 2018 10:04:48 +0100
From: Maksym Komar <komar@evologics.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 10:04:23 +0100
Message-Id: <20181029090423.25375-1-komar@evologics.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] image_types.bbclass: add support for multiply ubifs volumes in ubi image
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
X-List-Received-Date: Mon, 29 Oct 2018 09:45:02 -0000
Content-Transfer-Encoding: 8bit

Add the ability to create additional ubifs volumes inside ubi volume.

For example this code create empty 2MiB volume named "config".
===
MKUBIFS_ARGS = "-m 1 -e 65408 -c 958 -F"
UBINIZE_ARGS = "-m 1 -p 64KiB"

MKUBIFS_VOLUMES="config rootfs"
MKUBIFS_VOLUME_SIZE[config] = "2MiB"
MKUBIFS_VOLUME_ARGS[config] = "-m 1 -e 65408 -c 22 -F"
===
As result system will be have /dev/ubi0_0 as "config" and
/dev/ubi0_1 as "rootfs".

Can be used with FSTYPE ubi and multiubi

Signed-off-by: Maksym Komar <komar@evologics.de>
---
 meta/classes/image_types.bbclass | 67 +++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 14 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index e881d0cc2d..726760d99b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -174,28 +174,67 @@ multiubi_mkfs() {
 		local vname="_$3"
 	fi
 
-	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
-	echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
-	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
-	ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
+	if [ -z "$4" ]; then
+		MKUBIFS_VOLUMES="rootfs"
+	fi
+
+	local vol_id=0
+	echo -n > ubinize${vname}-${IMAGE_NAME}.cfg
+	for volume in ${MKUBIFS_VOLUMES}; do
+		echo \[${volume}\] >> ubinize${vname}-${IMAGE_NAME}.cfg
+		echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
+		echo vol_id=$vol_id >> ubinize${vname}-${IMAGE_NAME}.cfg
+		echo vol_type=dynamic >> ubinize${vname}-${IMAGE_NAME}.cfg
+
+		# workaround to get Variable Flag MKUBIFS_VOLUME_SIZE[volume_name]
+		eval ${@' '.join(['size_' + k + '=\\"' + v + '\\"' for k,v in d.getVarFlags('MKUBIFS_VOLUME_SIZE').items()])}
+		eval size=\"\$size_$volume\"
+
+		if [ -z "$size" ]; then
+			echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
+		else
+			echo vol_size=$size >> ubinize${vname}-${IMAGE_NAME}.cfg
+		fi
+
+		if [ "${volume}" = "rootfs" ]; then
+			echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
+			echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
+			mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
+		else
+			echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${volume}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
+			echo vol_name=${volume} >> ubinize${vname}-${IMAGE_NAME}.cfg
+
+			# workaround to get Variable Flag MKUBIFS_VOLUME_ARGS[volume_name]
+			eval ${@' '.join(['args_' + k + '=\\"' + v + '\\"' for k,v in d.getVarFlags('MKUBIFS_VOLUME_ARGS').items()])}
+			eval args=\"\$args_$volume\"
+
+	        # create empty volume
+			mkdir -p empty
+			mkfs.ubifs -r empty -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}.${volume}.ubifs $args
+			rmdir empty
+		fi
+		vol_id=$(expr $vol_id + 1)
+	done
+
+	# if variable IMAGE_NAME_SUFFIX is weak, set suffix with names of all volumes
+	image_name_suffix=$IMAGE_NAME_SUFFIX
+	if [ -n "${MKUBIFS_VOLUMES}" -a -z "${@d.getVar('IMAGE_NAME_SUFFIX', noweakdefault=True) or ''}" ]; then
+		image_name_suffix=${@'.' + '-'.join(d.getVar('MKUBIFS_VOLUMES').split())}
+	fi
+	ubinize -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${image_name_suffix}.ubi ${ubinize_args} ubinize${vname}-${IMAGE_NAME}.cfg
 
 	# Cleanup cfg file
 	mv ubinize${vname}-${IMAGE_NAME}.cfg ${IMGDEPLOYDIR}/
 
 	# Create own symlinks for 'named' volumes
-	if [ -n "$vname" ]; then
+	if [ -n "$vname" -o "${IMAGE_NAME_SUFFIX}" != "${image_name_suffix}" ]; then
 		cd ${IMGDEPLOYDIR}
 		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ]; then
 			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs \
 			${IMAGE_LINK_NAME}${vname}.ubifs
 		fi
-		if [ -e ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi ]; then
-			ln -sf ${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubi \
+		if [ -e ${IMAGE_NAME}${vname}${image_name_suffix}.ubi ]; then
+			ln -sf ${IMAGE_NAME}${vname}${image_name_suffix}.ubi \
 			${IMAGE_LINK_NAME}${vname}.ubi
 		fi
 		cd -
@@ -208,12 +247,12 @@ IMAGE_CMD_multiubi () {
 		eval local mkubifs_args=\"\$MKUBIFS_ARGS_${name}\"
 		eval local ubinize_args=\"\$UBINIZE_ARGS_${name}\"
 
-		multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
+		multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}" "${MKUBIFS_VOLUMES}"
 	done
 }
 
 IMAGE_CMD_ubi () {
-	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
+	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "" "${MKUBIFS_VOLUMES}"
 }
 
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
-- 
2.19.1


