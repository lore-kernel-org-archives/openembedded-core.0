Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 46C20779C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:36:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 131so233398wmq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 01:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5IorJVNw711PwAyA+LUoDk28gPkTqJLMm72MfQrRmsU=;
	b=UBKFSmUwPZ7nTCLL8KJULzfD+klcs+74rgyMqQ3MiSqdNNmNSL9A/TYkBvNQl3hUoN
	PKXZUGdfY36GVNllIpJcIC/8I5idJNZmbQRlrR7Vvo7NVlMRkty5gHvZ2LrXeRBt9hP+
	p8o6C6Nc8ktshW7zsFwDCQASsTO2r7NDV6g2TPqJFfuf0orV40MuYH6mOcHm6M6iOWFV
	VfUzXpafnKpUl4zlFfr3kuTW2MEtsjsTeLTkyuuRdBtGVrdNOYM0q6O847Z+j8QrTMpF
	ODhvip5HYkgnVfklhxygMI1MCWGspobEmmH71tvy7U48oZcRF6NQOH/XTYky8X5GBf4e
	mUag==
X-Gm-Message-State: AKS2vOymCBxQ3EmOQ3jybsdgDbyG+E+gQrZt3ZoZ/LsqNcHfc4WbhAt2
	56yWT8NLkqV1K1e7mw0=
X-Received: by 10.80.165.229 with SMTP id b34mr15776967edc.29.1498466181781;
	Mon, 26 Jun 2017 01:36:21 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w12sm5945579edd.21.2017.06.26.01.36.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 01:36:21 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 09:36:18 +0100
Message-Id: <20170626083619.26198-2-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626083619.26198-1-git@andred.net>
References: <20170623145924.21097-1-git@andred.net>
	<20170626083619.26198-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 2/3] selftest/archiver: only execute deploy_archives task
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
X-List-Received-Date: Mon, 26 Jun 2017 08:36:21 -0000
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


