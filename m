Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3F479540
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:24:59 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f21-v6so4332786wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=0MIBo+j6HXwF+dPzPsnftwfRz++AfavW8D+OypvSk2k=;
	b=NQUtk39DtUujpiJMq5HGEeCVh3gN0xb4GI1NLmsQw1zRVBRoksfvfSTNO7H0E5vQe2
	+e+yis2gn+BVzhwPGrALjNf8mIlHAFNeiEONXhUxOsLhHGfG7bosoKnEg5ytkV5CMvvx
	hU9aeVsFkYq9WjGR/L8MHWp9E5wdXE7eo/w+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0MIBo+j6HXwF+dPzPsnftwfRz++AfavW8D+OypvSk2k=;
	b=h6PpplIHDZIwrG6zLRWQmEIQJ9G7JG3Lno6Fps10p2aXDt9cTQCZne/miGnIakISj4
	qf1KYkIJgO+joREHGVGEwq8YejMExBp8cVBRou6UYp/RFNFfP7cXvHZzeAEwAMv0XKnb
	QCVdJkRt9thxh7fW9vxiJlG5DUDzd446CygZaj81il42IChs3GTDkeX2GcMKoEVLa1RJ
	e924NiwDW3kn/R1jjCsX3r8rId87OCxiKml0rD5y8MMiz61Du+s1lPXiLkaPp77/N9HH
	DLr3lvcccKY/xKi+FH736gS+1eqvcOUCS2GcbjMWtfjfrMRYtN9hFCE2xi8ZTgc8E5MR
	cgkA==
X-Gm-Message-State: APzg51DvI6AD53r06Bi6cFDDUsFaEWzjEZwE/fiC+iBNtHLS115kBtig
	UzpCCCDC+U8d6I5pSrX6fGa4jaPyAUs=
X-Google-Smtp-Source: ANB0VdZmg3Q+M5winD9DPXs6Lt1wLNOh8V0UpU4Q9ZbxZI/HMMaF4rc/+G8tOaVLCWfbkAbZyL9EOA==
X-Received: by 2002:a1c:6f8b:: with SMTP id
	c11-v6mr4726078wmi.138.1535012699655; 
	Thu, 23 Aug 2018 01:24:59 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p11-v6sm1316860wrd.74.2018.08.23.01.24.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 01:24:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 09:24:53 +0100
Message-Id: <20180823082457.32062-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] linuxloader: Convert to python function
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
X-List-Received-Date: Thu, 23 Aug 2018 08:24:59 -0000

We could do with one decent general purpose python function to query the
path to the dynamic loader. Convert the shell code into python.

Also correct baremetal to return "None", not musl loaders.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-mklibs.bbclass  |   2 +-
 meta/classes/image-prelink.bbclass |   2 +-
 meta/classes/linuxloader.bbclass   | 112 ++++++++++++-----------------
 3 files changed, 47 insertions(+), 69 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 5f6df1b17fd..68e11d43655 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -19,7 +19,7 @@ mklibs_optimize_image_doit() {
 		echo $i
 	done > ${WORKDIR}/mklibs/executables.list
 
-	dynamic_loader=$(linuxloader)
+	dynamic_loader=${@get_linuxloader(d)}
 
 	mklibs -v \
 		--ldlib ${dynamic_loader} \
diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 6a8afa8fa95..04dd57c940a 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -33,7 +33,7 @@ prelink_image () {
 	fi
 	cat ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf >> $ldsoconf
 
-	dynamic_loader=$(linuxloader)
+	dynamic_loader=${@get_linuxloader(d)}
 
 	# prelink!
 	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 8f30eb32e76..e1364a4e55b 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -1,70 +1,48 @@
-LDSO_TCLIBC = "glibc"
-LDSO_TCLIBC_libc-musl = "musl"
-LDSO_TCLIBC_libc-baremetal = "musl"
+def get_linuxloader(d):
+    import re
 
-linuxloader_glibc () {
-	case ${TARGET_ARCH} in
-		powerpc | microblaze )
-			dynamic_loader="${base_libdir}/ld.so.1"
-			;;
-		mipsisa32r6el | mipsisa32r6 | mipsisa64r6el | mipsisa64r6)
-			dynamic_loader="${base_libdir}/ld-linux-mipsn8.so.1"
-			;;
-		mips* )
-			dynamic_loader="${base_libdir}/ld.so.1"
-			;;
-		powerpc64)
-			dynamic_loader="${base_libdir}/ld64.so.1"
-			;;
-		x86_64)
-			dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
-			;;
-		i*86 )
-			dynamic_loader="${base_libdir}/ld-linux.so.2"
-			;;
-		arm )
-			dynamic_loader="${base_libdir}/ld-linux.so.3"
-			;;
-		* )
-			dynamic_loader="/unknown_dynamic_linker"
-			;;
-	esac
-	echo $dynamic_loader
-}
+    targetarch = d.getVar("TARGET_ARCH")
+    overrides = d.getVar("OVERRIDES").split(":")
 
-linuxloader_musl () {
-	case ${TARGET_ARCH} in
-		microblaze* )
-			dynamic_loader="${base_libdir}/ld-musl-microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el' ,d)}.so.1"
-			;;
-		mips* )
-			dynamic_loader="${base_libdir}/ld-musl-mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
-			;;
-		powerpc )
-			dynamic_loader="${base_libdir}/ld-musl-powerpc${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
-			;;
-		powerpc64 )
-			dynamic_loader="${base_libdir}/ld-musl-powerpc64.so.1"
-			;;
-		x86_64 )
-			dynamic_loader="${base_libdir}/ld-musl-x86_64.so.1"
-			;;
-		i*86 )
-			dynamic_loader="${base_libdir}/ld-musl-i386.so.1"
-			;;
-		arm* )
-			dynamic_loader="${base_libdir}/ld-musl-arm${ARMPKGSFX_ENDIAN}${ARMPKGSFX_EABI}.so.1"
-			;;
-		aarch64* )
-			dynamic_loader="${base_libdir}/ld-musl-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
-			;;
-		* )
-			dynamic_loader="/unknown_dynamic_linker"
-			;;
-	esac
-	echo $dynamic_loader
-}
+    # No loader for baremetal
+    if "libc-baremetal" in overrides:
+        return None
+
+    dynamic_loader = None
+    if "libc-musl" in overrides:
+        if targetarch.startswith("microblaze"):
+            dynamic_loader = "${base_libdir}/ld-musl-microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el' ,d)}.so.1"
+        elif targetarch.startswith("mips"):
+            dynamic_loader = "${base_libdir}/ld-musl-mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+        elif targetarch == "powerpc":
+            dynamic_loader = "${base_libdir}/ld-musl-powerpc${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+        elif targetarch == "powerpc64":
+            dynamic_loader = "${base_libdir}/ld-musl-powerpc64.so.1"
+        elif targetarch == "x86_64":
+            dynamic_loader = "${base_libdir}/ld-musl-x86_64.so.1"
+        elif re.search("i.86", targetarch):
+            dynamic_loader = "${base_libdir}/ld-musl-i386.so.1"
+        elif targetarch.startswith("arm"):
+            dynamic_loader = "${base_libdir}/ld-musl-arm${ARMPKGSFX_ENDIAN}${ARMPKGSFX_EABI}.so.1"
+        elif targetarch.startswith("aarch64"):
+            dynamic_loader = "${base_libdir}/ld-musl-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
+    else:
+        # glibc
+        if targetarch in ["powerpc", "microblaze"]:
+            dynamic_loader = "${base_libdir}/ld.so.1"
+        elif targetarch in ["mipsisa32r6el", "mipsisa32r6", "mipsisa64r6el", "mipsisa64r6"]:
+            dynamic_loader = "${base_libdir}/ld-linux-mipsn8.so.1"
+        elif targetarch.startswith("mips"):
+            dynamic_loader = "${base_libdir}/ld.so.1"
+        elif targetarch == "powerpc64":
+            dynamic_loader = "${base_libdir}/ld64.so.1"
+        elif targetarch == "x86_64":
+            dynamic_loader = "${base_libdir}/ld-linux-x86-64.so.2"
+        elif re.search("i.86", targetarch):
+            dynamic_loader = "${base_libdir}/ld-linux.so.2"
+        elif targetarch == "arm":
+            dynamic_loader = "${base_libdir}/ld-linux.so.3"
+
+    return dynamic_loader
+get_linuxloader[vardepvalue] = "${@get_linuxloader(d)}"
 
-linuxloader () {
-	linuxloader_${LDSO_TCLIBC}
-}
-- 
2.17.1


