Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F7BC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.7663.1742477999486903923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OSWmkYcN;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso7096065e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742477998; x=1743082798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQVguQN5BhOUNFu6c7wqZqaa1Cgikpq/Vrxg2JJ6fT4=;
        b=OSWmkYcNRN+3+WZNzJd5C9jU6nfWmmilrlnV52dyjwjMnHyN76RFwntK+KKh0WCWwp
         SXEoErDXiIGb9+YKXjRWQpXrgkfg9Z7CWW2yqJHBlJ+brSdBJg6Dh2btkO5ddLH7A/kf
         QZ51CgTIN7Hwl8W3/stqUwzRvDSYr0oKMejRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742477998; x=1743082798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQVguQN5BhOUNFu6c7wqZqaa1Cgikpq/Vrxg2JJ6fT4=;
        b=npyofmtNz0yEed3xO/Mfnk0Qyb90M2tTGPW1CSwaaTqPiNka0wjo9cvGM1dD7I6SIs
         MpZ/alxqOxFGS/UPKgS3V8X0RZ29H6U5is1EZRovYs+XZi4k7XrBj0gPsFZr2Y1+DUEI
         TGvssOR13OfqDe6zGbjzLepPrX2/UjDLvNILbdYSTwNvU8RKTgaolkJIo/RhVx6vGCP/
         qXqTANKIRfNdQSRVSNfkzdT8Pd8qFtvNkEf3jwQjVCgG1qzZHTIh3h3AqP1pJxbIfuw0
         NdwE3cTAOnsQbUBQgokZgxQIoWe+wQ4Qt035o5zPzFDYouDpdER5m8FSEgff9nNCbK4S
         V+9g==
X-Gm-Message-State: AOJu0Yz3HOLyrAglazHAjd6huKlBVc77veXkkAEbG37OiZHqRm51/2Oh
	FfAQpMho+nT1/Tbf/6EkXnPJm7Xj4an5RmIWdGkU83tXbJFIXK8Cca4GlhLd+EkDMrhxJ9Jeqs+
	o
X-Gm-Gg: ASbGncvxwIxzBIymm8NB3QWWPvTQpQjBq3TjcFnb01ardOy+E0rXfRSQtSsxFpNIg68
	qfjIGpulvOEqbSuOJ6Ei9wgWu5Zhp5mAoP2SNejcWeNNep4/5YXslpNtjqOusduK3AJw13HHs2+
	I7clTANl1LUWeaoq8Dcxffn4Q0tSnS/dP8/KKLQ8Jbz0aV/uRHInC0N6UyEi6bBGx9MgYUg+BLS
	+86TOpg8yRtHs6sbdukkb7m8OCPtlxsDhGUlN1XdNSlLJatJcW6a84WruiwpY+TFiIl8Cu1rZfa
	C9KnNjxWsxVHTNzca9e5SJAYJF9FlKU2R/vvM5TaslYXn624sJk6AzjDw5uzkgtxQheDxiRS5nP
	/phba+afNRwwwhpy3MPY6ReWw+PEPUqfka4j1W/TvdCWAygJNRP2VUDpKhg==
X-Google-Smtp-Source: AGHT+IE/WXVOWLUtgQaWrMKNR/Z9Ce9pj/xkXls+rgK8TFK9cQ5sKCRRBZm1W5s8LzhkLDqUVrQUGw==
X-Received: by 2002:a05:600c:1991:b0:43d:1f1:8cd with SMTP id 5b1f17b1804b1-43d438691ecmr42040655e9.24.1742477997564;
        Thu, 20 Mar 2025 06:39:57 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df320csm23651274f8f.7.2025.03.20.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:39:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] sanity: Refactor "C++ toolchain support this flag" check
Date: Thu, 20 Mar 2025 14:39:45 +0100
Message-Id: <20250320133946.2631311-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213386

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

