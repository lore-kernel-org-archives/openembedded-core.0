Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A608A6BA9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 06:29:09 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v64so5603329pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4msJlUY+so7fiwr6q4EWFFHZQkyZld7JpIO6XDwS17g=;
	b=qm6/ncHXAyKONLFktiW+azC82vvsV5ZSnJHulk504DO6bEjAAKxJxNSP/iYUs1RdFv
	Oqv6CTxXV/PCHas7Jvg0UdOwuaQfRH0Lanh0Dos8dRXbGKhCHJvnuonZqKQOQVVNlw/f
	p1I+hG4uypcL77Jzy8mKFqNAsul7FszPHimmxQ45HbtQg9JoFvAhxdTKW3uYp9rE6ZIw
	72oMTd4Lk40bqh+VRfiI0GY5zbO8ZtA+kkJm1zolQluuakF8au6Tc2ZK36rmGpZhuchl
	GtjiwQ518VXzPwZyRCDwGAip239i4W8t89sXujQaufaVQgGAjbgeLhoemlKF28zRbs5J
	HnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4msJlUY+so7fiwr6q4EWFFHZQkyZld7JpIO6XDwS17g=;
	b=NXXX/MGG6goucxp1KMGOYAPmvrEjNsIoCiTlY7NpmjF4JEWoeQWUYvbA1xim7qVH28
	8YyrfFlOoDRCQwtiw9xzK76iMM42toCqDro1FTxLpY7PLgYMyGnYWYKA03U7U0PhiKW0
	eRe6mFVJmS7ftbDxEPl0B90yAVFvRVbP+sb1/k2fbZ6pHiEzIX5FHFHf0k8tvuqxerMo
	BpstvkhX9x0BkOmqVusWNkt+cjsZG4Z/Snte5//ySuKwPpgSM9VCe329nO1JvlbnqulB
	xAJzAZM4RxtSLkfVHhrBE2ztmVeHDciFP1Q6dhtuZc1LcK1SP2YNKDKuL+aRaAoDhBds
	J8Nw==
X-Gm-Message-State: APjAAAWqAtnX8jAB31tErz9O50Ci1JeFFskU1Ill/xo1bpmQkah6T9+H
	RJgKkwz8m8yADPa6jlKs82LGly8x
X-Google-Smtp-Source: APXvYqwPheuyqKf3AAMNmrj8IVzDnAtovudwGGKSNHYDDil8/zMNyL7qrW3FKEvkFVKrhI37APVAHA==
X-Received: by 2002:a17:902:15a8:: with SMTP id
	m37mr2517077pla.178.1552631350313; 
	Thu, 14 Mar 2019 23:29:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	v12sm1369041pfn.25.2019.03.14.23.29.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 23:29:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 23:29:03 -0700
Message-Id: <20190315062903.1431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] cross-canadian.bbclass: Do not override LIBCOVERRIDE with SDK libc override
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
X-List-Received-Date: Fri, 15 Mar 2019 06:29:09 -0000
Content-Transfer-Encoding: 8bit

cross-canadian tools are supposed to generate code for target and if we
override the libc override then needed overrides do not get applied when
building gcc cross canadian e.g. for baremetal, which causes build
failures during compile

e.g. https://github.com/riscv/meta-riscv/issues/117

Not override libc override helps us fix this issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cross-canadian.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index f5c9f61595..ee53faad79 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -9,7 +9,6 @@
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
 NATIVESDKLIBC ?= "libc-glibc"
-LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 CLASSOVERRIDE = "class-cross-canadian"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
-- 
2.21.0


