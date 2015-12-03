Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E047F70016
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 19:57:51 +0000 (UTC)
Received: by wmww144 with SMTP id w144so37201698wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 11:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KryXXInBEoxV2+j7GK0z+5IwelBT4EL6R6ASy0A3G5I=;
	b=jTLKh8XGwiirlI+sZv8ghVNoB/22krz/gwhU4JrOF4SVGifWp2465c5IXtO7eAl1s2
	da8K6l+YCpUWorHzmqrrr7BgGlUa/rDQOV1MdyCuqrVNfpvu2rtMmB+vcaN9kPMjOlp0
	RmjGwjfWhzAzM/aSZ6HX8VS5Era4udnnwc4jr/LNnRm8DQl52dfuHznb86Xoz4gJgn0s
	qRbRhPwSzW6aTb/TMBBW/KFOgAKMZZCoNbxDUqj1JVjBXL/CPgNzwr/d6SwNNfeQn/w5
	NkRQv1lUiUYaGmxEmkaSJWfaDoQaLMmeYTl6vVnsNTgrABqwyMTpvKouLcHxv1iI6342
	d2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KryXXInBEoxV2+j7GK0z+5IwelBT4EL6R6ASy0A3G5I=;
	b=XcNqlcoU3B8MI7a+S/N1p+gupGcRwZDj6pOaZQLT+82EQB315ltjHFHN2cDpvRRKLn
	327R0tKOHjrNYWZygtWGhIIihhCGB4f3i9vw7q9YcPc3CvUD+4qlJKBYHF1Q8I8AtQad
	xBf95Sbo+DMXnj6WoKEmTKlufsu2HpDHF6QxFLSDjUkBdCezOc11PtL4Bp/6zOcjK6rY
	lxgaD6On2/pePj3cJBSYFrDHcRIRMFgyRXrtlRlEGk/9h4ZqyhBK/dA+iihBL32fHu6J
	ZNp/kp4krWgVZHrFSWIzB7vVhMVf1Tqgd7v5OwX5lddcCeMkcifLO4OLj0RrrYTkWa0g
	k2sA==
X-Gm-Message-State: ALoCoQkopEEMQUqmoARh2ScHts1/juQLmn9LBz6QJyN0PqcxH+oOF2ybBvkqJPO6WbaYDQN+9vGA
X-Received: by 10.28.180.132 with SMTP id d126mr493145wmf.72.1449172671963;
	Thu, 03 Dec 2015 11:57:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id i18sm431221wmf.6.2015.12.03.11.57.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Dec 2015 11:57:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 19:57:44 +0000
Message-Id: <1449172665-1343-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449172665-1343-1-git-send-email-ross.burton@intel.com>
References: <1449172665-1343-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] glibc: fix libdir/libexecdir path confusion
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
X-List-Received-Date: Thu, 03 Dec 2015 19:57:54 -0000

$libdir/glibc is deleted if it doesn't exist but this is incorrectly assuming
what variables are used to create this directory.  In fact libexecdir is being
used in the Makefile so use that in the recipe too.

This fixes builds where libexecdir is changed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 5f60368..36c5350 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -82,9 +82,10 @@ do_install_append () {
 	rm -rf ${D}${localstatedir}
 
 	# remove empty glibc dir
-	if [ -d ${D}${libdir}/glibc -a ! -e ${D}${libdir}/glibc/pt_chown ]; then
-		rmdir ${D}${libdir}/glibc
+	if [ -d ${D}${libexecdir} ]; then
+		rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
 	fi
+
 	oe_multilib_header bits/syscall.h
 
 	if [ -f ${D}${bindir}/mtrace ]; then
-- 
2.1.4


