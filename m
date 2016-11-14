Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C77576010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 09:41:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so13643790wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 01:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=lrwV8dzC+Ih2rt8rIMtS2EV9h2DE/NaTeVUP+6OfmSg=;
	b=mg6wKpJSab9lkajvNy6GSc35gcxiazHRFBh3El6kFr5gXxYR8HbLpVLPWhFk8Krjso
	KCGd+5w8pRkF5CSNNJlU4aCMFV5iZkhh0c1MIOoofj6tzx40Sehyzqoaz4kJCSTp+5Uq
	rGipoVslfFReuPPzCiPteMrPeWiTXaV9aBoi1PSAculAukTDky4+mYDfANRw3oDdWr3Q
	Rv04kz0qGXOtEg5Jxd4e9S4pl+OkWXTu2baQvCKqijxMJ6hKkEzmXogSQVgUipq9k5uz
	i872OZBsWVCbplKh7mvB5+1f9U3BrhpV5ILMSfvAKYJ6CxSEU1D8YeCx3vjswUe/TCn1
	D47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=lrwV8dzC+Ih2rt8rIMtS2EV9h2DE/NaTeVUP+6OfmSg=;
	b=KBl/LjIJi40zcIR9Td5E4k/R96amBE4uXJe1zc/vJdO1dORW5vTah4FUphUJgX4DLV
	KPOcBetEZWZhSadRkPerH7iILt9tDKXQsLowWi4SViugGR+6mafcqxGAg1LIWrxrNKSS
	yPK7fF6kowuuLnOROD6jH/MdDvtF+gPtf2T6wLorgbi9gOq7D6oAD5h2XaD0kwIxCVi4
	N4OEvjyrVo8h1SveGeBUUnqH/Qtau+gE0aiLVxhMk6jl3y4/K+evHo6ttXYkbMIlz8ff
	e8gelDgSGKUvUMlxtXoy3L9ZbZ9DO/4y6iLZMKohby8atYT7W1b8fxknJfy612Ki+WTB
	A0yg==
X-Gm-Message-State: ABUngve+UjsXtEhH69T/mS/UpwnVkOUCTRUbSjFfweUeelD2E1iLhu105cFI8Y1GGvGVsA==
X-Received: by 10.194.103.5 with SMTP id fs5mr18242734wjb.227.1479116467951;
	Mon, 14 Nov 2016 01:41:07 -0800 (PST)
Received: from zeelaptop.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	hy10sm27588982wjb.10.2016.11.14.01.41.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Nov 2016 01:41:07 -0800 (PST)
Sender: Zeeshan Ali <zeenix@gmail.com>
From: Zeeshan Ali <zeeshanak@gnome.org>
X-Google-Original-From: Zeeshan Ali <zeeshan.ali@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 10:40:54 +0100
Message-Id: <20161114094054.21393-1-zeeshan.ali@pelagicore.com>
X-Mailer: git-send-email 2.9.3
Cc: Zeeshan Ali <zeeshan.ali@pelagicore.com>
Subject: [PATCH v2] [krogoth] nss: Disable warning on deprecated API usage
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
X-List-Received-Date: Mon, 14 Nov 2016 09:41:08 -0000

nss itself enables Werror if gcc is version 4.8 of greater, which fails
the build against new glibc (2.24) because of use of readdir_r(), which
is now deprecated. Let's just disable warnings on deprecated API usage.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10644

Signed-off-by: Zeeshan Ali <zeeshan.ali@pelagicore.com>
---

This patch is not needed for master or morty, cause they use the latest version of nss.

 .../nss/nss-disable-werror-on-deprecated-api.patch | 22 ++++++++++++++++++++++
 meta/recipes-support/nss/nss_3.21.bb               |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch

diff --git a/meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch b/meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch
new file mode 100644
index 0000000..fbaa6a6
--- /dev/null
+++ b/meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch
@@ -0,0 +1,22 @@
+Disable Werror on deprecated API
+
+nss itself enables Werror if gcc is version 4.8 of greater, which fails
+the build against new glibc (2.24) because of use of readdir_r(), which is
+now deprecated. Let's just disable warnings on deprecated API usage.
+
+Upstream-Status: Inappropriate [Dev branch on newer version w/o this issue]
+
+Signed-off-by: Zeeshan Ali <zeeshan.ali@pelagicore.com>
+===================================================
+diff -u -r a/nss/coreconf/Werror.mk b/nss/coreconf/Werror.mk
+--- a/nss/coreconf/Werror.mk	2015-11-09 06:12:59.000000000 +0100
++++ b/nss/coreconf/Werror.mk	2016-11-11 14:36:36.301062957 +0100
+@@ -60,7 +60,7 @@
+   endif #ndef NSS_ENABLE_WERROR
+ 
+   ifeq ($(NSS_ENABLE_WERROR),1)
+-    WARNING_CFLAGS += -Werror
++    WARNING_CFLAGS += -Werror -Wno-deprecated -Wno-deprecated-declarations
+   else
+     # Old versions of gcc (< 4.8) don't support #pragma diagnostic in functions.
+     # Use this to disable use of that #pragma and the warnings it suppresses.
diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-support/nss/nss_3.21.bb
index 05d81c2..7933883 100644
--- a/meta/recipes-support/nss/nss_3.21.bb
+++ b/meta/recipes-support/nss/nss_3.21.bb
@@ -22,6 +22,7 @@ SRC_URI = "\
     file://nss-fix-nsinstall-build.patch \
     file://0001-Fix-build-failure-on-opensuse-13.1.patch \
     file://nss-gcc6-fix.patch \
+    file://nss-disable-werror-on-deprecated-api.patch \
     file://nss.pc.in \
     file://signlibs.sh \
 "
-- 
2.9.3


