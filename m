Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E945C752C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:45 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id o11-v6so6839906wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9fuHtnn5tC7aBJSIMJmzjQ0szlr7agrBnJpB0zyLK1k=;
	b=QUqtDflUYcjC9b9CcJpHBq+ax5BOX7tHLUNgsk0C8hlvfLR99x8ALboqFZt/pua8Vj
	9Y6XACR1LUrP5FuAlNwfNBoG8i3yGyE2Qz3E/D2K1Pl6qfoWSGC/xMK4bSBS90fCF4bl
	RTpdrHk6ZXV2XiOGvqUxyqdhBdECEeA0+ye1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9fuHtnn5tC7aBJSIMJmzjQ0szlr7agrBnJpB0zyLK1k=;
	b=qHHmdO8/mastKjXiMHW0OZkAh6ihVu2hJMvZ0gZqsZwP92afdVRbbNfYNre05MrQwG
	/FNi9rsEZmvSAaMFJfUdqzSsbv9bY00C7SeBqRCT0elRlr4PdtIi2epZYcXJim9+RmoW
	OZLNn/6N82U1VsgjJEp60WORQIoOSrbfTr830ap8jkiA1iBXZ50tEHpb/BVOZRUtmrmU
	Vlg8aeHtNw6JUmzpu06hwXCHQJxYPxMh8clqKRIbm2+nqyKSnt2zrqTtr2KJeJ53Z8DA
	78RrQ5Xhz6mS0qN2K7VAIssSv3o6RPRdlVfV+b2r5N6LkCbxWjuaBqgi71IGgfuyvHN7
	uWLQ==
X-Gm-Message-State: AOUpUlGM34vGQzMKaEAKT1vvQTr8XL+3Re71nMBBux7vQugrwM9ZkzTV
	mGutzQDp0Npyb0Gz/QBvKqxYc0myA3w=
X-Google-Smtp-Source: AAOMgpcNthBUwCfr0V3eYZLaFHA7XZPdSv3qtIeGAcHoHDl7+saBWWW2GPip6CLhur3cC2/eSp0+Pg==
X-Received: by 2002:a1c:30d2:: with SMTP id
	w201-v6mr7530857wmw.47.1531669006376; 
	Sun, 15 Jul 2018 08:36:46 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:31 +0100
Message-Id: <20180715153641.21029-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/12] oeqa/selftest/image_tyypedep: Avoid undefined variable failure
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
X-List-Received-Date: Sun, 15 Jul 2018 15:36:46 -0000

If something goes wrong with the test, dep can be undefined. Avoid a
traceback for this and handle it more gracefully.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/image_typedep.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index e6788853a36..932c7f883da 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -29,11 +29,14 @@ inherit image
         # like CONVERSION_DEPENDS_bz2="somedep"
         result = bitbake('-e emptytest')
 
+        dep = None
         for line in result.output.split('\n'):
             if line.startswith('CONVERSION_DEPENDS_bz2'):
                 dep = line.split('=')[1].strip('"')
                 break
 
+        self.assertIsNotNone(dep, "CONVERSION_DEPENDS_bz2 dependency not found in bitbake -e output")
+
         # Now get the dependency task list and check for the expected task
         # dependency
         bitbake('-g emptytest')
-- 
2.17.1


