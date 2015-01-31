Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id EC73165C9E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Jan 2015 01:15:54 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kx10so58651935pab.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 17:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=0No16eKyldEY36+H+jgHvkDQGw5yfyiA3t2YUxKpU80=;
	b=ehP8P8KKJ9g2kHrGxGIt+HDEfdmAlvzzII4fL45zGOhQv15diLfqRhauywvi0FDK3o
	4wv+OAG2ueFCVboTlMc1WItm5HqY5908ngEslh6gqPrVOs7ueQ/TDNnWA90FZA2KuCiD
	Jso1GHPktmGbIzLQ2v1KylBVbpX1en+/qqfvP0pmnMCGZEZkQRSwQdIXVfSY1x8W7j9N
	wD9dBkhoy8B6cRotxOoxpDpimvcfU4jPHUZ7IkBFTyF6NKhZWElHX+WG1AHkyzt5xvoC
	AhDDK12yV1YoKlG68WzCHA1JXLw/bYnoVoC32rOtUhp9OnIdmFJ6uS99K10jettiX6vV
	F29w==
X-Received: by 10.70.132.129 with SMTP id ou1mr12778386pdb.11.1422666956204;
	Fri, 30 Jan 2015 17:15:56 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	uf3sm11966963pbc.25.2015.01.30.17.15.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Jan 2015 17:15:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jan 2015 17:15:49 -0800
Message-Id: <1422666950-32415-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [MASTER and DIZZY] [PATCH 1/2] tzcode: update to 2015a leap second changes too
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
X-List-Received-Date: Sat, 31 Jan 2015 01:16:00 -0000

Changes affecting code

tzalloc now scrubs time zone abbreviations compatibly with the way
that tzset always has, by replacing invalid bytes with '_' and by
shortening too-long abbreviations.

tzselect ports to POSIX awk implementations, no longer mishandles
POSIX TZ settings when GNU awk is used, and reports POSIX TZ
settings to the user.  (Thanks to Stefan Kuhn.)

Changes affecting build procedure

'make check' now checks for links to links in the data.
One such link (for Africa/Asmera) has been fixed.
(Thanks to Stephen Colebourne for pointing out the problem.)

Changes affecting commentary
The leapseconds file commentary now mentions the expiration date.
(Problem reported by Martin Burnicki.)

Update Mexican Library of Congress URL.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014j.bb | 10 ----------
 meta/recipes-extended/tzcode/tzcode-native_2015a.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014j.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015a.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014j.bb b/meta/recipes-extended/tzcode/tzcode-native_2014j.bb
deleted file mode 100644
index b76aa33..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014j.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014j.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "970119e9765bc5a9320368851c91ecb6"
-SRC_URI[tzcode.sha256sum] = "7fd46125464856309fc81fe85a67a61de862b8ab884ce8ca82051f5fa308ede2"
-SRC_URI[tzdata.md5sum] = "2d7ea9c309f0d4e162e426e568290ca3"
-SRC_URI[tzdata.sha256sum] = "a2d870320694d40535df822ac8074dc629a90e92abafa5d3373314f78ddc0e0d"
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015a.bb b/meta/recipes-extended/tzcode/tzcode-native_2015a.bb
new file mode 100644
index 0000000..a0a31d6
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015a.bb
@@ -0,0 +1,10 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2015a.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "8f375ede46ae137fbac047ac431bda37"
+SRC_URI[tzcode.sha256sum] = "885bab11f286852f34030d7a86ede7d4126319ca74b8ee22be8ca7c17d72dd19"
+SRC_URI[tzdata.md5sum] = "4ed11c894a74a5ea64201b1c6dbb8831"
+SRC_URI[tzdata.sha256sum] = "c52490917d00a8e7fc9b5f0b1b65ef6ec76d612b5b20c81bf86a04147af18e4c"
+require tzcode-native.inc
-- 
1.9.1


