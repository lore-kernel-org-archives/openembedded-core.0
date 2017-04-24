Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0E777AB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 15:19:09 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r190so71192903wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=boohbsA2fR8Pi07rToIXS9m185JD9EFCS9hbE+Hp/T0=;
	b=1jCEcrbEwc/6FVVdd+zz0R+9KocDSm3cXWxSaUkmvrgI61gecm9QF/wBuOeRF8n4Ws
	9Wut3GxWsq/e67gxjztlgiDvv8qrjM2Ik9Mkz/kEVjHqs0UVfM3v4SGyywDQSxXDksrG
	3ebJYs475KpCSjalDyIRFFkZQ/aqLP8Kiy8zY0ijHedbwZF4nymYpoaQo4WBJ4NMO3qi
	GIgZqhXbS/Pz29ezxdS/qJjZ1+I6BHWsMjNF8f5rwpMf5J7uMSe7r+CZDOmpDPiBySZb
	/Jxr4WRZPzclQhxPG1h/Ubd8ATxfKmFQ2n1/lA24OGRtUHeyin7uF+wwcK4U6aE7DRAE
	LJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=boohbsA2fR8Pi07rToIXS9m185JD9EFCS9hbE+Hp/T0=;
	b=EoqORpIZw/q1A4D3RMxwk8/ee2CAa5BdEuEoxhUxk3JGzEHkt1XjpEe5deHDkieORJ
	zJSZLOSC6FFY6XeQ9j0TkwrcwE7ggs0TfidrIaM+GhFuh0XZFoY25RDSylnlH6Q6IEEh
	PPxaE8VrUJgmK9uFsCUGXQuah7lg6YAWV6FnHnXtK/oWWHCqiUWenqn2prGDLWwueGer
	aDHs2RzYoJaD4UqhC2GwE8nKOHF0c40GJWH8JoHXODQ8dJmHj5lRvmZf4PU8OEVRTh7K
	3PelrtM6KakVjCy3XNNQKAa1RgQPUaM0rS1BBBDm5cLmdO842ouK6ymnyfn1q/vFbxfd
	4YWA==
X-Gm-Message-State: AN3rC/7NQNY1+rWFQF5XrQqGCGGS6cDtuD/t4GQ9+5Zqt6IGUev+TzW5
	uZY5HATXc9BSPIgfXRw=
X-Received: by 10.28.182.134 with SMTP id g128mr9735749wmf.22.1493047150143;
	Mon, 24 Apr 2017 08:19:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e129sm918595wma.13.2017.04.24.08.19.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Apr 2017 08:19:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Apr 2017 16:19:07 +0100
Message-Id: <1493047147-2163-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] python3: add python3 metapackage
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
X-List-Received-Date: Mon, 24 Apr 2017 15:19:10 -0000

Many new users add "python3" to their image using IMAGE_INSTALL and are then
surprised that they can't import any of the standard library. This is because we
split up the standard library into a number of packages, and python3-core (the
interpreter and essential modules only) RPROVIDES 'python3'.

Solve this by moving the RPROVIDES of 'python3' to python3-modules, so that the
entire Python standard library is installed.

[ YOCTO #11182 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 2ff7c9e..7f2bc71 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -193,7 +193,7 @@ py_package_preprocess () {
 require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
-RPROVIDES_${PN}-core = "${PN}"
+RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
 RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
-- 
2.8.1


