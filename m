Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA86774EC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:25:09 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v186so120453703wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 09:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7m5WDdxAIxzhv0od3jYOu81ppR68IBtkxPuoAM4sp9M=;
	b=r7fZrYxYS+lx6oN/BvD9KeB9rriLuYyYTSUNfm6kz7oLXvylv5/Dm6ztLNojUxT9RI
	fpMw++WsjFmIvfpNHl+MYlKJlNXynBV0E68spX1JpVcs/zbtWGsF8QxloZ7t2oIMPIN1
	8VYQ4F2fw0KXkkoMjdTJrz7iZm44r11NKZXlEurBQiWOrOkBh5J3KO+ZLu1iiAJEOv3C
	33s0946fVxwazd/y77p6FJahdcIOVlTG7w4YowuKozvdCn84mTX1lPW+MlFK+n5lyhCF
	2LEWe8UXkXDNW/DfdgA6S4n2RowixOfQC9m66OmqJQQk9nCdFQbo+tIyBxS5ve3rtwto
	Lyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7m5WDdxAIxzhv0od3jYOu81ppR68IBtkxPuoAM4sp9M=;
	b=W6YGDElEKNhdRhypoRnnkPLRWWzUoOOcvOBtmsreIcRQaZw1VYJdlZf+CnajdGvXcJ
	A85ro4vMW5tNrfDup2WvXRun0QzzcR6S/r3hTkqNNdxC8j3+8P+HyKaEfBix4OPTBKbs
	HOTIf7lVBNyGLgTazXGxXYpDQmsNLE4LS1sesIsSmstq0NQ3tpt9CIdkAer7/sjudYDp
	YjZM0jdpYq4LVk5V1ulH0WZtRYL67MxcLv8a2jCEKUwGP22IgGdV2D1kMdxyrUt89Ec6
	JqtmhiLvVirKBFodvDXoaRrKLOvX4whHip4Pnn+z1YnQ5CXxJmc6CrIzy6n6woI/xQpl
	WGIQ==
X-Gm-Message-State: AMke39np50+bnHt0OtG58ltC5/WI1kqE5TXdbZdRTN6uu6IncTBcVnifjglCl5dxv40d4wzx
X-Received: by 10.28.181.80 with SMTP id e77mr24006762wmf.57.1488993910150;
	Wed, 08 Mar 2017 09:25:10 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	j184sm24008404wmd.31.2017.03.08.09.25.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 09:25:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 17:25:07 +0000
Message-Id: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Wed, 08 Mar 2017 17:25:09 -0000

This class lets you use BBCLASSEXTEND to add a variant of the recipe that
fetches from git instead of a tarball.

For example:

 BBCLASSEXTEND = "gitupstream:target"
 SRC_URI_class-gitupstream = "git://git.example.com/example"
 SRCREV_class-gitupstream = "abcd1234"

This variant will have DEFAULT_PREFERENCE set to -1 so it needs to be selected
to be used, and any git-specific tweaks can be done with the class-gitupstream
override, for example:

 DEPENDS_append_class-gitupstream = " gperf-native"

 do_configure_prepend_class-gitupstream() {
    touch ${S}/README
 }

It currently only supports creating a git variant of the target recipe, not
native or nativesdk.  The BBCLASSEXTEND syntax (gitupstream:target) was chosen
so that support for native and nativesdk can be added at a later date.

[ YOCTO #10215 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gitupstream.bbclass | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/classes/gitupstream.bbclass

diff --git a/meta/classes/gitupstream.bbclass b/meta/classes/gitupstream.bbclass
new file mode 100644
index 0000000..405283d
--- /dev/null
+++ b/meta/classes/gitupstream.bbclass
@@ -0,0 +1,25 @@
+CLASSOVERRIDE = "class-gitupstream"
+
+# TODO doesn't let you gitupstream a native recipe yet
+
+python gitupstream_virtclass_handler () {
+    # Do nothing if this is inherited, as it's for BBCLASSEXTEND
+    if "gitupstream" not in (e.data.getVar('BBCLASSEXTEND', True) or ""):
+        bb.error("Don't inherit gitupstream, use BBCLASSEXTEND")
+        return
+
+    variant = d.getVar("BBEXTENDVARIANT", True)
+    if variant not in ("target"):
+        bb.error("Pass the variant when using gitupstream, for example gitupstream:target")
+
+    d.setVar("DEFAULT_PREFERENCE", "-1")
+    d.setVar("S", "${WORKDIR}/git")
+
+    # Modify the SRCREV, if the recipe hasn't used PV_class-gitupstream to
+    # assign a +gitX PV already.
+    pv = d.getVar("PV", True)
+    if "+git" not in pv:
+        d.setVar("PV", pv + "+git${SRCPV}")
+}
+addhandler gitupstream_virtclass_handler
+gitupstream_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
-- 
2.8.1


