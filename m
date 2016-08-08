Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1604D771A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:39:00 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id w143so35377862oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oHLcVYzVJflrdLyc/PmdHUAvKGRzLPTLFsdDAZKka18=;
	b=uoyKHdqprV+deb8oY5ZGPgP1Bh1AX80+NpXN+d79hbKHruiIcnFTCA2yz8lNfElypN
	oTati3/5yaHi0ZCkblcHO/TDOBI8rsCEZmaGc0xAiQhYacv1TJxDQgFcZHxU3rShnbef
	Imzb8djzUFjH4bmGH9XdMRnI0PO+SZ30LM09As8aaMIY27XG3EobNfqjIWZsGgJL+Y2g
	TYO66o+KntsfSdWeT9Pwz861QE/YlQcRygfLUECG4GC9W1nLY8aZCWytsiL1Pk2dMUwG
	DeRoReXvzXb8yO9w2VqYI4FQQtESmdIXMLRrd/V99Q7tSL4cXbhTv2YKOsXi+G0IpVzR
	1UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=oHLcVYzVJflrdLyc/PmdHUAvKGRzLPTLFsdDAZKka18=;
	b=NLgABa53LMCSW5UbCOnU6uTn8FFLQbJYOV9SaXac+o6LXNUY2OD89iEtm+bl0SCjFO
	NAwSPN5xF0qq2pApUrhQcne2wDtBM7gzjW2EDPuOGAWuohh8TG7buzUGVH6PTsXc5li6
	BOfD4MpuD1SRQ6ofh0Sc53X+kt/UqCkJ3ZNwti9dc4LbeiVV2XkIp11JyWuqKh2DKify
	TcoWf8R9GUgJHCRQ0g3G4riwiZCc+F9v5sTJ9mlG03cZCzt/dIIlDy9/wvSK+t9uS4ti
	1vyjQWS8DSwQC4dntejWBvSPdmp+n6f+NQ41EycjFWd76N8OecPRpIQNOfjuJMZyjMx8
	nmZA==
X-Gm-Message-State: AEkoouuEexEHHO+ZKyQUkI+kx8TC+NPcwlQSzeNzcjdS8LALVHpJGreYifh/4mRlksqFuA==
X-Received: by 10.157.37.211 with SMTP id q77mr7083827ota.79.1470674341633;
	Mon, 08 Aug 2016 09:39:01 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	e195sm12516486oic.21.2016.08.08.09.39.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:39:01 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 11:37:56 -0500
Message-Id: <105b84186e6c47aa21c1dedc1bba3ac092d96ed4.1470672689.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
Cc: marex@denx.de, trini@konsulko.com, andrew.bradford@kodakalaris.com,
	denys@ti.com
Subject: [PATCH v2 4/5] uboot-sign: Handle .rom signing the same as .img
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
X-List-Received-Date: Mon, 08 Aug 2016 16:39:01 -0000

Handle u-boot.rom signing (U-Boot as x86 BIOS replacement) the same way
that u-boot.img signing is handled.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/uboot-sign.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 57d4903..d56ad8e 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -64,7 +64,8 @@ do_concat_dtb () {
 	# Concatenate U-Boot w/o DTB & DTB with public key
 	# (cf. kernel-fitimage.bbclass for more details)
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
-		if [ "x${UBOOT_SUFFIX}" = "ximg" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
+			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
 			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
 			install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 			install ${S}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
-- 
2.8.0


