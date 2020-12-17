Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2500.1608173537017137393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=mdldB0iL;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 7E12120B7185; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7E12120B7185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=AAg5ZId+rG06nN0tXqp5JWdAXkKB9SMDnifVk7Xbs2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdldB0iL2qYTskuiAPl6pRord8ejj1xqC0i3yLbIcrE5sLfsgeHAd3N2dgDdtf0a2
	 Rjtbt/rHDo7zhgidUHQvfY/89PA9vPOSKwG9JxdaZUd1M+2m6gBel0QAf3dd2nvlsK
	 rcizO/ZysBBvWbGaM8b2/TybvEvz+DEB31fAKqeI=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 2/8] classes/kernel-fitimage: make fitimage_emit_section_config more readable
Date: Wed, 16 Dec 2020 18:51:36 -0800
Message-Id: <b04aaf22ed12c9a61ce6323446f332c2fd2386fc.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>

From: Easwar Hariharan <eahariha@microsoft.com>

fitimage_emit_section_config() has a number of arguments, add named
variables to make the function a bit more readable.

Signed-off-by: Easwar Hariharan <eahariha@microsoft.com>
Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/kernel-fitimage.bbclass | 53 ++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f121eee..f3d18e2 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -273,6 +273,13 @@ fitimage_emit_section_config() {
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
 
+	its_file="${1}"
+	kernel_id="${2}"
+	dtb_image="${3}"
+	ramdisk_id="${4}"
+	config_id="${5}"
+	default_flag="${6}"
+
 	# Test if we have any DTBs at all
 	sep=""
 	conf_desc=""
@@ -285,49 +292,49 @@ fitimage_emit_section_config() {
 
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
-	if [ -n "${3}" ]; then
-		conf_node=$conf_node${3}
+	if [ -n "${dtb_image}" ]; then
+		conf_node=$conf_node${dtb_image}
 	else
-		conf_node=$conf_node${2}
+		conf_node=$conf_node${kernel_id}
 	fi
 
-	if [ -n "${2}" ]; then
+	if [ -n "${kernel_id}" ]; then
 		conf_desc="Linux kernel"
 		sep=", "
-		kernel_line="kernel = \"kernel@${2}\";"
+		kernel_line="kernel = \"kernel@${kernel_id}\";"
 	fi
 
-	if [ -n "${3}" ]; then
+	if [ -n "${dtb_image}" ]; then
 		conf_desc="${conf_desc}${sep}FDT blob"
 		sep=", "
-		fdt_line="fdt = \"fdt@${3}\";"
+		fdt_line="fdt = \"fdt@${dtb_image}\";"
 	fi
 
-	if [ -n "${4}" ]; then
+	if [ -n "${ramdisk_id}" ]; then
 		conf_desc="${conf_desc}${sep}ramdisk"
 		sep=", "
-		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
+		ramdisk_line="ramdisk = \"ramdisk@${ramdisk_id}\";"
 	fi
 
-	if [ -n "${5}" ]; then
+	if [ -n "${config_id}" ]; then
 		conf_desc="${conf_desc}${sep}setup"
-		setup_line="setup = \"setup@${5}\";"
+		setup_line="setup = \"setup@${config_id}\";"
 	fi
 
-	if [ "${6}" = "1" ]; then
+	if [ "${default_flag}" = "1" ]; then
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
-		if [ -n "${3}" ]; then
-			default_line="default = \"conf@${3}\";"
+		if [ -n "${dtb_image}" ]; then
+			default_line="default = \"conf@${dtb_image}\";"
 		else
-			default_line="default = \"conf@${2}\";"
+			default_line="default = \"conf@${kernel_id}\";"
 		fi
 	fi
 
-	cat << EOF >> ${1}
+	cat << EOF >> ${its_file}
                 ${default_line}
                 $conf_node {
-			description = "${6} ${conf_desc}";
+			description = "${default_flag} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
@@ -342,28 +349,28 @@ EOF
 		sign_line="sign-images = "
 		sep=""
 
-		if [ -n "${2}" ]; then
+		if [ -n "${kernel_id}" ]; then
 			sign_line="${sign_line}${sep}\"kernel\""
 			sep=", "
 		fi
 
-		if [ -n "${3}" ]; then
+		if [ -n "${dtb_image}" ]; then
 			sign_line="${sign_line}${sep}\"fdt\""
 			sep=", "
 		fi
 
-		if [ -n "${4}" ]; then
+		if [ -n "${ramdisk_id}" ]; then
 			sign_line="${sign_line}${sep}\"ramdisk\""
 			sep=", "
 		fi
 
-		if [ -n "${5}" ]; then
+		if [ -n "${config_id}" ]; then
 			sign_line="${sign_line}${sep}\"setup\""
 		fi
 
 		sign_line="${sign_line};"
 
-		cat << EOF >> ${1}
+		cat << EOF >> ${its_file}
                         signature@1 {
                                 algo = "${conf_csum},${conf_sign_algo}";
                                 key-name-hint = "${conf_sign_keyname}";
@@ -372,7 +379,7 @@ EOF
 EOF
 	fi
 
-	cat << EOF >> ${1}
+	cat << EOF >> ${its_file}
                 };
 EOF
 }
-- 
1.8.3.1

