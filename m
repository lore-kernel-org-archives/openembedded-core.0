Return-Path: <tylerwhall@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 47BC760071
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 04:14:30 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id m12so6641479iga.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 20:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0vT5jvfAma5rSCdD4RknzMZTkd0FQn6ZJPaOyrhzJIc=;
	b=FjNQ9rjdcyqH2EcdxvkrJkLRt6Htd5cb2dbLqJ14Z0XWXGQs4pMVdI3sCEuqdwW71v
	HBn6SvEPLCu5q1xofNujCwnEluJAmgTDk7PmiKt4JPv1mAzXHaaRZ4AH94jFnsZSfk3B
	XvTyKlkAVs5LVZqjWTyCjunKySaEJ1Cq9Tx/vt1vbxYcPmNpO/U+1Gc6Xu7kAdYOm7D9
	wcP85Vo05hD51j97451MHaOH/aR9FKzaG9OsDjE1WKfMcof5CQrdvqqrKbhi9UPYBem2
	ojFB3eE5ftntSwh6XT84E9/cBJBnMtJfBsXBGELogJW/pWWG5pKwXYWRR3t+cYYNW9y0
	mrYg==
X-Received: by 10.50.43.199 with SMTP id y7mr7756532igl.43.1390623271019;
	Fri, 24 Jan 2014 20:14:31 -0800 (PST)
Received: from localhost.localdomain (CPE-76-177-97-210.natcky.res.rr.com.
	[76.177.97.210])
	by mx.google.com with ESMTPSA id qb3sm16077572igb.7.2014.01.24.20.14.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jan 2014 20:14:30 -0800 (PST)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2014 23:14:03 -0500
Message-Id: <1390623243-28674-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH] db: Fix libtool linking against local libstdc++.so
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
X-List-Received-Date: Sat, 25 Jan 2014 04:14:30 -0000

Building the C++ bindings in a484b35b818768487ff27cf06b8c5d4e128126af
introduced this error on systems with /usr/lib/libstdc++.so present:

    /usr/lib/libstdc++.so: file not recognized: File format not recognized

The shipped libtool is sysroot aware, so pass --with-sysroot so it will
extract the sysroot from the compiler.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---
 meta/recipes-support/db/db_5.3.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.21.bb
index 8ec8870..caf6890 100644
--- a/meta/recipes-support/db/db_5.3.21.bb
+++ b/meta/recipes-support/db/db_5.3.21.bb
@@ -63,7 +63,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
 # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
 DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
 
-EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx"
+EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
 
 # Override the MUTEX setting here, the POSIX library is
 # the default - "POSIX/pthreads/library".
-- 
1.8.5.3


