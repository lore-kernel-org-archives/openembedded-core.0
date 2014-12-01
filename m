Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D65D072405
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 16:37:03 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so14648602wgh.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 08:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FJJ/zITxHukQyZzrHarWmh2IX2DGwkVAH6D4lhDVbK0=;
	b=CIctPUQqF+922hmYItiZz/4ClXtgYUtjjULeHbqpvL0YpGNYjgzXxWQXeQAshgIPvn
	7+XEcUXVlNT1RsyKWwwIPOLh9VEJ5pWWtOIWY1G46DJvmL1Hs1Fc2ZUl6amsIC81/yuI
	hrutuLEbwrhFD6MAw8yA0GBE7kWI9/+DwCeBGNXdEM3MyRuprxc+uLfVw0CPcvFq4dBs
	BrijevedgLnb6HJWfHvYGQBoT6Xnrqw77CTP4jCo6t+vNoD/UDhGQ+gWsVCyjddFluPo
	YWN11QP2es+5BgCX9BmpI76Osy2QYQ6P984QG4oRXSagNAILwhF8O6dCDrW+nyiMiSPz
	Oldw==
X-Gm-Message-State: ALoCoQmkWaoI1SJqMkOKgLAqg9wiLGzDfSUp8T6PLFIW3X7iSMcwKTTd7oc+O5ogsZeoIFc5NPMj
X-Received: by 10.180.74.68 with SMTP id r4mr83691311wiv.33.1417451823634;
	Mon, 01 Dec 2014 08:37:03 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id l9sm1638863wic.21.2014.12.01.08.37.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 08:37:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 16:36:37 +0000
Message-Id: <1417451798-28112-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] python: ensure all of Python is installed in nativesdk
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
X-List-Received-Date: Mon, 01 Dec 2014 16:37:06 -0000

If any part of Python gets installed in a SDK, we need to ensure that all of
Python gets installed to avoid replacing python in the environment with a
minimal package set.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 50c751e..7f13e22 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -161,6 +161,7 @@ require python-${PYTHON_MAJMIN}-manifest.inc
 # manual dependency additions
 RPROVIDES_${PN}-core = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
+RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
 RRECOMMENDS_${PN}-crypt = "openssl"
 RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
-- 
1.7.10.4


