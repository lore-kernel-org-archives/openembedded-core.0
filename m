Return-Path: <net147@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id AEB6B7482C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 04:23:33 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id k6-v6so2097222pls.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2018 21:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=a+tGN8bsrLg4E8YV2B9P+DFpaVyGhlPNNQ759AwkRzc=;
	b=SLr38qs8a3er/y733g+H5mFJ3MNXPciVejnHcSZ9oBBuPbgme6aUWNAkACpBUIu6Td
	rMOOAooQUO+ijqEd+1wuf3EEPPhS5zI41zpym3LkXHdT5Poo1m99ua/lWvqmAaD7W/vs
	7b9RCx/Rr6h5r4r6gGFCvW6GVK9nqaNiBZyQ5sLVcIbxR1vLB73vqqT6wcw4Zd2CjovJ
	ibrCenwaOq3p53aGu842c91xmberG9v3AZF8cwRqBYBM6ru5u7cSH/ebF91x7v9q1gIi
	7l9BTCb+75BKB/d7WX1ACOQ2qyu7XHO4w4oSTIPQZLpItaIP6q2a9lIYLBD6pwKysYh3
	QRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=a+tGN8bsrLg4E8YV2B9P+DFpaVyGhlPNNQ759AwkRzc=;
	b=TS/VeRViRS5KaHosJIJ8Wm0qivvK+cyAfjT7eV3HxdGlbWcV0mslhvBSzVX0qGxM4H
	nzjiv7Ybw82C5Ri2Pwp+a4OduenXYJSeo1WotxSWF38B+zNdZ++Hu6PXXJsQqc8YJCij
	zr9uV3ZOVLEJ4bvFSwBvOuM0CLF0jk27gcTIWL+WwWc7jHlIBNAz6gcwc7oDTTs0yWet
	ckdMYjvpdJGNMbwWcmclJPaKsNOxHL1rg2C30fkSclThCcZnar080ZEU5MocalgqaWQs
	/OU9urUiDLMz/ElpoEMiPr21a1UiCENz3uGMFJomLjdZX63VxDxooIKryDKKIvypy+si
	jYFQ==
X-Gm-Message-State: AElRT7EVys+72HDod+49ZCFPqI2FLnrYpwzlbRPCJePWTVNJwcg/aKnP
	hYE55/3QRr3rJjgtYl/s9Uk=
X-Google-Smtp-Source: AIpwx490lV1GP4RXtxQ4eTqSvaDt1Uq/oWLZ81v91hDjX7lArgEkHotH2vnJzGJoaGnbNLQpgDC0kQ==
X-Received: by 2002:a17:902:7894:: with SMTP id
	q20-v6mr12724259pll.86.1522729414188; 
	Mon, 02 Apr 2018 21:23:34 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	w27sm2857717pge.20.2018.04.02.21.23.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Apr 2018 21:23:33 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 14:23:31 +1000
Message-Id: <20180403042331.24524-1-net147@gmail.com>
X-Mailer: git-send-email 2.16.3
Subject: [PATCH] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Tue, 03 Apr 2018 04:23:33 -0000

Set KBUILD_BUILD_VERSION=1 to avoid build version being incremented on
every build. It is visible in the output of "cat /proc/version" after
the hash character.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4877965af0..78d6c30b07 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -151,6 +151,7 @@ PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
+export KBUILD_BUILD_VERSION = "1"
 export KBUILD_BUILD_USER = "oe-user"
 export KBUILD_BUILD_HOST = "oe-host"
 
-- 
2.16.3


