Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EBFCA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 17:42:33 +0000 (UTC)
Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17178.1790876549142639084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 10:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jg/wKGni;
 spf=pass (domain: gmail.com, ip: 74.125.227.166, mailfrom: workjagadeesh@gmail.com)
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2d747ec6185so32617765ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790876548; x=1791481348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNcMFm3wnO930h3sJmc7tQ/qJaqemIvQET8JLf/aEN8=;
        b=Jg/wKGniaPRZ9KcZANZw5/e2tWEJoXV++DXUjgQVyQDiBzIF5tKwaV7C2bbhy9gU4R
         nluJLR/0i/LaTxuPIgdPMQu8ZMkZaJbm7QvOdHFx1H7CQE5kTTMrHjdjCbmDsIpLRXKE
         sYagFUl6nsPKUJVcjMcif50byB/1yHrZjdnWuOixL+Ith0hDbHgIMOSpjy5QLIeGSq0N
         FvNVDB3/5HymI84I0YyKgm8WnOwyAb5uGCDdOacFuNZf20IxgQRNyd3lgZ+i8u1P11MB
         A0b4xQhT8lcYg+vzycSw3xqigvggOIn5M6k9HBYzvMgnEMHcOtmnKxfv+eI/j2vTOGmZ
         W13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876548; x=1791481348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNcMFm3wnO930h3sJmc7tQ/qJaqemIvQET8JLf/aEN8=;
        b=N/v0W1IVgbedfIxQ/lFjDDKHY4FhqHCyw3HehrnGmTtDu0VUKyNp7MJ2JgEuCPPZRY
         wNyYtpqzb0o8i89e2Qjiyi3OZxiLIQR35vqFOtYhZbNPcFDfcVQfbKjDpSiYjuVs8HSo
         RJcgZJROEA7usdFHrzJl+06gDvAKDnqScUdXrn7o98qjLvdeg8SBZZGtKykVQHOl39X3
         quAVPOMW161OxJIY4Wu1oRyWUGS1fvvVQ+1cjixgvfdYOTJikGhJoJQ+aaEguN1Szj/M
         jCOi+xs5L5ZwAavw0ODslKBZRXgMkE40gBcekGEt7EM32wJx9H0AWwlRB5e1d3da1gNq
         OGaw==
X-Gm-Message-State: AFq9FYISQHXFdaymgbSj3eRNHWriRb0LEjLCrgQH6mq7Txankqg5HjHk
	qxqlIxBr5JVarGqX8sufOsY1X4/r9Wi9L0psFgLW39FsaBL9LQcW9t9x5P/aCSC8SZA=
X-Gm-Gg: AYBFou3PzDYH3ahmwVTuqsV1PzarYdpjwnGllxOAU+ihdSaGAKA5P5Xq0LuQwylE1em
	V+h8NT6v8MlU8ou1D3JEyARTCLqZe6LqpCzDLfo/SXXEQN7DLi+qJbhRDyybyBo+Q8fyZOmltAQ
	5vylGeqnkGVotCsvW0SZHXDTfmXNz+xbhEcqM94GnD0/iMuYiME2cvUd2MUuZwMPGrWAgtGu4lC
	wlY20utRTNiRn7ZbL1gDL8sg7uykwbim8H80K69y0ffKQ05Ghpp51Tb1O6B09Fk0RCiqsStfzpm
	LShhcl/1jxD9gqS7MbGzw2/TRmDZK45l5KH918WeVPktJgDjju20C13wvGgFWnW0GR0LIay67dK
	I7nL4t1HqAIEAXwhy9nq0N/8y8vzEru5qUTlAl3zul6QY4zkYmgGiC2RAOFgNItY8IDdDwrm/M7
	bUd/9nc0AYX7Gowm1PZZA0e0zJxYvUGkpsnR5mGhh2P49XONFA2GNA1/I2nq3onqwJIwp5mtH1l
	rh+zMyhGbgTA4A=
X-Received: by 2002:a17:903:18e:b0:2df:a18a:ac58 with SMTP id d9443c01a7336-2e49b6a2c86mr1689085ad.47.1790876548488;
        Thu, 01 Oct 2026 10:42:28 -0700 (PDT)
Received: from cfarm422.jing.rocks (cfarm422.jing.rocks. [2600:3c18:e002:2e11::c422])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49bd4d40esm187715ad.17.2026.10.01.10.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:42:28 -0700 (PDT)
From: Jagadeesh K <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh K <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH 1/2] meta-extsdk-toolchain: Install multilib toolchain files in the eSDK if multilib is enabled
Date: Thu,  1 Oct 2026 17:42:19 +0000
Message-Id: <20261001174220.3492439-2-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001174220.3492439-1-workjagadeesh@gmail.com>
References: <20261001174220.3492439-1-workjagadeesh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 17:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247049

1. Ship multilib virtual/cross-cc, virtual/compilerlibs, and virtual/libc
packages in the eSDK if it is created with multilib configuration. These
packages are required to compile source for multilib using the eSDK.

2. Include multilib tune configuration directory in SPDX_MULTILIB_SSTATE_ARCHS
to search SPDX document as meta-extsdk-toolchain is dependent on multilib recipes.

[YOCTO #14020]

Signed-off-by: Jagadeesh K <workjagadeesh@gmail.com>
---
 meta/recipes-core/meta/meta-extsdk-toolchain.bb | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 16fe185964..2b30d89b4d 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -2,7 +2,22 @@ SUMMARY = "Extensible SDK toolchain meta-recipe"
 DESCRIPTION = "Meta-recipe for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
 
-DEPENDS = "virtual/libc ${MLPREFIX}gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
+DEPENDS = "virtual/libc ${MLPREFIX}gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native ${@add_multilib_depends(d)}"
+
+def add_multilib_depends(d):
+    mlpkgs = ""
+    for v in d.getVar('MULTILIB_VARIANTS').split():
+        localdata = bb.data.createCopy(d)
+        override = ":virtclass-multilib-" + v
+        localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+        for p in localdata.getVar('BASEDEPENDS').split():
+            pkg = localdata.getVar("PREFERRED_PROVIDER_%s" % p)
+            if pkg:
+                mlpkgs = mlpkgs + ' ' + v + '-' + pkg
+    return mlpkgs
+
+# Search the SPDX document of multilib recipe in multilib tune configuration directory.
+SPDX_MULTILIB_SSTATE_ARCHS = "${@all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
 
 do_populate_sysroot[deptask] = "do_populate_sysroot"
 
-- 
2.39.5


