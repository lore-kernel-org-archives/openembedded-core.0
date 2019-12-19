Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 77A0F7FD73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 18:38:22 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k24so6799380ioc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J1uXXXDXbgpobzUZ+/7FOF5zu1MI9P2YUHN7nHtVS7Q=;
	b=STjtTtVN6fkxnCaD5ZbP+Uvc2GGmdW5+AoHHANScVgsvk4EWdDiRiYBl3/aKkivBsU
	jwTxVmbIFJu15ba535S0wHkQXBawMltqqHvw0lMY6jEpGMB3Mq3Worim+5ES/q4wA5Nc
	71UR48evKbxDCdefa0p9ZoIDHHgdPeaBtb/zdE4QRoeBhKcU5yog2Xgxg3P6B1DEytiH
	pgwW4XO/Muy5yOu2PJV7Mx/CXt7rjHKmUv0tw2cp2PJleZjHRLr+leuX48KwFAYKc2Kw
	1OeSpK6YCF4diOeYpGiAH93StEXsXMpxm0ItHgpfz/qTRIfuqRXiy/Q6EIdKT9AouHaK
	oqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J1uXXXDXbgpobzUZ+/7FOF5zu1MI9P2YUHN7nHtVS7Q=;
	b=dRdfTP51OsRFbnh21bzgl/Z1TVS7gpaneDXLs0vjpZ5kFR14gWIbDGycpiK28fr/We
	sfcfwM9cbKXUNhGvPXYpnNQRwgzueugiofjjyio1/CozkiFJHccf4bWYvZdUfe3sdL0e
	YdJNHt+XrHFIp7fTr2INf8qC9s7KgUVTUbXgt+n82HnjrRAkHzuuHtZBAEhqvYC/ehBB
	9ihSSQ3mgSTfi/CCoou0QrrIC9F342vqbEOCcHwEtZcAKBWjc1Xi7axeqZrGUco/a518
	9MiT7Vqi07Jg9zuTRaN2Lv0Jor51lI5y9g20+cTMKust6dNdjgBLS5RbGKPyk8q+F89H
	OJTA==
X-Gm-Message-State: APjAAAX3pytwDU18i6z8izJ/aqCm6fqL9qgwJjf/phJxL4ezi8SQ3JiF
	8B9TkkM/AlTEr5ayD+3SHDLs2H17iwM=
X-Google-Smtp-Source: APXvYqzzdu1zgEmCT6gCdfKPn+9X818Gn+EgKJCCsVzi2EDWN5bXxBU9NEovgA2jHX1BmamubQnNeg==
X-Received: by 2002:a6b:7616:: with SMTP id g22mr7221990iom.192.1576780703183; 
	Thu, 19 Dec 2019 10:38:23 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	l83sm2878055ild.34.2019.12.19.10.38.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 10:38:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 12:37:59 -0600
Message-Id: <20191219183759.3122153-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] classes/kernel-yocto: Apply patches from BSP
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
X-List-Received-Date: Thu, 19 Dec 2019 18:38:22 -0000
Content-Transfer-Encoding: 8bit

0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
phases") appears to have inadvertently broken support for BSP .scc files
to provide patches for the kernel. Restore this behavior by adding
$bsp_definition to the list of files processed for patches.
Additionally, the logic can be simplified now that the same elements are
used for both configuration fragments and patches

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ed9bcfa57c..08c02a8f50 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -193,12 +193,9 @@ do_kernel_metadata() {
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 		fi
-	fi
 
-	# run2: only generate patches for elements that have been passed on the SRC_URI
-	elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
-	if [ -n "${elements}" ]; then
-		scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
+		# run2: generate patches
+		scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 		fi
-- 
2.23.0


