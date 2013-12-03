Return-Path: <andre.draszik@linaro.org>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id D70226DF93
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 15:04:41 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so1582583eei.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 07:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=4fZUTep34KWrOc/7XujZwldyYLhi++Gdwn+e+DYB5I4=;
	b=Y1XFVrdrS2tj0bpCXeLvS30hHX6NCyaKp4Z2FiaMcgn6f/l8ViASZ2P2KiUjZOhgGp
	UDsJ4qmjDwllOl9XRioyf6uoFWFuPZ+ZbwlJuTQKq9mpEqq82OdH1qj6QKIRblRAaE9E
	iNETxK9du6hHc8fdB5Wnea1L7yHKDMmSuK8jLH3aNzcxtbVCLTb+ISV9VO6rXA4z6fjA
	x3tB7BNw8HFke93w/gXLMMsEmnQqlTlbsHCNhcO2VWcAEIc9Ku8fiWFum9qxXl7oG+d6
	pPY9KCEPEZDmrysAyV5arI5DGwJrAUiV+jauK1wvS6F4ohq4pChuj6gszaBNvjqMPktM
	ec7w==
X-Gm-Message-State: ALoCoQkRsjo9AOJ6hE5goLQCZpibO6nq5sQ1tL3PVZMCOTLppbLJdPDVCluyyoFbd5fCL5BEBBai
X-Received: by 10.14.99.3 with SMTP id w3mr3199587eef.96.1386083080660;
	Tue, 03 Dec 2013 07:04:40 -0800 (PST)
Received: from bri0771.fritz.box (pD4B88AB0.dip0.t-ipconnect.de.
	[212.184.138.176])
	by mx.google.com with ESMTPSA id m1sm77676861eeg.0.2013.12.03.07.04.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Dec 2013 07:04:40 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Dec 2013 16:04:39 +0100
Message-Id: <1386083079-10368-1-git-send-email-andre.draszik@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <20131121173050.GA3708@jama>
References: <20131121173050.GA3708@jama>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt5.inc: allow to set the package arch globally
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
X-List-Received-Date: Tue, 03 Dec 2013 15:04:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If Qt5 (qtbase) is machine specific, then all packages depending
on qtbase will also be machine specific, because the (initial)
qtbase configuration becomes part of Qt5/qmake, thus affecting
builds of packages built against this specific version of qtbase.

Since it is not feasible to add PACKAGE_ARCH=... to each and every
recipe that is built using qmake and depends on Qt5, we introduce
a new variable, QT_PACKAGES_ARCH, that can be set by the machine
configuration as needed.

We have to be careful though to only change the architecture of the
resulting packages if we're not compiling a 'native' package.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 recipes-qt/qt5/qt5.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 7669efc..8d8438f 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -20,6 +20,18 @@ OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
 OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
 OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
 
+# If Qt5 (qtbase) is machine specific, then everything will be,
+# because the (initial) qtbase configuration becomes part of Qt5/qmake
+python __anonymous() {
+    barch = d.getVar("BUILD_ARCH", True) or ''
+    tarch = d.getVar("TARGET_ARCH", True) or ''
+    # do not do anything if we are building a native package
+    if barch != tarch:
+        tarch = d.getVar("QT_PACKAGES_ARCH", True) or ''
+        if tarch:
+            d.setVar("PACKAGE_ARCH", tarch)
+}
+
 PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
 # extra -dbg packages
-- 
1.8.1.2


