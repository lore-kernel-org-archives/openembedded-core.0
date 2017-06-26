Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C08A17782F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:18:37 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id j85so164708wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 01:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5IorJVNw711PwAyA+LUoDk28gPkTqJLMm72MfQrRmsU=;
	b=nWB/2t6rAmlIHl24cZx5whRwLiHaOrpHcukMo/agYMEBg2j8RQZjLVzYUHDSeY/Pp9
	97PaTedEah0ywkvA31FEI7yLgENxTQLDfUW9PmMjEsUJF9MBkhiPG6bdhXefQ0rUYE7T
	Goc1EBW3SkzVZWn95zXnR1hKlsBI0TFyQGXlm0qfNmY1mI3MeS/JKezVv4kupHn8LA66
	eFSmSZX66V+xuB/6x0P3HYkcdX2JbNcvFwbWPB6gckuVYmSHC0e/jDcTpc1JrEzWWbK8
	sssI70BCJ6saN9eSiIEGHYbwdpp/tvudik1YLAFHMO8S4Blcheft7GrGqWSHhxLtp5iW
	zJtw==
X-Gm-Message-State: AKS2vOzI0TtCjv7gJSrH+Z4I2m8ghgS5Fp67fIxHffPqXCq/kxml5/8I
	Y+vYCPQlYJeAK+7iY7E=
X-Received: by 10.80.173.85 with SMTP id z21mr16285494edc.10.1498465118718;
	Mon, 26 Jun 2017 01:18:38 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 2sm6954245edt.66.2017.06.26.01.18.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 01:18:38 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 09:18:33 +0100
Message-Id: <20170626081834.23832-2-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626081834.23832-1-git@andred.net>
References: <20170623145924.21097-1-git@andred.net>
	<20170626081834.23832-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 2/3] selftest/archiver: only execute deploy_archives task
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
X-List-Received-Date: Mon, 26 Jun 2017 08:18:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

There should be no reason to execute a full build, as we're
just interested in the deployment of the archives.

The newly added tests already do the same.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 7ef92cddac..72026d573c 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -27,7 +27,7 @@ class Archiver(OESelftestTestCase):
         self.write_config(features)
 
         bitbake('-c clean %s %s' % (include_recipe, exclude_recipe))
-        bitbake("%s %s" % (include_recipe, exclude_recipe))
+        bitbake("-c deploy_archives %s %s" % (include_recipe, exclude_recipe))
 
         bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
         src_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
-- 
2.11.0


