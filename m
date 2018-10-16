Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BBBD5798B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 19:54:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 143-v6so23527593wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 12:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=7IivQRpIAIA+zhIgAfPloglZsXmu1QUhAer8CC5wVMs=;
	b=Xre6KNYKA6jn0ZjJPCHSilqPY5271W2+iEV5Ah3bsorHrp/FSwccC75uXKYvDWivDP
	5RBWOIbyPpkNN9cKg7UjsgpPY8vZvQYZVEq68owUnUsKMZT7ZIPTDn+oCJfnwUN71GiB
	KqqUwr7sYNBAKV9MuWQ+3ix3JvIdFtAqpk4DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7IivQRpIAIA+zhIgAfPloglZsXmu1QUhAer8CC5wVMs=;
	b=n5Q54mYUo40GgQjZWpkodt4IM/Jd714TtC0rwQnATuXYf8NXluF0CDllg1tAjG7hAE
	GN+5aH5uLhFfczi1+7ONT60S/isZljuZu9vtGUPbwuHiTTvQ3DyUAKVkb/4HevMZi7IN
	PfsN+UEUX9zeWXTLypaXklxYN+RSqAfDC3A1RBtH4ZnTLPtBdOX4vPoW3V9cu6KkOs83
	qxU3yR4YvWd0WPd5kgEfU7OEaNikE0BqBNxMxy0jeFa76h4gITaT9xOIa3Gp7b6T8a3K
	ak92YLDaE8TM5SVFdw+up8oTRISSNK9k38pJiLsuGKP7Kd+GJ5SunBDpLwdUFcwEJAS+
	APkw==
X-Gm-Message-State: ABuFfogv4ZwXl3xGP+DD30XLmuBRcTR1NaneU3ZhXKduMIFt+Vjyd9FB
	7CjS1pznD8z+38ZyFEHLMDMcC8QdZBg=
X-Google-Smtp-Source: ACcGV61nYOBgmlJDr1wndgc3OTbbWlzKf6B8HNGVPdCE5iQCUFHRB2Pefd0NvkV/8MbkomSFqDIIKA==
X-Received: by 2002:a1c:b4c1:: with SMTP id
	d184-v6mr18636845wmf.143.1539719667889; 
	Tue, 16 Oct 2018 12:54:27 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t143-v6sm10274309wmt.2.2018.10.16.12.54.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 12:54:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2018 20:54:25 +0100
Message-Id: <20181016195425.18833-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libgcc/gcc-runtime: Disable thumb mode on armv6
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
X-List-Received-Date: Tue, 16 Oct 2018 19:54:28 -0000

Without this the build fails for armv6t targets due to invalid
assembler instructions in thumb mode.

[YOCTO #12929]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime_8.2.bb    | 2 ++
 meta/recipes-devtools/gcc/libgcc-initial_8.2.bb | 3 +++
 meta/recipes-devtools/gcc/libgcc_8.2.bb         | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
index fe787174e8a..a1c7a76d0b1 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
@@ -8,3 +8,5 @@ FILES_libgomp-dev += "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
 "
 
+# Building with thumb enabled on armv6t fails
+ARM_INSTRUCTION_SET_armv6 = "arm"
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
index 19f253fce85..0c698c26ec0 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
+++ b/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
@@ -1,2 +1,5 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require libgcc-initial.inc
+
+# Building with thumb enabled on armv6t fails
+ARM_INSTRUCTION_SET_armv6 = "arm"
diff --git a/meta/recipes-devtools/gcc/libgcc_8.2.bb b/meta/recipes-devtools/gcc/libgcc_8.2.bb
index a5152f28e9b..ea210a11308 100644
--- a/meta/recipes-devtools/gcc/libgcc_8.2.bb
+++ b/meta/recipes-devtools/gcc/libgcc_8.2.bb
@@ -1,2 +1,5 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require libgcc.inc
+
+# Building with thumb enabled on armv6t fails
+ARM_INSTRUCTION_SET_armv6 = "arm"
-- 
2.17.1


