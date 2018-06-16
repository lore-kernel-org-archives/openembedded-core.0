Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6B937198A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 09:28:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id j15-v6so7626462wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2nWq5bqkfbeF8katrM2RU2/pDDIKvCz1E+Cl9vWlWSk=;
	b=RsfEc4COFP8P5igUVX2Zp36xPelZmz7ZtyTyd/lIsBo8Ni8T9X99PCkvBXWdxdD9lY
	zW7/zLg5bCRJ99gREficvWlPOGu8v1/PMLbzHZh9Cvdh7/SvVVnAOPjNuw8ZsfUH2Qrz
	kGvYEjXU//6LkEqwcGPfIEiNZQSh0PsqiYonMx91v+p+ryQbSFjDlDjCtIziw/R/y1ok
	RHsGpC23+54EeGLKHzyzqM/SqGUZu7BIvY6hOA9RtJu2gk0DQt8EHOCMIT19RQxymcZ1
	NW0UiOWtsvTyc1W8seYcBYXqeuU/VSiUTrjpyutIzqw0CJXQ+mwfVJYcuq6l/ZaxNMxM
	ZvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2nWq5bqkfbeF8katrM2RU2/pDDIKvCz1E+Cl9vWlWSk=;
	b=mBF6g82rRP3h7s92Tc+beh90nIWQC2iwki1P3oIMUjIffS3cVUZRYMvllEIUwRyXW2
	QaSmRoMfZ3ZBoC+pDLSjVTpTHDX0SsVS2CWxiBClWxht/8kdMv5i9fk8pfUUG0yjR6kQ
	J+9UfB8vlW/SlY5UMffiGT11O0CAJO3ph0nSZ49CleXpfXlxaHK0ylkKBcUAhwluEECJ
	/Fh+juWaUYV2o7KmOH7dnUU4A5HrRSuTuVEw2OuPH7OcKJojRQ+KGP/lyqnkmudpI5VX
	K89KETgwBc82Rlh3xDaBNrrvD/4UKHhzOxig/u7F2WSA0QP0joviKqTWS5S4NZ4+NYvJ
	Sp+A==
X-Gm-Message-State: APt69E35KXV1evlDUVRnSuGUF8tSyeZPPfzxZIJpJLnQJNPmHw0R6un2
	jkY0h4GlJT6dHcOFzc0KnsRNSyf6
X-Google-Smtp-Source: ADUXVKLZX75hUVJPLo6V7kvtAs70VI2X5OlcjDVohLcX07A4i2TAkpoQZKFwFmgTlBcTL76PzgYuiw==
X-Received: by 2002:a1c:108b:: with SMTP id
	133-v6mr3714165wmq.146.1529141337898; 
	Sat, 16 Jun 2018 02:28:57 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm19869509wrf.30.2018.06.16.02.28.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jun 2018 02:28:57 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 09:28:52 +0000
Message-Id: <1529141333-17754-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 1/2] kernel-fitimage: Allow setting of DTB/DTBO relocation address
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

Introduce UBOOT_DTB_LOADADDRESS and UBOOT_DTBO_LOADADDRESS so that you
can set where U-Boot loads full and overlay DTBs. This is required when
using bootm's overlay support to construct the final DTB.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
This commit conflicts with this patch:

https://patchwork.openembedded.org/series/12589/

Either that needs applying first and this needs rebasing on top of it, or
use this one in its place.

Changes in v2: None

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


