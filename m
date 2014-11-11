Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id BC91B65CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:18:07 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so11830665wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GkkSHyJEgdCOgo3PKNxIHKfbcaCpZdUwioeU3HcEpxc=;
	b=Of3v+EzU7oQvlMRBv3zKEj1gbz9nDXZHh8yvGB6wXqzj7wnvmbQDApZCRadJ0t4vj/
	hUGBPN3iBm8KXzzevua2ZtaoaKjRARb6yeQojgmijb+Vcy6vPCgR0s7A4Mr0384oPiHD
	s1YHRUYGsfEEu8c1cWEFlfcuKcHkSPDwK/U6lgsNt1nfU0e3dCGdd9Ch39lV+quUF0nq
	DNPxBjtoki0UhWnvCunSgxjZyw3dRIptGqJvCbFOrWe4ga13+ODOMN9I19X8BUtUxO4x
	LitE5HLxV3BYYApmYjW3vtwWJwphvCWNHy+gUG5AuQLxkH1Hs5exuhlqfsZ3ZazmQikN
	vMBg==
X-Gm-Message-State: ALoCoQmbyFkc0AIvIskSHTFD+xZYb/wFjALjnc4lflr3DEqL12wThSWdO+0vjguugiuuPHoT5klr
X-Received: by 10.180.90.241 with SMTP id bz17mr20675435wib.41.1415719087454; 
	Tue, 11 Nov 2014 07:18:07 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bq6sm17874190wib.1.2014.11.11.07.18.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 07:18:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 15:18:01 +0000
Message-Id: <1415719081-4568-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] vala: upgrade to 0.26.1
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
X-List-Received-Date: Tue, 11 Nov 2014 15:18:14 -0000

vapigen can't be disabled anymore, so remove --disable-vapigen.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/vala/vala.inc       |    5 ++---
 meta/recipes-devtools/vala/vala_0.24.0.bb |    6 ------
 meta/recipes-devtools/vala/vala_0.26.1.bb |    6 ++++++
 3 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.24.0.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.26.1.bb

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index cac8728..63056fd 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -13,7 +13,6 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--disable-vapigen"
-
+FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
 FILES_${PN}-doc += "${datadir}/devhelp"
-FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi"
+FILES_${PN}-dbg += "${libdir}/${BPN}-${SHRT_VER}/.debug"
diff --git a/meta/recipes-devtools/vala/vala_0.24.0.bb b/meta/recipes-devtools/vala/vala_0.24.0.bb
deleted file mode 100644
index 342a875..0000000
--- a/meta/recipes-devtools/vala/vala_0.24.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
-
-SRC_URI[md5sum] = "beddeff9c06d3c278988b237da0e7401"
-SRC_URI[sha256sum] = "22a37c977512c19cd29c373eaaef96cb2c994795d491106f32387f3f9d1e899c"
diff --git a/meta/recipes-devtools/vala/vala_0.26.1.bb b/meta/recipes-devtools/vala/vala_0.26.1.bb
new file mode 100644
index 0000000..3df9cd4
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.26.1.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+
+SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
+
+SRC_URI[md5sum] = "723a03b822d4cc47abc4019685970a3e"
+SRC_URI[sha256sum] = "8407abb19ab3a58bbfc0d288abb47666ef81f76d0540258c03965e7545f59e6b"
-- 
1.7.10.4


