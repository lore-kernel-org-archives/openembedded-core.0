Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 444417559A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 11:12:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h15-v6so15382684wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 04:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=IjYO64RvX87H9js6YgSvtDl8ZISslXbGpuNRROjaxrY=;
	b=SCOksxgrlaFnhNgchUOBU1Vfic1w4wpbw6ZUUXs7eHsIg4ZRd5xDwRASX75j/ArC1i
	IJRtWJObll2fHTbo+dR8EInFFOJJuGPL0hYwt2EIIUT2oXwGAavbtLlPgXjnqBu4GoU7
	qngy/F6W9eKEhTBYRrFRDN7k1QY6az6ATd5Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IjYO64RvX87H9js6YgSvtDl8ZISslXbGpuNRROjaxrY=;
	b=mUtgIYPlPfaBunyvYYp95mlVex+MkWC3OFqyAmy5/uGyJ3e7Qtwkvm+e2MmVjkogN0
	rFTFjd6r73PqXEbVnS1DB+rFZS9Bl/CeQ+aJsyKhmd10gx7XG/TyHAF4fClrvOjdrxRS
	5W6iHwp4Mtj5Lvom/Iz18RL7DkcT6L+2SjbYTs22FrkY7K5cw5BRNWTGBEbajRFCirIu
	YMFI+HICJCjS5Wu4edk3ZNkkY4kxwiBjfgsdp6rRA4w5Qchqun5/sJvW4BXoeKbJPEl5
	nV2ZikXV1F8b/JDjvh9cMNXlJbjDRr2ZAhRBmbLAU0lhTeUcv7WNa3qgYUigQ7KGpS4D
	ez4w==
X-Gm-Message-State: AOUpUlGvJmkndz3xukY2vzhqxfLROSU21nPrBS7yoPzp50DMCl1zTe6D
	morHOXpG6319pt2fI2mvjJEoTfYkqd8=
X-Google-Smtp-Source: AAOMgpd9oIJY6o97Gmo7yLHdov1J+acRUZLgQ4MyqcSE0UquOWXURm2WhO+xIJSoUMSnEmFHckZe7g==
X-Received: by 2002:adf:c891:: with SMTP id
	k17-v6mr13013649wrh.6.1533640351709; 
	Tue, 07 Aug 2018 04:12:31 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y184-v6sm1612826wmg.17.2018.08.07.04.12.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Aug 2018 04:12:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2018 12:12:29 +0100
Message-Id: <20180807111229.18590-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] selftest/package: Fix hardlink test when using sstate
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
X-List-Received-Date: Tue, 07 Aug 2018 11:12:31 -0000

The build target won't cause the package task to run if things were already
built and in sstate. Ensure we run the package task explicitly to ensure
the test works as intended.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 1e171b5ebef..f288fcafdb4 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -89,7 +89,7 @@ class VersionOrdering(OESelftestTestCase):
 class PackageTests(OESelftestTestCase):
     # Verify that a recipe which sets up hardlink files has those preserved into split packages
     def test_preserve_hardlinks(self):
-        result = bitbake("selftest-hardlink")
+        result = bitbake("selftest-hardlink -c package")
 
         dest = get_bb_var('PKGDEST', 'selftest-hardlink')
         bindir = get_bb_var('bindir', 'selftest-hardlink')
-- 
2.17.1


