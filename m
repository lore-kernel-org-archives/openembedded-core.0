Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6307D753BB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 07:18:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x6-v6so6600101wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 00:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0K8RB2ijDbxEWVgNxX1eJ4b5Q8BfEVODXVtF1D97FGo=;
	b=G6W6L93oXLHQcQXz+N4uUNnkC7OTI6p0eU8KXUYbjzEekJ3emfiNgJCEsye5+SYvPV
	1yi0J4T+wZeudwSikVTg81m6hnJ2Mb8SQNjufzen/lmJtq8VmV4s3FhMt51Rd82po/jc
	npvYwuDztPDAG7B0ZSQQuekKQrO5OMGoMzpkcAT4XbCsY/esZgBB7FSomZPW14wUPu1R
	wrF/iQbDfUJNs9d5SxVxnxxRGu4fhRd87GTVYvgXDO2X8EUkuGTv5ESnlA0SWSwDbTEm
	M39heE9AfFqEBp8hT2ktXy/fJwdKCXv7tON2x5rK8yeOzbJG1NKlxYomYQ6Ik3U1qJyp
	rqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0K8RB2ijDbxEWVgNxX1eJ4b5Q8BfEVODXVtF1D97FGo=;
	b=KQlbWIxfiAt+FMnPd92l6xp9RG5DFThqZf1RWRonUQpODc/rK5ccxMrjpBkzX5EiTZ
	xJs9cE4Wbm8qrfzfamTlh/G0Gahp2rQhiDzlLrSJiP3WuH6PgHoY5BK26REwQe/5Wznh
	ZD1DwA2yTNeqCUzsmNpyQ/Sm4/xLoOi7asH/bzpszulCQvyfO+e+fFCrhhRC0p1u3c3e
	kZ9XCTIJnT5aEwk9S0YpS7k3jDn866knjHQ/7HzcbRnUEkDfJcPNCYSgtREHqy86IU1I
	HIUbIRGMzI0ZxXDIkeyiIT+tDcfSIrOGHhJrYTYQ59pIuCpSeoOwiRbSj7+pb/dtKYYT
	pkYQ==
X-Gm-Message-State: APt69E3EfY3me9WpNBTkrywATTLe7g9SryswZrBXRJDsUmvvlhzCPMIC
	hxOjQWHu6A3pFUrGobmks0ESf18I
X-Google-Smtp-Source: ADUXVKLWQXWs1kLdYtzkCoB1Jm7D0j4+v1hlbtxxrEqVyRRZ50fzwTQUDYNHSweLJ60bWdK8id/CAQ==
X-Received: by 2002:a1c:3c4:: with SMTP id 187-v6mr3039692wmd.96.1529133499930;
	Sat, 16 Jun 2018 00:18:19 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	j131-v6sm5450761wmg.24.2018.06.16.00.18.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jun 2018 00:18:19 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 07:17:05 +0000
Message-Id: <1529133425-9806-2-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529133425-9806-1-git-send-email-alex.kiernan@gmail.com>
References: <1529133425-9806-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH 2/2] kernel-fitimage: Add DTBO support for configurations
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
X-List-Received-Date: Sat, 16 Jun 2018 07:18:19 -0000

When generating overlay DTB configuration sections, U-Boot doesn't want
the kernel specified again as we already have that in our base DTB. Add
support for this to allow bootm to process overlay configuration sections.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel-fitimage.bbclass | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f3c2ff0..c2e227e 100644
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
 
@@ -413,7 +422,12 @@ fitimage_assemble() {
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


