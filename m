Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6E6D7843C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 13:49:17 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e11so2440674pgq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZhIUWS446O93Plsymdkw3NXFY+1FUBLXkbkaYDS61y0=;
	b=A7KhJOlm3CXPx2BFWqa6UK5unZiS5e+TyzGvZjpocdUVvKPxvNRSmuMrJdD27LhZ7i
	47uetAYOPIAs042FBs7wQgCwzURvKEnkkcq4dIqwyde8CKYozvAvJnBr7ynR0va4wyfk
	STtklF5bMtUoFg1TuErctNTEXy64tRvz0uJiOZDexdYsvi67thu6CTpkMcR+/3lx4wXO
	An9TcMuyICMktzvevIiORpcTvOUc7iDFvxSt8O+FAr85QjMLYxdcg4I7PyrVCouLqnlc
	/bEzAoOGVeUoN8wlGGCS3xZI3PJugdzxMBPRiVYpAJ0A8ciUoeVMU1oIRopeQDn8MdAA
	01TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZhIUWS446O93Plsymdkw3NXFY+1FUBLXkbkaYDS61y0=;
	b=fD3WT28JbHnlMquTbrMYIuCMdUqSoeRZ33CALIAqmc3mp5k9LKir8UHQvEqRFNicDr
	T3t5/4pZw4PD2xk58GGlvc03nuarDIO6/EhEgCerWGZiEHwxlShoMKUA8gTNAiVm1Pw8
	jF1tRX83gHtKE1h7kPRgppuXdzzjGfpG0/ePTJg/aYBsoYhtW4Hj0j6PlSRH47VPhFPM
	4G861oBujddlFnYkyT16mihVW9QWRonxCdYxhglQca3D7xTXWEYrULj3F5krruRgay1U
	iWbgShF4mxwp4M77uzHx+LfwZYNg/ylsvK2nOYrLYnfw7T84xotbjQS8z1+eDY7GRd6e
	AA4Q==
X-Gm-Message-State: APf1xPBIdsdHRy7sWVFGtl2wH+3BZ7kbGTpolgHLMaDfKyQl1NKCirka
	V4NVV8d54q7bfznxZWnLTj9e7AYK
X-Google-Smtp-Source: AH8x227Q5gKxOR7AEwqDlLA1p/gqdPZIc8QKXfD1Qr39Dj5EvijnnWnoWL2PHoTcYVl/ZIE2iabvVg==
X-Received: by 10.98.153.2 with SMTP id d2mr6301147pfe.44.1518788958724;
	Fri, 16 Feb 2018 05:49:18 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	o12sm8144935pfj.86.2018.02.16.05.49.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Feb 2018 05:49:18 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2018 19:19:12 +0530
Message-Id: <1518788952-11462-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][rocko][PATCH] libunwind: Fix multilib header conflict - libunwind.h
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
X-List-Received-Date: Fri, 16 Feb 2018 13:49:17 -0000

libunwind.h conflicts between 32-bit and 64-bit versions

This patch solves below error:
-- snip --
file /usr/include/libunwind.h conflicts between attempted installs of libunwind-dev-1.2-r0.core2_64 and lib32-libunwind-dev-1.2-r0.i586
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index ed32d19..b9c532d 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=3;md5=3fced11d6df719b47505837a51c16ae5"
 DEPENDS += "libatomic-ops"
 
-inherit autotools
+inherit autotools multilib_header
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
@@ -16,4 +16,8 @@ EXTRA_OECONF_aarch64 = "--enable-debug-frame"
 
 SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared -lssp"
 
+do_install_append () {
+	oe_multilib_header libunwind.h
+}
+
 BBCLASSEXTEND = "native"
-- 
2.7.4


