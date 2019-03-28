Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 04FEE7D186
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 12:35:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n25so1054991wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+Tzzb6o8RwCQqXWNLmWaZxCM0v6xHoyS2GNY7vmu5wc=;
	b=V9XtsXwV8u2U/8Su6Gp7ChWdMmZEkn4jg64Uhq6anzEG2OPcu5aqlmmxLHGGznRSOL
	dYqApQObqcdZe7xfuDT0+KZwyqDkxmvL3Hf0ai3PKOKCp2ENIQd40AOB+A30vsyrpe/6
	AQ5z5dvCVeucTQnejtZ82EUlsY0sGjcbF9cPXDyy/SQXFbGS49/V2iWDI8PnwE+vn1DS
	rRbt2mBf5axkj2sHAe+gOh72QuUT5Nv0yvRC/Wo5IkDJNjhPcB+ZuinUpTHOZ865fmSy
	ZCCYfiq1Ud7paXDlnBQRgzAOBZjoQXdk+g/an3XFUMgJ98AWksGmt+rSQray9YoEnaJh
	zAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+Tzzb6o8RwCQqXWNLmWaZxCM0v6xHoyS2GNY7vmu5wc=;
	b=oaW6BK8UaafKkb0lCL5UXlm55GpZnjRdLZ7livsYEINwgobCwZyfExrzOKqwOh0nGG
	HvBdN7GmO8QXPrldLLwGpTy3a1UD5nxuTTAOcBJcrm6Kiw90o0MigC6jNDRYCQgVYEY2
	xaEXP4OmdEHPsAjGQ5hnV0lnX7It3LjnpVu1XSBcsWf2Q+XQakrFFFbYDslUhfq7kQYG
	RVElFt7hI1O1zA+yXVA7nYnKcJAUQE+ydr/eZ3/FKlZVcPOy+Ybjb8eXYaw1KdsArL7r
	z5dgWHzVP32wEZljgIc/qRrQCP0gAkIAao1ZBu/JcpezpUt/VWVY/JU8okSVMMcYHAFP
	uDeA==
X-Gm-Message-State: APjAAAVTOfQq+2baRbeGkJ+SvkGToODOU/QVxIMpodBwdzdxWX3bb4IY
	C1bMdmv8NqhWm3I7+Kkf4VWauijRNWo=
X-Google-Smtp-Source: APXvYqxNSSYwCKPSV9gIQiTVRrXaC2TUiNiwdLNtS1uMnBMsQyZzgGScb6+tmE+ntIv87iEiz//i9w==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr22891434wmc.71.1553776531515; 
	Thu, 28 Mar 2019 05:35:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w2sm1030038wrm.74.2019.03.28.05.35.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 05:35:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 12:35:29 +0000
Message-Id: <20190328123529.10475-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] llvm: support older toolchains
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
X-List-Received-Date: Thu, 28 Mar 2019 12:35:31 -0000

LLVM is now warning if your host compiler is gcc <5.1, and some of our supported
operating systems still only have 4.8.5.  Set
LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN so those builds continue to work, hopefully
we retire the old operating systems before LLVM requires 5.1+.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 01a7da8ebdc..7832441482e 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -70,6 +70,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
                   -DLLVM_OPTIMIZED_TABLEGEN=ON \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
+                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python2 \
                   -G Ninja"
 
-- 
2.11.0


