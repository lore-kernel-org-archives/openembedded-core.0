Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 77EAF7F7C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 16:51:40 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id q16so3386203plr.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 08:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WVnHz9d3hzH+IiWRolLHjtgmV6aaGxvfFbhO92qW8nk=;
	b=AwxWtR7XYWXSvVakgqYk03SwGzRyZVg2ix16CfAR2Rv4zWLTopUNMC4V5n+iGgMqov
	AK/0hzjV1WQaGXkXvz7hE1LXQ0CdxW5CEjdZbYv/lv+n5M7v7MWPZvWDyvb7+HVws1IK
	BmVoA/YwuAglwKx0lu0OlmG4LAC2kAn1jGMt4FxBibm/nsuV+A6nTprE2wqFEPk7RaMy
	jlRVjJgrjr6B+Ch7UAundCB213erAyC+SCM75ehCiYgxRvQEBPeYY9GPLOZkCQ6UqugL
	34T/Jun0tLWT5Oot/8y6a6Xkab6do/iqZ68y9ea8utq4njUgAoc8BL2uAhOFGTai+syl
	BooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WVnHz9d3hzH+IiWRolLHjtgmV6aaGxvfFbhO92qW8nk=;
	b=mpf38Gh4yZvjjBQKpQ8cbfOd1NNrM5TRDzMdaGhB2H8/MMCUzhvylx2/tOIDhOcrdJ
	HJOE957KO8imA/BTvoJC5SRFp6K4VYZzcG3lM3qYEviWKwwcuFUqZmUlC9GpSNzZAfOt
	ase1QHkEFPAX2PD70xRg+eQuyNlaGQr8OR7IGoxsb2D57aRXunuMz/Ksn3EpzPrBM2KS
	smRyz3Qww3VCsDE4nLDRbH1GqOQhQvY2ilWzMuiJS++cSrsqjBjPkbwHzUxQvd6otaqp
	vCaf/WarxE5JFeEMz4N8kJD4AxQt6bcxbXeFVqK50xqDX1v42C8Ric+GBhBKLr5KODlX
	uSCA==
X-Gm-Message-State: APjAAAU4+OXlDBcjXIza2+xnC9w8RnkjRPxB20jUahMswMQIGr166wbF
	ae9ix7HDtWyjXqxllHXjLdo+f40EBQg=
X-Google-Smtp-Source: APXvYqyLBm9xqROrQCsDu8XLTJBfJl7Mq/vb2YO2SVgoGTZpbGeWItI6MXUbOCsnLWJjTTig3khmGQ==
X-Received: by 2002:a17:90a:fc94:: with SMTP id
	ci20mr4176885pjb.6.1575478300847; 
	Wed, 04 Dec 2019 08:51:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id y6sm8178320pgc.10.2019.12.04.08.51.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 08:51:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 08:51:25 -0800
Message-Id: <20191204165125.2546258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH V2] go: Reset unneeded GOARCH variables for native recipe
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
X-List-Received-Date: Wed, 04 Dec 2019 16:51:40 -0000
Content-Transfer-Encoding: 8bit

These variables depend on TUNE_FEATURES variable and that creeps into
dependencies for native as well as a result, which means go-native gets
recompiled everytime machine/arch is changed.

Fixes sstate differences found e.g.

basehash changed from 600fb6be571fa4853232a7fed78945ee19b324e54b1b94cff93ef472b6290103 to 994de861190a56064d3e186d9c411152127e230bf2f77b17e59b2c5932a41249
List of dependencies for variable TUNE_FEATURES changed from '{'TUNE_FEATURES_tune-core2-32', 'DEFAULTTUNE'}' to '{'TUNE_FEATURES_tune-armv7vethf-neon', 'DEFAULTTUNE'}'
changed items: {'TUNE_FEATURES_tune-core2-32', 'TUNE_FEATURES_tune-armv7vethf-neon'}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Cleanup a bit by defining YOCTO_ALTERNATE_EXE_PATH

 meta/recipes-devtools/go/go-common.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index f18d928c70..aa2482d356 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -37,6 +37,16 @@ export GO386 ?= "${TARGET_GO386}"
 export GOMIPS ?= "${TARGET_GOMIPS}"
 export GOROOT_FINAL ?= "${libdir}/go"
 
+GOEXPORTVARS = "1"
+GOEXPORTVARS_class-native = "0"
+
+GOARM[export] = "${GOEXPORTVARS}"
+GO386[export] = "${GOEXPORTVARS}"
+GOMIPS[export] = "${GOEXPORTVARS}"
+HOST_GOARM[export] = "${GOEXPORTVARS}"
+HOST_GO386[export] = "${GOEXPORTVARS}"
+HOST_GOMIPS[export] = "${GOEXPORTVARS}"
+
 do_compile_prepend() {
 	BUILD_CC=${BUILD_CC}
 }
-- 
2.24.0


