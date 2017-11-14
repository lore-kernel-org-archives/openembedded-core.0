Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 172D27855C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 20:01:50 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id t11so6450600iof.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ACMO61lGQmmQ4Ln+zMAC8y9VJon1HcaqNZpQTQwk0+I=;
	b=VyNMFHsNAcvNvwD6JUYurEB4aVl+CoZNasCUrYxJoGKQAxZrLpvsBhOd0DseN7WUlm
	qa6GBMq4GYYfJ7FtnwG5/FAcSelr760fe6BCV6hH+m7j3enJixhFFbsalQl3U+q+moa0
	pzMLh4Oo0pWqKqA8WmTgqZIj/qJKE+SidnBe4VUyOu7jMCsSSFOmYoGgrMOPIhUvkan7
	YR1tnswwOGEktfxT6IQYJP+ex3EJREFTfvWjJYOVaFWSidERPJXd1HsIK6FsFHdb3R+r
	CXCy4FwvNzN8aAdgvhMS8VVAL6xPPPGxtJcauDIrP5dTYLubd83JIDuh33REhah3oq20
	pBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ACMO61lGQmmQ4Ln+zMAC8y9VJon1HcaqNZpQTQwk0+I=;
	b=BMdd2JXnVxqTzhYfHM1eLHqSLeOe1yh/wkp7Q1GWoS3KcN3KaBFrHZAOBPpdlz9fC8
	/xmBHZUK961ceDWMVwa+ZXfomN5Q8Lj+uUsnqJXxvL5nsXkeHErNoeXYAl1s5iGFBZXI
	v29Zbcme1atPWOT5WTTOi14e7+80Ykk0VdFZQHihlbqXIhVyom6I4Sc4d8PaXNcY+HDA
	ydwqJsL22ZaH52gLryFxTd5nq/7xIIR2xlyzqtUzjsoFpHtqq9H37zyvV4pIE4Hb6BBF
	V1sgLqMzlUOfLi47Qaa72BDfQyFsl6qScQdNtS+rWnJ9Gcw8AgRaaX9AYEXGhiQPtcx5
	OmUQ==
X-Gm-Message-State: AJaThX4MWZ6VS72xnrVL1qGuHBVZ645Nyr9I8Dl3D2rM+BcyMvQ98Njl
	FPCBKRtCb85Ff6ngxwXFa42b
X-Google-Smtp-Source: AGs4zMYtL6IN+2nlQ7plDmOlwG52IyLHQdBnEDkydYu3l0l7xjTvIMMfugBhdhjFLhJWvbn8vn45sA==
X-Received: by 10.107.52.213 with SMTP id b204mr844804ioa.291.1510689709562;
	Tue, 14 Nov 2017 12:01:49 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id x2sm3054754ite.24.2017.11.14.12.01.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 12:01:49 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 14:01:03 -0600
Message-Id: <20171114200106.18227-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [morty][PATCH 1/4] zlib: Fix CVE-2016-9840
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
X-List-Received-Date: Tue, 14 Nov 2017 20:01:52 -0000

Add backported patch to fix CVE-2016-9840 which was fixed in zlib 1.2.9

https://nvd.nist.gov/vuln/detail/CVE-2016-9840

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../zlib/zlib-1.2.8/CVE-2016-9840.patch            | 77 ++++++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9840.patch

diff --git a/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9840.patch b/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9840.patch
new file mode 100644
index 0000000000..4f0d2c6975
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9840.patch
@@ -0,0 +1,77 @@
+commit 6a043145ca6e9c55184013841a67b2fef87e44c0
+Author: Mark Adler <madler@alumni.caltech.edu>
+Date:   Wed Sep 21 23:35:50 2016 -0700
+
+    Remove offset pointer optimization in inftrees.c.
+    
+    inftrees.c was subtracting an offset from a pointer to an array,
+    in order to provide a pointer that allowed indexing starting at
+    the offset. This is not compliant with the C standard, for which
+    the behavior of a pointer decremented before its allocated memory
+    is undefined. Per the recommendation of a security audit of the
+    zlib code by Trail of Bits and TrustInSoft, in support of the
+    Mozilla Foundation, this tiny optimization was removed, in order
+    to avoid the possibility of undefined behavior.
+
+Upstream-Status: Backport
+http://http.debian.net/debian/pool/main/z/zlib/zlib_1.2.8.dfsg-5.debian.tar.xz
+https://github.com/madler/zlib/commit/6a043145ca6e9c55184013841a67b2fef87e44c0
+
+CVE: CVE-2016-9840
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+diff --git a/inftrees.c b/inftrees.c
+index 22fcd66..0d2670d 100644
+--- a/inftrees.c
++++ b/inftrees.c
+@@ -54,7 +54,7 @@ unsigned short FAR *work;
+     code FAR *next;             /* next available space in table */
+     const unsigned short FAR *base;     /* base value table to use */
+     const unsigned short FAR *extra;    /* extra bits table to use */
+-    int end;                    /* use base and extra for symbol > end */
++    unsigned match;             /* use base and extra for symbol >= match */
+     unsigned short count[MAXBITS+1];    /* number of codes of each length */
+     unsigned short offs[MAXBITS+1];     /* offsets in table for each length */
+     static const unsigned short lbase[31] = { /* Length codes 257..285 base */
+@@ -181,19 +181,17 @@ unsigned short FAR *work;
+     switch (type) {
+     case CODES:
+         base = extra = work;    /* dummy value--not used */
+-        end = 19;
++        match = 20;
+         break;
+     case LENS:
+         base = lbase;
+-        base -= 257;
+         extra = lext;
+-        extra -= 257;
+-        end = 256;
++        match = 257;
+         break;
+     default:            /* DISTS */
+         base = dbase;
+         extra = dext;
+-        end = -1;
++        match = 0;
+     }
+ 
+     /* initialize state for loop */
+@@ -216,13 +214,13 @@ unsigned short FAR *work;
+     for (;;) {
+         /* create table entry */
+         here.bits = (unsigned char)(len - drop);
+-        if ((int)(work[sym]) < end) {
++        if (work[sym] + 1 < match) {
+             here.op = (unsigned char)0;
+             here.val = work[sym];
+         }
+-        else if ((int)(work[sym]) > end) {
+-            here.op = (unsigned char)(extra[work[sym]]);
+-            here.val = base[work[sym]];
++        else if (work[sym] >= match) {
++            here.op = (unsigned char)(extra[work[sym] - match]);
++            here.val = base[work[sym] - match];
+         }
+         else {
+             here.op = (unsigned char)(32 + 64);         /* end of block */
diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index 913c7033d4..b6a4c687ca 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -10,6 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
            file://Makefile-runtests.patch \
            file://ldflags-tests.patch \
+           file://CVE-2016-9840.patch \
            file://run-ptest \
            "
 
-- 
2.15.0


