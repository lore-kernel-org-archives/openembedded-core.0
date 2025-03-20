Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C828AC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7674.1742478014131560381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DnGMb0FN;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so8678105e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742478012; x=1743082812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQVguQN5BhOUNFu6c7wqZqaa1Cgikpq/Vrxg2JJ6fT4=;
        b=DnGMb0FNX+wJZ3lMpOKjoiBXr0xM4qEHvMVcbF+JRGW3L+vVvnoDYFT4Hb1YlXNFSK
         vz1L63ZmB6BSNeDt6tHBBsFsDsXgVWrurk0bg3TEe+ASxCvNf5xhRGrIr9jMVTbrIBYW
         k9fSqjpGuGmsEZHlxC080zoG6anvJtQn58MJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478012; x=1743082812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQVguQN5BhOUNFu6c7wqZqaa1Cgikpq/Vrxg2JJ6fT4=;
        b=C38Fjo3sflhTr5H4T1j7Agc2anUaL06y7rfdbAmW7VD0qupBE4gXqh4ZfC1vHOQsvz
         y5U1mqn/zcKW22PcySJ6LhP/VloF/yrBVB9Epi748diEdqmQ/yHTE2Z42zGwKscfclOP
         OfbMABPA6dpff1P99cQc9jW1l4nEKyFHlvrSnJlm2ZxO1/ffT/Mi0DZxkoVe6RyrWmSa
         3fFl+OGp5J4daar93pSU0dcmcVGi6f+MBs1vD+kXdNut19k/UqAWKG4WKSDB4HE1baBB
         i5v+JzKWdSgVC0i6Ve67Kevf6kl1Ghm5w/6dxFsLIs6ScMMy6QoOq1RiPTMDCwBpcOKV
         rpNA==
X-Gm-Message-State: AOJu0YxZTPl9Ldte+UsWaDbLgVYQ3TnIvEw13bv8XR47k7l/ApK4eqDT
	EFhlFsc4A60oqqaQubrOhqs1RamBr4rM2VhR1ne7HwAFbfvInbsh1ZcfACHW8ueHDu67gxzbcuM
	5
X-Gm-Gg: ASbGncvKBm6GWqwz/A1CbT6rxRm3R3G9x8PVSg6y/irEbUVDxCxDxOfuBtEb0VMU7ze
	Ds8pLJL6aylgWUQrdh5DhZDsF6Q44+NJXnfpGYDG841dWsv48YoZ1Ite4ra5ucbQu3MeOPRGC01
	wIGNfu8h2Zjl4f80x7C4O7J83N2ylBKc649mW23gjIsSjTOsCWxwBkEf70A7nYW7/ICnYzfBU0H
	Z/4thcarXhI1qtOd/QJ1rJ8rCUm/Og0StqBhz6gBynBChR38FjBblNDvkaYRt5vnkv0n2ahVIHY
	J9M0Sj8RW++CCN2Pde239+hU2Tg+3yZv45xbaIUDlbTvc0rO+DAQ5KptwwiULLooPI3YMJ6Y5m6
	r1FSLW6XeVynHWFKhMeQxguNpqbHotVmIqPPbycL3GAaw5M2kZh2u4Bkd1A==
X-Google-Smtp-Source: AGHT+IEifXyTZqauuj+PxxlFopvly+Q1jdrQT5+agOJvlWDHPm3cc6pNSePHASpNgCe3N80+VPSoig==
X-Received: by 2002:a5d:64c2:0:b0:391:1458:2233 with SMTP id ffacd0b85a97d-399795a7ca2mr2599849f8f.11.1742478012295;
        Thu, 20 Mar 2025 06:40:12 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f8679bsm50069995e9.40.2025.03.20.06.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 1/2] sanity: Refactor "C++ toolchain support this flag" check
Date: Thu, 20 Mar 2025 14:40:08 +0100
Message-Id: <20250320134009.2631475-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213389

From: Yoann Congal <yoann.congal@smile.fr>

This can be use to check for other flags.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/sanity.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1bae998f74..dc317e846d 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -607,9 +607,9 @@ def drop_v14_cross_builds(d):
                 bb.utils.remove(stamp + "*")
                 bb.utils.remove(workdir, recurse = True)
 
-def check_cpp_toolchain(d):
+def check_cpp_toolchain_flag(d, flag, error_message=None):
     """
-    it checks if the c++ compiling and linking to libstdc++ works properly in the native system
+    Checks if the C++ toolchain support the given flag
     """
     import shlex
     import subprocess
@@ -622,12 +622,12 @@ def check_cpp_toolchain(d):
     }
     """
 
-    cmd = shlex.split(d.getVar("BUILD_CXX")) + ["-x", "c++","-", "-o", "/dev/null", "-lstdc++"]
+    cmd = shlex.split(d.getVar("BUILD_CXX")) + ["-x", "c++","-", "-o", "/dev/null", flag]
     try:
         subprocess.run(cmd, input=cpp_code, capture_output=True, text=True, check=True)
         return None
     except subprocess.CalledProcessError as e:
-        return f"An unexpected issue occurred during the C++ toolchain check: {str(e)}"
+        return error_message or f"An unexpected issue occurred during the C++ toolchain check: {str(e)}"
 
 def sanity_handle_abichanges(status, d):
     #
@@ -802,7 +802,7 @@ def check_sanity_version_change(status, d):
     status.addresult(check_case_sensitive(tmpdir, "TMPDIR"))
 
     # Check if linking with lstdc++ is failing
-    status.addresult(check_cpp_toolchain(d))
+    status.addresult(check_cpp_toolchain_flag(d, "-lstdc++"))
 
 def sanity_check_locale(d):
     """

