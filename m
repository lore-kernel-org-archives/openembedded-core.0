Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3490472F10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:12:41 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id s67so7713822pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=PppIAHxy/nnm+nUehsOJnLXB0Nbi/1lny6k2AcyfcMc=;
	b=hJML4zL8ssCxVJVhHd7/PUbATZvwGRrHWcIwOjk+N0QiXxXmEVe3cg4ybkvN/5hHvI
	aIsPouCIYnPVvtZW7FPWcH2q+9IMG95Jh+rW1THJKin6WgUIHOVRMBzCoFgw3IgK/7j/
	FP8O038sYkJggw9S5+qnWtSJvIFiI42eb2LZKdHKq6+Przo/XyIwrgrMgyBEzfCHhTGt
	LJN986GOjmxVqsThVVwRCp9h9TLrlBBXXarJwSwoT4N75nKQvJoRW7LfheO58oYKmOqT
	Y3NNDzw8b1rAYW2XJcRy63BbUhUnxEzdLOJ1p/iM3/Q+wPz1bOEdEh569pqRVfczAIIR
	PmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=PppIAHxy/nnm+nUehsOJnLXB0Nbi/1lny6k2AcyfcMc=;
	b=AtqAaO3yvS/dZQNCMSMhbAXYoOxgqY+LcpCnQeYWerIPIFS+yRIuq/tiJBJNtkiK+E
	w+EMUIZX5JSsyaFSl+miSOjAvSX3jd2MaJd16wVLS5bgWL6aKIU+me1ln3EPJE/Etzda
	8WuHoXH+TgWOcGPFy2b5gawon/g43C+lHVT33QJV92NjM5PbEV7o0kk+JMXsC2drQ1Yx
	xTbW7nPCsjhDOyUBEN8GqEGbXACKUnM12WcSthlOjI/iYFbgH3rPOIQFe1NEF3ZXd7ss
	50xcCPCN3HvrveapEUY7SL+x8EIVxFiUhtHYN9EAsLeKZsW66zwZLPPep1EH6pZzHPGb
	ZtnA==
X-Gm-Message-State: AMke39mBs8pe9WngznFedYAZalmtsof0N31isdXXSSN771Xm6KbUj+Nljgww28hZ+0hUHA==
X-Received: by 10.98.91.131 with SMTP id p125mr33094084pfb.165.1487682763137; 
	Tue, 21 Feb 2017 05:12:43 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	x16sm41111435pfk.79.2017.02.21.05.12.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:12:42 -0800 (PST)
Date: Tue, 21 Feb 2017 23:12:29 +1000
Message-Id: <20170221131229.20126-2-nathan@nathanrossi.com>
In-Reply-To: <20170221131229.20126-0-nathan@nathanrossi.com>
References: <20170221131229.20126-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 2/4] qemu: Consolidate EXTRA_OECONF
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
X-List-Received-Date: Tue, 21 Feb 2017 13:12:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Consolidate the configure options into the EXTRA_OECONF variable,
including merging any native(sdk) specific options.

This consolidation also makes the use of 'system' pixman in the
nativesdk case, this is desirable as the QEMU internal pixman may not be
available (using QEMU git as opposed to tarball) and pixman is already
in DEPENDS. Additionally the QEMU configure recommends to use the system
pixman if available.

Additionally move the options specified in the do_configure into the
EXTRA_OECONF variable. And flesh out all the target directories.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6f350f9345..485638b62d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,9 +26,24 @@ SRC_URI_append_class-native = "\
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
 
@@ -61,7 +76,7 @@ do_configure() {
        KVMOPTS="${KVMENABLE}"
     fi
 
-    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
+    ${S}/configure ${EXTRA_OECONF} $KVMOPTS
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
-- 
2.11.0


