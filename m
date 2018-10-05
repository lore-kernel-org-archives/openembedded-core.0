Return-Path: <achille.fouilleul@gadz.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 20731799F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 14:38:17 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q5-v6so13790647wrw.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gadz-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wQDwqjkTO/JGvAeNDE5ccTiEn1WU4le8N2q9MRtlUNM=;
	b=kwPTz6lmpOmtDyPXE9Hswg+QIpiB322P4Lek1l6TVVL0aC7uRlSCLS52lKSKXyT0+z
	om6gUfnWtqGf5YPo5U7RxeCcfXY3+OlIM43fF6IUDI9ZlyUKJ3Dw+DF43IGD/2xpXimZ
	dULPG5Q5WQgRofrywU8x4zUDTDPR8BtEXxT9YkclkFg2iX2FZcyL9QIKfTzswWCn8QWY
	oQ2vU2q4SzPr6JMcYRjLJFfHXBlv/QzBO2NSR5ly/A64kd/dKej11cu/ZEM0ONee4DV3
	zIYiJV64/9WyO1BrjltWkQ/TJKvlJj7g4QLNUaIrd4ri2aRUeBYwCLsZhe0vzS6uuH+R
	OuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wQDwqjkTO/JGvAeNDE5ccTiEn1WU4le8N2q9MRtlUNM=;
	b=afxTJyoztZhvLCP46rtKw699G8d4hyV8Htm/FE4oVdmtjAiZi7Ae7QVTnycKA4G79G
	3/iuGUjC5O14u1scHaWGLZN20G0Nv+M+hyJXZU1sDmIMTvXYvwpgWWbdryDAqNM6uGWt
	Yh3+aBS61R5FYu70bIsHt9XLgQaYlBoDIr3gzYr+DKHwGe7qwx3ViM4aL2UhZtCf93XI
	NwK+NYPvrlExhKJt43bb512kGjixa5DBN5HXVBxwX87skG6kzjvX0irKgLSV40QCXTTG
	k5gspq0kwpoywYzNMWfqOm3BVYbjo8ErkcbxKMvD53IjG2pLOPk6EHOy8jbLXMnugb6F
	Z7fw==
X-Gm-Message-State: ABuFfoiTomGNYt104UhfQx5oeKNufKaivDHmPRXgOxe98JXq6Y6O+9AK
	YG/eNTE9i5JmVcKMDufrYg151EheX814Hw==
X-Google-Smtp-Source: ACcGV60qSrPsiscUj+E4WWhAZRbjg19xRTlIEH0SQJlPT4p1JKnpkBbeOn6n3bpX0Ygg6iuoVrlYZA==
X-Received: by 2002:adf:e387:: with SMTP id e7-v6mr8636257wrm.94.1538750298029;
	Fri, 05 Oct 2018 07:38:18 -0700 (PDT)
Received: from localhost.localdomain ([37.170.246.93])
	by smtp.gmail.com with ESMTPSA id
	t82-v6sm3868188wme.30.2018.10.05.07.38.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Oct 2018 07:38:17 -0700 (PDT)
From: Achille Fouilleul <achille.fouilleul@gadz.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 16:38:08 +0200
Message-Id: <20181005143808.13457-1-achille.fouilleul@gadz.org>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] binutils: fix symlinks
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
X-List-Received-Date: Fri, 05 Oct 2018 14:38:19 -0000

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


