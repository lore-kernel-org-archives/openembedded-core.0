Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 98CBD7520E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 09:28:58 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v13-v6so12047419wrp.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 02:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jlw9jB3deR3i4RLU27Nmn1qAcUwxFq+pbGTWOvw8CV4=;
	b=aBhrhIN6ebHwHsF+Za26R9LnCASji6+rX0yxiID+xWYlEXqkQvp2issogLqlGr68p+
	Sytr7+R+PqHAbG72Vg0xlktGcCf7B4vJPbUhvzYzdAcLxKIFHSuou5Ap5uceyG7cm/c1
	d7sg3/YgSVvJwRQxjhvEIzxiawjoujAfJbmJYEXWiynzDK9to2BHazmlOKGea2IO42vJ
	b61obYs9D/C3OBljmcaOgwLu1Dg7B0c3XUUVhFfd5JBj648mr3P2/TULF/6TloGoI9yC
	oi3lw9sPpSTJcZmCb7Pf7sevxwBQNpGL2xAuvkZPDx5EahOmAw8wID1spiimAs1Cgqv+
	8V1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Jlw9jB3deR3i4RLU27Nmn1qAcUwxFq+pbGTWOvw8CV4=;
	b=bWlJZc0XgUbZLrf+CaeKl4qpnqIYj1BoCZhk7ymaWU5rdrNrFxkSTNCvT4TEg75Uhc
	S+98hoDsD35RbWN+/dDiHymeYUhU4cY4De6os/QqFIqQmhkOEpkPaIQrbmnrZDUBM+rr
	p4lb47qLxZWWVT+Nluz4U8L8vPtO+OTMfkYmIfj8t4e1r4OV1DbG3ZBd01a0jwtlttIg
	ch1IHiyJqXkoM4vjOWY4/ZMe9ZMJhqVKjljLxdRxX8s0W3qolQx24nVmyzox4ME7Txit
	OrWT7/MDqpxcmyMuSjvCCktRwFMc2BdxFoF9+GCTJKgL/gyox0TTCxoAN+gNGE8jd/Yd
	G2fA==
X-Gm-Message-State: APt69E0/SzUR0RaH93Ym0RcoC5fmtFztrzpK3acE+qDIOlU6AxLmYnwh
	8XQ4yGIWI1PkrbrAioey4XpqJhc6
X-Google-Smtp-Source: ADUXVKLEmoXoZGoYeCtsyYeMsq+WWFPQgxVWiJzo9JHOq0aKCWE3BPrZgxY/7inZEFK0Qx6stqF3wQ==
X-Received: by 2002:adf:a925:: with SMTP id
	u34-v6mr4703407wrc.248.1529141338992; 
	Sat, 16 Jun 2018 02:28:58 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm19869509wrf.30.2018.06.16.02.28.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jun 2018 02:28:58 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 09:28:53 +0000
Message-Id: <1529141333-17754-2-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529141333-17754-1-git-send-email-alex.kiernan@gmail.com>
References: <1529141333-17754-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH v2 2/2] kernel-fitimage: Add DTBO support for configurations
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
X-List-Received-Date: Sat, 16 Jun 2018 09:28:58 -0000

When generating overlay DTB configuration sections, U-Boot doesn't want
the kernel specified again as we already have that in our base DTB. Add
support for this to allow bootm to process overlay configuration sections.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Use the right branch which ensures that signatures across DTB overlays
  don't fail because there's no kernel in their configuration

 meta/classes/kernel-fitimage.bbclass | 42 +++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f3c2ff0..f84be44 100644
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
2.7.4


