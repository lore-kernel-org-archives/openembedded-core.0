Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3909E7317A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:12 +0000 (UTC)
Received: by wmww144 with SMTP id w144so25418891wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Y7AWEBcndNfSF6eJi7MsrpKnW74Rm5uOexAsYtrs8To=;
	b=gCpXYsGwqIJ7xPAc83V1wCpzqjNiLF1REjhXrAKdhIaak+xEPS8clxnHLftmVa030E
	IK8iZ1JvfaNTAoUScwramrq3iUw9oENu3Qh8xpECFLgriP1cEsnLb8+0XE/FuMCqy93y
	fzh5GgamS4+ss8ZyLOtEgn/gCaWr9HzCjp5YeF7Ed3u85IM5j7OnUBuEC7SJkrUPqCOI
	958Ev2JFybPuE5Ecsbh0oXk6I2Lh1Ic4LEgtnwfxZgADFzeLYUBKtxUAxiZB0xnME01q
	GX/94ndl8sRR0HtjvP0TDOXxhSrxZ2VLNyAvbHC56YACxbB7mfWf1zNpqwsFSW/URIsw
	kw5Q==
X-Received: by 10.28.130.7 with SMTP id e7mr40837318wmd.68.1449755232884;
	Thu, 10 Dec 2015 05:47:12 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cs4sm12476705wjc.10.2015.12.10.05.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:38 +0100
Message-Id: <12d049af4428da8cac1638636b8f655eca44d48d.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 01/15] sanity.bbclass: add more information to error message about TUNE_PKGARCH missing in PACKAGE_ARCHS
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:12 -0000

* sometimes it's hard to see whots wrong here
* error message:
  Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (cortexa7t2hfhf-vfp-vfpv4-neon).
  doesn't help much to understand what exactly went wrong and where

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sanity.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ad9dda8..9f35558 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -329,6 +329,7 @@ def check_sanity_validmachine(sanity_data):
     # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
     pkgarchs = sanity_data.getVar('PACKAGE_ARCHS', True)
     tunepkg = sanity_data.getVar('TUNE_PKGARCH', True)
+    defaulttune = sanity_data.getVar('DEFAULTTUNE', True)
     tunefound = False
     seen = {}
     dups = []
@@ -345,7 +346,7 @@ def check_sanity_validmachine(sanity_data):
         messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
 
     if tunefound == False:
-        messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
+        messages = messages + "Error, the PACKAGE_ARCHS variable (%s) for DEFAULTTUNE (%s) does not contain TUNE_PKGARCH (%s)." % (pkgarchs, defaulttune, tunepkg)
 
     return messages
 
-- 
2.6.3


