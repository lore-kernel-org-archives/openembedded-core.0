Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id A609C60BE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:26 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b9so2404081pgk.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tb+OYPKikPUWxxE+QoDvZ04aL/HN7k22Ni3yUvrWzr8=;
	b=PqqDSvhabOqCBO9MerDhrXMbVaroUmhfqNyxwenyRDZy1wxZ+anjEWlCIVNpuTQRPx
	r0cxP0I9kfpmQ5rnepBmXcc8+tp53KcFfLhLHACzlY4RMy92qQxdizatErC+PdA7iFIZ
	5aYYqMwMnyvSlDdMTcbtQJqR2Iim+Q1t9inv1hp4bAfHlIneCeYAN2nRuerpl0BbAdw+
	vmNASdey7Z0LuZMAOrrcXAyL2p7xfbQTLS/4RD3uOQLynDqSGOFlsq14r9wkgkl46/mt
	7LwuN8qbUVw56+uKNh5wGsEXafMRXkR7fMP7r+L5IGSwkJSVobDJoseMTuDHftdORnaW
	dg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tb+OYPKikPUWxxE+QoDvZ04aL/HN7k22Ni3yUvrWzr8=;
	b=Y3EHPE122qj3eALS89vAvn9+xrQ9T03rICTs0d8r2Af4BN6E4aIdLv0ulLmSvcCG6U
	d+FDJhQTXIsUEnNXbBOBsSBmhId4K3Nga2Mec3IsVXj1pwLaJb/+BA4cpoUihDmiEhdD
	UE7AJaWvt67e28SLUY424D7Z0MwZhEA3BtcJBPVZ5ROTwFk3ij7ztgc7x3oRbGFSKybi
	7SAdg8hzys03HoasJq7Lr1XyxmzMI/xbZFE5IC5qY3KF/Wf1tHkBjLtcLLPLF7ZpAmLq
	KngxtVdE9VCdPLEAv6hO0yErozjEldxWK9eqmqYQupysqfgoy+AkOl13IOdzHuBZPYA9
	lEwA==
X-Gm-Message-State: APjAAAXFw2eakAOIIgPpYogEwIgRu+B+KR0JnlSvNO5r5Sw88pJ3eMKK
	1UZprLepungry2je0CJUXEExzBmiihI=
X-Google-Smtp-Source: APXvYqwx1a6kPtaGpV8dJVb/okfoGNvBKKq12DdwzA8bIH+Cu0j2ECGXfIHDfAdrktuRDpW1g5aMsw==
X-Received: by 2002:aa7:8610:: with SMTP id p16mr15898114pfn.28.1581575907447; 
	Wed, 12 Feb 2020 22:38:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	k63sm1170302pjb.10.2020.02.12.22.38.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:22 -0800
Message-Id: <11cf7d82deafd496d30a4a28a38a3b1121762f9e.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] binutils: Bail out if gold is used on 32/64 bit RISC-V
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:26 -0000
Content-Transfer-Encoding: 8bit

gold is not supporting risc-v yet and, this will cause subltle errors
during build e.g. autoconf not finding certain features like visibility
and it could take a while to unwind the problem. Its better to error out
early

Remove dwp and ld.gold for rv32 as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 0fb6cae407..f06ccc31b7 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -40,6 +40,7 @@ FILES_${PN}-dev = " \
 
 LDGOLD_ALTS ?= "ld.gold dwp"
 LDGOLD_ALTS_riscv64 = ""
+LDGOLD_ALTS_riscv32 = ""
 
 USE_ALTERNATIVES_FOR = " \
 	addr2line \
@@ -83,6 +84,7 @@ LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
 LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
 
+
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
 
@@ -163,3 +165,8 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}_class-target = "${USE_ALTERNATIVES_FOR}"
+
+python () {
+    if bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', True, False, d):
+        bb.fatal("Gold linker does not _yet_ support RISC-V architecture please remove ld-is-gold from DISTRO_FEATURES")
+}
-- 
2.25.0


