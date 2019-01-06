Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id CECC17BE4E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Jan 2019 18:14:31 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id p6so28655552lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2019 10:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aSJ3inhKzWkX5I6+0Po8osQJMu+4K0rU5L98rjU4tPQ=;
	b=VNL26ae7gLnhiXvJJnjDQhyJ7hWKOCz3j5yzJhisvwpT4uYEC/xynBABFEY0k1g8lF
	XGokedSgy6h0QYIGmVtLsKisnfPKicAz04lG3CsIbAaACjpEtx//2TmLX8hA3+DdxfVt
	Lvx6/0GBeCxohGjlNtyxbd40ww6pQckjD1QXzO5FY54sr9s8LNAvpT5TMgVgdlewJ1Ht
	fxxOb27JyDVSCvr9I+muO239g3+7poG1r3mnJQUIcO24IB8UxfbZwsuGFUQo2ViISFDb
	KcOKKNIk52IcBOWppjzDfusRrnRvejWj008wBkbFfDAv1Kw+3IZn/yt1llO4AluFlhPk
	Kzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aSJ3inhKzWkX5I6+0Po8osQJMu+4K0rU5L98rjU4tPQ=;
	b=iA/NW5wdayrlS1fTv/aOnWPJ6Y3tyFz/w50+lX1elCVxSzSTNxlSvIa1l/HOuFbDoY
	+fRRlyhliR9mGlWR4w43/jThy/UIhMRpDpvurgAhFcfZe/rmvSo05L/MNXji+SroZT8Y
	QXDHMD1gVibwAY/fQr9+kSWvaLdRStnKA5P0xo4MO3qQRz+dwnqJOs9v8VBT/JqhIT3w
	PQ4zeJmvV4dSmp787CGtvnXfhqq/ihK8h1BztrxHpGTz328aNbt1E3NBvcBAXhuxuaXk
	9+UL/Z0mQnKxXKW28xboWs2m97o1GIS4ETyIXXSlPrH5DPAU730zmmMAXk/dxC//qaga
	fW9g==
X-Gm-Message-State: AJcUukdHLeRZ3IK+JRSsusXiXeaUkehFNEzR2/tFvEQp/9rB46EjCpxD
	fGM5mX1Zo9H6SLjQ94LdaDPXXaXm
X-Google-Smtp-Source: ALg8bN5Tb9cTbbfkcl0FJAYUbKFbfWTr9IUXQ0vgkfmIFoIURI4gH6n4K1Z6+EIqyvdem62Di441QQ==
X-Received: by 2002:a19:cc46:: with SMTP id c67mr17419729lfg.145.1546798471900;
	Sun, 06 Jan 2019 10:14:31 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	w9sm12295175lfc.66.2019.01.06.10.14.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Jan 2019 10:14:31 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Jan 2019 19:13:50 +0100
Message-Id: <20190106181350.25386-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190106181350.25386-1-jacob.kroon@gmail.com>
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
Subject: [RFC][PATCH 2/2] buildhistory: support generating md5sum of files
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
X-List-Received-Date: Sun, 06 Jan 2019 18:14:32 -0000

Introduce 'md5' in BUILDHISTORY_FEATURES and enable it by default
when doing reproducible builds.

When enabled this will additionally create:

  files-in-package-md5.txt
  files-in-image-md5.txt
  files-in-sdk-md5.txt

containing the md5 checksums of regular files.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/buildhistory.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 33eb1b00f6..00f0701dec 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -7,7 +7,8 @@
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
-BUILDHISTORY_FEATURES ?= "image package sdk"
+BUILDHISTORY_FEATURES ?= "image package sdk \
+  ${@ "md5" if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES')) else ""}"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
@@ -526,7 +527,12 @@ buildhistory_list_files() {
 		eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
 	else
 		eval $find_cmd
-	fi | sort -k5 | sed 's/ * -> $//' > $2 )
+	fi | sort -k5 | sed 's/ * -> $//' > $2
+	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', '1', '0', d)}" = "1" ] ; then
+		md5filename=$(echo $2 | sed 's/\.txt$/-md5.txt/')
+		find -type f | xargs -I{} -n1 md5sum {} | sort -k2 > $md5filename
+		[ -s $md5filename ] || rm $md5filename # remove result if empty
+	fi )
 }
 
 buildhistory_list_pkg_files() {
-- 
2.11.0


