Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9A471C54
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:50:42 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id t72so2060700lff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jee3CAV8VKVv5eXXqtNKKzmrNdSbirI0bdIKx6H9tyQ=;
	b=t5fTuRa4IvH8S7la5jY8YKs8UG9SxH15mD4JoGvmkKjPNIvBcRe+AygTcSAeM1C7d4
	zX3X7rvq2wM6jlYJDjzMudRJgNE9+pTQVUuEtK1PJ/h4bKx9XVrcISQHInD2TJ3OIEn5
	tTtENYP5gnh77VdeVjw2OC1vrGI8Sz4pn+mPxd/oFkg+H+NX0KBJJ9rT11DFu31IJG2v
	aovEfePqrXCR1bmda1kE2HVdrt2mxBe2HdLtBU5G1dKl8B+Se8NmSmI8TySJrRhhQeNR
	F0U1g9I7BqBOug+fTCBsGVjH4afPq2PimE9b6RW5bPOQ7Kh2Ld0qfVsbJF4VtGNbRbaT
	Xptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jee3CAV8VKVv5eXXqtNKKzmrNdSbirI0bdIKx6H9tyQ=;
	b=Dfq27VeulHVU3+0v4/LeuRTcGiupQbwDZraonSqnHME15i8j3IZuLKJVOkGoMLJx9z
	rpKkULdTkXMm85ziguZWbNbKGQPv8Bp+AUIbWjy9XU5ziZsZzA1l/MJ3xKiBMZL9nLwQ
	SkFWR38eYG0JCXi5dqlZkeFBqJepVgY07cuEBXfF7jfZTKHAoMZmt7B+Gz7OFardVuOn
	fVk5/Qa0DAuRwOHeMrlLnGDldP3Kzcd7xrXOAXnqT3bK82l2wLMJIX7Ro7OFFTqsu03J
	dKDZf+7hmdk8b05xfI6k5J2/6+/g+zKkZ2/zObMAW5Kb3S/lHMKfJ7Ql0cOvYCZd/Tpm
	wPgQ==
X-Gm-Message-State: AIVw1128mBQyKT4SOa7DIBC7RxtkndGY0H7M/mJTFf+8bek3BlWxRYcf
	hTFeRPldizu36R2m
X-Received: by 10.80.184.130 with SMTP id l2mr9372288ede.22.1499341843561;
	Thu, 06 Jul 2017 04:50:43 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.242])
	by smtp.gmail.com with ESMTPSA id n26sm56063edd.51.2017.07.06.04.50.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 04:50:42 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 13:50:31 +0200
Message-Id: <1499341831-16305-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] linuxloader.bbclass: add musl libc support
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
X-List-Received-Date: Thu, 06 Jul 2017 11:50:51 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Current linuxloader.bbclass does not support musl libc ldso, so add it
in.

After changing, now the linuxloader function will call a subfunction
according to which virtual/libc is being used, glibc or musl, the
linuxloader_musl function is made on top of the LDSO macro defined
in musl source, by mapping related OE variables to it.

Change tested on following machines:
"genericx86"
"genericx86-64"
"beaglebone"
"qemumips64"
"qemuarm64"
"mpc8315e-rdb"
"edgerouter"
"qemumips"
"kc705-microblazeel" - meta-xilinx
"qemuppc"

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/linuxloader.bbclass | 42 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 117b030..8f30eb3 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -1,5 +1,8 @@
+LDSO_TCLIBC = "glibc"
+LDSO_TCLIBC_libc-musl = "musl"
+LDSO_TCLIBC_libc-baremetal = "musl"
 
-linuxloader () {
+linuxloader_glibc () {
 	case ${TARGET_ARCH} in
 		powerpc | microblaze )
 			dynamic_loader="${base_libdir}/ld.so.1"
@@ -28,3 +31,40 @@ linuxloader () {
 	esac
 	echo $dynamic_loader
 }
+
+linuxloader_musl () {
+	case ${TARGET_ARCH} in
+		microblaze* )
+			dynamic_loader="${base_libdir}/ld-musl-microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el' ,d)}.so.1"
+			;;
+		mips* )
+			dynamic_loader="${base_libdir}/ld-musl-mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+			;;
+		powerpc )
+			dynamic_loader="${base_libdir}/ld-musl-powerpc${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+			;;
+		powerpc64 )
+			dynamic_loader="${base_libdir}/ld-musl-powerpc64.so.1"
+			;;
+		x86_64 )
+			dynamic_loader="${base_libdir}/ld-musl-x86_64.so.1"
+			;;
+		i*86 )
+			dynamic_loader="${base_libdir}/ld-musl-i386.so.1"
+			;;
+		arm* )
+			dynamic_loader="${base_libdir}/ld-musl-arm${ARMPKGSFX_ENDIAN}${ARMPKGSFX_EABI}.so.1"
+			;;
+		aarch64* )
+			dynamic_loader="${base_libdir}/ld-musl-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
+			;;
+		* )
+			dynamic_loader="/unknown_dynamic_linker"
+			;;
+	esac
+	echo $dynamic_loader
+}
+
+linuxloader () {
+	linuxloader_${LDSO_TCLIBC}
+}
-- 
2.7.4


