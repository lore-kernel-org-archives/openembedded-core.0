Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id A04B071CB1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 12:44:49 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id y193so19648761lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uqTyFr/eDEjnvmA3BOj6F6K5EX9MobQqVLwxYHkAxiw=;
	b=fso2z0DcJ9vo/Wb44dePMIaFXtw/creDauPqRb8qP0ZrabpUPwmAF1EQ85iJruUwvl
	k1uu/qQFfy3ib3zhL5ZWGuN7aSilWqktIQvqG13ZJV/Ye0xM5A77v8lzeZyE0NlM528u
	6C08jDMwPPffeHdil41l0A7nS0YObFzJPzGaQiKyosjaazosnYuctbV2+ELr+jztBgjA
	4zdIL+jHTjX9mMNdwWFkP6GZzo2oZYF7WHkAgEMxWqZviEkhaZqazqoppNnT5uFlIX7t
	svSVQgdAgNFMgcDBKa09ZNuACP4c834n/LqWsA+684jLspOYVdGumkyPtuwYct5QObFP
	XdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uqTyFr/eDEjnvmA3BOj6F6K5EX9MobQqVLwxYHkAxiw=;
	b=IY1f0UcjvsxtjP1blbV7Ykthf1IjX7FcoXoao618aHoHSTktbxoiU/MsPT4Z6LE1oF
	bpIJrn5p7y1tmC2iTjDuFNBmrMKH7zsCfF4b/FiVxagY1hXa34JyPsFbACTLTG82aYY1
	KUtXedx4xa2BHN5xYTw5nQGoqSC5saKSZChvpLkZo86VN2Fyw94XNpEvZurP9biysE43
	metDBTu7ybScBq7lEFf94q9xZmYUMgVEYrHNX6fZy18YBBjgpvUC/eU1YOPWC74zvpvH
	3In/U0XCBnRMu0OgK89sL0/lMtctynM3d4HR/04eWqTbk8azv8KMhFva8gvBtrKX5iwt
	CGEw==
X-Gm-Message-State: AFeK/H1fW4OkGk1Nyop4mywrQh026Wo4nWnvSiy/GXIHyCjqbauRjuvGnfGnrWhHZQK24A==
X-Received: by 10.25.192.5 with SMTP id q5mr2792843lff.38.1489668290330;
	Thu, 16 Mar 2017 05:44:50 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238])
	by smtp.gmail.com with ESMTPSA id n20sm893148lfb.53.2017.03.16.05.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 05:44:49 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 13:44:35 +0100
Message-Id: <0d0d8af52d63d2eb2dc357e434f2cfd1283773bb.1489668133.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 4/5] wic: selftest: do not assume bzImage kernel image
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
X-List-Received-Date: Thu, 16 Mar 2017 12:44:50 -0000

Instead of assuming that bzImage is available, query bitbake enviroment
for KERNEL_IMAGETYPE.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 1cf26ce44411362873b5fa0b57da9f5a77613134..b9c06e56adb70376b6f6a4893026223077b708fd 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -225,7 +225,8 @@ class Wic(oeSelfTest):
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
-        self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
+        kimgtype = get_bb_var('KERNEL_IMAGETYPE', 'core-image-minimal')
+        self.write_config('IMAGE_BOOT_FILES = "%s"\n' % kimgtype)
         self.assertEqual(0, runCmd(cmd).status)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
-- 
2.9.3


