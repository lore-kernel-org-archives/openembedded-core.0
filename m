Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web09.55683.1622540268276589937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 02:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fris.de header.s=dkim header.b=0NzoYPEv;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B9BDBFB55;
	Tue,  1 Jun 2021 11:37:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1622540264; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9Q+FSyw8Ce7aVCuXKuS46zZVsxFHu5VzqQTgrKpsl3M=;
	b=0NzoYPEvsjU6lL5E7wT/F4vtc+XZfxadU33ksyHebXn3P7/zjgVsDgtpigAFgv66HvOdby
	caLQ/nsoS5f5voSORvJhktcLHAIziMr9wf6+NIUdoP7/5xxN8HC3YJ+nCM/t83BJZN3Kdt
	tiektc/2iHktp+1I2vMcjXnExWP/axAIMCqQY1U/45kAznMV0Zg01A7WY5W/HXBAQR6h1y
	NN5W9SykPty+vHu+9Dzg2TvsVXwr6Ibpw/sLo9VQ2Sy2LD0ulTYhl9HAFKlCrJ/ZcI9DaD
	XuyTuwm0hF20CRgLl7rHLs6hUsks7wbSK10dRnx943vyOoBj2OHTL3A0Be6REg==
From: "Frieder Schrempf" <frieder.schrempf@kontron.de>
To: Steve Sakoman <sakoman@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [dunfell][PATCH][RESEND] kernel-fitimage: Don't use unit addresses on FIT
Date: Tue,  1 Jun 2021 11:35:37 +0200
Message-Id: <20210601093536.34421-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable

From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

Das U-Boot 2021.4-rc1 has the following commit:

    commit 3f04db891a353f4b127ed57279279f851c6b4917
    Author: Simon Glass <sjg@chromium.org>
    Date:   Mon Feb 15 17:08:12 2021 -0700

        image: Check for unit addresses in FITs

        Using unit addresses in a FIT is a security risk. Add a check for
        this and disallow it.

        CVE-2021-27138

Adjust the kernel-fitimage.bbclass accordingly to not use unit
addresses. This changte is required before we can bump U-Boot to 2021.4.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Backport for Dunfell]
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Resending with ML alias set up for sender address.
---
 meta/classes/kernel-fitimage.bbclass | 32 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
index 72b05ff8d1..d91128de9c 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -124,7 +124,7 @@ fitimage_emit_section_kernel() {
 	fi
=20
 	cat << EOF >> ${1}
-                kernel@${2} {
+                kernel-${2} {
                         description =3D "Linux kernel";
                         data =3D /incbin/("${3}");
                         type =3D "kernel";
@@ -133,7 +133,7 @@ fitimage_emit_section_kernel() {
                         compression =3D "${4}";
                         load =3D <${UBOOT_LOADADDRESS}>;
                         entry =3D <${ENTRYPOINT}>;
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${kernel_csum}";
                         };
                 };
@@ -160,14 +160,14 @@ fitimage_emit_section_dtb() {
 		dtb_loadline=3D"load =3D <${UBOOT_DTB_LOADADDRESS}>;"
 	fi
 	cat << EOF >> ${1}
-                fdt@${2} {
+                fdt-${2} {
                         description =3D "Flattened Device Tree blob";
                         data =3D /incbin/("${3}");
                         type =3D "flat_dt";
                         arch =3D "${UBOOT_ARCH}";
                         compression =3D "none";
                         ${dtb_loadline}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${dtb_csum}";
                         };
                 };
@@ -185,7 +185,7 @@ fitimage_emit_section_setup() {
 	setup_csum=3D"${FIT_HASH_ALG}"
=20
 	cat << EOF >> ${1}
-                setup@${2} {
+                setup-${2} {
                         description =3D "Linux setup.bin";
                         data =3D /incbin/("${3}");
                         type =3D "x86_setup";
@@ -194,7 +194,7 @@ fitimage_emit_section_setup() {
                         compression =3D "none";
                         load =3D <0x00090000>;
                         entry =3D <0x00090000>;
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${setup_csum}";
                         };
                 };
@@ -221,7 +221,7 @@ fitimage_emit_section_ramdisk() {
 	fi
=20
 	cat << EOF >> ${1}
-                ramdisk@${2} {
+                ramdisk-${2} {
                         description =3D "${INITRAMFS_IMAGE}";
                         data =3D /incbin/("${3}");
                         type =3D "ramdisk";
@@ -230,7 +230,7 @@ fitimage_emit_section_ramdisk() {
                         compression =3D "none";
                         ${ramdisk_loadline}
                         ${ramdisk_entryline}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${ramdisk_csum}";
                         };
                 };
@@ -266,39 +266,39 @@ fitimage_emit_section_config() {
 	if [ -n "${2}" ]; then
 		conf_desc=3D"Linux kernel"
 		sep=3D", "
-		kernel_line=3D"kernel =3D \"kernel@${2}\";"
+		kernel_line=3D"kernel =3D \"kernel-${2}\";"
 	fi
=20
 	if [ -n "${3}" ]; then
 		conf_desc=3D"${conf_desc}${sep}FDT blob"
 		sep=3D", "
-		fdt_line=3D"fdt =3D \"fdt@${3}\";"
+		fdt_line=3D"fdt =3D \"fdt-${3}\";"
 	fi
=20
 	if [ -n "${4}" ]; then
 		conf_desc=3D"${conf_desc}${sep}ramdisk"
 		sep=3D", "
-		ramdisk_line=3D"ramdisk =3D \"ramdisk@${4}\";"
+		ramdisk_line=3D"ramdisk =3D \"ramdisk-${4}\";"
 	fi
=20
 	if [ -n "${5}" ]; then
 		conf_desc=3D"${conf_desc}${sep}setup"
-		setup_line=3D"setup =3D \"setup@${5}\";"
+		setup_line=3D"setup =3D \"setup-${5}\";"
 	fi
=20
 	if [ "${6}" =3D "1" ]; then
-		default_line=3D"default =3D \"conf@${3}\";"
+		default_line=3D"default =3D \"conf-${3}\";"
 	fi
=20
 	cat << EOF >> ${1}
                 ${default_line}
-                conf@${3} {
+                conf-${3} {
 			description =3D "${6} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
 			${setup_line}
-                        hash@1 {
+                        hash-1 {
                                 algo =3D "${conf_csum}";
                         };
 EOF
@@ -330,7 +330,7 @@ EOF
 		sign_line=3D"${sign_line};"
=20
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo =3D "${conf_csum},${conf_sign_algo}=
";
                                 key-name-hint =3D "${conf_sign_keyname}"=
;
 				${sign_line}
--=20
2.25.1

