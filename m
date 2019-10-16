Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF5F7C556
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:18:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i16so2051727wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CPzgGKbcQeHUcgR8vvSdgijJAEACjjBOWb0eKJS+9DI=;
	b=dRMUx+RdYy0QLL16nAIAuEKC3flERaiC40RNtqjH4NQ44YHMqMsoPmBK9iToaNCkIH
	XW0BFNG7xlTB5lfWbuULZ95QvmaKl7NyscBW8jUo5HTr7M3wRGkUxvkOy04tnKx63/KS
	M9+r5v3AnEpIhbMSBW1oeDitnp54391Vi7kTGC6UL3VtnehZs44OOVUDr+IdLnu1lBq9
	rXX0qYBEmLR9btmIzn7qBlaGg+Ez2fwoLaV1//F0EE7vAYga3pjAZVJDmGBillqVHm13
	hHd0Dy6FLMJfOwf8IUuc2fzPrA8QchiOIqUPH7ypGgamVxViMdK2VZm9TfBisaVXAy9C
	jFrA==
X-Gm-Message-State: APjAAAUcEk7oQHvuwdl8wcWjNrh40iv1YRkGJMmHA8dfWK5YlcVosTFk
	mRLU5P4mDCj5E1s0BZsUyWT686Iu
X-Google-Smtp-Source: APXvYqwoX14glnHBpnziJdXw5g6S2zvjyX2+iRJyyosmXIL71zRZD/afdvr4sis7CZnXE9oRT66WAQ==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr2379090wmg.155.1571217515840;
	Wed, 16 Oct 2019 02:18:35 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v8sm31907518wra.79.2019.10.16.02.18.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 02:18:35 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 10:18:24 +0100
Message-Id: <20191016091825.1910-6-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191016091825.1910-1-git@andred.net>
References: <20191016091825.1910-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 5/6] oeqa/runtime/opkg: skip install on read-only-rootfs
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
X-List-Received-Date: Wed, 16 Oct 2019 09:18:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Images can have package management enabled, but be
generally running as read-only. In this case, the
test fails at the moment with various errors due to
that.

Use the new @skipIfFeature decorator to also skip
this test in that case.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/runtime/cases/opkg.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index bb8b6d99d2..750706161b 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -5,7 +5,7 @@
 import os
 from oeqa.utils.httpserver import HTTPService
 from oeqa.runtime.case import OERuntimeTestCase
-from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature, skipIfFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class OpkgTest(OERuntimeTestCase):
@@ -45,6 +45,8 @@ class OpkgRepoTest(OpkgTest):
                       'Test requires package-management to be in IMAGE_FEATURES')
     @skipIfNotDataVar('IMAGE_PKGTYPE', 'ipk',
                       'IPK is not the primary package manager')
+    @skipIfFeature('read-only-rootfs',
+                   'Test does not work with read-only-rootfs in IMAGE_FEATURES')
     @OEHasPackage(['opkg'])
     def test_opkg_install_from_repo(self):
         self.setup_source_config_for_package_install()
-- 
2.23.0.rc1


