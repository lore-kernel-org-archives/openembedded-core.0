Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id E153E77088
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 14:24:57 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so107363927pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Oct 2015 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=wNms+bIspf5I+JB7qZ1faSeuTm7pawhP9rMtHP/Tvps=;
	b=po5nBf5MN00bpHREbkAEy1/l8OAPPi/9RXrlHSEPptazc2tTMhxkgMaCijNvZz3TND
	7gehZVYNVadGcDHoranHjn8Jp/lYFbcAatGcv1uQZ0Y439fh6gVo05z2mF/7mx2EwsMn
	ytvTJfhTtxXZXAylA7476oDYzsgzhLridCgbhVNDN3EZnqR+DWc0JnuakXKVmv9UB//d
	aN+S5HRUpP20AYqBfoHYv73c+TMhZqM1JWzjP2I0UCFsUeBORCDcr5ZOK8L+p93YpJDb
	7/dX0n8WApMleNzjLY6UqOaB6NFhusaEBQdniBcZwgYA1kfciYybxnT5F5HX1gCp63fo
	bP8Q==
X-Received: by 10.66.141.137 with SMTP id ro9mr20207991pab.41.1443795897599;
	Fri, 02 Oct 2015 07:24:57 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ya10sm12294688pbc.69.2015.10.02.07.24.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Oct 2015 07:24:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 07:24:52 -0700
Message-Id: <1443795893-29043-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 1/2] tzcode: update to 2015g
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
X-List-Received-Date: Fri, 02 Oct 2015 14:25:00 -0000

Changes affecting code

localtime no longer mishandles America/Anchorage after 2037.
(Thanks to Bradley White for reporting the bug.)

On hosts with signed 32-bit time_t, localtime no longer mishandles
Pacific/Fiji after 2038-01-16 14:00 UTC.

The localtime module allows the variables 'timezone', 'daylight',
and 'altzone' to be in common storage shared with other modules,
and declares them in case the system <time.h> does not.
(Problems reported by Kees Dekker.)

On platforms with tm_zone, strftime.c now assumes it is not NULL.
This simplifies the code and is consistent with zdump.c.
(Problem reported by Christos Zoulas.)

Changes affecting documentation
The tzfile man page now documents that transition times denote the
starts (not the ends) of the corresponding time periods.
(Ambiguity reported by Bill Seymour.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2015f.bb => tzcode-native_2015g.bb}  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2015f.bb => tzcode-native_2015g.bb} (59%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015f.bb b/meta/recipes-extended/tzcode/tzcode-native_2015g.bb
similarity index 59%
rename from meta/recipes-extended/tzcode/tzcode-native_2015f.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2015g.bb
index a8865a3..989e24b 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2015f.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2015g.bb
@@ -6,12 +6,12 @@ LICENSE = "PD & BSD"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
 
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015f.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata2015g.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "19578d432ba8b92f73406a17a9bc268d"
-SRC_URI[tzcode.sha256sum] = "0c95e0a42bb61141f790f4f5f204b954d7654c894aa54a594a215d6f38de84ae"
-SRC_URI[tzdata.md5sum] = "e3b82732d20e973e48af1c6f13df9a1d"
-SRC_URI[tzdata.sha256sum] = "959f81b541e042ecb13c50097d264ae92ff03a57979c478dbcf24d5da242531d"
+SRC_URI[tzcode.md5sum] = "a2c47d908a6426f530efb1393cf1cd06"
+SRC_URI[tzcode.sha256sum] = "18e402ef24bfad2ded38643c9a7a9a580f940a729cb47d983052fc28ff0c7ec4"
+SRC_URI[tzdata.md5sum] = "8d46e8b225b9a04c75f5c39636435ad6"
+SRC_URI[tzdata.sha256sum] = "b923cdbf078491696b17bc8d069c74bce73fabc5774629da2f410c9b31576161"
 
 S = "${WORKDIR}"
 
-- 
2.3.5


