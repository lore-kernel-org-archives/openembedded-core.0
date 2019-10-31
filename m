Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 993EF7D39B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 13:53:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q130so5990925wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 06:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OMaSHsGC+b5TbYqZZ4ZkcHuBCwiH0ZvFIs7LuNqn64k=;
	b=s+AfFlYRoNdNVhv7BdfRkj8tM09iQhepyAvLNiLIT0qYRdMTk2zgJEFltNGhja6CFg
	uwAtiFvL303CS2SgDtA/g+k6OrPceSE4Qb2+EZWJbSAuPQoFbQhkclUcaEpeRzwNnXiT
	QgIE84AYekafzbZHm3EGePiuMhJhE9mTgfL53Zn7uIxL2wDt58kiCbsbPKdW86IHKW9U
	ucmlHxkyvS6MquuGy903iTKtqNNeEuBX8uCyah/hvXe3t3CzvoZ7ibbR/O1yTx/UHPC+
	gftCgF93miGcx3xmsWCAZGBD2cEPKmSUUHtANtVMSrVIysZo0IAJyVyY0NDF2f3eLDft
	nvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OMaSHsGC+b5TbYqZZ4ZkcHuBCwiH0ZvFIs7LuNqn64k=;
	b=K+eEqkzJaJBDsW9wAIF7o1JGY42HrtGmBcWuks/vG89J9gdKh9zm04LlqBzoQ4T2ic
	Y68D8Frx9PCtCAybBCBvufaakwXOZfhiMv5N+aE6aXOlZuuAogdZgifDN2rrbxwibCZb
	I21yuFmWJltSDPd4EtR/4PGw1pigjoo5Q9jHp9Obz5TpNWqTE/shmty8XSmNAIcqZ3mC
	JaXjc0ZnrsCu7gQlkRkYjJGcYZM2aguQnZT7kAEbKV51lceld2mfXfAlneteDTiwl4vZ
	hVPlrTdBd8RlzEOkJG351Qm/16xg5RDtXGlFTqcFEj416RfrGI7jMxwZItWffp+cT3KP
	4skQ==
X-Gm-Message-State: APjAAAUDlpb/etNbN2HBl7nkLGTrrNMpP+lCsuSASgtaPMsba6sD0gyV
	0cbamqCNuggkrgmM3/Usijpb2Z281Sk=
X-Google-Smtp-Source: APXvYqzy6z0+bim2Ws94ofbRpw6l3SMRpmBGyLC47qjCeoW4DvBijRSJTBmaH1drIVuA3tXt7epLRA==
X-Received: by 2002:a05:600c:1009:: with SMTP id
	c9mr1823011wmc.71.1572529992167; 
	Thu, 31 Oct 2019 06:53:12 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	w22sm3602712wmc.16.2019.10.31.06.53.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 06:53:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 14:53:05 +0100
Message-Id: <20191031135305.53420-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031135305.53420-1-alex.kanavin@gmail.com>
References: <20191031135305.53420-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] selftest: add a test for gpl3-free images
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
X-List-Received-Date: Thu, 31 Oct 2019 13:53:12 -0000

Existing tests check that adding a specific gpl3 package (bash)
to core-image-minimal results in expected behaviour.

These tests check the ability to build two common images
without gpl3 components in them:

1. core-image-minimal needs no further tweaks and works
out of the box.

2. core-image-full-cmdline requires dropping the GNU packages
that it pulls in; for good measure this tweaked image is
verified with runtime tests.

These two tests allow dropping meta-gplv2 from being tested
on the autobuilder, however there should be a community consensus
first.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../oeqa/selftest/cases/incompatible_lic.py    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 424a9e69c3e..904b5b4094a 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -73,3 +73,21 @@ INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 
         bitbake('core-image-minimal')
 
+class NoGPL3InImagesTests(OESelftestTestCase):
+    def test_core_image_minimal(self):
+        self.write_config("""
+INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
+""")
+        bitbake('core-image-minimal')
+
+    def test_core_image_full_cmdline(self):
+        self.write_config("""
+INHERIT += "testimage"\n
+INCOMPATIBLE_LICENSE_pn-core-image-full-cmdline = "GPL-3.0 LGPL-3.0"\n
+RDEPENDS_packagegroup-core-full-cmdline-utils_remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"\n
+RDEPENDS_packagegroup-core-full-cmdline-dev-utils_remove = "diffutils m4 make patch"\n
+RDEPENDS_packagegroup-core-full-cmdline-multiuser_remove = "gzip"\n
+""")
+        bitbake('core-image-full-cmdline')
+        bitbake('-c testimage core-image-full-cmdline')
+
-- 
2.17.1


