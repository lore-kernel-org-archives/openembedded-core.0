Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAF8784DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 15:08:15 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id n79so13812594ion.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KPHCSzScYtLv2YSfZwhxlKS9a7wcXxbZblxPpmNX02k=;
	b=W+vjNcHaX4vu1m5Te1/a9goAKXcx2cryxycWTIQrCV+mfrSZqi66DjkpcpmA16Ajkh
	s3uPPpbmR64DajEv2nGJjgCLYDaL2MsLk6z7+CCAeIqLVJrRLG+tY36ZjGJ2i/gox2dY
	xjc9e3UKPRidJoV63+LFkA3qAUbshV+xkic3fwEW+B4kj3320HhxJt05WN8lOOAUdOR7
	DLWl0V/JWQBBE314m/AamFEaM8WRyyXOb842zpVbx25RO/wOpJ2FskmKSYUnA9kkteSO
	3xv0NODCVocTu9a2Lu7D7aUfabEI/AG8U19Xu+jExBapNdBf/BQbSDPG7M2nMsalW8Yh
	UaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KPHCSzScYtLv2YSfZwhxlKS9a7wcXxbZblxPpmNX02k=;
	b=LfKRLmAyqTCSsl1b3UCSQqOtN2kr3/StmvL/SwVi4OlSg6Ogc/BTVWNIj+a9HlfaCf
	U7+CAlrfcNjFPObyKYAb4sqS1zY0k5PztP3EiQ8sQAMFd9+PLC2A1+6Q8aE8y1a+LIbf
	IpXyVmVxSLoXBwFUzAUBzREZuMdOIZnCyBDASTDNx1SAvYlyBQjDawYwXEB8tH4iL8gu
	guHlohuhdjeULAExpqulXSZ9q5pO7qHUviPcW32NGUH8n5GIPqMTaLxLLTM7NHEzpGN+
	hnMF70SvlaFVFFNPgOLy4R/twhEQVvvAKZUo/2rzxtKJVQWb/m1dFeGo3mO7Nv/7ucVI
	FC+Q==
X-Gm-Message-State: AJaThX4FjAFvEYae51eL27EUtbyypafkOZPb0BshE97ap23C5DMxcPoY
	QWSqhn4+pYfQ9pbXj7vTJy+9
X-Google-Smtp-Source: AGs4zMaRJV16lkxSWBNFydd8PrRFSkgxzVsEOFbTObI6/9L3UsQz/GbJL/AW1gdsCvBR9y1VculWNg==
X-Received: by 10.107.147.9 with SMTP id v9mr14194820iod.25.1510672096735;
	Tue, 14 Nov 2017 07:08:16 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	u140sm5408285itc.41.2017.11.14.07.08.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 07:08:16 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 09:07:27 -0600
Message-Id: <20171114150727.17897-2-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114150727.17897-1-george.mccollister@gmail.com>
References: <20171114150727.17897-1-george.mccollister@gmail.com>
Subject: [PATCH v2 2/2] shadow: fix CVE-2016-6252
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
X-List-Received-Date: Tue, 14 Nov 2017 15:08:16 -0000

Apply backported patch that fixes CVE-2016-6252
Integer overflow in shadow 4.2.1 allows local users to gain privileges
via crafted input to newuidmap.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---

Changes in v2:
 - Add SOB to patch file.

 .../shadow/files/0001-Simplify-getulong.patch      | 54 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Simplify-getulong.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Simplify-getulong.patch b/meta/recipes-extended/shadow/files/0001-Simplify-getulong.patch
new file mode 100644
index 0000000000..8a41fb1dd6
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Simplify-getulong.patch
@@ -0,0 +1,54 @@
+From 70723e568159f3130b6076463f0bf978763e3369 Mon Sep 17 00:00:00 2001
+From: Sebastian Krahmer <krahmer@suse.com>
+Date: Wed, 3 Aug 2016 11:51:07 -0500
+Subject: [PATCH] Simplify getulong
+
+Use strtoul to read an unsigned long, rather than reading
+a signed long long and casting it.
+
+https://bugzilla.suse.com/show_bug.cgi?id=979282
+
+Upstream-Status: Backport
+https://anonscm.debian.org/cgit/pkg-shadow/shadow.git/plain/debian/patches/302-CVE-2016-6252-fix-integer-overflow.patch?h=jessie
+https://github.com/shadow-maint/shadow/commit/1d5a926cc2d6078d23a96222b1ef3e558724dad1
+
+CVE: CVE-2016-6252
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+---
+ lib/getulong.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/lib/getulong.c b/lib/getulong.c
+index 61579ca..08d2c1a 100644
+--- a/lib/getulong.c
++++ b/lib/getulong.c
+@@ -44,22 +44,19 @@
+  */
+ int getulong (const char *numstr, /*@out@*/unsigned long int *result)
+ {
+-	long long int val;
++	unsigned long int val;
+ 	char *endptr;
+ 
+ 	errno = 0;
+-	val = strtoll (numstr, &endptr, 0);
++	val = strtoul (numstr, &endptr, 0);
+ 	if (    ('\0' == *numstr)
+ 	     || ('\0' != *endptr)
+ 	     || (ERANGE == errno)
+-	     /*@+ignoresigns@*/
+-	     || (val != (unsigned long int)val)
+-	     /*@=ignoresigns@*/
+ 	   ) {
+ 		return 0;
+ 	}
+ 
+-	*result = (unsigned long int)val;
++	*result = val;
+ 	return 1;
+ }
+ 
+-- 
+2.15.0
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 031e880630..9fb1cd3d17 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -18,6 +18,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-useradd-copy-extended-attributes-of-home.patch \
            file://0001-shadow-CVE-2017-12424 \
            file://0001-su-properly-clear-child-PID.patch \
+           file://0001-Simplify-getulong.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.15.0


