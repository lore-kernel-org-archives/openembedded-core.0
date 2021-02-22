Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.158.5])
 by mx.groups.io with SMTP id smtpd.web12.1567.1614021450545481115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 11:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ibm.com header.s=pp1 header.b=rGi5RJ9x;
 spf=none, err=permanent DNS error (domain: linux.vnet.ibm.com, ip: 148.163.158.5, mailfrom: klaus@linux.vnet.ibm.com)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11MJEaAA094335
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 14:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=V2d4ip9D/2n+FWokX3mczlw1tr9epZqmXcdSM/sOwrs=;
 b=rGi5RJ9xE8Jt+SnEnLF+TZBsPg0oEiGUqXeTHu5qfiIn5aym5PAofMsuSdxgUemychlE
 idGrVYJthtdPrccIR1u2/jVgQi4ZUaiAN58zMIlQmFBFKnDMNCZ0MG6Qy4adRNmBagK+
 7aeyN2rjHhf/vqk+vNP2F2Hw7CaKZ5SYFUHEMrhjseZThc6eQf5Pf8tXzTgNFkqPkD4J
 M06FcORm9V3xA5ybcrJKuLRl7s72Y58kWutjU+hTzAhb3igguM1gqFsFqKOJVb8PV0yH
 b/1Zytgso9ArgHb8zKlYdVb5obt+kuz4PiWx0SyEiIzPKw7VcNOOihDwpCmgXT1qGDUu ow== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com with ESMTP id 36vjkmr539-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 14:17:28 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MIMut0014183
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 18:38:39 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02wdc.us.ibm.com with ESMTP id 36tt28rm0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 18:38:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11MIcdZv35389778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Feb 2021 18:38:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0EBD7805C;
	Mon, 22 Feb 2021 18:38:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20F9E7805E;
	Mon, 22 Feb 2021 18:38:38 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.139.253])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 22 Feb 2021 18:38:37 +0000 (GMT)
From: "Klaus Heinrich Kiwi" <klaus@linux.vnet.ibm.com>
To: openembedded-core@lists.openembedded.org
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Subject: [PATCH v2] kernel-fitimage: Don't use unit addresses on FIT
Date: Mon, 22 Feb 2021 15:38:19 -0300
Message-Id: <20210222183818.22615-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <99b61172c516c71dadbc7342da4e20a064299110.camel@linuxfoundation.org>
References: <99b61172c516c71dadbc7342da4e20a064299110.camel@linuxfoundation.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-22_06:2021-02-22,2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220168
Content-Transfer-Encoding: 8bit

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
---

Notes:
    V2 Notes:
      - Adjusted testcases
        (reported by Richard Purdie <richard.purdie@linuxfoundation.org>)

 meta/classes/kernel-fitimage.bbclass     | 40 ++++++++++++------------
 meta/lib/oeqa/selftest/cases/fitimage.py | 36 ++++++++++-----------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2414870817..f5082c93df 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -161,7 +161,7 @@ fitimage_emit_section_kernel() {
 	fi
 
 	cat << EOF >> ${1}
-                kernel@${2} {
+                kernel-${2} {
                         description = "Linux kernel";
                         data = /incbin/("${3}");
                         type = "kernel";
@@ -170,7 +170,7 @@ fitimage_emit_section_kernel() {
                         compression = "${4}";
                         load = <${UBOOT_LOADADDRESS}>;
                         entry = <${ENTRYPOINT}>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${kernel_csum}";
                         };
                 };
@@ -179,7 +179,7 @@ EOF
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${kernel_sign_keyname}" ] ; then
 		sed -i '$ d' ${1}
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${kernel_csum},${kernel_sign_algo}";
                                 key-name-hint = "${kernel_sign_keyname}";
                         };
@@ -210,14 +210,14 @@ fitimage_emit_section_dtb() {
 		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
 	fi
 	cat << EOF >> ${1}
-                fdt@${2} {
+                fdt-${2} {
                         description = "Flattened Device Tree blob";
                         data = /incbin/("${3}");
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
                         ${dtb_loadline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${dtb_csum}";
                         };
                 };
@@ -226,7 +226,7 @@ EOF
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${dtb_sign_keyname}" ] ; then
 		sed -i '$ d' ${1}
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${dtb_csum},${dtb_sign_algo}";
                                 key-name-hint = "${dtb_sign_keyname}";
                         };
@@ -283,7 +283,7 @@ fitimage_emit_section_setup() {
 	setup_csum="${FIT_HASH_ALG}"
 
 	cat << EOF >> ${1}
-                setup@${2} {
+                setup-${2} {
                         description = "Linux setup.bin";
                         data = /incbin/("${3}");
                         type = "x86_setup";
@@ -292,7 +292,7 @@ fitimage_emit_section_setup() {
                         compression = "none";
                         load = <0x00090000>;
                         entry = <0x00090000>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${setup_csum}";
                         };
                 };
@@ -321,7 +321,7 @@ fitimage_emit_section_ramdisk() {
 	fi
 
 	cat << EOF >> ${1}
-                ramdisk@${2} {
+                ramdisk-${2} {
                         description = "${INITRAMFS_IMAGE}";
                         data = /incbin/("${3}");
                         type = "ramdisk";
@@ -330,7 +330,7 @@ fitimage_emit_section_ramdisk() {
                         compression = "none";
                         ${ramdisk_loadline}
                         ${ramdisk_entryline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${ramdisk_csum}";
                         };
                 };
@@ -339,7 +339,7 @@ EOF
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${ramdisk_sign_keyname}" ] ; then
 		sed -i '$ d' ${1}
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${ramdisk_csum},${ramdisk_sign_algo}";
                                 key-name-hint = "${ramdisk_sign_keyname}";
                         };
@@ -377,7 +377,7 @@ fitimage_emit_section_config() {
 	# Test if we have any DTBs at all
 	sep=""
 	conf_desc=""
-	conf_node="conf@"
+	conf_node="conf-"
 	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
@@ -396,19 +396,19 @@ fitimage_emit_section_config() {
 	if [ -n "${kernel_id}" ]; then
 		conf_desc="Linux kernel"
 		sep=", "
-		kernel_line="kernel = \"kernel@${kernel_id}\";"
+		kernel_line="kernel = \"kernel-${kernel_id}\";"
 	fi
 
 	if [ -n "${dtb_image}" ]; then
 		conf_desc="${conf_desc}${sep}FDT blob"
 		sep=", "
-		fdt_line="fdt = \"fdt@${dtb_image}\";"
+		fdt_line="fdt = \"fdt-${dtb_image}\";"
 	fi
 
 	if [ -n "${ramdisk_id}" ]; then
 		conf_desc="${conf_desc}${sep}ramdisk"
 		sep=", "
-		ramdisk_line="ramdisk = \"ramdisk@${ramdisk_id}\";"
+		ramdisk_line="ramdisk = \"ramdisk-${ramdisk_id}\";"
 	fi
 
 	if [ -n "${bootscr_id}" ]; then
@@ -419,16 +419,16 @@ fitimage_emit_section_config() {
 
 	if [ -n "${config_id}" ]; then
 		conf_desc="${conf_desc}${sep}setup"
-		setup_line="setup = \"setup@${config_id}\";"
+		setup_line="setup = \"setup-${config_id}\";"
 	fi
 
 	if [ "${default_flag}" = "1" ]; then
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "${dtb_image}" ]; then
-			default_line="default = \"conf@${dtb_image}\";"
+			default_line="default = \"conf-${dtb_image}\";"
 		else
-			default_line="default = \"conf@${kernel_id}\";"
+			default_line="default = \"conf-${kernel_id}\";"
 		fi
 	fi
 
@@ -441,7 +441,7 @@ fitimage_emit_section_config() {
 			${ramdisk_line}
 			${bootscr_line}
 			${setup_line}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${conf_csum}";
                         };
 EOF
@@ -478,7 +478,7 @@ EOF
 		sign_line="${sign_line};"
 
 		cat << EOF >> ${its_file}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${conf_csum},${conf_sign_algo}";
                                 key-name-hint = "${conf_sign_keyname}";
 				${sign_line}
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 0958036a6f..02692de822 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -69,9 +69,9 @@ FIT_DESC = "A model description"
             'type = "ramdisk";',
             'load = <0x88000000>;',
             'entry = <0x88000000>;',
-            'default = "conf@1";',
-            'kernel = "kernel@1";',
-            'ramdisk = "ramdisk@1";'
+            'default = "conf-1";',
+            'kernel = "kernel-1";',
+            'ramdisk = "ramdisk-1";'
             ]
 
         with open(fitimage_its_path) as its_file:
@@ -137,12 +137,12 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
             "%s FIT image doesn't exist" % (fitimage_path))
 
         req_itspaths = [
-            ['/', 'images', 'kernel@1'],
-            ['/', 'images', 'kernel@1', 'signature@1'],
-            ['/', 'images', 'fdt@am335x-boneblack.dtb'],
-            ['/', 'images', 'fdt@am335x-boneblack.dtb', 'signature@1'],
-            ['/', 'configurations', 'conf@am335x-boneblack.dtb'],
-            ['/', 'configurations', 'conf@am335x-boneblack.dtb', 'signature@1'],
+            ['/', 'images', 'kernel-1'],
+            ['/', 'images', 'kernel-1', 'signature-1'],
+            ['/', 'images', 'fdt-am335x-boneblack.dtb'],
+            ['/', 'images', 'fdt-am335x-boneblack.dtb', 'signature-1'],
+            ['/', 'configurations', 'conf-am335x-boneblack.dtb'],
+            ['/', 'configurations', 'conf-am335x-boneblack.dtb', 'signature-1'],
         ]
 
         itspath = []
@@ -158,7 +158,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
                 elif line.endswith('{'):
                     itspath.append(line[:-1].strip())
                     itspaths.append(itspath[:])
-                elif itspath and itspath[-1] == 'signature@1':
+                elif itspath and itspath[-1] == 'signature-1':
                     itsdotpath = '.'.join(itspath)
                     if not itsdotpath in sigs:
                         sigs[itsdotpath] = {}
@@ -182,7 +182,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         }
 
         for itspath, values in sigs.items():
-            if 'conf@' in itspath:
+            if 'conf-' in itspath:
                 reqsigvalues = reqsigvalues_config
             else:
                 reqsigvalues = reqsigvalues_image
@@ -210,9 +210,9 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
                     signed_sections[in_signed] = {}
                 key, value = line.split(':', 1)
                 signed_sections[in_signed][key.strip()] = value.strip()
-        self.assertIn('kernel@1', signed_sections)
-        self.assertIn('fdt@am335x-boneblack.dtb', signed_sections)
-        self.assertIn('conf@am335x-boneblack.dtb', signed_sections)
+        self.assertIn('kernel-1', signed_sections)
+        self.assertIn('fdt-am335x-boneblack.dtb', signed_sections)
+        self.assertIn('conf-am335x-boneblack.dtb', signed_sections)
         for signed_section, values in signed_sections.items():
             value = values.get('Sign algo', None)
             self.assertEqual(value, 'sha256,rsa2048:oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
@@ -298,7 +298,7 @@ FIT_HASH_ALG = "sha256"
         its_lines = [line.strip() for line in its_file.readlines()]
 
         exp_node_lines = [
-            'kernel@1 {',
+            'kernel-1 {',
             'description = "Linux kernel";',
             'data = /incbin/("' + initramfs_bundle + '");',
             'type = "kernel";',
@@ -307,7 +307,7 @@ FIT_HASH_ALG = "sha256"
             'compression = "none";',
             'load = <' + kernel_load + '>;',
             'entry = <' + kernel_entry + '>;',
-            'hash@1 {',
+            'hash-1 {',
             'algo = "' + fit_hash_alg +'";',
             '};',
             '};'
@@ -327,7 +327,7 @@ FIT_HASH_ALG = "sha256"
             else:
                 self.assertTrue(test_passed == True,"kernel node does not match expectation")
 
-        rx_configs = re.compile("^conf@.*")
+        rx_configs = re.compile("^conf-.*")
         its_configs = list(filter(rx_configs.match, its_lines))
 
         for cfg_str in its_configs:
@@ -348,7 +348,7 @@ FIT_HASH_ALG = "sha256"
             else:
                 print("kernel keyword found in the description line")
 
-            if 'kernel = "kernel@1";' not in node:
+            if 'kernel = "kernel-1";' not in node:
                 self.assertTrue(test_passed == True,"kernel line not found")
                 break
             else:
-- 
2.25.1

