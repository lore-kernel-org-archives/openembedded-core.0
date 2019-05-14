Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7922F7DBB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 21:56:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h4so408829wre.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3Mxr+cQSdw7dUrdd0LubG2Tntn0RNpKXFqF6NgdZ3hA=;
	b=aM9QGuOeAskVfjDTpAovlwrjqUQTmNlmXuc1czTZSZvLSlSGw2Dp1gO5QgAgdBYU6O
	P7P9DIaVEU/TJrf8M60/hGUIxxfCZSFttf3lwTtoYRmv9I29FdjhQok7KW7c8cDl0+Qm
	p/u6W1IpTBojIK+wEA70GomegdHaD6saaakcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3Mxr+cQSdw7dUrdd0LubG2Tntn0RNpKXFqF6NgdZ3hA=;
	b=smHmXAW++vw7Y4AKMWYq5QJGCPTkaZaLLbslqKESXsvAdelY2HsHUaopGvkecixyBu
	E5DHeHR5jvLbsUlmWz09MOEEwS7G7cOZR0xd3+SO4Iy3ZNRX4nMtom3MKqyjqlC7XukN
	S20mSNrGj77dKx/kSR1ExJEV92UMBaFz/zB+bHdQvAjpVwgBArDx5yCIt34N/y/KftnL
	46EidW2WNI12YItoxWbEF7ybVNUJfM2BDARUAxPLxPhxMPpxJcCelrdnzUjM72wnSQUZ
	iVjzj0KwMLOUO9lRD3Yh1dVkPUenwnQDcUTJYrDhqGLTexPNcDTNZRGXtEni5ufWNMhP
	VKVw==
X-Gm-Message-State: APjAAAXNCB0H3MVc9khXxYacLFUUMQAVHs+rjRGGk0Us7puuePVczsuJ
	aebd6i0oG4bpqBue092aMgnTc77vRh4=
X-Google-Smtp-Source: APXvYqxAp5hvUodr7vlXUTvnZe+7d9QfM9zbiMpq4gsI++jf0njHwtOSRI8mrdfVXB+cErAFrKZtdQ==
X-Received: by 2002:a5d:49d0:: with SMTP id t16mr13712142wrs.324.1557870966974;
	Tue, 14 May 2019 14:56:06 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d6sm126130wrp.9.2019.05.14.14.56.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 14:56:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 22:56:03 +0100
Message-Id: <20190514215604.24839-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] dbus-test: Improve ptest dependencies dependencies
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
X-List-Received-Date: Tue, 14 May 2019 21:56:06 -0000
Content-Transfer-Encoding: 8bit

The dbus-test package is empty, move its dependencies to the ${PN}-ptest
package. Also ensure that it doesn't depend on the empty ${PN} package
which is about to start causing image failures in the following commit.
In this case the correct dependency is dbus itself.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus-test_1.12.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.12.bb b/meta/recipes-core/dbus/dbus-test_1.12.12.bb
index 0502c449171..f95b31a8630 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.12.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.12.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
 
 DEPENDS = "dbus glib-2.0"
 
-RDEPENDS_${PN} += "make"
 RDEPENDS_${PN}-dev = ""
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
@@ -85,6 +84,7 @@ do_install_ptest() {
         sed -i -e 's;@PTEST_PATH@;${PTEST_PATH};g'  ${D}${PTEST_PATH}/run-ptest
 }
 
-RDEPENDS_${PN}-ptest += "bash"
+RDEPENDS_${PN}-ptest += "bash make dbus"
+RDEPENDS_${PN}-ptest_remove = "${PN}"
 
 PRIVATE_LIBS_${PN}-ptest = "libdbus-1.so.3"
-- 
2.20.1


