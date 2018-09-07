Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC8907949C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 01:00:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o18-v6so13009778wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 18:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xd0YCSTwEMAIXhAM3fD9f4LEUTOITQhpea2EcKrPHaY=;
	b=xsHp1B/u67cExJ1jDTgdQZ+AGv6Qye5nOLBxROul5oCwVlMXh9CmAEculaf0jFlDas
	n0NUtPnpaFJI1IV+iBSykY6gGloJA1JBUnx0RQQDMqlg5Y3JSelotKpZy8ahZxCJ6VOY
	9xGxS+vJcwt7XIDb2KSvDIsH/2KrHP4yRlMLG1cH5Z5L7C30ui6XN76UthOyavuj0NdG
	FXMS7+Xvs/NFD7q2LmKrSIr4RTSBWQ78evfjmi/MWl2KH8jAucMKjqeuB1AXtKTLDBtX
	0i4nIASzeq0nc+34zOHuQe+pYw+MdcUgSQFeOPg5YBjVwO0R/Gc5RBXIMQyWpB9K69qO
	vF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xd0YCSTwEMAIXhAM3fD9f4LEUTOITQhpea2EcKrPHaY=;
	b=fqP9mkeD2pNqZcOsY6KKThjuYXg+NLdu9mV5BtgThF6UHbossGkBOy8riZsOt7SnX+
	Wol4LS+5AIoBXE1WHZANiXiDlTfsZ7Qwi8H8MNEv4Af2BfjxSVsDfJC26UFbI13BL21Q
	ynJN75lII0v9z3fjAf4HK0QPyXvw+enMnlyW7unAZnA4qnfBN/Hy63qkH9ST4SHbZXcX
	iBXEjMZdoiWhCaLul8AyP0Z3fg/uZzHoLEk2td/Td1E8UhZUWOBd/Gj5n6LpySUUKYKl
	Bewh409whBApXnt2rmd9Q9wlfvsI1bUzrvESAW355aWIGPRXBddhOjNurZqgxR+3cPpW
	MTjg==
X-Gm-Message-State: APzg51C4ajOTY5J3ieTbJc+A9egKczKpRHZU7QOxxjQ1MTPhDZBu7BBW
	JOcLzTztO0CUFU4JgzpxXuScbXIXLF4=
X-Google-Smtp-Source: ANB0VdZrRWvaMagTYCbBw5QzF2wbzokcfneWawumVD1UYD79xRMYjiMjlZ/TLE39PCHMEfOPFCCwLQ==
X-Received: by 2002:a1c:8414:: with SMTP id
	g20-v6mr3923827wmd.90.1536282035176; 
	Thu, 06 Sep 2018 18:00:35 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j191-v6sm8261122wmb.37.2018.09.06.18.00.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 18:00:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 02:00:32 +0100
Message-Id: <20180907010032.18028-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] sysprof: fix build with musl
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
X-List-Received-Date: Fri, 07 Sep 2018 01:00:35 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/sysprof/files/wordsize.patch | 62 ++++++++++++++++++++++++
 meta/recipes-kernel/sysprof/sysprof_3.30.0.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-kernel/sysprof/files/wordsize.patch

diff --git a/meta/recipes-kernel/sysprof/files/wordsize.patch b/meta/recipes-kernel/sysprof/files/wordsize.patch
new file mode 100644
index 00000000000..4ce77777825
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/wordsize.patch
@@ -0,0 +1,62 @@
+capture: use size of void* instead of glibc-specific __WORDSIZE
+
+__WORDSIZE is glibc-specific so sp-capture-types.h doesn't work with musl.
+
+As this code is all about the size of pointers, do sizeof(void*) at configure
+time and use that to determine what values to use.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/sysprof/merge_requests/5]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/config.h.meson b/config.h.meson
+index 2d8c8fb..d927b1b 100644
+--- a/config.h.meson
++++ b/config.h.meson
+@@ -34,3 +34,6 @@
+ 
+ /* Version number of package */
+ #mesondefine VERSION
++
++/* Size of a pointer */
++#mesondefine VOID_P_SIZE
+diff --git a/lib/capture/sp-capture-types.h b/lib/capture/sp-capture-types.h
+index 48fcfb8..bc3ab9c 100644
+--- a/lib/capture/sp-capture-types.h
++++ b/lib/capture/sp-capture-types.h
+@@ -19,6 +19,7 @@
+ #ifndef SP_CAPTURE_FORMAT_H
+ #define SP_CAPTURE_FORMAT_H
+ 
++#include <config.h>
+ #include <glib.h>
+ 
+ #ifdef SP_ENABLE_GOBJECT
+@@ -32,12 +33,14 @@ G_BEGIN_DECLS
+ #define SP_CAPTURE_MAGIC (GUINT32_TO_LE(0xFDCA975E))
+ #define SP_CAPTURE_ALIGN (sizeof(SpCaptureAddress))
+ 
+-#if __WORDSIZE == 64
++#if VOID_P_SIZE == 8
+ # define SP_CAPTURE_JITMAP_MARK    G_GUINT64_CONSTANT(0xE000000000000000)
+ # define SP_CAPTURE_ADDRESS_FORMAT "0x%016lx"
+-#else
++#elif VOID_P_SIZE == 4
+ # define SP_CAPTURE_JITMAP_MARK    G_GUINT64_CONSTANT(0xE0000000)
+ # define SP_CAPTURE_ADDRESS_FORMAT "0x%016llx"
++#else
++#error Unknown VOID_P_SIZE
+ #endif
+ 
+ #define SP_CAPTURE_CURRENT_TIME   (sp_clock_get_current_time())
+diff --git a/meson.build b/meson.build
+index ff7296b..d841c0d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -35,6 +35,7 @@ has_clockid = cc.has_member('struct perf_event_attr', 'clockid', prefix: '#inclu
+ if has_use_clockid and has_clockid
+   config_h.set10('HAVE_PERF_CLOCKID', true)
+ endif
++config_h.set('VOID_P_SIZE', cc.sizeof('void*'))
+ 
+ add_global_arguments([
+   '-DHAVE_CONFIG_H',
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb b/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
index 4f1b75017d2..7783ab27f50 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.30.0.bb
@@ -14,6 +14,7 @@ SRC_URI[archive.sha256sum] = "29cd2c4be277f00698dce48259219557c4fddc2c01254b8fac
 SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
            file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
+           file://wordsize.patch \
            "
 RECIPE_NO_UPDATE_REASON = "Waiting for resolution of https://bugzilla.gnome.org/show_bug.cgi?id=794625"
 
-- 
2.11.0


