Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 35EB160C6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 12:11:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b17so2489328wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GHJXSO/53nmHYD8mh2WI33b8hSGExsy0Du1UKoPrMu0=;
	b=Wohc72XWWGd4wR9CQ9Amo8GTQHLDj84/RFm6FvQ4NZPJRwaYneDLTqhncyFjmSRadD
	YYFovt2OhJwBE+7Z5R6f3eLPDu2IayRG8F/dOdJBe/B6VZEX0qS1PJeLpYkCtDGUYcAE
	0P1HBnUzuErymB2XX39vVRyiHSubWvLE0kvQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GHJXSO/53nmHYD8mh2WI33b8hSGExsy0Du1UKoPrMu0=;
	b=eQ4UuQTpoaIe6iMnPc+G883+Nxir89OOS13zRwNBuHFYnefNuks3AdgAo+9ZZEqDIx
	equUzFFhhpHN1OZNFYqsQCWEJZSBa0WxqaCELfRD6g23Ena0PPMlLcR8Be/sD+QgtbnK
	f0GdltDXv8L4RXLThJkYNoQ72vULpTdBgONFpbiMFZhKtrgcoG9CubtNQGNe8FpxAXB8
	CAxNq9K7Hf18wuoWWUrPGj5N23gpkhidwk7ah8uWC3/hPCuBSlA90Mjepy5VGooEH1Gy
	5N2/yiAJ6js6U5MvkhOhNPRT35R0sV9RYmhzQu61KNg6JMimdxWbn1gh40T6FoxHEubp
	McBw==
X-Gm-Message-State: APjAAAU1fgrhH66371Clh9BktJV2J1tzBGlNkaxypGkUHMXarCWGHMDB
	AZJejbcKMDC+sCi1KkPIRUTD//kKCBY=
X-Google-Smtp-Source: APXvYqxolb173+JPYcmnyZHeeSwKkhrKOUjLYV5sLTwQiSWLPfPOu3ZXr6g2WT4jceDLlCnDSmILBQ==
X-Received: by 2002:a1c:a796:: with SMTP id q144mr5684153wme.6.1580904714523; 
	Wed, 05 Feb 2020 04:11:54 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w19sm7557529wmc.22.2020.02.05.04.11.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 04:11:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 12:11:47 +0000
Message-Id: <20200205121151.27880-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
References: <20200205121151.27880-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/6] oeqa/reproducible: Improve test output and ensure deb+ipk compared
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2020 12:11:54 -0000
Content-Transfer-Encoding: 8bit

Adding newline characters between the packages in the failure output
massively improves readability.

Also ensure to output ipk failures when there are deb failures by
calling self.fail() at the end, else sometimes only partial differences
are returned.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 04dc46f38a0..f6433c9a02b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -185,6 +185,8 @@ class ReproducibleTests(OESelftestTestCase):
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
 
+        fails = []
+
         for c in self.package_classes:
             with self.subTest(package_class=c):
                 package_class = 'package_' + c
@@ -208,8 +210,11 @@ class ReproducibleTests(OESelftestTestCase):
                         self.copy_file(d.test, '/'.join([save_dir, d.test]))
 
                 if result.missing or result.different:
-                    self.fail("The following %s packages are missing or different: %s" %
-                            (c, ' '.join(r.test for r in (result.missing + result.different))))
+                    fails.append("The following %s packages are missing or different: %s" %
+                            (c, '\n'.join(r.test for r in (result.missing + result.different))))
+
+        if fails:
+            self.fail('\n'.join(fails))
 
         # Clean up empty directories
         if self.save_results:
-- 
2.20.1


