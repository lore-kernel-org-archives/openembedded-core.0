Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17C8C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 14:47:48 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15650.1788533260159596343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 07:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p8Mx4I1g;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso927372a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533259; x=1789138059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7qGheFeUD5m3RRhfr6sghc6SKBWARozEVoqtfp0jFw=;
        b=p8Mx4I1g3lBfrmbTr6HI3IVEP1tA9Ds733suQs52DPqn+P4ZP3c4XWLgJ+JtyhcCf3
         XeYEil2XlVWHCC98925bw7QNMdYZ082VGhcAUv+qQQq3aGM/63hPMjM0nVK/9hFdmQcL
         yr4aX56JOhHF0GoJf5Jq2ltiRIWpMESIsQDpUOJ5OJI1zr8vip6lK98e8O0D8O2JGa3F
         VGW6Gaglx6LDntAqQgvwckB59dXql/eZzM7WV8URNidpViRVjYtB/jg/BgEzkAaIZ1g9
         fwYwR2+tkFAMQUzeggyaIr3mhTGpY/sxzxLQab87hxqg7W/FCPRam8sssqBoPmAEylMj
         tE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533259; x=1789138059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7qGheFeUD5m3RRhfr6sghc6SKBWARozEVoqtfp0jFw=;
        b=nmdneYPDbttpqZHb1KTZVYQ4pmXU6JUCHv0m5UoEFRBa5XEjuDORx6GB5CmkzzIORZ
         C/6rH501HlekOv4crXDqYq1opeA0rju2O1RQU+QM+sK03ojdolbzy5FCdjcCZngGxC++
         1CnFuLPFYXN1sfdxwgxZB+ccxyP/uxTO16MYlgqjhE09Ugo3pU8dlBq03QPR2VK4zBpf
         Ik29Iv4zKmZ+U9UVsLfURUEKokgFMU+KYTLIltq+8nBUea1kkvX5NEfR1fJhHeUdUYH9
         l/yqftNcpsfrJuxgLGcFJYXhzMpd3gKcT9N4Pr6iSCvCcBOVbh4R9+gADoBVBJarhnBK
         dwAw==
X-Gm-Message-State: AFuF++mpKxwD0gBMSmqwAk/Im5KieMmDN+N1PJ0+/C9R33DedxbKNyGK
	hKZYlyf22fm3ijx1qLF03H8cBWFSl4hw9jPwQz4HNcqBgPJEJOZlY7slwghrjg==
X-Gm-Gg: AYBFou124AFuZM+1iiePE26JIlr8kni8Tx5+SVD8aF22vEXVY6K/ShAtnPBKAXeIxMO
	Dc4D7UqVXUer4o43iq/QsvMq/RLy6BCWwDAeDgw1rNeJveLXuFMyH0/jd4YsKojwPgQJoeI9qNq
	nDS6RPuX1utbKVxzio6KftsEM20FGEWXDEl+wfT8kYl2I8eg+HgVBrGw+3AFKzFDZMEdgzhnmYD
	cFs+gCJG+eCwVFhbHWgq9H9moi6PPmOR5OobU1ag4Fs11OYN7GeqdjResoLGV+0MAD5E7neSC2T
	HboB+NrmJVZfo7OsnnEEVN1ZXJ4DaVh/2D90SMwsZJtEb8Jrio5dzGLJ0tHCZ51ILfRDxr2+pRa
	5mu0/ey6iSdt1leonF/jo7l0cuDkjNF4oFy5rOcuItFseHAZfWT4d5DMFbvMCFIfdcjS/fqSC9P
	M+rFCWyktJ/feElYoodZrGMa15ztCePjctJoUMyeBARZ+xySslPZgAIEwWwXG9/SOa9sOqthJNm
	i4VdSH776ZoT2Oq5kk+yo1YjjysO3LnSZrD5FLFNMmXNWqgx9Lg9L8/4YVkNsvXjZYrtEgAPHRc
	tzEjmwLV3Q5+xU+K3i33cUSEaxC5eJUqD0FEcJfqvyll5BVd2KgGdAGdoJoQHtKYA2jfloyD1Fp
	pbMSK4awh04vVUf9G2JdiQK5xQNkhK4nEJH6JvnLA4tCvyM9Z7kK51H3Waw==
X-Received: by 2002:a17:90b:2552:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39b262728cdmr10625199a91.15.1788533259308;
        Fri, 04 Sep 2026 07:47:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm7626156eec.12.2026.09.04.07.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:47:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] barebox-tools: Fix linking the target tools with clang
Date: Fri,  4 Sep 2026 07:47:35 -0700
Message-ID: <20260904144735.641496-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 14:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245123

Makefile.clang hardcodes a generic triple per ARCH
(x86_64-linux-gnu for ARCH=sandbox) and ignores CROSS_COMPILE, unlike the
Linux kbuild. It appends that --target= to KBUILD_CPPFLAGS, which
overrides the triple clang is already targeting. clang then looks for
the GCC installation under a triple that is not staged in the
recipe sysroot, gives up, linker fails:

  ld.lld: error: cannot open crtbeginS.o: No such file or directory
  ld.lld: error: unable to find library -lgcc
  ld.lld: error: cannot open crtendS.o: No such file or directory

The runtime is present, just under ${libdir}/${TARGET_SYS}/<ver>, so this
is purely the wrong triple rather than a missing dependency.

Set CLANG_TARGET_FLAGS on the make command line, which takes precedence
over the makefile's assignment, so CLANG_FLAGS names the real triple.

The variable is unused when building with gcc.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-bsp/barebox/barebox-tools.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index eb327306d9..054dd97a71 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -19,6 +19,9 @@ EXTRA_OEMAKE = " \
   LD='${LD}' \
   "
 
+# scripts/Makefile.clang hardcodes a generic triple per ARCH
+EXTRA_OEMAKE:append:class-target = " CLANG_TARGET_FLAGS=${TARGET_SYS}"
+
 do_compile:class-target () {
     export userccflags="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
     export userldflags="${TARGET_LDFLAGS}${TOOLCHAIN_OPTIONS}"

