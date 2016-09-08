Return-Path: <sujith.h@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id BC53C77237
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 08:48:20 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id y2so502771oie.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3Hxnnx8XWA7oBBJAvxR5SS5Y21JiJrouNUf8C3PcLUE=;
	b=tq2rEUtg/TpA+PshisrhMuZFApiYdpxDcpTPrQm8SeCId3f5lBojKf5Y+/cZ2x3oEr
	Ex5v0ljck6Zi7u+zgoJl1YOxeoPgOjm8n7kryIKyG3RKYpbzrWy32tDwRNASexQEY39B
	bZDzl3tTOxZR5rmPJJI8U3uwTw2ONRc03VoV/B9ANsClh1CEle/QkcOq59sSO3/l7gUc
	DoikAohf8OFsMR8aYy03ovD1v6EZfGIfAo+/JXd/MfH5ZWq4h6NuiihPSZCiJ/7B8iZI
	HHXjHsLQ94GaNzWIUNXuAmUtpGw92BBtU98qSWddejr/T0q9axv23Cl4gTJ05C3otCPu
	++Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3Hxnnx8XWA7oBBJAvxR5SS5Y21JiJrouNUf8C3PcLUE=;
	b=EdylcARAugPj/R4/tKIzBz0gpA0sDu6Elnao2gjVQpW8nEI7qm7xISukMYzhhpu6Tk
	hWFEHFliIk8CyEwLq8wfGvAB+HHfvXCZpeCFgy6GkS1HcuennkH9v45zoFqxFgVw5QaV
	w+vAQoUTBD11qn2F+azKyii4VQJZ8g5dTLKqSSDmkutq/1BkPNzZqsI1Kczyh0Rv5EUy
	ObZbBazJB5/a/EHYn4j2FdmAfj5hGci1WjqoEbS5Ir8HO+4SRZBOpQB6pl/si5Jwn+L+
	qIwsBYGXMGuDQPecQcjsFq1ykL62MoDRWt2U1fK/FQmt1UA++KRbM1H1+PlFCbZye9FG
	SgXA==
X-Gm-Message-State: AE9vXwN+fZh91w1TNSI4WTuOOGKhPy1Xp1FqMsA/gaezHYbSMzLDHl+YR6GxFuS4e+dESg==
X-Received: by 10.202.79.132 with SMTP id d126mr3519314oib.205.1473324500584; 
	Thu, 08 Sep 2016 01:48:20 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id b35sm2362358otd.0.2016.09.08.01.48.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Sep 2016 01:48:20 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 14:18:12 +0530
Message-Id: <1473324492-13761-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] perf: Fix to obey LD failure on qemux86-64
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
X-List-Received-Date: Thu, 08 Sep 2016 08:48:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

When built on an i686 host for qemux86-64 without the
fix to obey LD and it fails:

/scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
Relocatable linking with relocations from format elf64-x86-64
(/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-1.0/fs/fs.o)
to format elf32-i386 (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-1.0/fs/libapi-in.o)
is not supported

This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,
which is -m elf32_x86_64 for x86_64. Without that, direct use of ld will fail.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 meta/recipes-kernel/perf/perf.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 88e3a0a..85fe0ea 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -79,6 +79,7 @@ EXTRA_OEMAKE = '\
     ARCH=${ARCH} \
     CC="${CC}" \
     AR="${AR}" \
+    LD="${LD}" \
     EXTRA_CFLAGS="-ldw" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} \
@@ -98,6 +99,14 @@ EXTRA_OEMAKE += "\
     'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
+do_configure_prepend () {
+    for makefile in "${S}/tools/perf/Makefile.perf" \
+                    "${S}/tools/lib/api/Makefile"; do
+        if [ -e "$makefile" ]; then
+            sed -i 's,LD = $(CROSS_COMPILE)ld,#LD,' "$makefile"
+        fi
+    done
+}
 
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
-- 
1.9.1


