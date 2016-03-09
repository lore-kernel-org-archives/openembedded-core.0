Return-Path: <tylerwhall@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id DA16560125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 02:07:48 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id m184so49653219iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 18:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dYfvOuf3VdZ2ifggMhL1yhjvNdkpw0AY0dOjp14X+Pg=;
	b=veCtd1RaiH+HX1G0gFqDgZKOyysUpvOa1BLcgcOpaTNfnvXZjOIA2yb4GIHDBbE7uI
	0XukiNdXnTB8nluT1qcPnt8CsioMk9vMZ6bYZ+ynJORvzymB2ZNjYu8SIKqxCOOqhGe2
	+CcUYLzoSUD6LZiSS309escPVqj9rvvIuXuAZ4OXOoWEX2U5DGBvJpD7oLed7zqEKywU
	Kz7LOOC++SEHAQLNZ33afSP0A5oDP1njOzdj1TldsM75AlbFbsNj2EaCx87JhZJzcvww
	MSB+jgL2bhw1q4G4KaOVAprcWUSuhwCmMO6adCMNBUOdB8RnxmhVCDkLRx+u1O1qQ0TB
	iqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dYfvOuf3VdZ2ifggMhL1yhjvNdkpw0AY0dOjp14X+Pg=;
	b=L9f2K/cY2v7XZlRqxtMbG4W36+EjrCYb9UwKE0TAWYlZFSWZoWx+7q3ELPaxzckCfG
	V5Ax/075L6F/3aTbyDWO0JCH59g+IIF3i2lAb1NFnmpF41PDS6AwQUQPp4ICF2uv5TxN
	hZgfIJkkny2/N+YPgQP8W2h6H+flDGKVZFJZVfiGnyLdyMXr7V5GeYy0LSvcwLwvjDMp
	s4ZSaBgIMDxiUBmVf4KbKfeRWVAWJoICzqFnXHmH1eO4Za7DZY0ruIVVj5N86PgdzWWo
	dG0yHv1LKyJMdyXrw5Rx9Tec9E9MPcOf4fpLIcTWnvYF2eBRUU4vXcHZIJxltPXwtypW
	rq3w==
X-Gm-Message-State: AD7BkJJTr3bHMLz7AxzHLL+pRi09DLogtukosc3D8CpcjNTpXPZX7z3hx3RrMTq02mgwUg==
X-Received: by 10.107.158.12 with SMTP id h12mr31247279ioe.107.1457489269709; 
	Tue, 08 Mar 2016 18:07:49 -0800 (PST)
Received: from metric.localdomain (cpe-76-177-101-4.natcky.res.rr.com.
	[76.177.101.4]) by smtp.gmail.com with ESMTPSA id
	qt2sm7611565igb.18.2016.03.08.18.07.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Mar 2016 18:07:48 -0800 (PST)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 21:07:40 -0500
Message-Id: <1457489260-2465-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] image-mklibs: handle position independent binaries
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
X-List-Received-Date: Wed, 09 Mar 2016 02:07:51 -0000

Executables built with -fpie have the ELF type DYN rather than EXEC
which makes them difficult to distinguish from shared libraries.
Currently when building the list of executables we omit these binaries
so they might fail to run on the resultant rootfs due to missing
symbols. One of these is systemd which builds -fpie unconditionally, so
mklibs breaks images containing systemd.

Modify the search to catch all executable files that are ELF and have an
interpreter set. Omit libc and libpthread as special cases because they
have an interpreter and are directly executable but treating them as
such is antithetical to the pupose of mklibs.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---
 meta/classes/image-mklibs.bbclass | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 6c0e8dc..5f6df1b 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -9,13 +9,15 @@ mklibs_optimize_image_doit() {
 	mkdir -p ${WORKDIR}/mklibs/dest
 	cd ${IMAGE_ROOTFS}
 	du -bs > ${WORKDIR}/mklibs/du.before.mklibs.txt
-	for i in `find .`; do file $i; done \
-		| grep ELF \
-		| grep "LSB *executable" \
-		| grep "dynamically linked" \
-		| sed "s/:.*//" \
-		| sed "s+^\./++" \
-		> ${WORKDIR}/mklibs/executables.list
+
+	# Build a list of dynamically linked executable ELF files.
+	# Omit libc/libpthread as a special case because it has an interpreter
+	# but is primarily what we intend to strip down.
+	for i in `find . -type f -executable ! -name 'libc-*' ! -name 'libpthread-*'`; do
+		file $i | grep -q ELF || continue
+		${HOST_PREFIX}readelf -l $i | grep -q INTERP || continue
+		echo $i
+	done > ${WORKDIR}/mklibs/executables.list
 
 	dynamic_loader=$(linuxloader)
 
-- 
2.7.1


