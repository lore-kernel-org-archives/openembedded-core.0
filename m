Return-Path: <jun.nie@linaro.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 78E717EDE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:11:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x4so1192947wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 00:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=+QgXJWX/zYFbqiIVCOZi9SKxs10DTiOxapCGTKpyPEc=;
	b=DfhY4U++9EXblLsuqVeKA8NEdAMdlqlDVqiwNvnv9RZ6eRtfj6Kc/fRkKTgCwTNYWI
	042op66MRxp670monli0C8sIKMg+No80J6R/sYg+KBpr7qREOcXi+RRX9KtHDpSGnhc9
	jQGxuxov0j4p5haLKf2tUBnZ03XEvJcrn+n+YKRgLyLaCOcQlw/1OhNN8WsI5MNrGP4P
	06WTBRXR8LZX4RvzH2VDJb9ldGG3UveB1uK0Zzx/SEuvnaw62cIVEPZMvoTLDkHf9EWw
	P4MBn4Noa8wINdEEGqxWkv9jHOve34G+CzICBBFk1ceDkH5zGg5QlpHSl2gOO4gkDxmj
	dohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+QgXJWX/zYFbqiIVCOZi9SKxs10DTiOxapCGTKpyPEc=;
	b=JX3BVhREuHTKjqkAZec08OaJtGugrIF/vHQ6m8EsKxPGU/6zt7c8Yw5UlmrhFGRHIg
	Ek9meW2ZQvlST4NTsKwPB6+e4Wl+Hg9+dZcAaEuEfUziE8I0rugnQmjLASq6ReQrKplC
	Aw6z2PzA95LdkswoRWGc0ytlnn09zJbZNhHykfi9+ljxJl1SITbBjGgSuFS1GTaeJVEt
	hGlBZPe7A45Wg+KLmhe3GXHpguai61xhpN2N9OKlHbtq9+brboFGm8ZUy4TNz0vnkE80
	m8Z1u67w8+b+PFTVvbjiIr5zFJUvZmrMge9WMXNAPB6Cjr85Ix3sF7UBF05hucCsf1mT
	HnDw==
X-Gm-Message-State: APjAAAUObs2OZ3zF9rdWLLS1YwY2AQIKO9V6l4X8U1RtHN2gtGM7vNV7
	iQWT9k+SIOxnMUUnGGctn3uwXw==
X-Google-Smtp-Source: APXvYqxDyheTQI4Ra2jqxeEf5x0qhOUniTjFx+GXw4KSyK+o40Zbwbgv9bdjpB1gtjwdfxDcCfc4bA==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr29964299wrw.185.1562742686241; 
	Wed, 10 Jul 2019 00:11:26 -0700 (PDT)
Received: from localhost.localdomain (li1816-253.members.linode.com.
	[172.104.240.253]) by smtp.gmail.com with ESMTPSA id
	o11sm1204515wmh.37.2019.07.10.00.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jul 2019 00:11:25 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: richard.purdie@linuxfoundation.org, liezhi.yang@windriver.com,
	andreas.obergschwandtner@skidata.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 15:10:56 +0800
Message-Id: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage: uboot-sign: fix missing signature
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
X-List-Received-Date: Wed, 10 Jul 2019 07:11:25 -0000

u-boot.bin with dtb & signature should be placed in ${B} so that
it can be deployed by u-boot as expected. Otherwise, the version
without signature is installed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 meta/classes/uboot-sign.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8beafff..1fc2a37 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -66,7 +66,7 @@ concat_dtb_helper() {
 		install ${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
 		cd ${DEPLOYDIR}
-		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${UBOOT_BINARY} > ${UBOOT_IMAGE}
+		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
 	else
 		bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
 	fi
@@ -77,10 +77,12 @@ concat_dtb() {
 		mkdir -p ${DEPLOYDIR}
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
+				CONFIG_B_PATH="${config}"
 				cd ${B}/${config}
 				concat_dtb_helper
 			done
 		else
+			CONFIG_B_PATH=""
 			cd ${B}
 			concat_dtb_helper
 		fi
-- 
2.7.4


