Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0112571B27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:18:06 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 194so5494447pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=F/m/2/PqFqm/AiO8AROXh6Fy+mXGxt1YXTE3JBXbva4=;
	b=Fo+fiMx6SscDU61Y6yOPREldSXV5MxV+PsqITN6FJoUjkr3GtGFvWu4Xz14EdELS+K
	tYBU8L4CjIqjzu1VMLkqjNYv8T6palvSJbHeZAUjcnp4S92MN4JhoEU76neKncTMSw+t
	8JUUEQyanAc633ET/vP9iLUOsLRJg2hX+EgEVPe82krUiHrVtVCcFI/pm2GRnbFqLoRn
	xjgAIDxCKSx9TPg+qHGe3Jr7xGIEzVBDgR7qLBKVtOyvokoN7o3ncqAOeeGBb+xfrUWG
	rdS4JRwCXRvARb8TfSvm1y2OwI/Lx0Nedg585O0rTCSaJ4YHGYZ/JCih+JPPOeOUbrqr
	CKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=F/m/2/PqFqm/AiO8AROXh6Fy+mXGxt1YXTE3JBXbva4=;
	b=FABinf+TjV6t5RvkhNd4zM/qzAkp2x0+15+cmbb1U3blCK2GEPRKHBLn1I+acGcrv1
	zlUHvYgeoW715PTfy1EfckNdcLsYSbkXkPAXnZkhXFw6hOUfYl3dhnfmc2irOAFApKB0
	mameYy+RIZhu6e/0h0DS1cBESbOzllrwhG8VTxCwGQCCStmWHhp97lKWiy2glaaP1T6d
	Xi1loxkzv0JL+hwFA1soe/3mGPvwQbFinfIrSe9jJej017WcDD+PCNOB1PLY5xxDeUvR
	38CJUaj6+YNfAEa3dwwIT4Rpq2zNIBdZm3jcwR7TXTK5MQtapHfUWMX9vwZsYHqZpR8+
	sBtw==
X-Gm-Message-State: AIkVDXI8ClRGZ/gJNbKxYL5hEKCCRP6N1/d9KJ/P4ll3g1+l08e2O8rZ32wlitWMRHwSuQ==
X-Received: by 10.84.247.8 with SMTP id n8mr50752391pll.39.1484576286506;
	Mon, 16 Jan 2017 06:18:06 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	j185sm23282486pgd.35.2017.01.16.06.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:18:06 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-28-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 28/30] qemu: Consolidate EXTRA_OECONF
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
X-List-Received-Date: Mon, 16 Jan 2017 14:18:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Consolidate the configure options into the EXTRA_OECONF variable,
including merging any native specific options.

Also move the options specified in the do_configure into the
EXTRA_OECONF variable. And flesh out all the target directories.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e5bc1864d5..f758f79dff 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,9 +29,24 @@ SRC_URI_append_class-native = "\
     file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --with-system-pixman --extra-cflags='${CFLAGS}'"
-
-EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
+EXTRA_OECONF = " \
+    --prefix=${prefix} \
+    --bindir=${bindir} \
+    --includedir=${includedir} \
+    --libdir=${libdir} \
+    --mandir=${mandir} \
+    --datadir=${datadir} \
+    --docdir=${docdir}/${BPN} \
+    --sysconfdir=${sysconfdir} \
+    --libexecdir=${libexecdir} \
+    --localstatedir=${localstatedir} \
+    --with-confsuffix=/${BPN} \
+    --disable-strip \
+    --disable-werror \
+    --target-list=${@get_qemu_target_list(d)} \
+    --with-system-pixman \
+    --extra-cflags='${CFLAGS}' \
+    "
 
 EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
@@ -64,7 +79,7 @@ do_configure() {
        KVMOPTS="${KVMENABLE}"
     fi
 
-    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
+    ${S}/configure ${EXTRA_OECONF} $KVMOPTS
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
-- 
2.11.0


