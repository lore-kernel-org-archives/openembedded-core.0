Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7625673E3B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 05:03:45 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so49401982pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 22:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=mL0yhQYKMm/Uh+IxS0pQl1Le3gI/PLKY+j6KUYHmdV4=;
	b=VJRKXlK2JAWxE1yCARoi+XNrdwg36658zDDNsQqhC0ov5TRopbovgQfjqledDNAhPa
	3Q4T0/DhYni1GbBeZyaApQc8c8vq+hz31up2Bw0ztQU3zJNun+7metuO67u+vgVxVxd8
	1JnrwXrgBLCj5YF/FrLZfNTK2RLDHkYU9/tQy1wxQbBcFnF1j2tuF91Nm1wocSSDYg6x
	kl/xz8rqGGu0IHtJ5CwdpI6shmX6sEjDmhZfzs4Rdj+Ek3ypAInSp/8CeCpnjrZQjzps
	CzRQVxqyhHo4XOjpzZ1UqQKLGfK8NJ/me62IapDHyxYfhBT/Jv8CtUTSJsQnKOJqbWke
	3lKw==
X-Received: by 10.70.36.10 with SMTP id m10mr30326871pdj.34.1434258227052;
	Sat, 13 Jun 2015 22:03:47 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id gc5sm8158162pbb.53.2015.06.13.22.03.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Jun 2015 22:03:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jun 2015 22:03:41 -0700
Message-Id: <1434258222-9867-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 1/2] tzcode-natvie: update to 2015e
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
X-List-Received-Date: Sun, 14 Jun 2015 05:03:47 -0000

merged inc back into recipe.

Changes affecting code

When displaying data, tzselect converts it to the current locale's
encoding if the iconv command works.  (Problem reported by random832.)

tzselect no longer mishandles Dominica, fixing a bug introduced
in Release 2014f.  (Problem reported by Owen Leibman.)

zic -l no longer fails when compiled with -DTZDEFAULT=\"/etc/localtime\".
This fixes a bug introduced in Release 2014f.
(Problem reported by Leonardo Chiquitto.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native.inc     | 15 -------------
 .../recipes-extended/tzcode/tzcode-native_2015d.bb | 11 ----------
 .../recipes-extended/tzcode/tzcode-native_2015e.bb | 25 ++++++++++++++++++++++
 3 files changed, 25 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native.inc
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015d.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015e.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native.inc b/meta/recipes-extended/tzcode/tzcode-native.inc
deleted file mode 100644
index 4af1e20..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "PD & BSD"
-
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
-
-S = "${WORKDIR}"
-
-inherit native
-
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015d.bb b/meta/recipes-extended/tzcode/tzcode-native_2015d.bb
deleted file mode 100644
index 44a9f03..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2015d.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015d.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "4008a3abc025a398697b2587c48258b9"
-SRC_URI[tzcode.sha256sum] = "221af54ec5c42eaf0101159ffe1256a883d1c14c46228d42774c656a56317128"
-SRC_URI[tzdata.md5sum] = "b595bdc4474b8fc1a15cffc67c66025b"
-SRC_URI[tzdata.sha256sum] = "8b9f5008277f09e251e97dba7813f56168d691115bda90ade4638d72f296d531"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015e.bb b/meta/recipes-extended/tzcode/tzcode-native_2015e.bb
new file mode 100644
index 0000000..30dba7a
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015e.bb
@@ -0,0 +1,25 @@
+# note that we allow for us to use data later than our code version
+#
+DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD & BSD"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
+
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2015e.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "fb62eb6daf3ddb8c41fd40be05ec657e"
+SRC_URI[tzcode.sha256sum] = "b5a217b55847fb56f470a7738939c36f3a520d6cc12342d965cfcf848e59ada0"
+SRC_URI[tzdata.md5sum] = "36f9056efb432ca945c73397acfce0d4"
+SRC_URI[tzdata.sha256sum] = "ffc9b5d38abda8277aa479e3f75aa7668819d0977cd1a0c8ef3b09128334ba6f"
+
+S = "${WORKDIR}"
+
+inherit native
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
-- 
2.3.5


