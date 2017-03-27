Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id DAA4F72F5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 15:26:09 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id h125so24136159lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Tb/LA0tDwFh0YR72fRfNbPqKYhWPNjt21jEkA15HT+c=;
	b=gREoBZQK/jn62WSHL1+v050+sC1oLESDDN0HWaBUzaeOUbkqL2Te+QbHYHYxiUjDf1
	fuFXjjQ6pK9cNqZXK7AIsyPtmaNkssFG7gmD/EiGxRwJDWyG0Yhz3qukeQYAVy/H/sKX
	BudgM+9TWpBtMgVn0ORYyOcPtExkYaHrnf+JIS0KvVCkb4P3TrBcdO92KJGzrxRUgTAN
	ablK5xbROpsqqwPYMjLehnOncAzXko1LxMb/7F6+TaPM/Z0CBVPU+ssA4XTsdGvuMGcM
	twmP2Ds8sybSXifz2pcAX14nPyftIGmktAJk56hvNl4cXlunorF+NI4p+J/wrABe7Svr
	DIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Tb/LA0tDwFh0YR72fRfNbPqKYhWPNjt21jEkA15HT+c=;
	b=FhxbO0Su0c9kJEEjnU2olsS77nETvW/8GS0ds9Dl1qcqRd3/ftMMSkKw3onsDp91el
	98AXbDmYdmvrPJ/zmDM0G/i5BQrtejFY8hS4Q+iohOkRSWzeKyQ7kBSxv6BfbmUTOyHt
	W3zfYQcrFfp/Yfhcw/NsOXYuvj01rRSXtmJUjYXI+BZl5OCyaBaW9Iood0RNt6ogxCEJ
	jmwouuYCDOqvGFC0q2g70Y2o6RYW+bpCcZ2fK4z0lrI5MoAvZxoHpaHJGSYHYnzmRnyE
	kxZW9PfzpDVH9FLKb60AidxRlD6b9TMrNKJQU6FR3oGEy8PiLINhHjxf/1JhxtuYLWOX
	VCXg==
X-Gm-Message-State: AFeK/H1ynb5OylO0AD6OtoxEC/BkrzUFkdFNet6z+LMuzdLFTdoHdQoQXpFn9Hzs6+8H56E3
X-Received: by 10.28.30.19 with SMTP id e19mr10090155wme.52.1490628369861;
	Mon, 27 Mar 2017 08:26:09 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 134sm1304147wmj.6.2017.03.27.08.26.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 08:26:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 16:26:04 +0100
Message-Id: <1490628365-5428-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] boost: build context and coroutine on ARM
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
X-List-Received-Date: Mon, 27 Mar 2017 15:26:10 -0000

With the right flags to the build, the context library can be built on ARM.

[ YOCTO #11253 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/boost/boost.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 4ff70e3..f85e1d1 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -28,12 +28,15 @@ BOOST_LIBS = "\
 	wave \
 	"
 
-# only supported by x86 and powerpc
+# Enable context only on platforms we've verified it builds on
+BOOST_LIBS_append_arm = " context coroutine"
+BOOST_LIBS_append_arm-64 = " context coroutine"
+BOOST_LIBS_append_powerpc = " context coroutine"
 BOOST_LIBS_append_x86 = " context coroutine"
 BOOST_LIBS_append_x86-64 = " context coroutine"
-BOOST_LIBS_append_powerpc = " context coroutine"
 # need consistent settings for native builds (x86 override not applied for native)
 BOOST_LIBS_remove_class-native = " context coroutine"
+
 # does not compile
 BOOST_LIBS_remove_mips16e = "wave"
 
@@ -168,7 +171,9 @@ BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 # Native compilation of bzip2 isn't working
 BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
 
-# Adjust the build for x32
+# Teach bjam how to build as it ignores the compiler flags we pass
+BJAM_OPTS_append_arm += " abi=aapcs binary-format=elf address-model=32 architecture=arm"
+BJAM_OPTS_append_arm-64 += " abi=aapcs binary-format=elf address-model=64 architecture=arm"
 BJAM_OPTS_append_linux-gnux32 = " abi=x32 address-model=64"
 
 do_configure() {
-- 
2.8.1


