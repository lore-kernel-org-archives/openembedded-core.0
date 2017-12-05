Return-Path: <noe.rubinstein@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6B53A6FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 16:30:36 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id v105so954505wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 08:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=epTvH1Dv2aHiD30sPTBPSELUK+r5eqT64oHUiKzy/lA=;
	b=PaUDlN6+s26QnLCQNUpEQtPdxZZik+63DejFzsu0HC286aOjSMBv388oZ9MaCXZ5Ha
	qDeCTBwi9HSuib0FjyyghbEk6QC/4TG1EjImel4eZk3cjUC9ztqF51MTV4c91kbcJ+6n
	HFjKaiR6f/H927bKR0T3m/xQHtjHIHcIUJDXUKyZBVAeenrsHe0qxyfbVY+0XOd2hb3J
	z76nvO3yzH12kNpoBqA26l8dErXdU00NoXS1AvhKAo73xPOKS2zwBy4Te6z1cS7zK8LB
	W+OLpeimHOntvat+A5y04ifnbfIXbzxDbFzUMxus3ychb0FnGaNu1dGzDP9cNKiYwzhG
	UvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=epTvH1Dv2aHiD30sPTBPSELUK+r5eqT64oHUiKzy/lA=;
	b=g/MARZrAawTTwUF0Wdi6wNRFAZn85x/SVbRxV00v5h3apc8TdBVzS2nfcVxs1lwpuo
	iBJfOLGDDUFfaHXhyz4CBiOXrwXK/qO9dvLLMMhaLG+Jw8PkZ4D4Zu/IpcVUexV5PHT8
	VsC8da7c0x0XXVK3NDs4f0ow+mcxHYmXdHcCsiGqZErMu0GqSDVqhHYoF/5eUvvgfQqK
	DfusBnJF0S6H6DDznAmG5VYdjd7OxZ00jh8qDNuH8V2yszy83fs2r7u245Z1+sRXxM96
	ueqzeNToDMwmI4mCgPmXy+MIVn+7fzSrnM0wF+G3YlWt/cejjUxx9+woNVxj7qIMtzsw
	C8pA==
X-Gm-Message-State: AKGB3mKXFLlEQnnMb/fWhSHQc+FwFkMYyVBRV0BzHuaBwGimijNbAQIp
	dEzf8jFoBMxHlWBzjb3i5l0IXRuX
X-Google-Smtp-Source: AGs4zMaGhj9pCjkJW47ksinushEpftPipIINfTK5ZrZx2xYHC2kwYMhBpdrlO207cpH4LIosDa3x2Q==
X-Received: by 10.223.197.10 with SMTP id q10mr5590515wrf.237.1512491437769;
	Tue, 05 Dec 2017 08:30:37 -0800 (PST)
Received: from nrubinstein-de.aldebaran.lan ([80.12.37.143])
	by smtp.gmail.com with ESMTPSA id q89sm566634wrb.95.2017.12.05.08.30.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 08:30:36 -0800 (PST)
From: "=?UTF-8?q?No=C3=A9=20Rubinstein?=" <noe.rubinstein@gmail.com>
X-Google-Original-From: =?UTF-8?q?No=C3=A9=20Rubinstein?=
	<noe.rubinstein@softbankrobotics.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 17:30:33 +0100
Message-Id: <20171205163033.15194-1-noe.rubinstein@softbankrobotics.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] Fix warning for nativesdk distutils recipes
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
X-List-Received-Date: Tue, 05 Dec 2017 16:30:37 -0000

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


