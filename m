Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.3467.1613629307545345938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 22:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p37kXNT0;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: wesley.lindauer@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id t62so1150829qke.7
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 22:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LAZNQacDi0uBpuE+IDVqXFEYgCPMadiBAr7SVjMCyB4=;
        b=p37kXNT0/wjlUpHvklV+fFPs98n324X6UK6rPcFeTA8bqz7EaOuta3Kxz6vVlTuANl
         kUGhlxsGCFMc0aVaAslg5q85S/o1Do3jE9yWC5lfZkvWd8p/t+0+rD4Xalc++FjGOH9v
         vuAh+XMeUmBhXwT4s2PWlIUE4Wt214AmtUzL0b6hXS5FBeGvGk0y6BfC7qGYj74c0E6d
         z3qBQlG7KLTnHk5i7fRFg90SEWqnjgTqebOhl8qtJnnCkll6rQJQEAIW2BxFe1fodm+F
         5njNOJWA5Mj/Pgiw8cAoYG06kazu2JzdXu3N72vtP13FuVILY/mo68Th3TbYP6DzlPLy
         YQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LAZNQacDi0uBpuE+IDVqXFEYgCPMadiBAr7SVjMCyB4=;
        b=GoNpl/Jr/9p73sswzZxNN641f4AvW9l9RHNQr+qKUhN0GdGluMTTYmk3eW83/VdmCd
         bcn97zjXIX+mNoOtBhoRJqKk1ie0KUxCTu0dzaniaZC7OxBIywY3VKb9M/KHFrfBz6F4
         QQFp4rAasOmKpSk56d1kcOnW/5sknP6KpC0ZRKPkFzwd0PrQLgFIDB2lahHPzoK5iPN5
         5v339xou0AlJk4UbyF/PnLgEgItQST/BCf5LPVVzBiXcVrIXC9VwAx5k+sGNOA5xXld/
         X+zpYYAo5/Tb8ornWK+P/HSkD+Uj2UWat7YreDlno57bcgiC6b8lBWROpjVXinDlb7NG
         e1Tw==
X-Gm-Message-State: AOAM531UQNLSlGgNWNFVa1nAiy/QQvqMQ728gQi3m34A0wspIQUbAr/i
	lymXgw95pd7g2e1Kc3JL2Z3S06sQcoQ=
X-Google-Smtp-Source: ABdhPJxPsX9VKgUsX4QjtUNjcK7sKOkzscNkb0I/5sgLWXZ2WuWj09PD4D3No3Le+K6oiN24D2DXww==
X-Received: by 2002:a37:e108:: with SMTP id c8mr2859293qkm.250.1613629306510;
        Wed, 17 Feb 2021 22:21:46 -0800 (PST)
Return-Path: <wesley.lindauer@gmail.com>
Received: from nova.wlindauer.baselinux.net (cpe-65-24-166-29.columbus.res.rr.com. [65.24.166.29])
        by smtp.gmail.com with ESMTPSA id y190sm3329290qkb.133.2021.02.17.22.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 22:21:45 -0800 (PST)
From: "Wes Lindauer" <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wes Lindauer <wesley.lindauer@gmail.com>
Subject: [PATCH] df.py: Add feature check for read-only-rootfs
Date: Thu, 18 Feb 2021 01:20:55 -0500
Message-Id: <20210218062055.2465-1-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Wes Lindauer <wesley.lindauer@gmail.com>

If the target is using a read-only rootfs, the available space on '/'
will be zero. This will cause the test to incorrectly fail and skipping
seems appropriate in this case.

Signed-off-by: Wes Lindauer <wesley.lindauer@gmail.com>
---
 meta/lib/oeqa/runtime/cases/df.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index 89fd0fb901..bb155c9cf9 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -4,12 +4,14 @@
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfDataVar, skipIfInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class DfTest(OERuntimeTestCase):
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
+    @skipIfInDataVar('IMAGE_FEATURES', 'read-only-rootfs', 'Test case df requires a writable rootfs')
     def test_df(self):
         cmd = "df -P / | sed -n '2p' | awk '{print $4}'"
         (status,output) = self.target.run(cmd)
-- 
2.21.3

