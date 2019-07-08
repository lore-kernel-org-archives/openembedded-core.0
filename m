Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9277C37F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 23:46:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id f9so18925247wre.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 16:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G3iG+VWdm0QGnsa+RGlicccsDsIGQUVn35p7L3vJadQ=;
	b=IPltadOUCJWkBFZ9a5Ab8SnZo9+lBabkoxNQX1EmKO/gvwqOrBdIzqWb9FwKGSE6bA
	j9FrzJ6Toco6fcekxHtOYUPEoT6ykfF51yPf3Hr8eQLPyPv6x2LLQkXhCKYChB6Kf5hf
	3GnFS1CYDC8yjTAvhBQhKglZfgMXLMqU/XC12Y+Ko1VnECQmIJg9jteIwMC2Z+wR95kO
	fKytzDSV/xjdb+bqfzC1eoDrwEwMaRMb5zGYxEhBzSTxgGuqx3BmphKZBTdrgkaGXGaV
	I/oZwWseDyK/agsatgTCwSIATTzkTMnb0SnF+DYz/PZb0cop/Kfh8F/JRz8tMqoZmoXN
	DasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G3iG+VWdm0QGnsa+RGlicccsDsIGQUVn35p7L3vJadQ=;
	b=RJvJ8ckxOWn1dVaKAUnWTBoyx84SiNGNQdRd+kKSRgxj+/kQCLaMjhQw4/ulA4sGg7
	0Ks0w6UsTuXCl3GleuG1IhK9Hgj7oqPa8DqX9PJJCpmSp8WdwGbbt6uQB5OdagkPpHBn
	anwLR0JmwosFlCBPbG1bqoRck6vRd3mQILDmnnVeqViwV8DsQZXnAV3vTuxTAtc3zMzl
	es1cW5ZOppNvYfkJ44Z/OtyV4CIvcb4f0Ftg7dgqgdh7q8zfKvJnqodDMJSpJAcFksnP
	J13dEDrnlSKnI9JaF8souRUutLGGAD1eppa8U6f1TzZVCH+3Y2kH/35LAaP5nYw1iIUq
	ulQA==
X-Gm-Message-State: APjAAAX7Nr1k2CYEsNsAT5RgHLYYyiAEgJRiOPnOameuno69h8OwQYJw
	W53Dw2WHSRJOmabJhiSV1daB7oxmiLY=
X-Google-Smtp-Source: APXvYqzUPsO9cGTlwXrq2BNxu/nSUpBPBNIGF6/AtpyK+HJ6LtWRr9ZOKH0Wf/wpPIGU61SJt2PTHg==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr21873526wru.147.1562629607962; 
	Mon, 08 Jul 2019 16:46:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t13sm480827wrr.0.2019.07.08.16.46.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 08 Jul 2019 16:46:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 00:46:43 +0100
Message-Id: <20190708234643.15636-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] buildhistory: don't output ownership for the sysroot
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
X-List-Received-Date: Mon, 08 Jul 2019 23:46:48 -0000
Content-Transfer-Encoding: 8bit

As the sysroot isn't ran inside pseudo the ownership is whoever is running the
builds.  In a setup where multiple builders all contribute to a shared
buildhistory writing the ownership data isn't useful, so just replace it with "-
-".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/buildhistory.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index baa7c8e2799..5bf27268107 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -67,7 +67,7 @@ PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
 buildhistory_emit_sysroot() {
 	mkdir --parents ${BUILDHISTORY_DIR_PACKAGE}
-	buildhistory_list_files ${SYSROOT_DESTDIR} ${BUILDHISTORY_DIR_PACKAGE}/sysroot
+	buildhistory_list_files_no_owners ${SYSROOT_DESTDIR} ${BUILDHISTORY_DIR_PACKAGE}/sysroot
 }
 
 #
@@ -537,6 +537,20 @@ buildhistory_list_files() {
 	fi | sort -k5 | sed 's/ * -> $//' > $2 )
 }
 
+buildhistory_list_files_no_owners() {
+	# List the files in the specified directory, but exclude date/time etc.
+	# Also don't output the ownership data, but instead output just - - so
+	# that the same parsing code as for _list_files works.
+	# This is somewhat messy, but handles where the size is not printed for device files under pseudo
+	( cd $1
+	find_cmd='find . ! -path . -printf "%M -          -          %10s %p -> %l\n"'
+	if [ "$3" = "fakeroot" ] ; then
+		eval ${FAKEROOTENV} ${FAKEROOTCMD} "$find_cmd"
+	else
+		eval "$find_cmd"
+	fi | sort -k5 | sed 's/ * -> $//' > $2 )
+}
+
 buildhistory_list_pkg_files() {
 	# Create individual files-in-package for each recipe's package
 	for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
-- 
2.20.1


