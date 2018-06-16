Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D9908753A5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 07:18:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e16-v6so6629057wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5adRZoe/1cepR4buJWA18Xe4WUsaRRFwvmpZHmdHXWE=;
	b=Ex+AJdewPNXHg5zMwyr06aQRjzrMUkU0dddz6hhiR12qg8WtDfT7+pmgZqMZy+VNKW
	59dZrMgYmvC6Yd2yFVAOT8iuPCLn7nSX+e5apIPQAZmcvZ2pRKoiJudTQVINJ7QPZvGx
	WzhWH5/inr/+gGFDReks3BuEAxnOI2LxakmYb/CyuDquexxPk5oNCN+mXwiq9KqdfcdZ
	5ocDE5Acr6RmrGoxwAo6UrmO9KxjddfnimL39IkNVdr3CPCXVxY2e4D0nJrxkf/egcPD
	smWIcW/8+veJ3ZkK7NyTRZ2FyYCwt/LLmPgiEo8Z8rmUPgBBnn03qyXWSTwkJXFLKA7N
	2eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5adRZoe/1cepR4buJWA18Xe4WUsaRRFwvmpZHmdHXWE=;
	b=fV+GisYlZTVrkE9hTDCU5TJ7eOMLK+0aIt+uYiRZXlg8IqXd+kgbfZOwf045Fd9hz6
	g+HFwdjPvEvqTWBCYZtBPsGsqEKsiRWNOqkghgnYpOlluUKgBaDFHb8PvbAvuVInZw1L
	D3iSqLpWOHZscFHQMZG4h1mxljaCHvWOKYU66EYGRcFXErVBHtNAf7cvbi/T1tNsDwKN
	w/kLgauNgPtexJj5iDJtkRbD9zZofPpxE49wk36sC/UT1EkAsKaM8hm9PC4cSJsH3muZ
	6jpxOKungUxXRjxtV3cGg1FDFh8NfjBU5N+Nf0nmlwuo1+mVRIhrTFZ/cFWoSNqENHb+
	pNfA==
X-Gm-Message-State: APt69E26dNQJRRM3Z4Kwyx/8BSPHZxFsSHrVrbdxF0NPUv4Krf6ZXxTO
	PouoRAswOFhT1InGGRd8txrtGpQk
X-Google-Smtp-Source: ADUXVKJT6U1alemdTh8mFUidakEafvnoNqBQHrpwMoqbsK3GyMWBxVjIdF9BRpGs72QfRlwYaPW/7g==
X-Received: by 2002:a1c:3705:: with SMTP id e5-v6mr3223009wma.20.1529133497329;
	Sat, 16 Jun 2018 00:18:17 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	j131-v6sm5450761wmg.24.2018.06.16.00.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jun 2018 00:18:16 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 07:17:04 +0000
Message-Id: <1529133425-9806-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] kernel-fitimage: Allow setting of DTB/DTBO relocation address
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
X-List-Received-Date: Sat, 16 Jun 2018 07:18:17 -0000

Introduce UBOOT_DTB_LOADADDRESS and UBOOT_DTBO_LOADADDRESS so that you
can set where U-Boot loads full and overlay DTBs. This is required when
using bootm's overlay support to construct the final DTB.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
This commit conflicts with this patch:

https://patchwork.openembedded.org/series/12589/

Either that needs applying first and this needs rebasing on top of it, or
use this one in its place.

 meta/classes/kernel-fitimage.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 50a91e1..f3c2ff0 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -135,6 +135,15 @@ fitimage_emit_section_dtb() {
 
 	dtb_csum="sha1"
 
+	dtb_loadline=""
+	dtb_ext=${DTB##*.}
+	if [ "${dtb_ext}" = "dtbo" ]; then
+		if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
+			dtb_loadline="load = <${UBOOT_DTBO_LOADADDRESS}>;"
+		fi
+	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
+		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
+	fi
 	cat << EOF >> ${1}
                 fdt@${2} {
                         description = "Flattened Device Tree blob";
@@ -142,6 +151,7 @@ fitimage_emit_section_dtb() {
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        ${dtb_loadline}
                         hash@1 {
                                 algo = "${dtb_csum}";
                         };
-- 
2.7.4


