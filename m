Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95653C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 14:16:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.7074.1641305788401757279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 06:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L36Ek7dA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso20085409wmk.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 06:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mR2OVHN/8iME4RrITvLMZwxrPo49cjk6By1P3E48DZo=;
        b=L36Ek7dArpIwq5kUcgr5Y62iSX18NMIiGQjtNi/xW5VOh7dAsNqgp3aU/Xof57Z5kL
         5n2PR9t9Nhsfqaoo+zeKNE9b7usjTBR1cOjeSty9iCMrzGjafI0ux+nd22wTIi7fnQJY
         l+wruWbvksA/UhXp9btXRGY9HjDe6epocgk7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mR2OVHN/8iME4RrITvLMZwxrPo49cjk6By1P3E48DZo=;
        b=Tllre7wDQhiu49XDrlGPmiypmE/i35YpUT/1w1M8Aqf8kI9kbJj1weZXtntSsc3lTM
         ASbRlQSIDyQxGBgZFKVMVIeTgLmtrWIptMTHJazTow/FPOUAw5RSS5qeEP8peCQgWBz7
         aNJHzG0dZnRrEz2NOqOGcA0nxo0M22GWu41u9Z4B4U0gO61yc/CtJvnfrTVLEUawE9Va
         cTKMByhZvb3F69jpT5t0x9HTPrlP2xwBjsbPkBY8PfYfELvRzT/ubCuMMOVqHF6nmjt4
         1PlGdRNdaT5vrS8qN46J7d0FRgyGtTtboj/wJjeC3AaQjhNiQryZdulz+o9IDbAofwVQ
         grmg==
X-Gm-Message-State: AOAM532VYXe1pE0liplkeDkKyAzOWV3W7nEKuDsH1OUtWCwR/Wy8UDQf
	4scEMKPByhPUkjYODpa7PYZPxRqhepM8hA==
X-Google-Smtp-Source: 
 ABdhPJwrYXr1YR3Gw1s1c9M9Gqy5hX8d9bF72nWaJPRw49o/eQac+5cKYMzu5bcIGnJEuL5RHaGcIw==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr42568657wme.55.1641305786531;
        Tue, 04 Jan 2022 06:16:26 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 h204sm38270838wmh.33.2022.01.04.06.16.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:16:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] meson: Handle qemu riscv issues
Date: Tue,  4 Jan 2022 14:16:23 +0000
Message-Id: <20220104141625.1369719-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
References: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 14:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160163

In qemu, they merged the 32 and 64 bit riscv variants into one target for meson
purposes but this isn't officially supported by upstream meson. In normal builds
this would just be a warning but in OE, this is fatal.

Avoid the fatal errors for now and build as qemu intended whilst this is resolved
by the upstreams.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Make-CPU-family-warnings-fatal.patch | 28 +++++++++++--------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index c5be526b103..848dccfbe72 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -11,30 +11,34 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  mesonbuild/environment.py | 4 +---
  2 files changed, 2 insertions(+), 4 deletions(-)
 
-diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 307aac3..66fb7ec 100644
---- a/mesonbuild/envconfig.py
-+++ b/mesonbuild/envconfig.py
-@@ -267,7 +267,7 @@ class MachineInfo(HoldableObject):
+Index: meson-0.60.2/mesonbuild/envconfig.py
+===================================================================
+--- meson-0.60.2.orig/mesonbuild/envconfig.py
++++ meson-0.60.2/mesonbuild/envconfig.py
+@@ -266,8 +266,8 @@ class MachineInfo(HoldableObject):
+                 'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
-         if cpu_family not in known_cpu_families:
+-        if cpu_family not in known_cpu_families:
 -            mlog.warning(f'Unknown CPU family {cpu_family}, please report this at https://github.com/mesonbuild/meson/issues/new')
++        if cpu_family not in known_cpu_families and cpu_family != "riscv":
 +            raise EnvironmentException('Unknown CPU family {}, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.'.format(cpu_family))
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 71286a5..179917e 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -352,9 +352,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+Index: meson-0.60.2/mesonbuild/environment.py
+===================================================================
+--- meson-0.60.2.orig/mesonbuild/environment.py
++++ meson-0.60.2/mesonbuild/environment.py
+@@ -354,10 +354,8 @@ def detect_cpu_family(compilers: Compile
+         if any_compiler_has_define(compilers, '__64BIT__'):
              trial = 'ppc64'
  
-     if trial not in known_cpu_families:
+-    if trial not in known_cpu_families:
 -        mlog.warning(f'Unknown CPU family {trial!r}, please report this at '
 -                     'https://github.com/mesonbuild/meson/issues/new with the '
 -                     'output of `uname -a` and `cat /proc/cpuinfo`')
++    if trial not in known_cpu_families and trail != "riscv":
 +        raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % trial)
  
      return trial
-- 
2.32.0


