Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.300.1584983849664982402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CW1KpNhP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id b12so230417wmj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IcZJmBhHDpH5MbfKw4T4ix8Kq/WRNW0TcPl+KMjUHIU=;
        b=CW1KpNhPreNS7eynDY4VDLQeD/pjW+pXQrL3QbBG8rRujElv6kab/pLOpdPTpQBJkP
         eSeOYNouWo/n5qu/5YAc+jEOyJEsu1rp/U1maySzHQysmSVmYsr6/Ic35XTs/nA3avk6
         9rk3/bWZGcoMvVZd6ZUD18HoQgryajsnsjDMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IcZJmBhHDpH5MbfKw4T4ix8Kq/WRNW0TcPl+KMjUHIU=;
        b=Jjqm9jymey0MR+mHIGzssjPHMErCvX+fThv3YMkmXF+olwtpZffR0wZoM0VAqEX+ns
         hO5GzwhXhzqtYfwhT+3rX5kz7nvu5usfTpsnQRQ0GX+HVXxjTcm0/LLp0MVEoO8jreyf
         R+lnRYI3iP0c8vEXH2RZobYWhVL59hoDNbF8UKoHtXta39o9rzwPN3k5Bn89ARFPTcga
         VfK/VrPL6ke5KOguHgSx/3cPhoJYQaMJWTI74czqJWTedT1u10Ph4XoAinUpbI9XLHzE
         bNMpRw3MBl86CjVG2M/7nQ8tbOtKtIJKnO2+EMn/J7EuHpmVmDogp8NFYq27kNAAnj1t
         tenw==
X-Gm-Message-State: ANhLgQ2kvYQGQ9NWTTL3f7Om9Z3M+uFUWwv7Qvx8nx53YC+/Vn7cCXzc
	95t5Omh7c6l6k+EWtxwOZpNblS97B0Y=
X-Google-Smtp-Source: ADFU+vtWZbgBr2W7v4HBeBgGlTP2nT4KTbNHAX1kW37B8mhjQWE1aNowuFvvfOYaCoMNQeYAibBHDA==
X-Received: by 2002:a1c:2701:: with SMTP id n1mr317274wmn.180.1584983846978;
        Mon, 23 Mar 2020 10:17:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l8sm313896wmj.2.2020.03.23.10.17.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:17:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/selftest/tinfoil: Drop test for functionality removed upstream
Date: Mon, 23 Mar 2020 17:17:24 +0000
Message-Id: <20200323171725.435004-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitbake dropped support for this piece of functionality (the test was
the only user), drop the test too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 42a1b6b4f4d..d1aa7b9afdc 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -65,19 +65,6 @@ class TinfoilTests(OESelftestTestCase):
             localdata.setVar('PN', 'hello')
             self.assertEqual('hello', localdata.getVar('BPN'))
 
-    def test_parse_recipe_initial_datastore(self):
-        with bb.tinfoil.Tinfoil() as tinfoil:
-            tinfoil.prepare(config_only=False, quiet=2)
-            testrecipe = 'mdadm'
-            best = tinfoil.find_best_provider(testrecipe)
-            if not best:
-                self.fail('Unable to find recipe providing %s' % testrecipe)
-            dcopy = bb.data.createCopy(tinfoil.config_data)
-            dcopy.setVar('MYVARIABLE', 'somevalue')
-            rd = tinfoil.parse_recipe_file(best[3], config_data=dcopy)
-            # Check we can get variable values
-            self.assertEqual('somevalue', rd.getVar('MYVARIABLE'))
-
     def test_list_recipes(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
-- 
2.25.1

