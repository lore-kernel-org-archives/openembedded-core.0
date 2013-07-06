Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 604FC61642
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 08:39:19 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so1760910eek.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=nQH2AKhOsf/HfwgqdkO9+/OPyTP/IMiIsDgJ5BP6MuI=;
	b=UApM3IoT0fvG4HXAdDA/4STRPdm+AtACAAvD913MwtE3dNRJ43daIkb9bcGn+O+HFl
	JytYASItyQotEGCwE+vqoCGDct872C5rRiryNtn4UfM7+/WBYkRLlZ0vZdL+B7zyhf2q
	4AZoE85v94gVbXJfEcXkjIm0QOrXNTcIi6LWsC5+Z41XCM3xy1PbaxZUEB3phy6xvIsd
	6dQkxiahjJRWUsJLggHdj3QOeV9P+XAIrqDlRcntFgykAt2D6z2OMiBsQqNZAGCMzIrC
	uUKxz2sUPRsD6y+rHeoux6y0UStRRqX6LIRx5X7Pb43BPD5w+O5xPPz7M/NDHzrsmj8l
	COPA==
X-Received: by 10.14.182.132 with SMTP id o4mr15756527eem.94.1373099959381;
	Sat, 06 Jul 2013 01:39:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm21507685eeu.2.2013.07.06.01.39.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 01:39:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jul 2013 10:39:21 +0200
Message-Id: <1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130705224311.GA3288@jama>
References: <20130705224311.GA3288@jama>
Subject: [PATCHv2 1/2] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Sat, 06 Jul 2013 08:39:19 -0000

* eglibc-collateral.inc inhibits all default deps, but do_package needs
  objcopy:
  ERROR: objcopy failed with exit code 127 (cmd was
  'i586-webos-linux-objcopy' --only-keep-debug
  'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so'
  'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
  ERROR: Function failed: split_and_strip_files

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index f4cb814..c3fcc6d 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -5,6 +5,11 @@ SUMMARY = "Locale data from eglibc"
 BPN = "eglibc"
 LOCALEBASEPN = "${MLPREFIX}eglibc"
 
+# eglibc-collateral.inc inhibits all default deps, but do_package needs objcopy
+# ERROR: objcopy failed with exit code 127 (cmd was 'i586-webos-linux-objcopy' --only-keep-debug 'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so' 'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
+# ERROR: Function failed: split_and_strip_files
+DEPENDS_class-target = "virtual/${TARGET_PREFIX}binutils"
+
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
 # to decrease initial boot time and avoid localedef being killed by the OOM
-- 
1.8.2.1


