Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id B377490072
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 21:21:34 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id a1so2653743ioc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 14:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VFfo01j5/NcAjrN/cmA7Oj31AHBsuDsvM6C3ynFn81s=;
	b=e+QmPUHfMXCQIYzNk6u92C1FPZvgW7yOk5pbzUd9JFnxd9bHkLUQbjHYT9NACWS+JV
	BLW5rkVEfgL6rV6uv3z0mrbug7NBGpRA9Ut7BLWI0y/2aGpqy/znU0ihhvR3SUJwfS4M
	14ZxQzpUe+SQXj7BeqVLLdnDypeKuO2sRMlOymEjAp1TKUSJdYjHwVcnD5YPz0Wl1BaG
	lCbhLa/EXSl1fas41crmPykIsc2j76GDhoMC0fDN2LIRT568r3/PQLxiBmxxfslOeISC
	DOluZXLwFhLpLtBrFME9cKSXRAj0a8jMWmhXrcrcJbYKJQql9BXe50w7HNV1gQ14EkF6
	k3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VFfo01j5/NcAjrN/cmA7Oj31AHBsuDsvM6C3ynFn81s=;
	b=nxHXPFwAcIhJYATw0NHuQU2WLv8Meat0tC+eM8M6L+UE4V11G75Uhx/v64WeKDMrSk
	WiXa7Ibr/YYUhlRZ0LMRoeERhu167MTkM2KAq9uwa9VlKbyToiCH2vJqxsuUWWmChxv0
	XMmQgE1cexal1QM7TaVZN/tlP484RgJAdWW8Q+FozIcldH4/E6NdjCr+urzwif4ecEdT
	hdgp1Ww8ZDORQU7l/dnZiLCi4e5Xgv40f0f5MUaTljHn1Et4K5nqleSQLEBV+Yszg3IR
	bsaGhiWLROMnzqKL55jW58RfIZnWbQGST8MjyM4avGDJKd3fIk6EDiTp3ytzekNJPe3d
	u9mQ==
X-Gm-Message-State: APjAAAXWzp/trAQlbvgtDhUhyrOZa+0THAHyoPHpOylwLJfILHk8XjuC
	g/6YWwzHzykUL2kVV/OOlFUjdjV1
X-Google-Smtp-Source: APXvYqwQ8teT9eQbfCAPLxQlOzkdPxZVOSPz2VIpJSmR39RD09cVXETGaJgoyV/0JRUn5oy7ouygDQ==
X-Received: by 2002:a6b:2c07:: with SMTP id s7mr7875474ios.254.1568841695369; 
	Wed, 18 Sep 2019 14:21:35 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b11sm5444565ion.62.2019.09.18.14.21.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 14:21:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 16:21:32 -0500
Message-Id: <20190918212132.16645-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] classes/archiver: Fix WORKDIR for shared source
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
X-List-Received-Date: Wed, 18 Sep 2019 21:21:34 -0000
Content-Transfer-Encoding: 8bit

When archiving patched source, WORKDIR should only be changed to
${ARCHIVER_WORKDIR} if the recipe doesn't use a shared work directory.
This matches the behavior of do_unpack_and_patch for these recipes.

This fixes kernel recipes that set S = "${WORKDIR}/git"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/archiver.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 13b05bb5f2f..093e2d95af5 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -221,9 +221,10 @@ python do_ar_patched() {
 
     # Get the ARCHIVER_OUTDIR before we reset the WORKDIR
     ar_outdir = d.getVar('ARCHIVER_OUTDIR')
-    ar_workdir = d.getVar('ARCHIVER_WORKDIR')
+    if not is_work_shared(d):
+        ar_workdir = d.getVar('ARCHIVER_WORKDIR')
+        d.setVar('WORKDIR', ar_workdir)
     bb.note('Archiving the patched source...')
-    d.setVar('WORKDIR', ar_workdir)
     create_tarball(d, d.getVar('S'), 'patched', ar_outdir)
 }
 
-- 
2.21.0


