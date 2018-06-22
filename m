Return-Path: <mihai.serban@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 196727546A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 07:07:42 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id d2-v6so5539293wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0ZMGJIXtQnxIRQ375wF1m6miEXGUe2g8zOs0PYM3GGs=;
	b=V+/MsGSa5icfIHFEqqWaolwwPIOmO+5J0GQ2xpvXDsPe6M0tnirypZlMd+8v53oxbb
	bMHPugJ5VOW8N0fHRCQndtmMpAFnrRXx8dUP8ZvyJGy3FA9sz+AUcBQMEJSa8147AyGx
	Lb8fXnjk7/vDKXpb7F7hqzFg6LElevfLpHYdE4ceypjZYiw6OskGsT/MwdBw+0kU54FW
	OKc/c8oOq9v3n681E2OwY3XLZB+P2h90JqPJmU6nHNtpUiRh/76ViEViqO2ZIsOm9xxs
	L/55onbYpJODQf/quhjFvnnrxoCWVmZPOJANnKlz8xWvKo8Q4c7lXEAJSocHth8dRwZ0
	fBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0ZMGJIXtQnxIRQ375wF1m6miEXGUe2g8zOs0PYM3GGs=;
	b=WLGM+VccD5xsVDlzjr5W17qBArb5Kfnk25aNVT/JQFKrMfpmGia7Qqe+UhIlP6o4no
	b4A/KPXrnW3+kN8mozcPqH2PupAKqfCTlle9Ys9CoNCA64n8eZhapmCr/sSaKBuQwB72
	0zsWDVrjI4zf06yOki0xSoj4JoNNTuuinR7mQXqbaqZScm2+mgh8o/f53YmKp8QHABz8
	5yURb6R27td4NZtZ7hFcE52ilV0zYbxLcAdOToCRegXg64Qn8mxvHm9TQc2Gct0/TG84
	vks8V9RDvWeA19P7D9/zwN9hF/186ayQ3AGkENUBQdZBOZDESon3lR7vlUhD0fZQLn2g
	Yqmw==
X-Gm-Message-State: APt69E2ZgFTiK8om9x2JYZIuyqdHwbqVPrv6u62eYWeHrCBCQzcBmyU0
	plC9Q5l6C/lCU9SC2QXxlQOiqN4m
X-Google-Smtp-Source: ADUXVKJN01ToaPfKzClQxTL1JLhn7Vw42ULUeS0/VepAih7c3LS4Ja13F073qm5gWnB6SFM5lJ14DQ==
X-Received: by 2002:adf:9d21:: with SMTP id k33-v6mr495107wre.29.1529651263390;
	Fri, 22 Jun 2018 00:07:43 -0700 (PDT)
Received: from mserban-linux.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	p3-v6sm7556975wrn.31.2018.06.22.00.07.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 00:07:42 -0700 (PDT)
From: Mihai Serban <mihai.serban@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 10:07:12 +0300
Message-Id: <20180622070712.24005-1-mihai.serban@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [rocko][PATCH] kernel-fitimage: Allow setting of DTB/DTBO relocation address
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
X-List-Received-Date: Fri, 22 Jun 2018 07:07:43 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

Introduce UBOOT_DTB_LOADADDRESS and UBOOT_DTBO_LOADADDRESS so that you
can set where U-Boot loads full and overlay DTBs. This is required when
using bootm's overlay support to construct the final DTB.

(From OE-Core rev: 05d2230db1d7379494814407fc0d79d7e755d89e)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-fitimage.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 50a91e199069..f3c2ff0a3004 100644
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
2.17.1


