Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4AF6B88A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:03 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so183478ead.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FYquTR9I5M7vXbgvcM7whDVfANBDVAozTcyaSqBiZpU=;
	b=TTTWFpW6lAOEdawK3ZBa4hp2aaxt1O+Z3dgxDoQFJNG7C0XIqkAYSTS6qMjP1xqzDA
	XMDC1caqYmECbw/5EA4rjCPNAaC4NfPc5EFyYV4Uz7Wm28iHQRN8EsqdSWfspr7wxQug
	WJkOIm0PbRIKUQqM8TcUORzHaSmidUdBeQbOT5xueHP2AAxtbzTx9Cz6YCD40QYP9vSl
	YNW3FHQOMkDFDN4MBRliHr5+ftKWwaXeO7ZXHpodNP6Bs/O4TCxzfV6MP+gZ6ctJq5gs
	oY/fPe5BT4dbXoFkX2Ow8tVeS7u82U4u3vmj4/xTTl4s4m/AKa9Oi6Ks//1jfYTE7fp5
	8P8w==
X-Received: by 10.14.214.136 with SMTP id c8mr20436206eep.6.1376551383604;
	Thu, 15 Aug 2013 00:23:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm70011449eei.10.2013.08.15.00.23.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:19 +0200
Message-Id: <626202efaf85c51f06c29bbfde914c631267eaba.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 08/33] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:03 -0000

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
index 3d6382d..68418d3 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -3,6 +3,11 @@ include eglibc-collateral.inc
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
1.8.3.2


