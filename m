Return-Path: <achille.fouilleul@gadz.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D097A79A49
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 11:44:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 143-v6so1577269wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gadz-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wQDwqjkTO/JGvAeNDE5ccTiEn1WU4le8N2q9MRtlUNM=;
	b=YkmOdGTu8splTct6EmpP3w41tB8CrGyu8AXnjoiSKGamXbxVHcLNuQNEYOES4Jv/5o
	qy5gL57/JQUCZm2e6W0JM6dB4ZSemqpX2MPOm6KEdg/MATcplHckXtGclSSVNFyRP+Ou
	vOoW89xsW1n/ERD4c4ZJ/fI5+jt9h2iY1QFoUoZusbKwTK1csuVmOU7n0WT6blAXtfc+
	9+75xl2XRkPgTOZHGFxKpTH7G0zujConPhDMJMsMhqGLEVrxE8Ec2UuPTqy15sSDVOr9
	RpRQWVQ/cLjBjVPVIlcvJ8x9lyhHJU0zgPMeuaT1Lg5Q1XeU4hy0Pe51RCLjFUz/Nt+I
	WNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wQDwqjkTO/JGvAeNDE5ccTiEn1WU4le8N2q9MRtlUNM=;
	b=f9szg2MqfmJx7um/Y5CnsI8JtMLUpuN3pxmJKbNRchJDhw5MIzUfsOkof8vMRaKlHm
	iVYOFVCARoNMaY9h+cNkBouI8GK4PmVjZcUsgyvbusdNxgw4MyDQURJIOZXcpuDsyRzZ
	WbaKnb8NsWaJaXA0TKVrQOupdqeO66vuM9kp5Kr+DwYJtKzy7JjxFhfGeFk1y3ZHzqlB
	5oe72jLXivNwlPQ86JE2Gk5iGjotFyNv4eDIoAeoMj8G5V5fb+ZF2HIHkpApFZCQKFFs
	UrVS29nj9oqSpR/g6i7FgZuRGfrsGVSz48ZQlfWpds7Wq6pAnMwpYHpjfvDSmpQ1wn2t
	ek9w==
X-Gm-Message-State: ABuFfogGqgQEj9Nzlh8YDxBMjlxm5td5oLeoTsiw9Fu1qezHw5ZyuZsx
	Cva9Ep8IH6biQMmGBvTKzrnH43C5LW8xuA==
X-Google-Smtp-Source: ACcGV63Y7VWxS5f7IzqWeYqcou0y9IhK8vMD0WWrifYZNzx9g4fZMfL55FW1Pg0Jc2seZh8v8K81RA==
X-Received: by 2002:a1c:5f54:: with SMTP id
	t81-v6mr8001200wmb.67.1538739861868; 
	Fri, 05 Oct 2018 04:44:21 -0700 (PDT)
Received: from localhost.localdomain ([37.171.8.5])
	by smtp.gmail.com with ESMTPSA id
	c10-v6sm3286818wrr.73.2018.10.05.04.44.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Oct 2018 04:44:21 -0700 (PDT)
From: Achille Fouilleul <achille.fouilleul@gadz.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 13:44:13 +0200
Message-Id: <20181005114413.23395-1-achille.fouilleul@gadz.org>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] Fix binutils symlinks
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
X-List-Received-Date: Fri, 05 Oct 2018 11:44:23 -0000

For nativesdk, symlinks created by do_install contain ${SDKPATHNATIVE}.

This is a problem with SDKs that include nativesdk-binutils and nativesdk-gcc.
When extracting such an SDK dangling symlinks are created, because
relocate_sdk.py does not adjust symlinks. As a result gcc ends up calling the
host binutils.

Use the os.path.relpath function to obtain shorter relative paths, which do not
contain ${SDKPATHNATIVE}.

Signed-off-by: Achille Fouilleul <achille.fouilleul@gadz.org>
---
 meta/recipes-devtools/binutils/binutils.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 37813dd864..8af48e735b 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -128,12 +128,12 @@ do_install () {
 	# We don't really need these, so we'll remove them...
 	rm -rf ${D}${libdir}/ldscripts
 
+	bindir_rel=${@os.path.relpath('${bindir}', '${prefix}/${TARGET_SYS}/bin')}
+
 	# Fix the /usr/${TARGET_SYS}/bin/* links
 	for l in ${D}${prefix}/${TARGET_SYS}/bin/*; do
 		rm -f $l
-		ln -sf `echo ${prefix}/${TARGET_SYS}/bin \
-			| tr -s / \
-			| sed -e 's,^/,,' -e 's,[^/]*,..,g'`${bindir}/${TARGET_PREFIX}`basename $l` $l
+		ln -sf $bindir_rel/${TARGET_PREFIX}`basename $l` $l
 	done
 
 	# Install the libiberty header
-- 
2.18.0


