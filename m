Return-Path: <noe.rubinstein@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 25E7660069
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 15:53:22 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id a41so11239148wra.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 07:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ogFe3Hl5r5w/nMK8qDraD2Img1iRqXkx1k9UROXx61I=;
	b=Yh3oMtrpg3PU19NXiRsog5WBUg2e9lrV93TFiEnptCrJ0qodXusNAu01qzlD07xo0X
	A+uYUkhNCFpae37XuGbCUmnMt/ix4zL9Zq1z4IymlaoutkohMc/lG8dkNFzhh/BUhzXh
	qNbihxGlrlrjURLETXQBW9Yk1SDQPZV0d4dOxUzPEABD1K5nC7UxYPSth6HWTWXxbrch
	hxwRpf707OfnwK8AKfRjRh58AmPuV79TW6xy4JMZn6o+ukia1DtRajkBcLhTYcU1+74B
	1VerIVG+C8xXiTFNpYEliFyenZAH4xOrzrgv1Onej3cMiiwXH92FTb/vWXCHCXs7oY0D
	HoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ogFe3Hl5r5w/nMK8qDraD2Img1iRqXkx1k9UROXx61I=;
	b=JsZTayLRHD8+Udfn6EAHSu4uWPdi20J6NPLkP3JZN4McV4+UK+7OgXYCToLwaD5bpX
	MMCq43FrvcZW2qBqD9MH65ncoz3YOQe9g186+u5DXjZbpNj2kkTGWOETO19s+BoKUd+u
	yzK0ootT+kYVqBIbB5Awd3n5luH62wYjBNB/X0Ld/7gsybqrP9Tapn8g2Czh5q+9jPjZ
	Shy1382Nr9h/OMP+EFwCnMFRpEK1icRr1Svhc/5rer10InXGtjooBuN7xw9sRM1BQ/Hk
	x9pEZbBDNgeIg+9NQmG6hK/ICw1DP0HnaSPpTemSPFqU2r22gvjHmDV7y1fdY28K4jv+
	dYYg==
X-Gm-Message-State: AJaThX6fZ/YCXjDtp0uEi2InK+gJxv1zmvW18h1IkJTwpUK6tQ1J+BcW
	z5tmvvNtAUhkA1ls0sb+WHO4o196
X-Google-Smtp-Source: AGs4zMaNSIe4HKOk55cWLhBolKn48gcsV2YMVkeMsMhtinG3neXqlCLypbYESY6ByGO/3fHEar+aRQ==
X-Received: by 10.223.163.216 with SMTP id m24mr27999255wrb.107.1512748403676; 
	Fri, 08 Dec 2017 07:53:23 -0800 (PST)
Received: from nrubinstein-de.aldebaran.lan ([80.12.33.90])
	by smtp.gmail.com with ESMTPSA id 2sm1983655wmk.28.2017.12.08.07.53.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Dec 2017 07:53:22 -0800 (PST)
From: "=?UTF-8?q?No=C3=A9=20Rubinstein?=" <noe.rubinstein@gmail.com>
X-Google-Original-From: =?UTF-8?q?No=C3=A9=20Rubinstein?=
	<noe.rubinstein@softbankrobotics.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 16:53:06 +0100
Message-Id: <20171208155306.21202-1-noe.rubinstein@softbankrobotics.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Subject: [PATCH v2] classes/distutils: remove dependency on env
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
X-List-Received-Date: Fri, 08 Dec 2017 15:53:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building a setuptools-based recipe for the nativesdk, Bitbake
complains about the missing dependency on 'env' (normally provided by
coreutils):

    WARNING: nativesdk-foobar-baz-2.1.0-r0 do_package_qa: QA Issue:
    /opt/foobar-os/sysroots/x86_64-foobarsdk-linux/usr/bin/foobar_baz
    contained in package nativesdk-foobar-baz requires
    /opt/foobar-os/sysroots/x86_64-foobarsdk-linux/usr/bin/env, but no
    providers found in RDEPENDS_nativesdk-foobar-baz? [file-rdeps]

That's because distutils.bbclass modifies the shebang line of all
installed Python scripts, which would otherwise point to python-native's
Python binary instead of the target's Python binary.

Doing so, it introduces a dependency on 'env', which should not be
needed as we know full well which Python binary we want.

This commit replaces the call to env with a direct call to the installed
Python binary.

Signed-off-by: Noé Rubinstein <noe.rubinstein@softbankrobotics.com>
---
 meta/classes/distutils.bbclass  | 4 ++--
 meta/classes/distutils3.bbclass | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 1930c35292..9f048000ce 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -44,7 +44,7 @@ distutils_do_install() {
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
-			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
+			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/python:g $i
 		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
@@ -53,7 +53,7 @@ distutils_do_install() {
         if [ -e ${D}${sbindir} ]; then
             for i in ${D}${sbindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
-			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
+			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/python:g $i
 		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 6c30306882..d255bcf225 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -47,14 +47,14 @@ distutils3_do_install() {
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${USRBINPATH}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${USRBINPATH}/${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${USRBINPATH}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${USRBINPATH}/${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
-- 
2.15.0


