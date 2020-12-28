Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.2408.1609185900938298609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L690kyZO;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id j16so10777021edr.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TmKvez3Mgqpe/RzDBs5V+5dcs5sTp4VNONLliEMMrE4=;
        b=L690kyZOuyNIp12IAmNR5oZymVFUzaLZchogLQWOGPS5Eb/WK/gHEoqBy2yrgwa8vg
         /eHsBNuX9UaJWd6Frv8SShcbKln7xpLiNgHLwOEYqzG8gVM6loVI1nlcoWuU8eAIxYjd
         5x2OlY9UahD0iVCxBvlUCqKH//eEYKq/6HcnsgKr59RQ3L2NLgzncVm6WgDr8l71Y6U8
         /W4jRYLrDTAukFFt4BAClUsoZRBLCKlKo0sXWlA44U9K1gOQZsoy8OkLeUw/kccGHA6X
         MAX+VOXlKbnTqcmAuGynRhAhCtzPxElOys9kB9yYfBmsgv6lRMQJeM5TLmedZ1Ba3VqI
         eeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TmKvez3Mgqpe/RzDBs5V+5dcs5sTp4VNONLliEMMrE4=;
        b=ZEkraEDLsEWJRMkHXVIBYZLQ4Z9BPsQABQDo2g8eaFWjo4pTc4y9niDq+44qgYRSQ5
         cFsMbUJ0SeS1euNWxjNdTQTklfQDZrMphwOIMAbtfNYweMKAVsGpZG/31eZnHw6tN7tB
         gbceOvMLPHbKdxYXDw6J+9+X7BnkLF6Ys1Kzw09rZaLnyKTLB6JG4vrTZHWLiy/eFaSd
         /Tw7SuFsG8kBz/CmGnPJdf8Gwxv/XT8ua4brTsfAGneevjP0dPMQsTKmkpF+xLkk5J+1
         MyfNmbpOiFvdoJIek4xFxgq4yzK0FUKqqqmsLy6C9jyqPM4D5KYA1jrSWexxj2EPHa04
         EkNg==
X-Gm-Message-State: AOAM530pNlVuN+qPq7iGbaOXH3BY9wz318aMJy6qZ68W8AOELj31CrIZ
	e9P3kejr/uDMqWbgF4ECxuowM3Wy4yc=
X-Google-Smtp-Source: ABdhPJwWC29F1TU0yIK+1f6grskZnuzTUlVP8w5GiDxNQCTexH1gyChvwy3/aXGO3zbxxistes1Kwg==
X-Received: by 2002:a50:f404:: with SMTP id r4mr43527161edm.62.1609185899555;
        Mon, 28 Dec 2020 12:04:59 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:59 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/22] runtime_test.py: correct output check for bash 5.1
Date: Mon, 28 Dec 2020 21:04:35 +0100
Message-Id: <20201228200436.78130-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bash 5.1 inserts escape sequences into its output (specifically
disabling bracketed paste mode via \x1b[?2004l). I am not sure
if somehow terminal detection isn't working correctly there,
but in any case the marker is still in the output, but needs to
be checked by 'in' rather than exact equivalence.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7189e4e6c5..b20c5b427b 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -276,7 +276,7 @@ class Postinst(OESelftestTestCase):
                     # run_serial()'s status code is useless.'
                     for filename in ("rootfs", "delayed-a", "delayed-b"):
                         status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
-                        self.assertEqual(output, "found", "%s was not present on boot" % filename)
+                        self.assertIn("found", output, "%s was not present on boot" % filename)
 
 
 
-- 
2.29.2

