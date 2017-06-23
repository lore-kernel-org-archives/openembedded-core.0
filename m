Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6B4780EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:59:26 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z45so13213634wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 07:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JVSNsMe1PAcQ+OBZWe/bf4JTeHZvgVBgvIWZIj74n28=;
	b=NtrKoSeXKpWSU6mjPo3da81l2qJWhXwN1q+fRs6+Yy5NPL7uxZ8jIZMtWAPzaWnus8
	8oqPui8k3gHBt3a1PIDZsWtxf/vEfQADE9+6Fx8RI6itvCIr6iAjA1HzYL3jdQNjS/1J
	mlmvobYE4lsH268PeciVvA2YXeTRksKdAYaIn/bYoT9X74Vm8b7GmnN/Is0MziX6cEpg
	bMabYg631JrnnPQAVP6HXqjsVBU/rB5wGMdMm0b24Rcxq2rj0KvAcKmgJUuF2js16PYK
	cIEs1uz1mXs1BVwL5yzmLjum1yRZiCyjxtEUDq/SPBo5etc9ttQ5z66h1xqced0UjwYq
	8U5A==
X-Gm-Message-State: AKS2vOzIF/DwS7nenpw0NCANtJug2DWlO19COIVivNbIkO1gjQXC2Z1m
	ceW+OZFrLyUDxP+I+VQ=
X-Received: by 10.223.171.181 with SMTP id s50mr6419366wrc.177.1498229967486; 
	Fri, 23 Jun 2017 07:59:27 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b94sm4041008wrd.40.2017.06.23.07.59.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 07:59:26 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 15:59:23 +0100
Message-Id: <20170623145924.21097-2-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170623145924.21097-1-git@andred.net>
References: <20170623145924.21097-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/3] selftest/archiver: only execute deploy_archives task
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
X-List-Received-Date: Fri, 23 Jun 2017 14:59:27 -0000
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
index 9f686debe6..ca9dad0643 100644
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


