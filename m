Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id A79D472F62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 16:57:07 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id l37so27681490wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 08:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JxtE0Ezu8Jp+qC5uZVsO9fMivY65+dH3kzcar0De9n4=;
	b=MZpIR5T7bteWBO1yidSY5pIqtxkWV9BiRpgreC1sWP/Fs8QBXIf1PNUC25SQvj6k3Y
	O5xVDIr1NrXwiMQaaKZXeNvylTtkkE98gD6C22nQyWpvRhaS0qxkhzdiUI2cxLhCvQaS
	LjVcYKpJzXTztlTplEdw0rVYutpuJ+azackYKd1N7zbHXaEhDX9Qfu5h3IwfZI1DMWI2
	oF3F+tMlZMSvYd8yftxvCmQZmejpevBj1J4ENrktpN7cVr6cR3pA+ThN4kSrunmAU4uI
	1Cq+T5jS9JD3cFSK1GMyUNXEpp+bpX6L557FhG1+o8qSrz6rpT8kcjqsOMoSFb1KE3gN
	FrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JxtE0Ezu8Jp+qC5uZVsO9fMivY65+dH3kzcar0De9n4=;
	b=RIlO+jmSwuZAfk6pS0Cf2Ro/eesc4R2Zt6aHW6YV01EaoFAhKtu66aTLLqztPulA1S
	rhXyWlQspAXB6yWwlQONeQ0VePeyJ5yBuNZq5zIDreEmOMQjBfqBk5SNf0myRk+JEio+
	D0IGRdpgMbX7+sBHQ6npRXuaviZOEEGTGRwFnIZHCZnBJxPmGH7OOWByUGMRDSgK2cUg
	UJeUzyXTa4Y7yWFh+oxdN2jgZu7DEdbt7OBZRUSiPovVCbhbOysJJXYgYlkf7yyBqEFM
	odLgtxSe5XWKy+mFnUnq8Zd3mek3YfmTxjwagxOyjcJ+fW+uok9FVBNQAaKWFPrsYICJ
	PMXg==
X-Gm-Message-State: AMke39kXEM5LW21s/BK/LtZrdCsF6cgHyBQpv4olfAyMdkH69DEIG6e4MfgmOINv4vgtJViG
X-Received: by 10.223.154.149 with SMTP id a21mr6130961wrc.145.1488992227836; 
	Wed, 08 Mar 2017 08:57:07 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	t195sm6881500wmt.32.2017.03.08.08.57.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 08:57:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 16:57:04 +0000
Message-Id: <1488992224-2962-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] openssl: disable cryptodev by default
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
X-List-Received-Date: Wed, 08 Mar 2017 16:57:08 -0000

Cryptodev is a way for userspace to access the kernel crypto drivers (and so,
hardware crypto).

Not all hardware supports cryptodev so this is something that should be enabled
in a BSP layer instead of in oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc       | 2 ++
 meta/recipes-connectivity/openssl/openssl_1.0.2k.bb | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 9afa5bd..03dee0e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -15,7 +15,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
           "
 S = "${WORKDIR}/openssl-${PV}"
 
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[perl] = ",,,"
+PACKAGECONFIG[cryptodev] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,-UHAVE_CRYPTODEV,cryptodev-linux"
 
 AR_append = " r"
 TERMIO_libc-musl = "-DTERMIOS"
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
index 1973f81..4436ba3 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
@@ -1,10 +1,5 @@
 require openssl.inc
 
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-DEPENDS += "cryptodev-linux"
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native = " -fPIC"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
-- 
2.8.1


