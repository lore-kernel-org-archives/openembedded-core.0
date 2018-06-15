Return-Path: <mihai.serban@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2D44474B0D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 16:18:52 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id d8-v6so10490500wro.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=55Sf6MRot3gt38C4VwwcCjSBp8FOBThz8IQU6N2CPCQ=;
	b=uvkl1dF1FjlBgCItL4pxMOuKk/qswgljvVI3Kumzr1ifNOLKpg7saM3boB3ijaT9RM
	cJPz2sJRsfVpLOKn/DUWUHZzTYSdn/8GkhF0PChhSWoOStn1tZuwaT3QfHwmaYUNT530
	Pwn2lCItFdxdNam7gDyRhjtDH8IfbPKWCh5qR1WDKkOF0FCjKknzbDX7+mRDPXZ86ni+
	zEeDhA9qr5R5EW3433EPJH5LQ9Qw5TWOzS3TRhrbdYr5XbSpFphkOKqNImZ1Q9m5TLck
	xXxKULW+yGgt7byhWxVs9LPazWyH/USy4vHYfeXHTR3e8BE0QKBHRub8OZqRliqLdsLX
	GAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=55Sf6MRot3gt38C4VwwcCjSBp8FOBThz8IQU6N2CPCQ=;
	b=gV02bMosXw9TOIqoXOMY/esSBRD3HfZvfmCCHowv3NA6apnVxgIAuCv25vB6Q5SIBi
	wswHpfVi7BtMoqRDbaYb84LGHt1chNzEYyLn1ft+42vlzOV8g08vmy5B98EsZpa0Y3Tt
	zbgdBrNY7VENkZmrYCB8+bMhJrailg55gtIFA63MfSgiylKa7qhnwhZ9HcHQ/uLzFBOv
	j7yeyfFK8D/TFRVbv4i5U3NkRD+ZiAEd/cwyWBn8ihrIu8BsUkMoDwv/HcLZLKUdGBZp
	rGbOi78J1mulbmJcRoNp/ucaGLbmz8ICzv4krd1csPKHN1j4aQ2/2rEIHkLmy22lE9Oy
	vbfA==
X-Gm-Message-State: APt69E3Sg3XPE4R4hnNGbKZbcWV77nxMBhbjjfRXBhWi5KFrG5CHCIvU
	MpPbXXzSioNwG2DAvtD/kpzy2Qpp
X-Google-Smtp-Source: ADUXVKLFU71n9CTc2mGr2hcMFf0U1guuEboOUQvkNuoM5nWoAp8cxGo8o5Slj/CKj6wKlSuTKIDR6w==
X-Received: by 2002:adf:a9c1:: with SMTP id
	b59-v6mr2178257wrd.48.1529079532530; 
	Fri, 15 Jun 2018 09:18:52 -0700 (PDT)
Received: from mserban-linux.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	m58-v6sm15612728wrf.61.2018.06.15.09.18.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 09:18:51 -0700 (PDT)
From: Mihai Serban <mihai.serban@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 19:18:18 +0300
Message-Id: <20180615161818.831-1-mihai.serban@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kernel-fitimage: Allow DTB file relocation at boot time
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
X-List-Received-Date: Fri, 15 Jun 2018 16:18:52 -0000

Use UBOOT_DTB_LOADADDRESS and UBOOT_DTB_ENTRYPOINT variables to instruct
U-Boot where to place the selected DTB file when booting the system.
Without these settings U-Boot uses the relative offset where DTB resides
inside the loading address of the FIT image.

Signed-off-by: Mihai Serban <mihai.serban@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 50a91e199069..981d11f19f8d 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -134,6 +134,15 @@ EOF
 fitimage_emit_section_dtb() {
 
 	dtb_csum="sha1"
+	dtb_loadline=""
+	dtb_entryline=""
+
+	if [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
+		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
+	fi
+	if [ -n "${UBOOT_DTB_ENTRYPOINT}" ]; then
+		dtb_entryline="entry = <${UBOOT_DTB_ENTRYPOINT}>;"
+	fi
 
 	cat << EOF >> ${1}
                 fdt@${2} {
@@ -142,6 +151,8 @@ fitimage_emit_section_dtb() {
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        ${dtb_loadline}
+                        ${dtb_entryline}
                         hash@1 {
                                 algo = "${dtb_csum}";
                         };
-- 
2.17.1


