Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3327E7F180
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 12:00:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 5so6907934wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4iAGAMrcO5npRu0WIA671BWcDy2IkEoMkgZ3LAaMCjA=;
	b=LbfZQDVAOQH2I8RQ26GIpBb06FbaQIPlkpTo4+Q00T/EovekdrLNEDIdASFdFb0orz
	wh5mRuHo0Pe3JxnrEKM+nnXAA2l7nrbuWTJn+1jB8NYHbkSdGsC8P9XaItOv7yHjn8tq
	pjEqYYhyK1oEuwbyR5zbpBMhfhfBY2Uw7xG3qik1HSpOqRhUObwk2868M5PmTVZI414v
	qBCGaLt25Rmsr+9RinMnZbw8dmLZDB7VLjc/Cmt/37VuHfAhh035FBZVg2sYcYIjmiey
	foO7tYq5p1VIUlfcunz9BrtvWcNML8+Yf970bk4sTMP5EJNFZxj+FSJHj8Z3Aq1NuvIl
	ucOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4iAGAMrcO5npRu0WIA671BWcDy2IkEoMkgZ3LAaMCjA=;
	b=T9QGU1y1kuuM52ZCXT6175+ADOOtoP1kcvFeJr42RtQ1h2dfAGja0Si23DvItK2D8y
	hmN3npK4iHgiquhnEGHqhyD0X6bOh840J6bElJFf45e+4YFP6l/aAoQ3mRz1lGMerm+2
	1rkh/zw6T3dVWjkgwMGQIv3DYkbTLXwrC5/UenCsFxsStGqgrIETkRUZzgHDZtkpea8L
	MPRQ2S291gwPWngaf+QNV/rT7hptNzCssxy6J0ZFY81L5cAQLpRI0lohbpb1+9LfIk67
	Joe6ZScjePuhfn4e4ay/+2k993CgNvat863CLydaf4CSXhag4tECz/ulvguE7bK9tsPd
	kS1g==
X-Gm-Message-State: APjAAAX+WmL+SWISeii6gU47D9+nsCl3t07BsHNUVsXlmCE2hHVQXouI
	I5XP0Hz42WQUNjOqcKUuzGmv3lWi
X-Google-Smtp-Source: APXvYqzvrIz3cSfve18iOkon+vrBPR0FrTf5FdejrjKp59Vzm4HT6U7AcSvLE5Sa6hwXZ4ipIKyPTQ==
X-Received: by 2002:a1c:2501:: with SMTP id l1mr2399455wml.74.1570017640696;
	Wed, 02 Oct 2019 05:00:40 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e6sm17521899wrp.91.2019.10.02.05.00.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 05:00:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 14:00:27 +0200
Message-Id: <20191002120027.109242-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002120027.109242-1-alex.kanavin@gmail.com>
References: <20191002120027.109242-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] ethtool, libcap: fix upstream version check
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
X-List-Received-Date: Wed, 02 Oct 2019 12:00:41 -0000

The default URI returns a gzip-compressed index page
which browsers can auto-detect, but we can't.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/ethtool/ethtool_5.2.bb | 2 ++
 meta/recipes-support/libcap/libcap_2.27.bb   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ethtool/ethtool_5.2.bb b/meta/recipes-extended/ethtool/ethtool_5.2.bb
index e9759bd21bd..67e7fadee0c 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.2.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.2.bb
@@ -14,6 +14,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
 SRC_URI[md5sum] = "79cff0d4af62b030ad28be90414b5c4a"
 SRC_URI[sha256sum] = "8ad6cb30f6e1767d9d23a5cb5f606f3b51f83e85ebf0153c1506194f6709e90b"
 
+UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
+
 inherit autotools ptest bash-completion
 
 RDEPENDS_${PN}-ptest += "make"
diff --git a/meta/recipes-support/libcap/libcap_2.27.bb b/meta/recipes-support/libcap/libcap_2.27.bb
index 4f3bac84909..3f64ff76364 100644
--- a/meta/recipes-support/libcap/libcap_2.27.bb
+++ b/meta/recipes-support/libcap/libcap_2.27.bb
@@ -13,6 +13,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI[md5sum] = "2e8f9fab32eb5ccb37969fe317fd17aa"
 SRC_URI[sha256sum] = "dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a"
 
+UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
+
 inherit lib_package
 
 # do NOT pass target cflags to host compilations
-- 
2.17.1


