Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4A260103
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 14:25:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g23so9852886wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=gLBfP5Zi4qEhXW53cY3MWem4WzSVxJY992JtyBBsNzQ=;
	b=uNu+Ls17YwhIWu3otCyEwg2k5AzLyuV2bOvqB5EDvIQ7UggVQP/3U+Y3XPnHxTCYjh
	iF3GV6WSeJg96o06FmYCOw2hjNYbeV+osZsEeGFFtm3tCFcind4HQ2HVrPGtdFk2nR7Q
	UA4wgOcWrylZv+6/8/dpLJ4HRn0moHfCtvZjHD8bP766F2yGMiiuqD03CX0URHQIo3pk
	BimGbLx6ruIexg4q3m5uU2BTmtjrW7wccsIj13vcFv1yHvhFE4AYOOP+YuT5iNdoDeZ+
	BkeyxXoPNf5x0Vg6ObY/kBWb1up5ZuyquB7s2KhbqzZy2OxVkqJVQD09mPuLYwC0vOsB
	yx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=gLBfP5Zi4qEhXW53cY3MWem4WzSVxJY992JtyBBsNzQ=;
	b=K5WoN+8R7JniAgO/NbFJm/YK4GIl19UcksYgS4dLWQZ8HUooHVas6cR20PWp7rjeFB
	Ewapo4qN5dBzcgYBgG4BjeMh0QW4wzXzfEoYI15Js6sQr0gcilO4eRQFmYj2hfa2zwV7
	f+fvHrHrUx/hsOJBI4pzApoiz1kc8LXzLzgnnuYoQS8hNaTq8zpjHYFpOSkPiAhajeLq
	H6aWrljI9UNEyRmEGS2Ul3SFtM4J5bN9sYnelgw3beWhNo1dOzrLcsK3y7G8ROYtspJK
	LMWIQbA7gKVUMxu675jKoHHcTsbGw2DsiuRgMkXKuK1m3RAEPvCWbAbnyjYvdPGI0peF
	hMHA==
X-Gm-Message-State: ABUngvdx18xYloXPDw6KNfUvPzJcVDnlMjRp5nybMpioiifxckLr1iz9extlfKEjmayMkQ==
X-Received: by 10.28.25.68 with SMTP id 65mr11381937wmz.93.1478874347017;
	Fri, 11 Nov 2016 06:25:47 -0800 (PST)
Received: from zeelaptop.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	q125sm12483080wmd.2.2016.11.11.06.25.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Nov 2016 06:25:45 -0800 (PST)
Sender: Zeeshan Ali <zeenix@gmail.com>
From: Zeeshan Ali <zeeshanak@gnome.org>
X-Google-Original-From: Zeeshan Ali <zeeshan.ali@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2016 15:25:25 +0100
Message-Id: <20161111142525.20700-1-zeeshan.ali@pelagicore.com>
X-Mailer: git-send-email 2.9.3
Cc: Zeeshan Ali <zeeshan.ali@pelagicore.com>
Subject: [PATCH] [krogoth] nss: Disable warning on deprecated API usage
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
X-List-Received-Date: Fri, 11 Nov 2016 14:25:46 -0000

nss itself enables Werror if gcc is version 4.8 of greater, which fails
the build against new glibc (2.24) because of use of readdir_r(), which
is now deprecated. Let's just disable warnings on deprecated API usage.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10644
---

This patch is not needed for master or morty, cause they use the latest version of nss. 

 .../nss/nss-disable-werror-on-deprecated-api.patch | 22 ++++++++++++++++++++++
 meta/recipes-support/nss/nss_3.21.bb               |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch

diff --git a/meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch b/meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch
new file mode 100644
index 0000000..bbd5243
--- /dev/null
+++ b/meta/recipes-support/nss/nss/nss-disable-werror-on-deprecated-api.patch
@@ -0,0 +1,22 @@
+Disable Werror on deprecated API
+
+nss itself enables Werror if gcc is version 4.8 of greater, which fails
+the build against new glibc (2.24) because of use of readdir_r(), which is
+now deprecated. Let's just disable warnings on deprecated API usage.
+
+Upstream-Status: Pending
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


