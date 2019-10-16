Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD52C7C556
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:18:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n14so27085380wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZALrDRxvnAEC/oC56Pc0KW7OdhsJIAQUQtQD7luZgfY=;
	b=cH5Ow4spGwI1yKtcjQVdS6G8EqX8ACa3c1xIj/G1w8FUUcdrk7lgku7x8pEeMp2Kgq
	WkHWuXn57T+3wXsNmNh0lwPLdL4Gu0h2aBA5oCzyPoC9yk5UPllGNdpMfR8vQd1qnpJs
	ixrs18hmYdcHbExD2d3MxJ56b0I6837OCQIXV4stRM3Vb2bXQSpXl39PathX1wc/9CRW
	n4Lfp4bgtvaiK3lefi2ZC6wDQvOFaAPCsJb3uBSaBS95OxQtYeyyrUWPau7bjLrAaRtJ
	aT0EakP1dIdg2sIMwIYlo+v5ErIDFhqH3FHP5r+IsE73Xgwilu2oftKMfS1hghK9i+bR
	ifmw==
X-Gm-Message-State: APjAAAUZIOrEusRSy+J1Sgmu3vAVuMO8dwFxqP24EPaTg/vzP+6GYhwY
	mzXbEifw47ERmhB2FFLWu3GrrRT6
X-Google-Smtp-Source: APXvYqznjOK4IGf2s6vl8lhxAM1Oa2IG81eu3LwadlgZppKkVoaP9kEtTHgfqZks6AG2hxAYIy37Dw==
X-Received: by 2002:a5d:674e:: with SMTP id l14mr1691702wrw.45.1571217515260; 
	Wed, 16 Oct 2019 02:18:35 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v8sm31907518wra.79.2019.10.16.02.18.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 02:18:34 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 10:18:23 +0100
Message-Id: <20191016091825.1910-5-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191016091825.1910-1-git@andred.net>
References: <20191016091825.1910-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 4/6] oeqa/core/decorator: add skipIfFeature
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

skipIfFeature will skip a test if a given DIST_FEATURE
or IMAGE_FEATURE is enabled.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/core/decorator/data.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index babc9789d6..12d462f202 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -113,3 +113,21 @@ class skipIfNotFeature(OETestDecorator):
         self.logger.debug(msg)
         if not has_feature(self.case.td, self.value):
             self.case.skipTest(self.msg)
+
+@registerDecorator
+class skipIfFeature(OETestDecorator):
+    """
+        Skip test based on DISTRO_FEATURES.
+
+        value must not be in distro features or it will skip the test
+        with msg as the reason.
+    """
+
+    attrs = ('value', 'msg')
+
+    def setUpDecorator(self):
+        msg = ('Checking if %s is not in DISTRO_FEATURES '
+               'or IMAGE_FEATURES' % (self.value))
+        self.logger.debug(msg)
+        if has_feature(self.case.td, self.value):
+            self.case.skipTest(self.msg)
-- 
2.23.0.rc1


