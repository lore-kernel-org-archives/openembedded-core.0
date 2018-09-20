Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 11E9860800
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 03:52:53 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id l63-v6so3739411pga.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 20:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SX+erauX2QpARFBv0JaBuWO0/AtYTq+8oI7Da2gX74Q=;
	b=inu3VRc5GF7ysM6yfNivewRdq4FEo7PVLRmwd4HWkpUsXhVPPrpVElR/+t2g+chgTn
	0VAwklbpO9/fuLTw6rIpjw9DFPIekrqsWSo4I8CXDi/dJlviLIQgzVTv3B51DomJeNtP
	LG5Dfdw29MauffGmEOG84lXQ59KXE/yr7H9zX8xprNFHjgxsw4RO6y0U6mo03wznc2LG
	LaKXZ4c+7WgPzxdBn/QB18ZxGTIUCQDDyn0J9uOQ/joXlCFCv5njA32g7WUcObSX23vT
	3NhjmhXGoIYDA+E9OD+s5TusTTckz7Ec4EfD0e0csj+qUaQ4mqyjHmqIJZSt2o1VLeG6
	lTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SX+erauX2QpARFBv0JaBuWO0/AtYTq+8oI7Da2gX74Q=;
	b=BHnrC/DhyNLHixp5yTR0P+EX0jcCDKHjYfXDh/cFVqdsJZHIzwBi28RcqqZwyoygEs
	5UOa6HPUEIkRHdfi8QTRoNFe9zO/gu7B32sYch+MJfX2M/83QCLe5BxLKqie4XaUset7
	ZtmD2uVGT3rJN+c+8gAD5vd2F3h8vPFIz5nqjii1WIZm2f4LkykCmNJTFytJ6R/GYXQs
	7jdUCLjHGuOCezM/5HcLv4vEQXsGKMn3oDnJ62UoaxVa4cHCsWbtgzsfa7gAo+TfLd2a
	by2D7er6nqtyULGhx/QLjobF2pcpAJMUPtmTXeeF9OGZB12yLVg8Kmdni4sLnvVNcFhH
	d57A==
X-Gm-Message-State: APzg51DEs0CJn4cBBA2ntLYz+mFrDzr1ihNkUgYpKEZ9iTRcWRzQzktt
	n9lvF7Px1fWHCOvPdhYTQChNCl4T2k8=
X-Google-Smtp-Source: ANB0Vda0eQ4wklHOgZWVYS8zr/uw2WiE6g99R6z8aPXuMSoK4qJgANfcuKOdCciktm+viAPQLY3tLg==
X-Received: by 2002:a62:6781:: with SMTP id
	t1-v6mr39045928pfj.200.1537415574316; 
	Wed, 19 Sep 2018 20:52:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	a20-v6sm52640309pfc.14.2018.09.19.20.52.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 20:52:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 20:52:41 -0700
Message-Id: <20180920035242.983-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH 1/2] linuxloader.bbclass: Refactor to have seprate functions for musl/glibc loader
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
X-List-Received-Date: Thu, 20 Sep 2018 03:52:54 -0000
Content-Transfer-Encoding: 8bit

this makes it possible to use this for musl where we are trying to
create a glibc compat package

Add missing aarch64 loader definition for glibc function

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 85 ++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index e1364a4e55..b4c413494a 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -1,48 +1,61 @@
-def get_linuxloader(d):
+def get_musl_loader(d):
+    import re
+    dynamic_loader = None
+
+    targetarch = d.getVar("TARGET_ARCH")
+    if targetarch.startswith("microblaze"):
+        dynamic_loader = "${base_libdir}/ld-musl-microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el' ,d)}.so.1"
+    elif targetarch.startswith("mips"):
+        dynamic_loader = "${base_libdir}/ld-musl-mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+    elif targetarch == "powerpc":
+        dynamic_loader = "${base_libdir}/ld-musl-powerpc${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+    elif targetarch == "powerpc64":
+        dynamic_loader = "${base_libdir}/ld-musl-powerpc64.so.1"
+    elif targetarch == "x86_64":
+        dynamic_loader = "${base_libdir}/ld-musl-x86_64.so.1"
+    elif re.search("i.86", targetarch):
+        dynamic_loader = "${base_libdir}/ld-musl-i386.so.1"
+    elif targetarch.startswith("arm"):
+        dynamic_loader = "${base_libdir}/ld-musl-arm${ARMPKGSFX_ENDIAN}${ARMPKGSFX_EABI}.so.1"
+    elif targetarch.startswith("aarch64"):
+        dynamic_loader = "${base_libdir}/ld-musl-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
+    return dynamic_loader
+
+def get_glibc_loader(d):
     import re
 
+    dynamic_loader = None
     targetarch = d.getVar("TARGET_ARCH")
+    if targetarch in ["powerpc", "microblaze"]:
+        dynamic_loader = "${base_libdir}/ld.so.1"
+    elif targetarch in ["mipsisa32r6el", "mipsisa32r6", "mipsisa64r6el", "mipsisa64r6"]:
+        dynamic_loader = "${base_libdir}/ld-linux-mipsn8.so.1"
+    elif targetarch.startswith("mips"):
+        dynamic_loader = "${base_libdir}/ld.so.1"
+    elif targetarch == "powerpc64":
+        dynamic_loader = "${base_libdir}/ld64.so.1"
+    elif targetarch == "x86_64":
+        dynamic_loader = "${base_libdir}/ld-linux-x86-64.so.2"
+    elif re.search("i.86", targetarch):
+        dynamic_loader = "${base_libdir}/ld-linux.so.2"
+    elif targetarch == "arm":
+        dynamic_loader = "${base_libdir}/ld-linux.so.3"
+    elif targetarch.startswith("aarch64"):
+        dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
+    return dynamic_loader
+
+def get_linuxloader(d):
     overrides = d.getVar("OVERRIDES").split(":")
 
-    # No loader for baremetal
     if "libc-baremetal" in overrides:
         return None
 
-    dynamic_loader = None
     if "libc-musl" in overrides:
-        if targetarch.startswith("microblaze"):
-            dynamic_loader = "${base_libdir}/ld-musl-microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el' ,d)}.so.1"
-        elif targetarch.startswith("mips"):
-            dynamic_loader = "${base_libdir}/ld-musl-mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
-        elif targetarch == "powerpc":
-            dynamic_loader = "${base_libdir}/ld-musl-powerpc${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
-        elif targetarch == "powerpc64":
-            dynamic_loader = "${base_libdir}/ld-musl-powerpc64.so.1"
-        elif targetarch == "x86_64":
-            dynamic_loader = "${base_libdir}/ld-musl-x86_64.so.1"
-        elif re.search("i.86", targetarch):
-            dynamic_loader = "${base_libdir}/ld-musl-i386.so.1"
-        elif targetarch.startswith("arm"):
-            dynamic_loader = "${base_libdir}/ld-musl-arm${ARMPKGSFX_ENDIAN}${ARMPKGSFX_EABI}.so.1"
-        elif targetarch.startswith("aarch64"):
-            dynamic_loader = "${base_libdir}/ld-musl-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
+        dynamic_loader = get_musl_loader(d)
     else:
-        # glibc
-        if targetarch in ["powerpc", "microblaze"]:
-            dynamic_loader = "${base_libdir}/ld.so.1"
-        elif targetarch in ["mipsisa32r6el", "mipsisa32r6", "mipsisa64r6el", "mipsisa64r6"]:
-            dynamic_loader = "${base_libdir}/ld-linux-mipsn8.so.1"
-        elif targetarch.startswith("mips"):
-            dynamic_loader = "${base_libdir}/ld.so.1"
-        elif targetarch == "powerpc64":
-            dynamic_loader = "${base_libdir}/ld64.so.1"
-        elif targetarch == "x86_64":
-            dynamic_loader = "${base_libdir}/ld-linux-x86-64.so.2"
-        elif re.search("i.86", targetarch):
-            dynamic_loader = "${base_libdir}/ld-linux.so.2"
-        elif targetarch == "arm":
-            dynamic_loader = "${base_libdir}/ld-linux.so.3"
-
+        dynamic_loader = get_glibc_loader(d)
     return dynamic_loader
-get_linuxloader[vardepvalue] = "${@get_linuxloader(d)}"
 
+get_linuxloader[vardepvalue] = "${@get_linuxloader(d)}"
+get_musl_loader[vardepvalue] = "${@get_musl_loader(d)}"
+get_glibc_loader[vardepvalue] = "${@get_glibc_loader(d)}"
-- 
2.19.0


