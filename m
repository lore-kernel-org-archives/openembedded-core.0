Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.2934.1588845024441941228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 02:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bmWpgTvy;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id j5so5578620wrq.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 02:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BLeKXAJw/i7KxnXZXMnUhmKseV8fGljVsNDwS7PyHTw=;
        b=bmWpgTvy2THqs3yAbT9GDGU9msPzpWDmyql1XtvqbIfmfaIO6vGWp+UP/B3FLFonmK
         o5lLccZ6pqwT9HpiKPFNwBj4OEGoo5N1c+0UW7Fa3kg+r9A9Rc3QnxZ/7TSl8kqnq4wt
         q982y2HqJitvBi2Ach65lL/WyI5ezVjwWa2pQX8Wy+NLwVma2q0X9aQs5tXiR+WA6Uo2
         bB4SN9rXqkzhtK4GuQhSomhZyEt6FlahN0FDtb6T//99KtHlHe3X8re8DU8Ezg+yu225
         ypnKWo+79pge7rTI0VzJs5p+gwybzzEXUFEpFbfyvo+hh1NDDJg00xIFagHkFXr1WnWa
         kEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BLeKXAJw/i7KxnXZXMnUhmKseV8fGljVsNDwS7PyHTw=;
        b=ZipuVZv07uoqZtcV+c/J6rKvIali/xW99Z3PnJry8pp/0OYwX6YvjYVLZsYo3kUiFn
         MGtBbwj1ZQR57pbZgBPnMu3N5pBpTZaFzT766vrBMnvs1aMwUG+qM2jIzWK63cbPc9+x
         1i36Iq9k80QTRW45acOztl4uvTvCKLFLsTQXDdU4FONtoCwn1XZCnzIq5JErqtp60TIK
         MMVkyAEjzD3PA5gY6n8/LuX2t6LtZQQemCcJAEvb5APBkwGVRBuJJyUxDX68lLGOR3aM
         f6dibXIuDpwiUBUV1V0aQITdr7LCmjaHgZVuqncRSsKTeL1dFJvm2DOLae4hNsVdt0DA
         PVfQ==
X-Gm-Message-State: AGi0PuZQ8/A6EuF/xaftH1uFCUs5S2ST5X20+L84ZbdDXUnoBeTCfxd+
	q2GRiKoisc153nE05fNl44wlTzt4
X-Google-Smtp-Source: APiQypKGuF97i3bJGZLWLpzomAAXFDck2aHVV95Q9aJ+1c7G+CJIn8wOtX9odCQmR2CD7G43oMHoRw==
X-Received: by 2002:adf:9545:: with SMTP id 63mr15736783wrs.57.1588845022765;
        Thu, 07 May 2020 02:50:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id x24sm7698166wrd.51.2020.05.07.02.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 02:50:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] virgl: skip test on Debian 9
Date: Thu,  7 May 2020 11:49:47 +0200
Message-Id: <20200507094947.27047-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Debian 9 has an older version of mesa, where dri drivers do not link
against glapi explicitly, which causes problems when they are loaded
by newer mesa-native:

pokybuild@debian9-ty-2:~$ ldd -d /usr/lib/x86_64-linux-gnu/dri/swrast_dri.so |grep undefined
undefined symbol: _glapi_tls_Dispatch   (/usr/lib/x86_64-linux-gnu/dri/swrast_dri.so)
undefined symbol: _glapi_tls_Context    (/usr/lib/x86_64-linux-gnu/dri/swrast_dri.so)

compared to Debian 10:

pokybuild@debian10-ty-2:~$ ldd -d /usr/lib/x86_64-linux-gnu/dri/swrast_dri.so|grep undefined
pokybuild@debian10-ty-2:~$

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 60cb2e01a6..09d3de7aea 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -180,6 +180,8 @@ class TestImage(OESelftestTestCase):
         distro = oe.lsb.distro_identifier()
         if distro and distro == 'debian-8':
             self.skipTest('virgl isn\'t working with Debian 8')
+        if distro and distro == 'debian-9':
+            self.skipTest('virgl isn\'t working with Debian 9')
         if distro and distro == 'centos-7':
             self.skipTest('virgl isn\'t working with Centos 7')
         if distro and distro == 'opensuseleap-15.0':
-- 
2.26.1

