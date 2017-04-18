Return-Path: <oleksandr.poznyak@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A11D471AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:53:35 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id p68so22786490qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eyw7qvoy0iIm1sjh0cOCJmXt9UL8Tm+ax8icjvFtM5o=;
	b=hVZB+RbiuA6J2tePHaZkWbNwcWZwlTrFsN7eIIoTFLCO3bfFhnAWCoarXz7yc1+Dxj
	O0/w2K2AHbzEublCCugZOh0oJndyr4kgHx5zEesfPQXiHBouQL3aajWuOisWacZbOf6u
	K91Zbp64jFxjjmE2npH2jemcPmaWGImFXBmgyTZRR2Ztqu2nYty+IUyi1VoQrb/zf2cZ
	p0LKsCngxXx0kDS8JPhIBES4ydqt8wWK+kj1MuEXJ/VCViQaGjvzf5Z1vX2TrQYoe6CT
	c+RJPvY8cA0Ef0m+BY3wOGm14fAiGO1Ly/hNRMCHNqOOMxp4YeMxlJyl8fGD93P6O95a
	pmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eyw7qvoy0iIm1sjh0cOCJmXt9UL8Tm+ax8icjvFtM5o=;
	b=X3r5gycOJfLP66tuuXUonQr9KNN33bapLK1SsMcuBYO5aRJOkcrg+8rifmO2HbDc47
	HiqnB9CNdfoDH/h8m9ZIBSjY9NGQRs6BqdEiS6p3CACbO+BtrF/zKZv3NMdgGT3PoTFI
	KtP5aKVvLgXRPvixjk34qkvG9hk6snndDaBuh6oH/YlW2nOy+MFVL+e3njM4VyTR3vDZ
	pHOOpC8e8fbLF/bMbalAMpclyL35lkhFs0bAqM0Hx47wgQPBMDJ99nU4gavEfa+ogoy8
	CkxCM2s+f7x9w7U39nnZPffKeLvsRg/5Yh+//TwPHLXetGuuL7bRPC2DPTeNSPaw7OZ1
	HtHg==
X-Gm-Message-State: AN3rC/7zhaa9WrFISvLw6oKShpSD1G6AKqb9gTyuTWanSX2xbNVvpKCn
	ZTyXS6CQvAKkYA==
X-Received: by 10.55.217.71 with SMTP id u68mr11535170qki.272.1492505617465;
	Tue, 18 Apr 2017 01:53:37 -0700 (PDT)
Received: from kev-poznyak-lx.Nominal.local ([195.33.116.220])
	by smtp.gmail.com with ESMTPSA id
	c18sm9121369qkj.33.2017.04.18.01.53.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 01:53:37 -0700 (PDT)
From: Oleksandr Poznyak <oleksandr.poznyak@gmail.com>
To: yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:53:30 +0300
Message-Id: <1492505610-7939-1-git-send-email-oleksandr.poznyak@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] package.bbclass: Changed PACKAGESPLITFUNCS execution order
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
X-List-Received-Date: Tue, 18 Apr 2017 08:53:36 -0000

Fixes [YOCTO #11343]

I've added runtime PACKAGESPLITFUNCS value modification in
the context of do_package() function so that
populate_packages_updatealternatives function is allways
executed before populate_packages_updatercd

Signed-off-by: Oleksandr Poznyak <oleksandr.poznyak@gmail.com>
---
 meta/classes/package.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cc466bd..149a185 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2110,6 +2110,11 @@ python do_package () {
 
     cpath = oe.cachedpath.CachedPath()
 
+    # modify PACKAGESPLITFUNCS order
+    if "populate_packages_updatealternatives" in d.getVar("PACKAGESPLITFUNCS", True):
+        d.setVar("PACKAGESPLITFUNCS", "populate_packages_updatealternatives %s" \
+        % d.getVar("PACKAGESPLITFUNCS", True).replace("populate_packages_updatealternatives", ""))
+
     for f in (d.getVar('PACKAGESPLITFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
-- 
2.1.4


