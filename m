Return-Path: <armccurdy@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id C073D731A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 22:05:46 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id h80so1725198ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=abAy912QcR2rzOgOLXrbEbZzdXbXzpCCJc6pTKSsiZI=;
	b=mOuoPya+8vJNB8+l28oCeVJVghQk5Ccf0ygMBSTl6hPGO2EDulnLqzLskYgRXAXJbi
	L14uMgDWRFck57e+2Bi6NkNB5pQ5HWV0TAYQCtUuONHHcRXUXUYcClvZoEsnTRQQfbMv
	hQnj5daH59hVIeeR5q7LgFIKZQ9OhdrJ7EejQBx26wMqgSoNKtyx4kb5VJ9l+b0fGgjf
	OupcTnxI3s8/aaAcWc931mGhN1CIHWsQGG+UPWfd3N4Tx/LlaeGanuwylV4FAh1hs7iM
	e2sqeLqgEHVmQgqzjRhnuKc1dRTrUvD7WBCxDUyCVpCKGim68UZm5fL7lvYNWzI7UjKm
	VY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=abAy912QcR2rzOgOLXrbEbZzdXbXzpCCJc6pTKSsiZI=;
	b=BNAgFFiYRsl0KD9+wGxjNcsbOkJU2ac/OC5++rtg0n1wYjQt9NgJWrHaK2INxYplDp
	hV/TLh8lURVTIeTDQmFB8PeqQKg+7NOeFa709iIApV8j8uziNqCYnBkqePD0Y69CpncF
	C6TwFrGprM/rWvK3F1NDXQoP8KNH4sEizf7zMQ2XD96dOWLX+OUCyqYQ31MZrlfP+KJ9
	jjgrHZ9uG1kGQH1xLAI++qBJx2yTpnlKWHIkYYx/o+gk89S4sgB1QPhfIGETuprud7fe
	ouy5WTo6UqUJ7rCBTlKovWPi0VGaoiAmC8dPe2W6zYbHnOoIDposoFCDCpKfZHfLfxzw
	bkkA==
X-Gm-Message-State: AG10YOSB981C+OnLkqoLoeVFhfOGGBAWD/m8+agbVvJ8JqkU4sZ0PwpWgYmGRWjy26fRyg==
X-Received: by 10.129.53.214 with SMTP id c205mr22049298ywa.108.1455141947051; 
	Wed, 10 Feb 2016 14:05:47 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l78sm895235oib.21.2016.02.10.14.05.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 14:05:45 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:05:36 -0800
Message-Id: <1455141937-23225-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455141937-23225-1-git-send-email-armccurdy@gmail.com>
References: <1455141937-23225-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] gstreamer1.0-plugins-good_git: fix gst_structure_get() compiler warning
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
X-List-Received-Date: Wed, 10 Feb 2016 22:05:46 -0000

 | ../../../gst-plugins-good-1.7.1/ext/taglib/gstid3v2mux.cc: In function 'void add_image_tag(TagLib::ID3v2::Tag*, const GstTagList*, const gchar*, guint, const gchar*)':
 | ../../../gst-plugins-good-1.7.1/ext/taglib/gstid3v2mux.cc:468:63: error: missing sentinel in function call [-Werror=format=]
 |			GST_TYPE_TAG_IMAGE_TYPE, &image_type, NULL)) {
 |								  ^
 | cc1plus: all warnings being treated as errors

gst_structure_get() is declared with G_GNUC_NULL_TERMINATED, ie
__attribute__((__sentinel__)), which means gcc will generate a
warning if the last parameter passed to the function is not NULL
(where a valid NULL in this context is defined as zero with any
pointer type).

The C code callers to gst_structure_get() within gst-plugins-good
use the C NULL definition (ie ((void*)0)), which is a valid sentinel.

However gstid3v2mux.cc uses the C++ NULL definition (ie 0L), which
is not a valid sentinel without an explicit cast to a pointer type.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...sure-valid-sentinel-for-gst_structure_get.patch | 40 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch
new file mode 100644
index 0000000..bc7ac0b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch
@@ -0,0 +1,40 @@
+From 2169f2205c0205a220d826d7573e5a863bd36e0a Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 9 Feb 2016 14:00:00 -0800
+Subject: [PATCH] ensure valid sentinal for gst_structure_get()
+
+gst_structure_get() is declared with G_GNUC_NULL_TERMINATED, ie
+__attribute__((__sentinel__)), which means gcc will generate a
+warning if the last parameter passed to the function is not NULL
+(where a valid NULL in this context is defined as zero with any
+pointer type).
+
+The C code callers to gst_structure_get() within gst-plugins-good
+use the C NULL definition (ie ((void*)0)), which is a valid sentinel.
+
+However gstid3v2mux.cc uses the C++ NULL definition (ie 0L), which
+is not a valid sentinel without an explicit cast to a pointer type.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ ext/taglib/gstid3v2mux.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/taglib/gstid3v2mux.cc b/ext/taglib/gstid3v2mux.cc
+index 8651e77..a87234f 100644
+--- a/ext/taglib/gstid3v2mux.cc
++++ b/ext/taglib/gstid3v2mux.cc
+@@ -465,7 +465,7 @@ add_image_tag (ID3v2::Tag * id3v2tag, const GstTagList * list,
+ 
+           if (info_struct) {
+             if (gst_structure_get (info_struct, "image-type",
+-                    GST_TYPE_TAG_IMAGE_TYPE, &image_type, NULL)) {
++                    GST_TYPE_TAG_IMAGE_TYPE, &image_type, (void *) NULL)) {
+               if (image_type > 0 && image_type <= 18) {
+                 image_type += 2;
+               } else {
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 915be73..56631a5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
+    file://ensure-valid-sentinel-for-gst_structure_get.patch \
 "
 
 PV = "1.7.1+git${SRCPV}"
-- 
1.9.1


