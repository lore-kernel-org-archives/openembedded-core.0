Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DFDF47F21B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 15:57:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o18so16149874wrv.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 08:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f1xf4zFyVv37PlmDZiE8otshZLw/OzLnj/xAfFvdyk0=;
	b=qoBNj6gMMlKILaMmWzygHxQOPo0DE3H0DtgxHtlrFLd9tRWtPngnAVFbZljkd0/jIg
	V7HykFY1bifRfvgAyNaiOEEHkDbDYpgplElXY4MzvDRUjt/YyYRBfX2rYynf9tsmk2bN
	HGGlSIXElc0JZyLhVNhNJCF8uFO/iZfBugfZd1/5GDMCM1EB4bdp7B8ZgewT5gTVIojG
	FqmronhaTpyMGSUTaXRVIhHIsmnzQbbwWErxBgozspA7OA27q+wugDMO9Da/CCYVfiPr
	ZXbkCaIhfZYcNn6mnrBQFofnj8S65t48X2BXCwhfLQsBRM0sIMyzE5uRlfsAKBx0cE6E
	kyaQ==
X-Gm-Message-State: APjAAAVtghoZxu5UK5Xd85Csbjb78qFdOTcoj9wFBxJwiuQmSXLj74f1
	ciFpJp01prjHxYGUSnl2c4eV70SH
X-Google-Smtp-Source: APXvYqw7LnuWJcwYOikoQsvAoXg0v1wvk1MPG66Gw4KM9smU5krH0m8g9kYCH4iZuBv03hMv7maDaA==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr17646980wrj.56.1569945450427; 
	Tue, 01 Oct 2019 08:57:30 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id p7sm3653597wma.34.2019.10.01.08.57.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 08:57:29 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 16:57:28 +0100
Message-Id: <20191001155728.8178-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH] packagegroup: fix a comment regarding PACKAGE_ARCH
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
X-List-Received-Date: Tue, 01 Oct 2019 15:57:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

packagegroups whose dependencies are affected by MACHINE_FEATURES
need to be marked as MACHINE_ARCH *before* inheriting the
packagegroup class, not after.

This has changed in commit 9c826962ec8f
("packagegroup: Make allarch inherit conditional"),
commit 4f3f34deafe4 in poky but the comment here
wasn't updated at the time.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/packagegroup.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 94a59e0c03..1541c8fbff 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -8,7 +8,7 @@ PACKAGES = "${PN}"
 
 # By default, packagegroup packages do not depend on a certain architecture.
 # Only if dependencies are modified by MACHINE_FEATURES, packages
-# need to be set to MACHINE_ARCH after inheriting packagegroup.bbclass
+# need to be set to MACHINE_ARCH before inheriting packagegroup.bbclass
 PACKAGE_ARCH ?= "all"
 
 # Fully expanded - so it applies the overrides as well
-- 
2.23.0.rc1


