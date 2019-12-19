Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E350F7FD7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 17:57:45 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id l127so3696539pfl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 09:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SKubNXSG3dtc87MI0E1cHQ53Dximp/vpYRxUQZIec9M=;
	b=bPIrxxfEar5V86zhofXlGOataE5R0GVmRgN1MoMRBqLp4H1hhQNjxe/NQgQVgM/tzQ
	VeYSA7CJK0iNS83rtZnMYrB0lRkysOF38iiyWdZbZrPo/oZ1FLf9cXObtWHBJeN0CwUL
	wy2opEhrpJIsKd4jKYzd7JbKXtv/iUO46Z1RIzGGoQ+5hDxEBtZMdPjZPDw21Kt4HyD6
	Eh0W22GHWPtWHGN+s3ejYd12pzxJgSoyKlwN0+8jcXArZllEV9fOEwU0pfkJxzzSotqW
	zHxjrrw7NvxI4vv0IQ5TkvotdKLjEpJ5tIXuJ9Q43Y0l6G+6X1zdzl3++BtEtRh0+w6E
	oCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SKubNXSG3dtc87MI0E1cHQ53Dximp/vpYRxUQZIec9M=;
	b=bk3U+V8GtLt6w2IWHw+SleUabQpLQttA77Q7EBZji67egwMbIpe8Ey5GAUHRVDpI+A
	db7CmgydYFsasC4rWEX7w6o+lfJ4VN4Ve96QG7pahgdGFIg+rvp5Uq9HFRDfJE8AynBA
	LXqH/Cnl7cFPxfCOEJ7NpXa4f6IVfw0XpCsTUjruD5vkigoIzKLFAs6L+0be+aZrxQ2v
	h6+AJ3LKJ3wF0bzoJAI1JXmLqOqh6sVo1eWUeVYEQygZ49+CbpmCjgTqRYproRGfiWlt
	qZJDkw0f2t8PPU7JXK8dAmsZp/Tu64p1cWF+H1WmVrVLZz/FXmRiD/MfeqQRT9ihmziO
	WlnA==
X-Gm-Message-State: APjAAAUo2x9N0Sb1AoqksbREl/Puh/LerUDw7BOXVVK2yclcz3JGX49S
	OSb2pt/GTYnoLQspSgbRHewrbqR0+2k=
X-Google-Smtp-Source: APXvYqzl8n8GhSUgzvopKkD3gtOWxRpsjrwlGhtsqBbqFYTysQ/I2155N4Aw0zHqbwF1uw/E/I+HWQ==
X-Received: by 2002:a63:2142:: with SMTP id s2mr10256680pgm.54.1576778266239; 
	Thu, 19 Dec 2019 09:57:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	x18sm9193565pfr.26.2019.12.19.09.57.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 09:57:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 09:57:36 -0800
Message-Id: <20191219175736.1324263-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH V2] cmake: Add a knob for cmake VERBOSE settings
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
X-List-Received-Date: Thu, 19 Dec 2019 17:57:46 -0000
Content-Transfer-Encoding: 8bit

Setting VERBOSE always, while is fine on one hand for debugging, its
coming at an expense of creating lots and lots of logs, e.g. qtwebkit
compile logs alone with VERBOSE is 163MB, there are many other large
packages which use cmake e.g. WPE, webkitgtk etc which are in same range
with out this option on, the logs reduce to 861K and also speeds up
build a notch

If user needs to disable these logs for a recipe or globally

CMAKE_VERBOSE = ""

in recipe or in global metadata e.g. local.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Andre McCurdy <armccurdy@gmail.com>
---
v2: Make a knob for verbose option and keep the defaults as such

 meta/classes/cmake.bbclass | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8ccb1eefc7..14796ac053 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -181,9 +181,20 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
+# To disable verbose cmake logs for a given recipe or globally config metadata e.g. local.conf
+# add following
+#
+# CMAKE_VERBOSE = ""
+#
+
+CMAKE_VERBOSE ??= "-v"
+
+EXTRA_OECMAKE_BUILD_append = " ${CMAKE_VERBOSE}"
+
+# Then run do_compile again
 cmake_runcmake_build() {
-	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
-	eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	bbnote ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
+	eval ${DESTDIR:+DESTDIR=${DESTDIR} } cmake --build '${B}' "$@" -- ${EXTRA_OECMAKE_BUILD}
 }
 
 cmake_do_compile()  {
-- 
2.24.1


