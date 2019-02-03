Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 16EDF6C4CE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Feb 2019 21:13:09 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g189so5390208pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Feb 2019 13:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=1tvAnRFE9Zc79hmMea+Y23ab0X0+A6633Ztp4buyji0=;
	b=Ut+Uc2hsNSBUAOB2qowVRoHRqqfkOtaVdp0a/eQNMBNhirZtM5mY44+PQXmIbhdB8h
	lggXvaGLMPwS1ffgj/G2ZR86XqJRvUGQr6sPZnqv+aOFUxSiCo+e0UlIMlNrsdVm3hzs
	vzhbIf6e0ew+hR4qu+mk93722aFm/OwytfU1Pg8h7A53VhifKo1gQcQ5XY5G9yxqWpFJ
	QXElnX3uPd8nO82kUoPJORe6iX+dUcX1ZxKF051n9luH5LEHeUdGGeehRXD4xjxB+QSr
	2w7Hwee3OabCMSuXDegh41jeoRxq9KIAV8EqbjmPeLjo/PRzWShcLKOKkmfliu0ftsUj
	klwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1tvAnRFE9Zc79hmMea+Y23ab0X0+A6633Ztp4buyji0=;
	b=m/UYIy4yBjdwgbe4+jvS3WZG6NXoieCJwB5m42XGYoI+NDKucGIqQbLNc32z+MiPP7
	mgmkYXcqRfWk3y0fWG1944NwvAWUd/4/pgUz0HY6KRf3JGcGsBDC7CNCEJOAH178A2z6
	yKrqS8lqq/s8E96E3MYy3mM360VTIAeDzdIigipAfZvbA0CaAar+BO3F/URFJ2ZLIZpk
	/GeWzmm9K1br3i4jSa1IpFR+GvtSB0Dm7qWShjwL6qTejIC5BLtjV4jzgtBVVFORy6aZ
	yjFnEMEGvAnEXm1+S9JW+55wj/AxAJm4vtZhl3KWxnreoBTaEUlfVTFkRozuGfMOZVT4
	d+iQ==
X-Gm-Message-State: AJcUukfb8nBclzDK6bnUUHuE5isPR2zcLjs4y7adoowg4BQMVYHvkeQZ
	l50eclzbmmrg6yxhVhMf7y8=
X-Google-Smtp-Source: ALg8bN7/3ONk4muo5invQFnorPDoK+iyQCp4oI09TMtR+xSF829xu39GbUiuSBZcDNUDZdemtX+tJg==
X-Received: by 2002:aa7:8758:: with SMTP id g24mr47476269pfo.250.1549228390938;
	Sun, 03 Feb 2019 13:13:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b8d0:83fa:6066:70dc])
	by smtp.gmail.com with ESMTPSA id
	p64sm19844668pfi.56.2019.02.03.13.13.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Feb 2019 13:13:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2019 13:13:09 -0800
Message-Id: <1549228389-17737-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] timezone: refactor to simplify maint
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
X-List-Received-Date: Sun, 03 Feb 2019 21:13:10 -0000

move tzcode and tzdata-native into new dir

Updates are now limited to the common include file.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../timezone.inc}                                   | 21 +++++----------------
 meta/recipes-extended/timezone/tzcode-native.bb     | 17 +++++++++++++++++
 .../{tzdata/tzdata_2018i.bb => timezone/tzdata.bb}  | 12 +-----------
 3 files changed, 23 insertions(+), 27 deletions(-)
 rename meta/recipes-extended/{tzcode/tzcode-native_2018i.bb => timezone/timezone.inc} (63%)
 create mode 100644 meta/recipes-extended/timezone/tzcode-native.bb
 rename meta/recipes-extended/{tzdata/tzdata_2018i.bb => timezone/tzdata.bb} (94%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb b/meta/recipes-extended/timezone/timezone.inc
similarity index 63%
rename from meta/recipes-extended/tzcode/tzcode-native_2018i.bb
rename to meta/recipes-extended/timezone/timezone.inc
index f056370..38dadac 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -1,10 +1,11 @@
-# note that we allow for us to use data later than our code version
-#
-SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+UMMARY = "Timezone data"
+HOMEPAGE = "http://www.iana.org/time-zones"
+SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
+PV = "2018i"
+
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
            "
@@ -16,15 +17,3 @@ SRC_URI[tzcode.sha256sum] = "aaacdb876ca6fb9d58e244b462cbc7578a496b1b10994381b4b
 SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
 SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
 
-S = "${WORKDIR}"
-
-inherit native
-
-EXTRA_OEMAKE += "cc='${CC}'"
-
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
new file mode 100644
index 0000000..e3582ba
--- /dev/null
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -0,0 +1,17 @@
+require timezone.inc
+
+#
+SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+
+S = "${WORKDIR}"
+
+inherit native
+
+EXTRA_OEMAKE += "cc='${CC}'"
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
diff --git a/meta/recipes-extended/tzdata/tzdata_2018i.bb b/meta/recipes-extended/timezone/tzdata.bb
similarity index 94%
rename from meta/recipes-extended/tzdata/tzdata_2018i.bb
rename to meta/recipes-extended/timezone/tzdata.bb
index 4482e89..7542ce5 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018i.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -1,17 +1,7 @@
-SUMMARY = "Timezone data"
-HOMEPAGE = "http://www.iana.org/time-zones"
-SECTION = "base"
-LICENSE = "PD & BSD & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
+require timezone.inc
 
 DEPENDS = "tzcode-native"
 
-SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
-
-SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
-SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
-
 inherit allarch
 
 RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
-- 
2.7.4


