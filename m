Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.1942.1614295760094140943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 15:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J68/VAAC;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id t9so4499162pjl.5
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 15:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FQTQy5ghF4GzwyboAev69oscLXC1G0glhTxijkVcw4Y=;
        b=J68/VAAC3eXQ2/q9p0hf6gSTDPTbzqjSXa/dAiH5II86mSgGFSwettXM/oGpK92UV0
         UVkJsuvoECZG1EuOZDH1FyVqAM3Yecv8N56NfnXelQ+QGuUrPRTkrM0ycThlAmRFl7rl
         35cqrGLhTIFBbdbf6iCzNJf9yfMiMswprEUvCux3qHUyxjrQiz/jbrbanfQ1YOzmRX2P
         mVO+UlLyosOdGn3xG7sNI0hKNFzaZOL7e7lOZhcQTs37mfpGF21WcoQhGxOca5PSiGnv
         6/T2ZcXbBN6+f9T6HRp28qmROzNRAyr6sArIEalaf6LZa0fqc5ar0bSgjGLU8tL0YcXo
         mKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FQTQy5ghF4GzwyboAev69oscLXC1G0glhTxijkVcw4Y=;
        b=UuSw1Eb7bm0C4i9se9AqNtX3YBPabwRl+5jYQvhcSbQZYSxplLGaXyUmkQY4ujwvTO
         edTM9aoq8BqU+jdNTMfkKv0+K20oomHjXVQwJDcWwdBUEFK4ShiuNxCKh7BnJ6U6xYre
         TsPA2y9Y2EI/BlBH07rPegkcszz/8sTO4Ju8vMcCeIs7g8iXyAR4eLadRVUKTr8rz9+T
         gOsfTRlPa8JfXsXWhM0tgR6kpxj2nS64d9LwwA08FIqtIG83MK2cx3pidMLe3rGkvvic
         rVTyeHUd4q+PVjgrGia1kLZpJ2pI3w+pQrWcl1PV3z7+2hFbjDsjxZGEKzs+t237Mead
         hXnA==
X-Gm-Message-State: AOAM533j8AbPC9V0389poZhCM1Fh+ueqLIfoAmkFeIogGIGDfwA1Mlte
	GXoqq2cwi9zGfpH4LDwiJsoCwhOCDsZVJQ==
X-Google-Smtp-Source: ABdhPJykse8CDE64k8l9vki1Bty635yQfKK0atm1d82EaybW4gN2ERiAPu4QM5uvHlniPL2+uSIfzg==
X-Received: by 2002:a17:902:8697:b029:e3:9724:e260 with SMTP id g23-20020a1709028697b02900e39724e260mr419007plo.31.1614295759310;
        Thu, 25 Feb 2021 15:29:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id n21sm7414208pgf.26.2021.02.25.15.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 15:29:18 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] oeqa/pam: Need shadow installed for the tests
Date: Thu, 25 Feb 2021 15:29:16 -0800
Message-Id: <20210225232916.1646170-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Distros may not use shadow for login manager
secondly login --help returns 1 only with shadow provided login
utility, with busybox it returns normal 0, the testcase clearly
assumes shadow being part of image, therefore add needed
checks to ensure the pre-requisites are met

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Check for dependencies instead of trying to run it without shadow

 meta/lib/oeqa/runtime/cases/pam.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index 271a1943e3..a482ded945 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -8,11 +8,14 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
 class PamBasicTest(OERuntimeTestCase):
 
     @skipIfNotFeature('pam', 'Test requires pam to be in DISTRO_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['shadow'])
+    @OEHasPackage(['shadow-base'])
     def test_pam(self):
         status, output = self.target.run('login --help')
         msg = ('login command does not work as expected. '
-- 
2.30.1

