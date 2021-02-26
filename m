Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.13151.1614361674966932401
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 09:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QwGDJCnz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id m1so8548918wml.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 09:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0F60hOt0FrM9fbVW6yAqIIyiPpwultL1t4dfG7I0yc=;
        b=QwGDJCnzOpfUHOSeFFoUtmzZaGf4IM5ZgvA/1WP9zGAFy56aHMWFaNVxbMs5DKCsz0
         Ir5o9hbOmjWGlBw0JD6X3tZlNSVOrvfjtO8jkaL7gEwML/y79zl6A1Uw/lmuwlD6qfUs
         ENt4PRjqXt2SrwrFgVbHPo6GlvJF1i77dUxD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X0F60hOt0FrM9fbVW6yAqIIyiPpwultL1t4dfG7I0yc=;
        b=ixStV7MbqGaVV4GK1UXpmovrJXRQMlJX0KM68+wM6+oYwp80Er7G02pH6cH4+EQpCB
         5gfTKnk/9WBOvwMK0+nVpF4Ajox+VNwkMjkfcO/nYPD0xkfrNzgM7ZoBETw0RZCBK7ts
         Yh2GVEi7mme29HxuPA8a3a9yAPeO9JQw7D90VDhFTkUlsjgM/HOsbVhnm1ftslQTEUAq
         KLdJ/On+2M1NWtmdcKRNa4HcNW4irFOjp9bsLl4SOFMSSlBMl/8IqCny2hh3bLyfBDSb
         IokMJVPHkfPT0elzxHYwBQNJpX4cVe2iQC+Ogsa6qBysnJAO4xmC9Rlxm+yMZmEhBnsb
         XHfQ==
X-Gm-Message-State: AOAM530rdJ+nh9yEXlgkYvIC9vCnq+qJ5dqOaYb8s+UZmoFqzweGz1Q+
	fWF9OSYWkqxZiikyVrU0d+z0VlC2mv+srg==
X-Google-Smtp-Source: ABdhPJxZhUFMaBF1Jl6lfXI4dp7Ii6V25PneG+MJJlzY9DBIIDusamov31vWW2dbDsrX9POqc0/1BQ==
X-Received: by 2002:a05:600c:410a:: with SMTP id j10mr3848981wmi.172.1614361673102;
        Fri, 26 Feb 2021 09:47:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id i8sm3850868wrx.43.2021.02.26.09.47.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 09:47:52 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/reproducible: Don't call sync between each file compare
Date: Fri, 26 Feb 2021 17:47:52 +0000
Message-Id: <20210226174752.3942750-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling sync between each file compare is horrible performance wise
as we compare thousands of files. We don't care about IO latency here
so disable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ce4e8ebe06b..05fc4b7fa0a 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -123,7 +123,7 @@ def compare_file(reference, test, diffutils_sysroot):
         result.status = MISSING
         return result
 
-    r = runCmd(['cmp', '--quiet', reference, test], native_sysroot=diffutils_sysroot, ignore_status=True)
+    r = runCmd(['cmp', '--quiet', reference, test], native_sysroot=diffutils_sysroot, ignore_status=True, sync=False)
 
     if r.status:
         result.status = DIFFERENT
-- 
2.27.0

