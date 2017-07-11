Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1D49A77E3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:05:54 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e199so77794pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gr3wnJdwWk1MVeyqzvJ8kScYNWpfU69SVTGgsm68Lhc=;
	b=be0sEu5XKMF13Yb1y/tvPYmUYEt3McH17lZDOXqXzUSulIgO2YNkCnv5EIhH9qRw16
	/okAoqClc/keZK1PRqhLdCcKkrDt1dnlgrukVUjENxYak4C0NRxavEAeOkXnQ7OFZCKd
	GS80qgTjb0fEteRt08XmVI/wul+g/m4zAVrzAZFUEnnRv5Fw2SMmA7iwbkiQYVjHp0Co
	Kc+jlvfF4amC1ZjRoGS3ExGF5va7tX/T+COFZ4Vk8CGFhAKhRC1uPeKES5Yt/sj4R7U7
	MNriDFkDeEUC+xtUHIbgJ1lqXK0/7Q/g1taimkmcAsHL2+pZYYr/aCKjWGRNPxAy1f4a
	EdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gr3wnJdwWk1MVeyqzvJ8kScYNWpfU69SVTGgsm68Lhc=;
	b=ixC++drSbXoNLSHMkrkuQRVhecEbXtyzJIpDF1pb1fpSIhpqTavqxGZGOBei2sq5d2
	fakNqtx4Nn48IUttlU8bo6z47+dEvvaTI/hfZnmirAQ6ZxvjH34Kele3iVUwK/lVJdoY
	YaznPgZeeCCLF1esPHrawcFSxjBusSwp2oxapI48UEJfVBneS4+TLcxg4mm/7avGVbCU
	u0EgbeSS9RqFPxd054+MhiQ6vxMPgRYssumopiQLXy9Hd3k/vGkS9p81v+dGye1q19sO
	QifR3zIsdSeQD8HkUbc70Eu+ehwupSYfKniNP05lZg2tgWAdPJkRDceUlF0l9p8YbVbL
	9gAQ==
X-Gm-Message-State: AIVw110/oMJ5bGATnfrt2cSHaZl8gri/I4PHpYU60mqCz7rKen6rKRLd
	KKqsLvQr1AvhEuVx
X-Received: by 10.84.216.13 with SMTP id m13mr59814pli.201.1499781955777;
	Tue, 11 Jul 2017 07:05:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id t70sm37374pfk.111.2017.07.11.07.05.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 07:05:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 07:05:46 -0700
Message-Id: <20170711140546.23414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] gcc-cross: Fix linker and fortran symlinks
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
X-List-Received-Date: Tue, 11 Jul 2017 14:05:55 -0000

If we used -fuse-ld gcc option, then it does not work
ending in

collect2: fatal error: cannot find 'ld'                                                                                                                                                                                                       compilation terminated.

This is because we are not creating proper symlinks for BFD
and Gold linker in gcc installation

Secondly, we end up with dangling fortran compiler symlinks
if fortran is not enabled when confguring gcc, therefore
create these symlinks only when fortran support is enabled
in gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index b08bc197ba..1e184a60db 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -161,17 +161,19 @@ do_install () {
 
 	install -d ${D}${target_base_libdir}
 	install -d ${D}${target_libdir}
-    
+
 	# Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
 	# gfortran is fully backwards compatible. This is a safe and practical solution. 
-	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
+	if [ -n "${@d.getVar('FORTRAN')}" ]; then
+		ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
+		fortsymlinks="g77 gfortran"
+	fi
 
-	
 	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
 	# found. These need to be relative paths so they work in different locations.
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
 	install -d $dest
-	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+	for t in ar as ld ld.bfd ld.gold nm objcopy objdump ranlib strip gcc cpp $fortsymlinks; do
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
 	done
-- 
2.13.2


