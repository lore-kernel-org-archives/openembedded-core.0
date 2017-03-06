Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7104D77501
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:26:38 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 77so7311599pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=mEwiKyo+A+kNSJaY+1mOmW+ZG1xw89SlMwlXIR4aQHM=;
	b=hJemyRNnvtyOV6p3CLXQMRS4HCtLkA+0uGuJ1Tjfzrp5I8jitP9mW8Ag3PcoBipL6m
	blZUk7jnWuwBL51+l6yNPVJ8oaz6ilzSp3W5xmkNXiwmAOpTBiIIBVK1I6DRR5uZ+ocn
	CyrTDM0fzqHgr1fQl87ym3wuaJB5ykG7Zr9rTsYaBD7nAsJvGuGTigQ5DcYA8VPm63uK
	4bOrgrFtfqBPJv2pEQTDQzf4Pg57BNzqeGxv6l7hsObCoEv33aXPUcB6ezWgkoABYXTc
	ly4jc0DdmUdaPy6S2sLhJnMwllfuE4AlZN/QijwsfvorOydf8Iqj32AJoSeg8YnwKez+
	e6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=mEwiKyo+A+kNSJaY+1mOmW+ZG1xw89SlMwlXIR4aQHM=;
	b=iUCmEHodO8PGSUs9mNGq5GNBwl8moloPzLmnDImxEg3UdyyhUQxmYKieg5fAY/3jTf
	z8WIWZtuW/ZNUizTsI6+JlR4raDtm97TJgV7UQcMg8w5+jQMxFnmlt3fwphV+PNsps/t
	MKkbELsKLILHyk5FH/B1obBkCTB62rKRpqezH0xJawjQDaENBkZMOOjk67AS5AO5C2P7
	boAv9VJd2F70qUP6vvZ/wr1A/emQPaR6sexqpKA62NcTFDRBKAZ7K9lFDkFEM4JucsVN
	BwXjODXH6Zp6y3TJqUTh/3pWCq5Pno1Ctd74stOZFb2fnATA/bvBl2ZFtqUKp0yEJKxj
	iDVA==
X-Gm-Message-State: AMke39nlLcRpRKGg9ZEzUPyTiYirzVzjgMaMLXrWyhosobZLTgSVQJXZT/B7pgv0XjvIHw==
X-Received: by 10.98.193.69 with SMTP id i66mr21635722pfg.35.1488813999382;
	Mon, 06 Mar 2017 07:26:39 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	67sm40324165pfd.120.2017.03.06.07.26.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 07:26:38 -0800 (PST)
Date: Tue, 07 Mar 2017 01:26:20 +1000
Message-Id: <20170306152620.22194-2-nathan@nathanrossi.com>
In-Reply-To: <20170306152620.22194-0-nathan@nathanrossi.com>
References: <20170306152620.22194-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v3 2/4] qemu: Consolidate EXTRA_OECONF
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
X-List-Received-Date: Mon, 06 Mar 2017 15:26:39 -0000
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
index 1857786917..72430cc6fd 100644
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
 EXTRA_OECONF_append_class-native = " --python=${USRBINPATH}/python2"
 
 EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
@@ -62,7 +77,7 @@ do_configure() {
        KVMOPTS="${KVMENABLE}"
     fi
 
-    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
+    ${S}/configure ${EXTRA_OECONF} $KVMOPTS
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
-- 
2.11.0


