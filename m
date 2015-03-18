Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D17B6AC43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 11:27:36 +0000 (UTC)
Received: by padcy3 with SMTP id cy3so39986558pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 04:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rnNHA/RL7oxZ+JJkDoG+sUIuC6kVl6HAbL7eLBbnnCg=;
	b=Yonyp0EnwixcOas8fih60tWduaKdbGWGsK8y5+gg2IyJI79C7ALyRx0o+X7oSgqIWd
	nwPpq6Zbqd+YcXoRpMDS95QLoRU+Ma+J6dp+tY+CJ7bkPckHq2lVLrCdVI3CXk2I98kr
	aXpM2HkIQtb2kL4JEPSuZ0fWUhPL0qbCoCX/bOXAQGy23TJkeN//63ujaWCbWvPjrCIk
	uBnlOK1UFKuObA391VZ+GSyfa43HAac4omY9xNHLnK1cYrHnh4YA/tyKOAALtHnwGiGr
	NYR8FD2LUkkt/zjYLK+b1UBFFsJPNbeJrX8yFNmYlFVeXIRVZBUxPCLO7Gg6nrqEyUpC
	tPCA==
X-Gm-Message-State: ALoCoQnio6ASeOyv+wX54+ukKYfMckwEsxmFlLfJz/gZ4M3IQS3XUrXF6CZCTzSrrbbhq9pMjAOE
X-Received: by 10.70.89.195 with SMTP id bq3mr119501468pdb.138.1426678058082; 
	Wed, 18 Mar 2015 04:27:38 -0700 (PDT)
Received: from Latitude-E6430.domain.name ([119.82.123.224])
	by mx.google.com with ESMTPSA id x1sm27111518pdr.17.2015.03.18.04.27.35
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Mar 2015 04:27:37 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:57:08 +0530
Message-Id: <1426678029-19516-5-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v2 PATCH 4/5] grub-efi: Add to support to install grubaa64 efi
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
X-List-Received-Date: Wed, 18 Mar 2015 11:27:38 -0000

Add support to install grubaa64 efi image.  By default GRUB_IMAGE contains
the bootia32.efi image.  Depending on the architecture type the variable is
being updated to bootia64.efi or grubaa64.efi

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/grub-efi.bbclass |   17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 47bd35e..cded1a0 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -31,15 +31,20 @@ efi_populate() {
 	# nested under a top level directory.
 	DEST=$1
 
-	install -d ${DEST}${EFIDIR}
-
 	GRUB_IMAGE="bootia32.efi"
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
+
+	case ${TARGET_ARCH} in
+		x86_64 )
 		GRUB_IMAGE="bootx64.efi"
-	fi
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
+		;;
+		aarch64 )
+		GRUB_IMAGE="grubaa64.efi"
+		;;
+	esac
+
+	install -m 0644 -D ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
 
-	install -m 0644 ${GRUBCFG} ${DEST}${EFIDIR}
+	install -m 0644 -D ${GRUBCFG} ${DEST}${EFIDIR}
 }
 
 efi_iso_populate() {
-- 
1.7.9.5


