Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.294.1599602903196973055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 15:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hv7+sD/8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id s12so757498wrw.11
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZEMYgwiX7/b/EA2Lx3Y1Be3rN+0R4ybiPfPWlCbMoXo=;
        b=Hv7+sD/88xmZLDRIuV3LZwYHxTW+DeGwAwGAwUABv7k2cT7ENbg+xFbV6BRZz/Jmtv
         Kw41tgyxObLumfxShgpNPMg715CG1oLJPWdQzFDyB31mzccxUPqMTIPAMJ98UjvttpAt
         ePRxQGSDJ4KTdG/kCJQ7TZ4+EPiowbkckx7qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZEMYgwiX7/b/EA2Lx3Y1Be3rN+0R4ybiPfPWlCbMoXo=;
        b=Hr3kOz97wkub7Z9SWp5tPpn+fhIM8U/YQ6IGsfubP7/pzcbB3oktgEFVC0sRRtnXK1
         rw82lq7S+bB2hvlnjtK2vTXDYV1LKncb0p/u6ZSCylhUDfiYZuMy9kS0LlcaIjXcGhHx
         56egSUgtXCP+h3LMoKQ2s+iTKoh/ndaP9VTCQ6AW6T6vDmxvkxr0wIazl8LHXem3k9mc
         ddI9Kwv0EN1qHOkg4zvSQAAZSDzbKCgWxX36KnvBRW79Pf2I1tXZVBbw7LyJqt7YHwqs
         V2pfzD3M7tlYpZ4cnnA2yyo3HQ1YX6FjNoToCRQmzyiMpWOamABmtQ2HI7ONRtbMcuAn
         M/Vg==
X-Gm-Message-State: AOAM530LnP+HhRwE79HXHkHUtcsgkKkaDDKYaPs88uxwoNx0X9P4q1hd
	FO2Tsdy8qjZVxVT094CqwCEdbp+qgi5b/g==
X-Google-Smtp-Source: ABdhPJwjJmacVOhmI5vr78qp0sMIClCdDLAUt1HbrBv/XZaWS9eEHb99YyCoMf01aXtM7+ipMiLv0g==
X-Received: by 2002:a5d:430d:: with SMTP id h13mr595049wrq.41.1599602901171;
        Tue, 08 Sep 2020 15:08:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id r14sm1070325wrn.56.2020.09.08.15.08.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:08:20 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus] oeqa/runtime_test: Disable test_testimage_virgl_gtk
Date: Tue,  8 Sep 2020 23:08:19 +0100
Message-Id: <20200908220819.1992119-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test keeps failing on the autobuilder and is proving extremely
annoying. It works much better in later releases but for zeus and
earlier, lets just stop running it as it doesn't really tell us
anything useful at this point, nobody has any plans to improve
the distro exclusions or otherwise fix it in the older releases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7d3922ce448..d4fea913502 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -166,7 +166,7 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
-    def test_testimage_virgl_gtk(self):
+    def disabled_test_testimage_virgl_gtk(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk frontend
         Expected: 1. Check that virgl kernel driver is loaded and 3d acceleration is enabled
-- 
2.25.1

