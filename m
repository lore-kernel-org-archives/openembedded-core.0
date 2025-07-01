Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283FFC8303C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:34:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.4664.1751355258732052439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Uyeo2p5Z;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so28371231fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751355256; x=1751960056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCK3oQ8eKM75QM800h3N+9mFwXG1w0Pafrr0NA1MpoM=;
        b=Uyeo2p5ZoqDKacfZQv/UXHLTR2FktHeEiAY7MZZNK8NpHnB1XfdHcJAVKjOqJfIdIT
         wiemNYNZbISh7QrAtGUvar+KhBFt9XKfcXhYaZ3IYWn6d3M/daQmz+CHVboRktBFp9YK
         noS8YVlZwZX91MuM+g+iFgAoNgEGxD/p6OravTYm4BckEGDDywrjouE4XyV8rCsCHZxs
         bQ4pwX5VlpFgQELu5EIhdCQMwdt+N+/cLtdTJlVUZ7LjdXldNapa6L8hFPoTFAhdDn0v
         X7t7H1cx+U6/Meb0RxffeK98BfapHDuToiWMZbmfl+FPNKCSVryWTrG/sLgiA/U5WM8j
         Cv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355256; x=1751960056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCK3oQ8eKM75QM800h3N+9mFwXG1w0Pafrr0NA1MpoM=;
        b=VlKSh6BV7L4aQdXzOAYljCOBGiCqeESDewb45L7T472ezvUMDwkVXaiUwdmDdKmNZc
         sG0pfdKbx8dmgb5OCD2aaZaSfKFzD0UIy1lLCVChiWHZmliwO2T+Ag3ggecVEqBmA3ux
         gEwYE6We52WgYHm2Dq+Fvf+89J+QYF/2hUX5GOctFg6ncGye1gJyE+Q76Aei3XPE0gbm
         Svh/TejZBVufLqUaylz1kBArvQxJEnS3s81R7B6W4MPRPkmAlXlN58wC6P1CfwGgVmu1
         dKAyQfqqtv2ZQVVcur5Y/0DbHXLOfDLfeQZeAfRFO2Ugm9DZr14yeM5LcOzx9oSLGLkC
         zOhw==
X-Gm-Message-State: AOJu0YwMF11mOy46LNEEJS2834GuGXCodTJMRVPy1s623xYL6oFZgAn9
	HEynkv+l2/ayTOl3f1/NtTQawwmO6CCW4uxdxdoxY2APQP/3gleBPH/yBX6fIOTbRxH/C3sWHFd
	4pkRLAX8=
X-Gm-Gg: ASbGncs7SDIRdrZL4U80/Ur8YpvS+S4+fhYTsKm302EkoC3gpqju0HMKmGHIDDCaVmQ
	imNDfU2oAVVsP/eeVtp0xboqz6wllIUG9J10n1IvhXL6UFSEAfpNWFpbeqBGHub1sq3WmPGWvhA
	pDhi17KN4z/5cp+vhF+q2/jm45YXxnWhidCLaDxe4ZH9diy7pMUHNIcHY9WqOwzZBNNYpwn9bRe
	gMHGd+A9actQpYg2LFmvkiRLwuTgWDMPbiQt5CDW88WhcmmEPNSB7p74l27eNIv8E7dUx2arJq3
	99COg7bxuuIfaxF+VNsMbvZZngobXmt/monotScdT8XXIJVLCMYt+HCa3PcOrLHUIFLhgnJU+LA
	xoTVeURpiJpJUDIHO2BHKuEbGNyejQZL9NKOVYeE=
X-Google-Smtp-Source: AGHT+IHpxoaj4yAqCnk7N8JYxI21JG0eqKF9GiDzzdpQKRkPcYxj43gItT8gY/D1DZUAkOF0xhE9Dw==
X-Received: by 2002:a05:651c:4207:b0:32b:a8f7:9176 with SMTP id 38308e7fff4ca-32cdc4574f8mr41864441fa.3.1751355256357;
        Tue, 01 Jul 2025 00:34:16 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2dead99sm15268581fa.22.2025.07.01.00.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:34:16 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 3/6] oeqa context.py: use TEST_SUITES if set
Date: Tue,  1 Jul 2025 10:33:56 +0300
Message-ID: <20250701073359.979368-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701073359.979368-1-mikko.rapeli@linaro.org>
References: <20250701073359.979368-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219550

If build target has set TEST_SUITES, then that should
be the default test modules to execute. Fixes testexport.bbclass
to run same tests as testimage.bbclass which already
uses TEST_SUITES.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/context.py | 7 +++++++
 1 file changed, 7 insertions(+)

v2: added check for unset TEST_SUITES variable which caused
    failures in autobuilder

v1: https://lists.openembedded.org/g/openembedded-core/message/219380

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 9313271f5865..46de9135c179 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -179,9 +179,16 @@ class OETestContextExecutor(object):
         else:
             self.tc_kwargs['init']['td'] = {}
 
+        # Run image specific TEST_SUITE like testimage.bbclass by default
+        test_suites = self.tc_kwargs['init']['td'].get("TEST_SUITES")
+        if test_suites:
+            test_suites = test_suites.split()
+
         if args.run_tests:
             self.tc_kwargs['load']['modules'] = args.run_tests
             self.tc_kwargs['load']['modules_required'] = args.run_tests
+        elif test_suites:
+            self.tc_kwargs['load']['modules'] = test_suites
         else:
             self.tc_kwargs['load']['modules'] = []
 
-- 
2.43.0


