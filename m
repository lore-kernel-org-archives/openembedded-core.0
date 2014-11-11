Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7829065CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:16:25 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ex7so1953619wid.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 07:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=esWqWE4ITWeXsiDBLCaa2qmq86AzNuOw4dbaC77Js34=;
	b=b6rslaYFxe0uLwca7tzqrL4qtoe8uvZGA81PNp4D27sS6G6SKvumCjJHl0my7aPX4z
	N9IbW1stp7n3mQA/TgZqQd28sRpxi1e6BEgGe+p0fa3Mmhng6SglXz0fQokUVwBgT3nF
	uiX138TQ7GMm/4rkDuRg6noJvo8i5fWhfS209bumHfoPYqyI1U6p1VV95myZqweAWX57
	MU1CXEINcw1VDux5/ku3GicYPxTsT1Zk+r+Isq8Fi2JxXHSc3qXRab6thn4DzeTyV+Zy
	HGw7g6evqW0pRUWxS2ZdQ6DA+ud+Eg8f6HfWsc2G2dAQuJJqA4tN66vs2OvVmPzdozHu
	g3NA==
X-Gm-Message-State: ALoCoQnOWs1Tooz3tjxOPhFz93bT6lzniF+J1yvwMfalCECiksGQ0zioda0iQpkXki6XVAngSG7v
X-Received: by 10.194.172.234 with SMTP id bf10mr55277711wjc.81.1415718985925; 
	Tue, 11 Nov 2014 07:16:25 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	wa10sm22983480wjc.8.2014.11.11.07.16.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 07:16:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 15:16:22 +0000
Message-Id: <1415718982-3975-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] vala: upgrade to 0.26.1
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
X-List-Received-Date: Tue, 11 Nov 2014 15:16:29 -0000

vapigen can't be disabled anymore, so remove --disable-vapigen.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/vala/vala.inc       |    5 ++---
 meta/recipes-devtools/vala/vala_0.26.1.bb |    5 +++++
 2 files changed, 7 insertions(+), 3 deletions(-)
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
diff --git a/meta/recipes-devtools/vala/vala_0.26.1.bb b/meta/recipes-devtools/vala/vala_0.26.1.bb
new file mode 100644
index 0000000..d59d3fb
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.26.1.bb
@@ -0,0 +1,5 @@
+require ${BPN}.inc
+
+SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
+SRC_URI[md5sum] = "723a03b822d4cc47abc4019685970a3e"
+SRC_URI[sha256sum] = "8407abb19ab3a58bbfc0d288abb47666ef81f76d0540258c03965e7545f59e6b"
-- 
1.7.10.4


