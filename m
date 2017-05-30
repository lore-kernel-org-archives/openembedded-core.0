Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C6E8A781F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 10:08:03 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id e127so93205325wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lfehpfblbugN/Sa8fktIczVtBj2ILN/Uj87QCjZ/yl0=;
	b=daOVYmc52uxPCQcaWg9H7VOm4vqEkfVfo7mxWSQkLmacD7IH2yhJD1w3iKFCg5+HeV
	3qWFV/f0LJCzHqd7UXmtLlOiDToX1msYquziXqDN8yFjJ2yj/ajdPeQhK62PjYAIENqZ
	cDrUvpsV6eZJqIk8XXi+k3w4UaVuRzC3SCODTWsi/xYTLSihqe4JNx4mWQUGDXi51wCz
	Mbc5sPm0I+9PNBR4wn2DV2yu+UqPLcfIWcqnyX3lZyME7fZSWxwI6Ge9MU4591YvvUj+
	coBvAvFjbRk15vADGDVDBF7lfASzjpBKI1LfolaP/LhnZNxJdC93h9hCMVZ5iXYbCkTD
	n42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lfehpfblbugN/Sa8fktIczVtBj2ILN/Uj87QCjZ/yl0=;
	b=mlqPdRMEAHgBHiUb1ETU7UmDhFZXH+DatuKb6dxQjJ22P+kVw6duHJN5tXvOeySzw+
	uMw6mh0u3H8dgyy9atQ7N/NaJ8AcpLoytV2Z4A31ZTApQN9UGeHN9QdxVU+9g33Pw7iA
	sUoQKJRCPMUEnvQzGaEe7RycU1hkLhuyyIk7jmV4PCGFAhaUFUobRNoT9L9AUaMURYXE
	Ak5hR8t7WoRxWusNafZc7y2jLKue3yuZ893FfseOMrkwiXgKDgjD6ZuhOIqJZ9rJ6MK0
	YPfXAYcylOT7fK6/CjhkR21+xBwiM+5cGKZGV8Jw4b4qmQ8yptkDLzTspkvRB65f36j4
	+s5w==
X-Gm-Message-State: AODbwcDVW6cpS7qaiA4G0DgOdy6k3V1X5xRfbZD3xK7KKWeJeLaIvjYX
	tUHYczZ9jxVPr/IP
X-Received: by 10.223.135.42 with SMTP id a39mr12631692wra.113.1496138883933; 
	Tue, 30 May 2017 03:08:03 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 1sm19585441wrw.32.2017.05.30.03.08.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 03:08:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 10:08:01 +0200
Message-Id: <20170530080801.23995-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning and separated with dash
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
X-List-Received-Date: Tue, 30 May 2017 10:08:06 -0000

* I had some components where the MACHINE name was also included in PV of allarch recipe
  which was tripping the script into saying that they have different signatures (because
  for one MACHINE was the string in PV replaced with 'MACHINE' and not for other MACHINEs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-diff-machines.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
index 056aa0a04c..27c6a33006 100755
--- a/scripts/sstate-diff-machines.sh
+++ b/scripts/sstate-diff-machines.sh
@@ -118,7 +118,7 @@ for M in ${machines}; do
     cp -ra ${tmpdir}/stamps/* ${OUTPUT}/${M}
     find ${OUTPUT}/${M} -name \*sigdata\* | sed "s#${OUTPUT}/${M}/##g" | sort > ${OUTPUT}/${M}/list
     M_UNDERSCORE=`echo ${M} | sed 's/-/_/g'`
-    sed "s/${M_UNDERSCORE}/MACHINE/g; s/${M}/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
+    sed "s/^${M_UNDERSCORE}-/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
     find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
   else
     printf "ERROR: no sigdata files were generated for MACHINE $M in ${tmpdir}/stamps\n";
-- 
2.13.0


