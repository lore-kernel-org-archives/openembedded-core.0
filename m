Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E950E788AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 11:22:28 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o1so4314901wro.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6AVRZt5N5CqyfoAorw0p8773zfaBvWwBXLUkqNSDu4Q=;
	b=0hKiaePBugTOmN66/KTfolmuKku13NIGprSXUlZwTJSuPKgZQQ79MEhrIGWr175ykU
	pTEqXrHzFSCg396U9zLyQMLCqK5Yb4HFbyZ291djtXsqFEafS2rYPz6Ag51rids2jouz
	PkZ1xtEHAcFWMLmfXXuhndbGmzfpdr5OM8W4FFZ6cEcwZHCFnF70nD2v1oeR7BEIU7Gf
	XpwpezQ+V1i2t7Kq5tZ+scXAmtsQwJFcs64xU0p2uEs8SITAKRPTYBq8YYR+dOsF84Rl
	i3P20qsTxVinw+0rl51HtJ2DsYG/sdc67q3253KcFskCbYVoG+5CvYzQ22fEzLb42be0
	sY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6AVRZt5N5CqyfoAorw0p8773zfaBvWwBXLUkqNSDu4Q=;
	b=cxWZb2FXtvkhDbsFVsEy0t+z3Ap2r15jCEf8QJi7X2UeEQsKxq2ZY/P9RpWINKynti
	iccI/BRbP2GYdOQxNyhHFTPWlhKu8fky1OSms/mB+jI9assypK++Hw+nzv330u4qJeLQ
	PpzdQGaRHFa5xlUwpMizgfBYrlcEPXHZCRvoydagHwGyMHz9RD2uHbxec2woj6AZOgWZ
	UmKBGlJGG5I8U41KtnNyMskUgD6jee9sx6IPgF0v9V78Hgp+zpGarv7zdXdRNe1J9XCU
	9MAKrXZq44SXa32JIfbDy/1YtfTJB/ohwAMj6Ep9shHPvfp0RYXsypZEupqEmgLIRnPl
	+Z+Q==
X-Gm-Message-State: AElRT7EInCgNXXhMtE5J7H3afdAfXGCFduemV5XcEQLOFA8Bl4RetqCc
	9XU82P7p1ZrP1soDcojQRtPn2D58
X-Google-Smtp-Source: AG47ELtLtmKHPjYJIbZeWmyRgm18kP++FYHiGHPtF567n5L1IpXmFgc+heYcomBQzbUeYc86+cLYrQ==
X-Received: by 10.223.170.152 with SMTP id h24mr3412339wrc.102.1521026549256; 
	Wed, 14 Mar 2018 04:22:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z197sm1703522wmz.24.2018.03.14.04.22.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Mar 2018 04:22:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2018 11:22:25 +0000
Message-Id: <20180314112225.22192-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180314112225.22192-1-ross.burton@intel.com>
References: <20180314112225.22192-1-ross.burton@intel.com>
Subject: [PATCH 2/2] gtk-doc: improve calling of gtkdocize
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
X-List-Received-Date: Wed, 14 Mar 2018 11:22:29 -0000

gtkdocize is only needed if the recipe is using autotools, so instead of hiding
all errors from it, only run it if we're also inheriting autotools.

Also instead of cd'ing into ${S}, pass --srcdir.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 3f731cb93bf..cfeb49a1d00 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -31,8 +31,15 @@ export STAGING_DIR_HOST
 inherit python3native pkgconfig qemu
 DEPENDS_append = "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-do_configure_prepend () {
-	( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} || true )
+# Run gtkdocize if the recipe is using autotools
+run_gtkdocize () {
+	bbnote Running gtkdocize...
+	gtkdocize --srcdir ${S} --docdir ${GTKDOC_DOCDIR}
+}
+
+python () {
+    if bb.data.inherits_class("autotools", d):
+        d.appendVarFlag('do_configure', 'prefuncs', ' run_gtkdocize')
 }
 
 do_compile_prepend_class-target () {
-- 
2.11.0


