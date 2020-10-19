Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.15662.1603122186820463775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 08:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GVtQ4Mo3;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id ce10so14576082ejc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YDC2kesL0K//PEeU1wAu8zWcs40rVSAu9SY/Gczdcec=;
        b=GVtQ4Mo3jKWfVROHt1dhzBa93rp6ujOdvDIPbb6CR2SOj8PVqT4mXaL+Q8QNSqU2vW
         X3kKjRy1etCO+DYZgJqXhTJvOlmZ6xqbpGehq8p5JFCAzL79lChez2eWKahRXSbhHnm6
         1EoY0D7/v8+XYXzFpMeutj9A94pDFC+TtNPpZTLoSd9DM0AnjoxyivXyjDtIQKErR2i0
         +4WjpbXKc0DA4kwucA2cA8sQ27tlnSbOBnYWY4K3+E5cjBF3rxxe74AzxR78OO+q5wC8
         zpQgK25dDtzGNGF+4giDs+IiSC2aIDfg83Sr6Wh4DTS6eKeCekm431xgpJUG9cYpTwfG
         dVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YDC2kesL0K//PEeU1wAu8zWcs40rVSAu9SY/Gczdcec=;
        b=ZuT4JbufooAN6+UmKXMs6Ft48OKiZevQ7uv9O6pJsUn3cfkCn56Yp4eNRg9Rf0HG9V
         JS+UC7ZYC5/XlmBZCgyYcbQFQ2hs6SMljlBT7R0Cdb/5AIUS+Bu/kH1g3dYGNsaKQBTy
         3joo5KF1zeLYgk9R8/G1fn7tXeH1W4NZP2priJ3ysorO/vm9smBskVeFrZ2bS0JCp0Nv
         Pk04o2DIHsvndz3Oh+zw1lmcnRL/AV7ZlC2g15/d8IYBYAirVKvR3fWPG3g4jU396xsx
         U06oVsJv/amlZHFOMKYIHhA+t/4/IFlTBPMr5jNBDhFiZ7Yi4AU571/koIDLHBH9gtXr
         Ew+g==
X-Gm-Message-State: AOAM533cC4HzdJA3F71UCFmqffZ/tKTAdzU8B0lpUjHQOSDBkTTFx9Ce
	fAyR94Rg8iolw3VPfbVgNX5IZF1z77I=
X-Google-Smtp-Source: ABdhPJwVtW03Vm8PM61JSscsZe/DXhfTbSQ3TWQZc+O/+cLBTRXVtsSx3+cg3YIZztF8mUBflZbNoA==
X-Received: by 2002:a17:906:1484:: with SMTP id x4mr464685ejc.81.1603122185166;
        Mon, 19 Oct 2020 08:43:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id o11sm497754ejd.60.2020.10.19.08.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 08:43:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/4] selftest/virgl: drop the custom 30 sec timeout
Date: Mon, 19 Oct 2020 17:42:56 +0200
Message-Id: <20201019154256.9519-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019154256.9519-1-alex.kanavin@gmail.com>
References: <20201019154256.9519-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is occasionally reached on the AB; I am not sure if it is due to
host overload, or guest malfunction, but let's use the default 300 sec and
see if it helps.

[YOCTO #14097]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index 892c19c848..144decdd6b 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -13,6 +13,6 @@ class VirglTest(OERuntimeTestCase):
 
     @OETestDepends(['virgl.VirglTest.test_kernel_driver'])
     def test_kmscube(self):
-        status, output = self.target.run('kmscube', timeout=30)
+        status, output = self.target.run('kmscube')
         self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" %(status, output))
         self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" %(output))
-- 
2.28.0

