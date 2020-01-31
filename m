Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0A08360071
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 16:24:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so9325373wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 08:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AU4MMNMzD89Lyemy4V0N2sQVzB32jLXX2jW+ZqSsbqQ=;
	b=OYGCIYeMxREAud66waF/SFbBfsgeSIw/kLVnKntRfdN3aQpi/M1qC60iVQrNy6rFkT
	Q5eqcFE3s6qPBT6ehCq7ViW+ep1O7706kCsrrE9uIXOn/vOAVs/Xy0OLQkAJesntO946
	w+/TqbsNTz5hE15pKzCNgO9s15purbKHjzxym0WFjYtnBa/6pr1vkAYzGD9yRjAHnYmm
	BHxfLJnZ5P7E0amRG92Iz6fNZkpzY+jRUiW5kg0FCoITL2TgsecPEUcq1bOyNcQSY+T6
	ZWCOA0KHOsPAsjVuKUGupdV8kRiX7EQk/e1F02OLiJeWPkJicrdId/XGhjyO7p6wHIc+
	Lejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AU4MMNMzD89Lyemy4V0N2sQVzB32jLXX2jW+ZqSsbqQ=;
	b=LxBHgsmQ24QJxqmyNCs4xPjv3ql07udmrmH6zZ7apPLnjEKNzjM2ZTUGfx/3c8BhiN
	JkqVZfOSTXjeKlQdVDEPUuQHLsle9Df3kL02QpZKP8FW9snsadSSn47ZlVxZKattWw7L
	tVmGeUPSC2agk6ehWI+xDC94K1QG44HwMci3GqQJpRe70i4tNvYqo/f8EB5wXZQ3tcmP
	GkZsyfYXpgw+vVdl4H0mVaDkCyKEc1op5exx1d8Pn+KSzGOwra2zi/YUa40Lixb6gzYd
	P59AybdB9swep521LONPZHv/Wlgx8aDXK8O9Gk3orhvcUMbOVPFK+urRQGGP2vocSCdv
	7H/Q==
X-Gm-Message-State: APjAAAU/c4D3s7k36YTFcG0CjrYS2Mw6aFOdULKGgtq+yxJirBpokhJf
	QBFAo5X9X2+KBsGO+pDi+9IB/a8V
X-Google-Smtp-Source: APXvYqyCl8xxKjrsDeBMvL9rgLklSAEHYjTLrwZJVtK7TZjqn0Q6HgV6PdxkWzrIOAIsHz6LGtOVbg==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr13107256wrj.225.1580487885270;
	Fri, 31 Jan 2020 08:24:45 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	v3sm12734527wru.32.2020.01.31.08.24.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Jan 2020 08:24:44 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 16:24:42 +0000
Message-Id: <20200131162442.58931-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kernel-fitimage: Handle overlays in EXTERNAL_KERNEL_DEVICETREE
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
X-List-Received-Date: Fri, 31 Jan 2020 16:24:45 -0000

When using EXTERNAL_KERNEL_DEVICETREE, collect DTB overlays too (*.dtbo)
as well as iterating down into sub-directories so using the behaviour
for naming which matches KERNEL_DEVICETREE.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel-fitimage.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index ec18a3d69921..d1b8cdc1f049 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -391,11 +391,10 @@ fitimage_assemble() {
 
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
-		for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb; do
-			DTB=`basename ${DTBFILE}`
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n'); do
 			DTB=$(echo "${DTB}" | tr '/' '_')
 			DTBS="${DTBS} ${DTB}"
-			fitimage_emit_section_dtb ${1} ${DTB} ${DTBFILE}
+			fitimage_emit_section_dtb ${1} ${DTB} "${EXTERNAL_KERNEL_DEVICETREE}/${DTB}"
 		done
 	fi
 
-- 
2.17.1


