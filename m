Return-Path: <mihai.serban@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2AED5784DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 07:09:18 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n5-v6so1186849wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 00:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ctgIFVUw2HZ8ufkyrEr0axxnCDNvfDxui/Vz4n0gxJU=;
	b=ZCdkaVkspm1CbjzySAgEoGdjTYQ+8sTxme/Z/cCN13ZfMPEJI00cOHuHlQQIHzA/vP
	zQaWJbtvlAEAztOJQ90yVWPHyqEs0Xi1wyxLaIVJXPV3GumRB+eiDSENTg6khFbke030
	u85JsvMA+CNuEYneI5Iei8J/UmUNsgZ01/34bdnD1YX902Pmc5AjOqJTBF133s+nlOHo
	HPlnMKtYgbukS3bJVGIP9pZV4+D+SndE6KZxIy83b4Muszt8urSHtzlwJYo1rP9GBYyG
	OjNINKx8gbFhe0AB3p6VGUR9I3lgm00y8nnG5Yh/BKejPE/1d5mgfeaF6+jtSZlam4ef
	qfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ctgIFVUw2HZ8ufkyrEr0axxnCDNvfDxui/Vz4n0gxJU=;
	b=gbJ+aRHVHJ7NwAwHLdHQXSoW640Yb93o2O5xCzgqWlyH+7dlcmDrjVzV73Sfehu7nb
	gUvSGNadk2n2SlIWpVOAnnmw2MsnKIY/3NuwGiyA8nnWfY1MQtNs9tP8wOWuIlFDV4yF
	Tx3pugQZzcbRlqBmHQEt/K7YKi63xxq9TTdUg9/W2vYNVrHSzYMB/psg85WgyBDYgEoK
	fFhVZ2BzrZWZGM5a1wo8l/a5F6riH/Hr88EahtqouJ/xnJpkwmhBgJRE/qiBeSo6ekY+
	YAYcQftVsyMZrp7BcQsKJXEfWrv0CzByJFINovnkIsYR2DcJ2SDU/6XD9jlohJo/5bS7
	JgXg==
X-Gm-Message-State: APt69E2AjaDpVIDdthyNUH1wUnPj5bie3e8u6/BYcKrG+2UNqeDoccJS
	ezjMN9Ves8zM2nc4RL3wdX11Y5eg
X-Google-Smtp-Source: ADUXVKItSuYRA660tmj4Di3IdfJ7rkbqQrq4TRyEtlYJVX8HHlgKbdGY/kFakoYqeY2vRpdVdVkRJg==
X-Received: by 2002:a1c:7401:: with SMTP id p1-v6mr676906wmc.14.1529651359566; 
	Fri, 22 Jun 2018 00:09:19 -0700 (PDT)
Received: from mserban-linux.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	j21-v6sm791990wme.36.2018.06.22.00.09.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 00:09:18 -0700 (PDT)
From: Mihai Serban <mihai.serban@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 10:09:08 +0300
Message-Id: <20180622070908.24320-1-mihai.serban@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [rocko][PATCH] kernel-fitimage: Add DTBO support for configurations
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
X-List-Received-Date: Fri, 22 Jun 2018 07:09:19 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

When generating overlay DTB configuration sections, U-Boot doesn't want
the kernel specified again as we already have that in our base DTB. Add
support for this to allow bootm to process overlay configuration sections.

(From OE-Core rev: c0db9776beb4f519079a554a733353c368739dcf)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-fitimage.bbclass | 42 +++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f3c2ff0a3004..f84be44bb9e4 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -258,25 +258,34 @@ fitimage_emit_section_config() {
 	fi
 
 	# Test if we have any DTBs at all
-	conf_desc="Linux kernel"
-	kernel_line="kernel = \"kernel@${2}\";"
+	sep=""
+	conf_desc=""
+	kernel_line=""
 	fdt_line=""
 	ramdisk_line=""
 	setup_line=""
 	default_line=""
 
+	if [ -n "${2}" ]; then
+		conf_desc="Linux kernel"
+		sep=", "
+		kernel_line="kernel = \"kernel@${2}\";"
+	fi
+
 	if [ -n "${3}" ]; then
-		conf_desc="${conf_desc}, FDT blob"
+		conf_desc="${conf_desc}${sep}FDT blob"
+		sep=", "
 		fdt_line="fdt = \"fdt@${3}\";"
 	fi
 
 	if [ -n "${4}" ]; then
-		conf_desc="${conf_desc}, ramdisk"
+		conf_desc="${conf_desc}${sep}ramdisk"
+		sep=", "
 		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
 	fi
 
 	if [ -n "${5}" ]; then
-		conf_desc="${conf_desc}, setup"
+		conf_desc="${conf_desc}${sep}setup"
 		setup_line="setup = \"setup@${5}\";"
 	fi
 
@@ -299,18 +308,26 @@ EOF
 
 	if [ ! -z "${conf_sign_keyname}" ] ; then
 
-		sign_line="sign-images = \"kernel\""
+		sign_line="sign-images = "
+		sep=""
+
+		if [ -n "${2}" ]; then
+			sign_line="${sign_line}${sep}\"kernel\""
+			sep=", "
+		fi
 
 		if [ -n "${3}" ]; then
-			sign_line="${sign_line}, \"fdt\""
+			sign_line="${sign_line}${sep}\"fdt\""
+			sep=", "
 		fi
 
 		if [ -n "${4}" ]; then
-			sign_line="${sign_line}, \"ramdisk\""
+			sign_line="${sign_line}${sep}\"ramdisk\""
+			sep=", "
 		fi
 
 		if [ -n "${5}" ]; then
-			sign_line="${sign_line}, \"setup\""
+			sign_line="${sign_line}${sep}\"setup\""
 		fi
 
 		sign_line="${sign_line};"
@@ -413,7 +430,12 @@ fitimage_assemble() {
 	if [ -n "${DTBS}" ]; then
 		i=1
 		for DTB in ${DTBS}; do
-			fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
+			dtb_ext=${DTB##*.}
+			if [ "${dtb_ext}" = "dtbo" ]; then
+				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "`expr ${i} = ${dtbcount}`"
+			else
+				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
+			fi
 			i=`expr ${i} + 1`
 		done
 	fi
-- 
2.17.1


