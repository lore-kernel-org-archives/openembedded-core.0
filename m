Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D99117D537
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 21:15:19 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s18so2117667pfd.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 13:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pvX5ReQcrdVj2xH8IhoBcdBeRBAgZCNRHUS+vK0FEdU=;
	b=fP91yNinjOd6muvptBEmX5sen7CD0NgkSVjonl8G1jl1cii4p6JAel/AmU14aQoosv
	pagneCTMzpq+xuKvQiq60+LrQMzLK34W4s+Q+mp8s4yBOcZssPtUdDrv16yLN+mjsAME
	yyIPZpQbWwg2VoC79wt+KCIeMc4R1S5AInTAXZ+ociM5c6LE9tpBbrS8R6ZDmxYJhCGR
	TIN3QPzHlga+LvO3k011llm1v4tofVYOViBmXnN0IQIsmgB7TCgT5vqUjaoYzACVAW75
	47MmWPtJmN4c/A0wadJTgGILSJLnBETRrYkhlPNinGvwVgp9qxWYrh8qBbiat+ojhu0d
	gHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pvX5ReQcrdVj2xH8IhoBcdBeRBAgZCNRHUS+vK0FEdU=;
	b=HCWIX437UkMQ4SRs9NBSK4NfLEVYgpqR0EHL1Mlgz+dGvQavMiNfOhlKJ0jguYShYm
	qjcm9Yt5EumThdN5aeopgRB1BvTuXkJ2bXtuWep9C+iU764nfllmHGBeh1wt59BRgcxc
	1LgubunRPX6Ltb4Qq4h2mBxY1x34tXEW8BDcE8e5mVGmHP9M0TOxrxCa2xq3JoGp/YS6
	kKzazJOsHvlcwkPmwxne42OnBKtFDE+fYCaa2NFFfIfx55G1UH1trdjYsy7L2G5VhXe0
	JYBwQ33V1fZiNITI2TpOh5jc17xixf9cWXFbor/FjxmPzzkkAgx8VXBcPXp6vI5gfhlo
	Cq3A==
X-Gm-Message-State: APjAAAUNahc8e726uBVuDqviTb013X7yv4usvhLwHQJPX6j4j3ysEUW3
	IgjP4cwoS2FKAHjI2xiO6Lr6fXgke5Q=
X-Google-Smtp-Source: APXvYqz0oqXZC/g89/hDXAEoYO6iiWRhd9oL1bCVZ50WnD65f8xB3axtvHGhYJB4yGThPI6FFwJigA==
X-Received: by 2002:a62:446:: with SMTP id 67mr1612049pfe.109.1576271720517;
	Fri, 13 Dec 2019 13:15:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6d2c])
	by smtp.gmail.com with ESMTPSA id
	y23sm11671441pfo.110.2019.12.13.13.15.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Dec 2019 13:15:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 13:15:01 -0800
Message-Id: <20191213211502.3144020-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/2] goarch: Remove target specific dependencies
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
X-List-Received-Date: Fri, 13 Dec 2019 21:15:20 -0000
Content-Transfer-Encoding: 8bit

goarch is used in all classes of recipes ranging from native to target,
therefore its best to contain the variables and not spill over into
recipe classes where they can adversely affect shared state reuse e.g.
go-native currently gets TUNE_FEATURES into dependency chain of
referenced variables which means go-native gets rebuilt when we change
from qemuarm to qemux86 machine types since TUNE_FEATURES is defined
with DEFAULTTUNE which would change as machines are switched

These variables are specific to arm/mips/x86 so marking them with
appropriate overrides for native recipes will be right thing here

Chose 'hardfloat' for mips which is default too, 7 for arm and sse2 for x86
somehow go-native bootstrap compiler (1.4) still needs them so feed
commonly used values or defaults.

Fixes
ERROR: go-native different signature for task do_configure.sigdata between qemux86copy and qemuarm
...
List of dependencies for variable TUNE_FEATURES changed from '{'DEFAULTTUNE', 'TUNE_FEATURES_tune-core2-32'}' to '{'DEFAULTTUNE', 'TUNE_FEATURES_tune-armv7vethf-neon'}'
changed items: {'TUNE_FEATURES_tune-core2-32', 'TUNE_FEATURES_tune-armv7vethf-neon'}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/goarch.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 166dea9dc6..1147b6d233 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -6,12 +6,18 @@ HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
 HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d)}"
 HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOMIPS = "${@go_map_mips(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+HOST_GOARM_class-native = "7"
+HOST_GO386_class-native = "sse2"
+HOST_GOMIPS_class-native = "hardfloat"
 HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
 TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
 TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
 TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d)}"
 TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+TARGET_GOARM_class-native = "7"
+TARGET_GO386_class-native = "sse2"
+TARGET_GOMIPS_class-native = "hardfloat"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
-- 
2.24.1


