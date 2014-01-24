Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gg0-f182.google.com (mail-gg0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id C3BB86E938
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:29 +0000 (UTC)
Received: by mail-gg0-f182.google.com with SMTP id e27so761870gga.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=57dx8d4MfZl78aixj/vr8cw8QwBC+B/IGAWFOi20ONY=;
	b=l2yX9KlUscsIUpaj6QmJIBXB2gslCPNJT/ug1cfYFP8RYSIrQEm2QIXnXtLOfU5XMy
	7S5mzQLAHoTkpjkcdGqCPqLwxh2puovJuNWS7zpvQ/Lv25CXM9tz8QBGF80C2UTFT9UQ
	AkZSWJzEPzEtxl/jNt5gNXkFgKXVcI426dEuCXUdIakLpzLvrEqmbWUAg6Ar9fWQtea2
	e0C7iBTdKTVGtjMnwUdt2aCXzuK6iY/L83G27BslABke1EIqOyBJrT8ep0UYZFlxnC48
	mYIlBUmg5BfQJuOU3lpaabjC26FZWpTjoGE7fse3EKmW8vDNkZLQMPmyOPRwHCwu9mu9
	ILmg==
X-Received: by 10.236.131.19 with SMTP id l19mr10324231yhi.0.1390526790877;
	Thu, 23 Jan 2014 17:26:30 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id d7sm42526409yhd.24.2014.01.23.17.26.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1E9CC17BF8CFD; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:13 -0200
Message-Id: <1390526775-26036-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v3 09/11] libfslcodec: Add 'test-bin' and 'test-sources' packages
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
X-List-Received-Date: Fri, 24 Jan 2014 01:26:30 -0000

Add the libfslcodec-test-bin (with built binaries for testing) and
libfslcodec-test-sources (with testing applications source code).

Change-Id: Ic785fb73852530f98e4b4e238d67ee0ffbd3cfea
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-multimedia/libfslcodec/libfslcodec.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-multimedia/libfslcodec/libfslcodec.inc b/recipes-multimedia/libfslcodec/libfslcodec.inc
index 35fc713..a935341 100644
--- a/recipes-multimedia/libfslcodec/libfslcodec.inc
+++ b/recipes-multimedia/libfslcodec/libfslcodec.inc
@@ -12,7 +12,7 @@ SRC_URI = "${FSL_MIRROR}/${PN}-${PV}.bin;fsl-eula=true"
 PACKAGES_DYNAMIC = "${PN}-*"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-PACKAGES += "${PN}-meta"
+PACKAGES += "${PN}-meta ${PN}-test-bin ${PN}-test-source"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-meta = "1"
@@ -36,8 +36,6 @@ do_install_append() {
     done
     rmdir ${D}${libdir}/imx-mm/video-codec
 
-	# FIXME: Drop examples
-	rm -r ${D}${datadir}/imx-mm
 }
 
 python populate_packages_prepend() {
@@ -57,6 +55,8 @@ python populate_packages_prepend() {
     # Allow addition of all codecs in a image; useful specially for
     # debugging.
     codec_pkgs = oe.utils.packages_filter_out_system(d)
+    codec_pkgs = filter(lambda x: x not in ['libfslcodec-test-bin', 'libfslcodec-test-source'],
+                        codec_pkgs)
     d.appendVar('RDEPENDS_libfslcodec-meta', ' ' + ' '.join(codec_pkgs))
 }
 
@@ -67,6 +67,12 @@ FILES_${PN}-dev += "${libdir}/imx-mm/*/*${SOLIBSDEV} \
                     ${libdir}/imx-mm/*/*/*${SOLIBSDEV} \
                     ${libdir}/pkgconfig/*.pc ${includedir}/imx-mm/*"
 
+# FIXME: -test-bin includes the DUT .so files so we need to deploy those
+INSANE_SKIP_${PN}-test-bin_append = " libdir"
+FILES_${PN}-test-bin += "${datadir}/imx-mm/*/examples/*/bin"
+
+FILES_${PN}-test-source += "${datadir}/imx-mm/*"
+
 # FIXME: The wrap and lib names does not match
 FILES_${PN}-oggvorbis += "${libdir}/imx-mm/audio-codec/wrap/lib_vorbisd_wrap_arm*_elinux.so.*"
 
-- 
1.8.5.3


