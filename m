Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 730757E91D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:25:03 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so1806753wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fp5igaAUb/4tBI5e9pRPN9qadnZ3KCk/q6gM4nrYTtQ=;
	b=Aup1iCBq/zOowGbR+sUDqJ/9cxOhXmVTukdcu8cFQ7OegYEXSccewY4RH0lCp4t2Lq
	E3F94iyjeKlXve9ibxBofNvuW4DsNMYmUpQsH58neeJv7D0XvLcutj4IPkDrLDUsEjJx
	YV+7bhfLa6ouFRprT9LwZB/I0Udm3C7ykFs+bifLGT7cHZSaqvt48VNbtqrOO1WSSMHJ
	zid+t/ASSghzI/uwmmpbSRyQfoISfCJL8MFZeBbB291ItPPXdijrCMOX1iPnNypxFJov
	Ch1LiRpqCQX11KWxbgW0A7c/PXgpgw0PcHakT7xNmFsgYYlq37HYEXKNE+Y5lgz3dwZg
	xo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fp5igaAUb/4tBI5e9pRPN9qadnZ3KCk/q6gM4nrYTtQ=;
	b=L+Lh7NI0TumXrRWGDJu/k41G5jdsCyRuW55TGrq8pvaPgFKc9ZPNHu6fchOYBQ2dfF
	sXA2r/0kH0YwpZMNXzpW9iOV9RhwVAX+lv0D5OZb8CLWAWE4zjkMy31A5vmiqrDqQUzO
	sT24Cx1RJECJG2CGyV/c8kNeL7tTB2W9NAlxQe8iB1noV3F/r3f4vXPHpgw4pKjSB1p2
	l04FK8iSLnba/WkWiFhMw/i+DBdVXrcexqdddMjJmD/fKIaoSD3O6nuoFaU9q8t8QVwT
	tghII/0B5wpbkn8XkrixR7uJdalesA/OhbAfiioE1fXpj+OvghtWwpjKu8PEpzNmISjr
	kqnw==
X-Gm-Message-State: APjAAAV5Hw+4DgTMMhC2arae/xISeL674pqWrT+4BJl/3uLu/2rBfi0e
	EB+5gM6tgQP4zpSF/88KzBSiqYzoTTE=
X-Google-Smtp-Source: APXvYqzLtBfclniDe1RnvEWU+AGGRZk4fkyAfvvvMV5nWDbjfNNw5H86vQru6gnSQVnyI33eqf3SQA==
X-Received: by 2002:a1c:411:: with SMTP id 17mr7655836wme.74.1560950703971;
	Wed, 19 Jun 2019 06:25:03 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.25.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:25:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:47 +0200
Message-Id: <20190619132450.130226-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619132450.130226-1-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/9] libnewt: merge libnewt-python recipe into the main recipe
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
X-List-Received-Date: Wed, 19 Jun 2019 13:25:03 -0000

libnewt-python was including libnewt recipe and adding tweaks, which is bad form.

It also broke AUH, as it won't update more than one recipe in a single
transaction.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../newt/libnewt-python_0.52.20.bb            | 28 -------------------
 meta/recipes-extended/newt/libnewt_0.52.20.bb | 13 ++++++---
 2 files changed, 9 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/libnewt-python_0.52.20.bb

diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.20.bb b/meta/recipes-extended/newt/libnewt-python_0.52.20.bb
deleted file mode 100644
index 433d184c710..00000000000
--- a/meta/recipes-extended/newt/libnewt-python_0.52.20.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require recipes-extended/newt/libnewt_${PV}.bb
-
-SUMMARY .= " - python"
-DEPENDS = "libnewt python3"
-RDEPENDS_${PN} += "python3-core"
-
-inherit python3native python3-dir
-
-EXTRA_OECONF += "--with-python"
-EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
-
-
-do_compile () {
-	VERSION="$(sed -n 's/^VERSION = //p' Makefile)"
-	oe_runmake _snack.so
-}
-
-do_install () {
-	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-	install -m 0755 ${PYTHON_DIR}/_snack.so ${D}${PYTHON_SITEPACKAGES_DIR}/
-	install -m 0644 snack.py ${D}${PYTHON_SITEPACKAGES_DIR}/
-}
-
-PACKAGES_remove = "whiptail"
-
-FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/newt/libnewt_0.52.20.bb b/meta/recipes-extended/newt/libnewt_0.52.20.bb
index 264ef3b8adf..dc07a1809e7 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.20.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.20.bb
@@ -15,7 +15,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 # slang needs to be >= 2.2
-DEPENDS = "slang popt"
+DEPENDS = "slang popt python3"
 
 SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://fix_SHAREDDIR.patch \
@@ -30,15 +30,20 @@ SRC_URI[sha256sum] = "8d66ba6beffc3f786d4ccfee9d2b43d93484680ef8db9397a4fb70b5ad
 
 S = "${WORKDIR}/newt-${PV}"
 
-EXTRA_OECONF = "--without-tcl --without-python"
+inherit autotools-brokensep python3native python3-dir
 
-inherit autotools-brokensep
+EXTRA_OECONF = "--without-tcl --with-python"
+
+EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
 
 CLEANBROKEN = "1"
 
 export CPPFLAGS
 
-PACKAGES_prepend = "whiptail "
+PACKAGES_prepend = "whiptail ${PN}-python "
+
+RDEPENDS_${PN}-python += "python3-core"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
 
 do_configure_prepend() {
     sh autogen.sh
-- 
2.17.1


