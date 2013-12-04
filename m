Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id CBE846DEE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 17:33:08 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so2587751eek.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 09:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AD87k7xJojCSYQM68/GLEmZb/QaL8A5DTmuQAOGbOCk=;
	b=aVfkJoWxB281l//6rM7y9b4GZTQMlrTLSA+t45QBxgCDrrxiTPlHTSFg1MWqRV8qCX
	f76OWrWvYkYK14tMMIepZVI4wu2eEK6+I0y2Rji1gYBaWQ0M7dc4+MwTHj1T4QVjZeQo
	KNYzCyhEW4seoM7/tW2Dkc4p0R/HPbeWxZtohRHf/UYpMc/ryoCqFazdNM7GYFauTqee
	/3JBm+AY/1R38OvqpeNDSRFAiqdC0++brhLlBvsgCShmqf756axrNxzxqXdaolZuxrLV
	UEK4eOhApNqC4VHXgkjN9cNQRRpiT/mhJ6CJl+7LPafs64XzU0p3LbMvzvcxjypkuRlI
	lv7Q==
X-Received: by 10.15.26.6 with SMTP id m6mr7389586eeu.80.1386178388116;
	Wed, 04 Dec 2013 09:33:08 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g7sm48067538eet.12.2013.12.04.09.33.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 09:33:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 18:33:18 +0100
Message-Id: <1386178398-15454-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] icecc-create-env-native: Drop FILESPATH, document PATCHTOOL
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
X-List-Received-Date: Wed, 04 Dec 2013 17:33:09 -0000

* moving icecc-create-env to BPN allows to drop FILESPATH
* document PATCHTOOL, because it's not easy to guess why it's needed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../icecc-create-env/icecc-create-env-native_0.1.bb         | 13 +++++++++++--
 .../icecc-create-env                                        |  0
 2 files changed, 11 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/icecc-create-env/{icecc-create-env-native => icecc-create-env}/icecc-create-env (100%)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
index b04474e..c05a76d 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
@@ -11,10 +11,19 @@ PR = "r2"
 DEPENDS = ""
 INHIBIT_DEFAULT_DEPS = "1"
 
-FILESPATH = "${FILE_DIRNAME}/${PN}/"
-
 inherit native
 
+# This is needed, because otherwise there is dependency loop from quilt-native
+# Dependency loop #1 found:
+#  Task 10907 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_install) (dependent Tasks ['quilt-native, do_compile'])
+#  Task 10908 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_populate_sysroot) (dependent Tasks ['quilt-native, do_install'])
+#  Task 10997 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_patch) (dependent Tasks ['icecc-create-env-native, do_unpack', 'quilt-native, do_populate_sysroot'])
+#  Task 11001 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_configure) (dependent Tasks ['icecc-create-env-native, do_patch'])
+#  Task 11002 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_compile) (dependent Tasks ['icecc-create-env-native, do_configure'])
+#  Task 10998 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_install) (dependent Tasks ['icecc-create-env-native, do_compile'])
+#  Task 10999 (meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb, do_populate_sysroot) (dependent Tasks ['icecc-create-env-native, do_install'])
+#  Task 10910 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_configure) (dependent Tasks ['quilt-native, do_patch', 'icecc-create-env-native, do_populate_sysroot'])
+#  Task 10911 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_compile) (dependent Tasks ['quilt-native, do_configure'])
 PATCHTOOL = "patch"
 SRC_URI = "file://icecc-create-env"
 
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
similarity index 100%
rename from meta/recipes-devtools/icecc-create-env/icecc-create-env-native/icecc-create-env
rename to meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
-- 
1.8.4.3


