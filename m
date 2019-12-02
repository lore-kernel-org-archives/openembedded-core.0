Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 54F697F65C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 18:26:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y10so44038pfm.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 10:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LAcxEA8m22o6bG9ErEYfVqX4Xez/BhG/ZxP7KUVmvo8=;
	b=ANg/ChBnp4lXzeXur+yGehYbUvcbzKfRJFXbJV/0FIahjr9h/AO9aOyLtF5ANM71T7
	Zz/Ze57hfsfyI7hEMRKj7Kwt34a4yYUAhuUhgD8iWA6YD5ZeppjmtD+voXl+BwdTyV2T
	bBQQFaaafsKESYByR7g5QUTdgfhY0NuQXMrUHnLUwSg3BsxpXMYK+uWiCQh709mLTyg1
	7lo29TsSGCrB0p24J7TYTiVrXpZ0MLefgo7XSlKu+i+FAIjCpaFeJnPScQlaPRRlj3+D
	F/A+3aik1furlxkhySISaZeiCGRWH12gR4Mk5yBrmTqWgNjaSMyheapRmJrmaIvJ7XTE
	S8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LAcxEA8m22o6bG9ErEYfVqX4Xez/BhG/ZxP7KUVmvo8=;
	b=k0QjJGPdh6egSAOHIdQ7S5i6viLiybULC1lxFkkawL5vBY/2fyhclXgoic4qjPNOF0
	SzJ64VCcOVx38i+WlkTwyLj2IWWktdSevF9K6Mx21gw3vks1mUHK7v6pFUA8EGiAlx71
	gmbAAmwXEMzgSeASo6DJ47ekuQbQBqHD0Pq27LSa+wjx0f61NZZbh0ZsiAAYUWL1iEGX
	yM4e4N+9sWFl41aT9StGtmtk3sDXTTytT0AxQEeewEtk95whBkuH+x/ZzLnqdYSIHWyH
	++73ecVS6MxWmsAmpfidhQw5qIZrYQq+Hnj1anuKJHlocJmHe/VUt7ipNXTlqUVFKcFU
	jVuA==
X-Gm-Message-State: APjAAAX0juPqbA5SqRlSP3UJ53CiwtplkO9hh8oSINgWmS+vQHKJGHfF
	5L+ag8iukXa2oOQQ4ZJ6MutcZ3X8iA8=
X-Google-Smtp-Source: APXvYqwHlrqupNR9uNakbmmxKrRm9GjaBC6XfRoa+BkcwCZcu8ZGgODpCyd60Ouqd499kOUjjQs4mw==
X-Received: by 2002:a65:628f:: with SMTP id f15mr437704pgv.91.1575311184754;
	Mon, 02 Dec 2019 10:26:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id u18sm289868pgi.44.2019.12.02.10.26.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 10:26:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 10:26:13 -0800
Message-Id: <20191202182613.3380457-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] go: Reset unneeded GOARCH variables for native recipe
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
X-List-Received-Date: Mon, 02 Dec 2019 18:26:24 -0000
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
 meta/recipes-devtools/go/go-common.inc | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index f18d928c70..8e4dd137a0 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -37,6 +37,30 @@ export GO386 ?= "${TARGET_GO386}"
 export GOMIPS ?= "${TARGET_GOMIPS}"
 export GOROOT_FINAL ?= "${libdir}/go"
 
+GOARM[export] = "1"
+GOARM_class-native = ""
+GOARM_class-native[export] = "0"
+
+GO386[export] = "1"
+GO386_class-native = ""
+GO386_class-native[export] = "0"
+
+GOMIPS[export] = "1"
+GOMIPS_class-native = ""
+GOMIPS_class-native[export] = "0"
+
+HOST_GOARM[export] = "1"
+HOST_GOARM_class-native = ""
+HOST_GOARM_class-native[export] = "0"
+
+HOST_GO386[export] = "1"
+HOST_GO386_class-native = ""
+HOST_GO386_class-native[export] = "0"
+
+HOST_GOMIPS[export] = "1"
+HOST_GOMIPS_class-native = ""
+HOST_GOMIPS_class-native[export] = "0"
+
 do_compile_prepend() {
 	BUILD_CC=${BUILD_CC}
 }
-- 
2.24.0


