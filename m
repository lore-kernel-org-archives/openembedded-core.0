Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 46AB177249
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:38 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s5so46494249qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uxBp1VukMVyzTWqPjVMJnZfm8n+NXqlsvK/v/3sSLUw=;
	b=RZawkpTeo7WdqDsUfMaLh6l4Q3IvUS9VAkZpQMh3tWvc9aVoXrcsadnztUipbOSTAq
	6VaTX2ZPshJMhRvVRwNijQ1UeMgfZpaIsQYeloIWxg0dfMd2u8qYnmvMtDI4Voj583x/
	O/uKBd+gjYao7qk5Nytp5ReZz2IcDeB/glHiNlY9nREZpQ/IzBNJBnj8vpU1hSfwlaJM
	DB91cfLMKyYqm56sMEeFRsSkI9rjZDlf6w4p0H6/4ooXDEzcHrFKn6EqNyluwnEraXDj
	X8LAyAMF6D285kkBOuaRuoWfZMA183IOHHr4NLsHtMlLNJ8jWgX1vd4WU+bHmrPGgEQ8
	JnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uxBp1VukMVyzTWqPjVMJnZfm8n+NXqlsvK/v/3sSLUw=;
	b=cTus6MYLXUUr9SrEC8AXTdEUm8VpLPwcq05DjjMLQTO06bQIsd0Cy4XycCeIgLEHTB
	8Wr60U/WDShkst15w1osWN3pB+tlUGPjwGfnuT4K9dEd5U8R5dHP+TD0GT3tuyCTPbk3
	NRE6mW3gFsl0G7nL0v8YFQJsAmEtsmR5+KwWr26zRaiOBaX9qxhAJF1q5YRKobKj99fj
	iU3+F4JA1Pf4RPva0oh8wxuT1zCykiwqP6tro9LSYFCSXMuT27AN9b2YB+JHhivIKZch
	7+AJRxChwSgnzStSTCNqUfcWVelBHCLLeXwZAEB8RueJr5TlNBTKoSTHXOb++VoX1Ex0
	edXw==
X-Gm-Message-State: AG10YOT0I2sV/tLAxzmzL9O5QHu/WQMbIVIOf4rie+ff5JdPIfZ94qvreBkQv7zq4UBBMw==
X-Received: by 10.55.217.22 with SMTP id u22mr26431475qki.5.1454303319070;
	Sun, 31 Jan 2016 21:08:39 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	b6sm12058940qkh.12.2016.01.31.21.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:29 +0000
Message-Id: <e45e550e5d1bdcd4011e9d92c77201596d52ea2b.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
Subject: [PATCH 8/8] boost: Fix build on soft-float ABI arm systems
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:39 -0000

We get errors like
./boost/test/execution_monitor.hpp:490:27: error: 'FE_DIVBYZERO' was not
declared in this scope
     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,

on musl, rightly because FPU is not used on soft-float
systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/boost/boost/consider-hardfp.patch | 19 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.60.0.bb            |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/consider-hardfp.patch

diff --git a/meta/recipes-support/boost/boost/consider-hardfp.patch b/meta/recipes-support/boost/boost/consider-hardfp.patch
new file mode 100644
index 0000000..66808a6
--- /dev/null
+++ b/meta/recipes-support/boost/boost/consider-hardfp.patch
@@ -0,0 +1,19 @@
+When using soft-float, on ARM we should not expect the FE_* symbols
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: boost_1_60_0/boost/test/execution_monitor.hpp
+===================================================================
+--- boost_1_60_0.orig/boost/test/execution_monitor.hpp
++++ boost_1_60_0/boost/test/execution_monitor.hpp
+@@ -484,7 +484,8 @@ enum masks {
+     BOOST_FPE_UNDERFLOW = EM_UNDERFLOW|EM_DENORMAL,
+ 
+     BOOST_FPE_ALL       = MCW_EM,
+-#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG)
++#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) \
++    || defined(__ARM_PCS)
+     BOOST_FPE_ALL       = 1,
+ #else
+     BOOST_FPE_DIVBYZERO = FE_DIVBYZERO,
diff --git a/meta/recipes-support/boost/boost_1.60.0.bb b/meta/recipes-support/boost/boost_1.60.0.bb
index e7b91dc..4d824c8 100644
--- a/meta/recipes-support/boost/boost_1.60.0.bb
+++ b/meta/recipes-support/boost/boost_1.60.0.bb
@@ -4,4 +4,5 @@ include boost.inc
 SRC_URI += "\
     file://arm-intrinsics.patch \
     file://0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch;striplevel=2 \
+    file://consider-hardfp.patch \
 "
-- 
2.7.0


