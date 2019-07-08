Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id CFE597D1E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 12:33:03 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id x15so15606601wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G3iG+VWdm0QGnsa+RGlicccsDsIGQUVn35p7L3vJadQ=;
	b=dvHSdDsRUhv/B6G9oRg/fLN709xQVhJ/aoJms+3iEA01uYNC8TowXg2QsqMv8KbrUG
	LOVUE4D1YEUsJAk6R7GCXk2H62GN3hgYorivOQfUAV1EsHeseTKxeS+YynhzloObCgKp
	+JabdZaGPCy8aroQEBqtxlvNCrYzznxvGb7erwzTp1YkHsPIJztI9lNtfjQcFQZc4xiB
	7bRHBTCFZHVq6O/hl84Kx9IzsrqhA+pw4tohzCgtJ1S5RYdtTLYr8NgDGBhXCm5gZ2ye
	l6xfZLUC9xPKheop7uvQKT2As8Kn640pcv1zs97r4eyDGLTLtHnihikh7bXLkyDkMg+N
	i9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G3iG+VWdm0QGnsa+RGlicccsDsIGQUVn35p7L3vJadQ=;
	b=ts/VTyzFpWfM8bcxq/v7USyn0huAOL97IUutUixNN3bAvLnYowLQ4LJ4vVlW7Jxxwg
	IIUHJb/mnh5KdLJOYaL4qZSn+bCwtdVKA/49hxTAqwp4qz9qFIbKSA9PAyV547b+b3f2
	5srA7IYEO+FFIRW2X8aMmU3/pTkaLwliRACDBmZOSpaLGqdsrrvZkPrTxX369RFAjksP
	x6N17XVrQjMfhc9EKfktaH3wibDFo+n0kvdS6fVa4CVPDW8udHsY3WBRd8ofDtsZP7PU
	P3fjYRJol4R7jqkNGu3qm2yIb93aT2PioNNCJdgIw21s22oAjm5yQrwivry86dYRwUsz
	J2ow==
X-Gm-Message-State: APjAAAUna68UqAQHmRr8BJ33CGlsf6GCgtW7EwJPskr0tTd1rYTRBFi3
	1OovifQeeLVq2Q4jdC5aUtNKZzFkVIE=
X-Google-Smtp-Source: APXvYqycjS9tInM8HD1Q6lHBAcIZtKAVilFHRTKXFAemPb+VceCsv/yHlMMN7yfIYLF+7nNFh9Vwbg==
X-Received: by 2002:a1c:c2d5:: with SMTP id
	s204mr17250072wmf.174.1562589184247; 
	Mon, 08 Jul 2019 05:33:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u186sm16756635wmu.26.2019.07.08.05.33.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 08 Jul 2019 05:33:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 13:32:58 +0100
Message-Id: <20190708123258.9862-1-ross.burton@intel.com>
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
X-List-Received-Date: Mon, 08 Jul 2019 12:33:04 -0000
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


