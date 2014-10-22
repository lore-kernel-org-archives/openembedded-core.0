Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 321EC65CAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 20:29:19 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id eu11so1314452pac.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xULY5aGu8r4DVFZFFvWQx2WA2xVDOabCHG97PoYNDCc=;
	b=rlvYDN5ouiqD1mgCnvXpncTP+FnVbAz2i67DXEL1CKAdGUXBMZn1IsxfrnoAbj+QVt
	LVaPjTns3PrSlgS0FB5mcHSeWMnuUrPX6j2l2UdGA/hJvNXf2MElqvn8vxqaaZYpgiXM
	QoUCA9LNPP0FWjj8fooxixQd47G8tDE8cWActEndfjm5pBXKImAAE6nykuloXfDdJDpl
	GSrR5i2Pp9danBdpofELPC3iZBc0rH9vn4e0g/8CFYEtia+XlRfSM9Ky7tY78cBBsrVT
	sGoUdPowuldM0zNOaoXTjx+w9XEhG0knvjr2gOoSQ+RGZX4D7oNbz7teb8NJkgHS9BsZ
	lMMA==
X-Received: by 10.70.89.167 with SMTP id bp7mr395893pdb.144.1414009759995;
	Wed, 22 Oct 2014 13:29:19 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id k9sm15031331pdj.41.2014.10.22.13.29.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Oct 2014 13:29:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Oct 2014 13:29:13 -0700
Message-Id: <1414009754-26738-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414009754-26738-1-git-send-email-akuster808@gmail.com>
References: <1414009754-26738-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/2] tzcode: update to 2014i
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
X-List-Received-Date: Wed, 22 Oct 2014 20:29:20 -0000

Changes affecting code

The time-related library functions now set errno on failure,
and some crashes in the new tzalloc-related library functions
have been fixed.  (Thanks to Christos Zoulas for reporting
most of these problems and for suggesting fixes.)

If USG_COMPAT is defined and the requested time stamp is
standard time, the tz library's localtime and mktime functions
now set the extern variable timezone to a value appropriate
for that time stamp; and similarly for ALTZONE, daylight
saving time, and the altzone variable.  This change is a
companion to the tzname change in 2014h, and is designed to
make timezone and altzone more compatible with tzname.

The tz library's functions now set errno to EOVERFLOW if they
fail because the result cannot be represented.  ctime and
ctime_r now return NULL and set errno when a time stamp is out
of range, rather than having undefined behavior.

Some bugs associated with the new 2014g functions have been
fixed.  This includes a bug that largely incapacitated the new
functions time2posix_z and posix2time_z.  (Thanks to Christos
Zoulas.)  It also includes some uses of uninitialized
variables after tzalloc.  The new code uses the standard type
'ssize_t', which the Makefile now gives porting advice about.

Changes affecting commentary
Updated URLs for NRC Canada (thanks to Matt Johnson and Brian
Inglis).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2014h.bb | 11 -----------
 meta/recipes-extended/tzcode/tzcode-native_2014i.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014h.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014i.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014h.bb b/meta/recipes-extended/tzcode/tzcode-native_2014h.bb
deleted file mode 100644
index 87c5f23..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014h.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014h.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "8e7741fc769ebdd94d95e5f2c3adbb60"
-SRC_URI[tzcode.sha256sum] = "a4d9788a1bb0aa314eae4986ee991425b83ecc47da0e84f626735846be1dbf44"
-SRC_URI[tzdata.md5sum] = "ed05111948beba8a0f30956baa46b272"
-SRC_URI[tzdata.sha256sum] = "e78152f616fb07c1dea124215ffca57d0de66d8897e00896086542e3de30f69e"
-
-require tzcode-native.inc
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014i.bb b/meta/recipes-extended/tzcode/tzcode-native_2014i.bb
new file mode 100644
index 0000000..d77dd5d
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014i.bb
@@ -0,0 +1,10 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014i.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "7fa413158f01a961348aa6a289b6be21"
+SRC_URI[tzcode.sha256sum] = "62591075fb0d47459889b71bac3c8487f09b7417b81dfa541d750b4889e84783"
+SRC_URI[tzdata.md5sum] = "00adeb62a0897aac5ba67da838351adb"
+SRC_URI[tzdata.sha256sum] = "2af331bdd2b794ec59b8ded7300fb29dc3573a009ec14183f5c9ad38e3886153"
+require tzcode-native.inc
-- 
1.9.1


