Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 02ECB71F41
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:13:56 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z12so550320lbi.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 02:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mYaGgHU+BezWzJoaisiMk0iwx+xXZxC5mXkDxXFw9To=;
	b=gZy2Hnu2HKR7WgDdAzaEl15bJSkiMggx4qGoVDfkGD6ZNP2wyU7w1uEllXV1fAM2Kw
	I1pJJVyv4KV1g1KECwBCeSMKQ2N78JKQ3HwKTBUylDM4ra3yZ/eCwi9gy43NWBhIRCBc
	uTvGio5KXE0QJn00Z6SjG1CzoHoECNsPG8sMFIm2b+YIZg9DHyqKfwA/QTBRS10Qmb8c
	xKD3fSi/X26QGSPTeBGUQ82/CIh8qXg3EigWw+rEg1KKcq01Mqb4Xy9Zwsz8kTvlxMKk
	iuEzAFJkGDXAYyNP8d+bBEcHG3ATC8PF455iz6HwAbvgMUZPfY6nHuwzP/BIgNT5BqkH
	tktQ==
X-Received: by 10.112.168.97 with SMTP id zv1mr23684415lbb.6.1415009635879;
	Mon, 03 Nov 2014 02:13:55 -0800 (PST)
Received: from neopili.fritz.box
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id l1sm2239300lbd.32.2014.11.03.02.13.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Nov 2014 02:13:55 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Mon,  3 Nov 2014 11:13:50 +0100
Message-Id: <1415009631-13851-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1415009631-13851-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1415009631-13851-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [PATCH 1/2] debianutils: Add recipe from meta-oe
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
X-List-Received-Date: Mon, 03 Nov 2014 10:14:00 -0000

This recipe is a running dependency of recipe apt

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../recipes-support/debianutils/debianutils_4.4.bb | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/debianutils/debianutils_4.4.bb

diff --git a/meta/recipes-support/debianutils/debianutils_4.4.bb b/meta/recipes-support/debianutils/debianutils_4.4.bb
new file mode 100644
index 0000000..346eaf1
--- /dev/null
+++ b/meta/recipes-support/debianutils/debianutils_4.4.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Miscellaneous utilities specific to Debian"
+SECTION = "base"
+LICENSE = "GPLv2 & SMAIL_GPL"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.gz"
+SRC_URI[md5sum] = "c0cb076754d7f4eb1e3397d00916647f"
+SRC_URI[sha256sum] = "190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6"
+
+inherit autotools update-alternatives
+
+do_configure_prepend() {
+    sed -i -e 's:tempfile.1 which.1:which.1:g' ${S}/Makefile.am
+}
+
+do_install_append() {
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        # Debian places some utils into ${base_bindir} as does busybox
+        install -d ${D}${base_bindir}
+        for app in run-parts tempfile; do
+            mv ${D}${bindir}/$app ${D}${base_bindir}/$app
+        done
+    fi
+}
+
+ALTERNATIVE_PRIORITY="100"
+ALTERNATIVE_${PN} = "add-shell installkernel remove-shell run-parts savelog tempfile which"
+
+ALTERNATIVE_LINK_NAME[add-shell]="${sbindir}/add-shell"
+ALTERNATIVE_LINK_NAME[installkernel]="${sbindir}/installkernel"
+ALTERNATIVE_LINK_NAME[remove-shell]="${sbindir}/remove-shell"
+ALTERNATIVE_LINK_NAME[run-parts]="${base_bindir}/run-parts"
+ALTERNATIVE_LINK_NAME[savelog]="${bindir}/savelog"
+ALTERNATIVE_LINK_NAME[tempfile]="${base_bindir}/tempfile"
+ALTERNATIVE_LINK_NAME[which]="${bindir}/which"
-- 
2.1.1


