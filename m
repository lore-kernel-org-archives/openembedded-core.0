Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 19E0F781F6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:58:31 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id n195so30546907wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DjU9fkkNLOwiCNSeLWSkuenwk8JX3pDLqe68ZUcmKX4=;
	b=MnzhHXMuaL+2ZP4us81niBev9o5iva3B7F02fBSLaxw/oORTsdr9oLNO0OT6lpmKfH
	XiDHnGrPRR7bW+HiVkT3U+MP2S8ocYpwKl2gKutRdkk6v7j4QRPupGybqtQ7MgExezMO
	0WoBOY3Bq/M6eA7gD/ztW3CHu077RWxQfR00qaOJcHq7jdS+1FYnSGATA5iWADjcHSsl
	xUbWQpb64f4NXnIMLIPtJj0QovanHWFG8jVQHiF1sdS/GgPFDp7Qf+bBEQaSrMKL9Hga
	fTd+u2s872ibsoEZTy/c5l0+La1b+CP9qkeu/3my2X4ebyTGmEWeORib/D+dD/pJbewY
	x/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DjU9fkkNLOwiCNSeLWSkuenwk8JX3pDLqe68ZUcmKX4=;
	b=KXWROjUwck9ljMS0Y3yNfVW0k+iL6mgeo2InrZgZaR66jDUTakQYMH4zC75s3kwiqj
	w2Pw69IHPIPGlicyzigK0rgVo+rOpRYxskrFXz3+ijy4eM/+eEsLPbUkJjIi3e/afHwV
	v9O81N2SX4/GpMLOiPIA7t21wZHdW/Dp0r92r56aIPZYkTa45HuRvO/k5MYo3UsU4npo
	m9p1ZHewbqvBLAgfm+7gvxSG7X/6O5a9ptVXxKrZV1uHV50axEwMLnwiylYq8TOyL1zu
	HW6Fn40sDus1KNKbeIDBswMUFAOZB0ONa/0cXxIY3lGP7KDLgcqSt9G80SMCGEZQPWiZ
	XoyA==
X-Gm-Message-State: AKS2vOxWF3AQEXp3heCQwh3rteRfBCy8O6bCPKY95sCZV2CY8+fX3dZO
	XPsJRIlAPKeIz/nz5lU=
X-Received: by 10.28.45.13 with SMTP id t13mr3354194wmt.98.1496926711785;
	Thu, 08 Jun 2017 05:58:31 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m14sm4918503wmi.2.2017.06.08.05.58.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 05:58:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 13:58:29 +0100
Message-Id: <1496926709-20617-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] opkg-utils: if Python support is disabled, delete the Python scripts
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
X-List-Received-Date: Thu, 08 Jun 2017 12:58:32 -0000

To make it obvious what is lost when python is disabled, actually delete the
scripts so the user can't attempt to use them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 06710b5..ed5980b 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -19,6 +19,7 @@ S = "${WORKDIR}/git"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+# For native builds we use the host Python
 PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-subprocess python3-pickle python3-compression python3-textutils python3-stringold"
 PYTHONRDEPS_class-native = ""
 
@@ -31,6 +32,10 @@ do_install() {
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
 		rm -f "${D}${bindir}/update-alternatives"
 	fi
+
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
+        grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
+    fi
 }
 
 do_install_append_class-target() {
-- 
2.8.1


