Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD709C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 18:21:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.1972.1742408480031186099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 11:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vWp+1uOC;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso52099115e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742408478; x=1743013278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cR3nIwneNsMMvX5oylv3KCQsPx8Evyx1RvcqpSxRmVw=;
        b=vWp+1uOC5PRr5lCPnQu4DQmNVCoDsWpohk2mZlLxIEIozRb3EupE3fbRA1ObyQcCrT
         jMWohVbv3bbMQPBuTFrb910tMFsMJUN5Q4tVs/GHOgSJeNSUyA6ok/wsGxyHBvPJatp1
         K9bles8sckZQ9CE2G4gaDZxh9XrsgNmh4w+hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742408478; x=1743013278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR3nIwneNsMMvX5oylv3KCQsPx8Evyx1RvcqpSxRmVw=;
        b=JJtWKDDjKWvDg1xo56VHbYOw+Cp5ZA/ZrAmI3f+F5bBJ92f7fJamU5X3iNEuDrazTn
         fOtyX9gzXwRMfcfwJtCgbaSXNEudWI/POk6YviM5TEpzL8HtfqB/dxQTJoG0sUgbUFDk
         AEDgR5m6Za8/mwzWbFtlQ+jSTEeCvQV84x5Eek/zjE2f/f9IwbL2eQ5+K06TATNoOwfI
         F1+1/UYnmruLnZCO7fUzACzuBNZSAvfg+Wl1aLkRjXI2c2EfdSIDXhIz4DMt59uoaQuO
         vQcXQ+KrhtT+paZEFLkeUksezsHQjmx5qkV/SZm60VB/NoH+ACy/ESaAaeaXB88nB1Fu
         LjDA==
X-Gm-Message-State: AOJu0YxzzkXWIQb3RwELe+ibeH7goMOioTpxDsm0pVTaUREBrCmLICvf
	RzErxYJa/23PlfTmThWgp1jiIrjS67hSU8KkJFLJNWeUJI5go6stGNg+bXA+kmbnRQZs8iGRSV7
	N
X-Gm-Gg: ASbGncsZlB+otfEmHSsE6A4RRGO7wpQN6FGe2uuX9ghj+QQURhUGqDDe1mewNYvihgs
	HzA6/ISNlqyJPAdn4sdjUaG6SvZQCQhN/Mdmo3Pgmx/nFZ0+sNlE2UnlFlpKt9Hr2dj9zIeltFk
	rKlmGcYnHj3SVmp7/pRDefZNbB1Upfl25Tg31BQLcUf+l8U8yCemmTH+xFB19yoQ89NzgPW5jg6
	VHVR9FhglWdkOo31eou+OZAUcz2m3MCD7pUAVA7DOP3WnNgT4wJCuVHPxz1e5eSOLAiBIgDcQUI
	gExnEeY4ELDGyUT08wQgQNCNmm26z4isAwmuao3OGUcQhVHOuKDBCkKktxXGnShrPK8pqTtvx1v
	2AcRme8KgzRAreQnNHKA61Amo6zqTaUf2vNvzE2i1MQtVy9+mWG6f
X-Google-Smtp-Source: AGHT+IG3yGvQxtFkCElSQFARiLeTESjUMH7JuC16gEZ6Xs8sNOdg19uFNkmWt9sp33dlk79Av8vYOg==
X-Received: by 2002:a05:6000:2aa:b0:391:2ba9:4c51 with SMTP id ffacd0b85a97d-39973af9380mr4028828f8f.44.1742408478006;
        Wed, 19 Mar 2025 11:21:18 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a02-8440-9203-3273-cb18-bc8e-d57a-ef3a.rev.sfr.net. [2a02:8440:9203:3273:cb18:bc8e:d57a:ef3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm22023471f8f.51.2025.03.19.11.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:21:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] insane: Check if the C++ toolchain supports --std=gnu++20
Date: Wed, 19 Mar 2025 19:20:29 +0100
Message-Id: <20250319182029.675932-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 18:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213348

From: Yoann Congal <yoann.congal@smile.fr>

This is needed to build nodejs from meta-oe. Check this early to avoid
an error later in the build.

Fixes [YOCTO #15804]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
WARNING: as discussed in previous threads [0][1], this will disqualify
builds on Ubuntu 20.04 (its g++ does not support the option)
[0]: https://lists.openembedded.org/g/openembedded-devel/topic/111740469
[1]: https://lists.yoctoproject.org/g/yocto-patches/topic/yocto_autobuilder2_patch/111757761
---
 meta/classes-global/sanity.bbclass | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1bae998f74..5783b92b26 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -629,6 +629,28 @@ def check_cpp_toolchain(d):
     except subprocess.CalledProcessError as e:
         return f"An unexpected issue occurred during the C++ toolchain check: {str(e)}"
 
+def check_cpp_stdgnupp20_toolchain(d):
+    """
+    Checks if the C++ toolchain support the '--std=gnu++20' option
+    """
+    import shlex
+    import subprocess
+
+    cpp_code = """
+    #include <iostream>
+    int main() {
+        std::cout << "Hello, World!" << std::endl;
+        return 0;
+    }
+    """
+
+    cmd = shlex.split(d.getVar("BUILD_CXX")) + ["-x", "c++","-", "-o", "/dev/null", "--std=gnu++20"]
+    try:
+        subprocess.run(cmd, input=cpp_code, capture_output=True, text=True, check=True)
+        return None
+    except subprocess.CalledProcessError as e:
+        return f"An unexpected issue occurred during the C++ 'std=gnu++20' toolchain check: {str(e)}"
+
 def sanity_handle_abichanges(status, d):
     #
     # Check the 'ABI' of TMPDIR
@@ -804,6 +826,9 @@ def check_sanity_version_change(status, d):
     # Check if linking with lstdc++ is failing
     status.addresult(check_cpp_toolchain(d))
 
+    # Check if the C++ toolchain supports --std=gnu++20
+    status.addresult(check_cpp_stdgnupp20_toolchain(d))
+
 def sanity_check_locale(d):
     """
     Currently bitbake switches locale to en_US.UTF-8 so check that this locale actually exists.

