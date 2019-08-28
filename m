Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D11F7F04A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:06:56 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y8so620722plr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=lwfAPMgTmmNdqc5B3peLfFqIOkTOj5VAWVIfx/ZXHrc=;
	b=YhZXLPAk9fkDEXTyjlT1TPYjblDSrodViWK5R4tXNSVHISYBS8V21+KXqpBiVb4EmO
	bbrdlIlXYsmMakbfVoOJAYS0UXAZ0k9XySWbRkfuIhFqeX6Ts3kr8lq1QIp0htxPAPbt
	l8Ln+69jmvNTFbZ/OoRwRH15bQcMWO6uBgLEX331Es1VCDrEEEWW4utvXdmV2yEfKmJG
	NuUW3k9V1eTV3ZuudDlj5YJFyGfz6egAqABvm6TTJO0yj/AaC0rd9RdpuYD00HXDF/7O
	Vm8iZyJuaES7O6EfdRa4PkL3/lUek62icQ/4wTpeSZv6WNTVwsyJMs0RHzAIANtA3TNa
	PgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=lwfAPMgTmmNdqc5B3peLfFqIOkTOj5VAWVIfx/ZXHrc=;
	b=Wp8kL2szWguDsNv1eKhgbqs8LeSI1lWH70AAABHRg+2j9lJDAtPRLKuNZKJB7uje9M
	pSh1BMVTdo7+wl7vNbNGK984d4qfx2Et1XZjga4EY8KT2J33Vm0FSpptrROnBfn8g+wR
	4NSVI7jWaC0I66G4Krbbm/nHd08QbRDoENB8SubQn82ukFQE269WSISgBtfkAsi1gXVd
	Ey9EbBQCTSm+kZFgBnrT+/EbPuCCKnAD0KIP4JYONnbG8dR7rQmYyjdAPeqXTJXG3Zkk
	Yw+cyGLvkQ3etXzMGCCl63JkP6laeKm6Yum9fddwtHuWAkBJceyCzZpW6KGeGJAXw1kL
	C0KA==
X-Gm-Message-State: APjAAAXestkzJhm++K8mxAkTzEw49jmGpT8Fc7vmTrhwDRBzcVWjKur5
	UFrX7bRTgoo7G080rxLiyClrLg==
X-Google-Smtp-Source: APXvYqxZFvMnplJBvCaFl4cMRgg7o56b2V1dk9c/bRicQG1Io9b8NymyZO0d5n2BQ2nEPtPnOydm+w==
X-Received: by 2002:a17:902:1123:: with SMTP id
	d32mr2500614pla.218.1566968817665; 
	Tue, 27 Aug 2019 22:06:57 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	t6sm785601pjy.18.2019.08.27.22.06.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:06:57 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-3-nathan@nathanrossi.com>
In-Reply-To: <20190828050629.6392-0-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 3/11] gcc-runtime: Add do_check task for executing gcc-runtime test suites
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
X-List-Received-Date: Wed, 28 Aug 2019 05:06:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add a do_check task to implement execution of the gcc-runtime component
test suites. The component test suites require execution of compiled
programs on the target, this recipe reuses the same setup as gcc-cross
for setup of the target (either as ssh or qemu linux-user).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 22c1d78dd1..ce0b5e482d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -277,3 +277,40 @@ FILES_libitm-dev = "\
 SUMMARY_libitm-dev = "GNU transactional memory support library - development files"
 FILES_libitm-staticdev = "${libdir}/libitm.a"
 SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
+
+require gcc-testsuite.inc
+
+EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
+
+MAKE_CHECK_TARGETS ??= "${@" ".join("check-target-" + i for i in d.getVar("RUNTIMETARGET").split())}"
+MAKE_CHECK_IGNORE ??= "prettyprinters.exp xmethods.exp"
+MAKE_CHECK_RUNTESTFLAGS ??= "${MAKE_CHECK_BOARDARGS} --ignore '${MAKE_CHECK_IGNORE}'"
+
+# specific host and target dependencies required for test suite running
+do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
+do_check[depends] += "virtual/libc:do_populate_sysroot"
+# only depend on qemu if targeting linux user execution
+do_check[depends] += "${@'qemu-native:do_populate_sysroot' if "user" in d.getVar('BUILD_TEST_TARGET') else ''}"
+# extend the recipe sysroot to include the built libraries (for qemu usermode)
+do_check[prefuncs] += "extend_recipe_sysroot"
+do_check[prefuncs] += "check_prepare"
+do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
+do_check[nostamp] = "1"
+do_check() {
+    export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
+
+    # HACK: this works around the configure setting CXX with -nostd* args
+    sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
+
+    if [ "${BUILD_TEST_TARGET}" = "user" ]; then
+        # qemu user has issues allocating large amounts of memory
+        export G_SLICE=always-malloc
+        # no test should need more that 10G of memory, this prevents tests like pthread7-rope from leaking memory
+        ulimit -m 4194304
+        ulimit -v 10485760
+    fi
+
+    oe_runmake -i ${MAKE_CHECK_TARGETS} RUNTESTFLAGS="${MAKE_CHECK_RUNTESTFLAGS}"
+}
+addtask check after do_compile do_populate_sysroot
+
---
2.23.0.rc1

