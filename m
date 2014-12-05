Return-Path: <awais.belal@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id D9E8970A8B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 11:40:21 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id fp1so240779pdb.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 03:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OwkpBUcp6SEo5eGnnZzosxMK5Dwt4cT0Tl6xk0WpOxg=;
	b=YW8lLYDVlxqRgTGVT3IddWKtoUyKKuEh37MHbXor1/xyiIqcCPS7isRDq6X8yWJrn6
	mKw+NYsCD1J/9CnOmDYh02PL9MjCR5Ydeb6oFzgI3btYPT+9yQxiX9geuvSLYipDH4YC
	e++y9Z3DQT0rhWNhpF5rtlWOwbhyqy97k1YJqJZ3zrdj4Z+7CA16vmqMuKX+cSoYevDp
	mvgsY9W7pDgAS0XEpdfDVpGIlzAnMSB/zKIUAo5fOzZ5Qn5cY8a198ifgqmnXT79ZNVs
	ZDllqW8kQUfmXAc0PpdBmjZmJctoSuIql4HBQSeDKPYEfUVm6Vei3vAZ4Q51LlYUsXnH
	2DzA==
X-Received: by 10.68.57.225 with SMTP id l1mr34212352pbq.87.1417779621774;
	Fri, 05 Dec 2014 03:40:21 -0800 (PST)
Received: from awais-Precision-M4700.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id c5sm10579192pda.16.2014.12.05.03.40.19
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Dec 2014 03:40:21 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
X-Google-Original-From: Awais Belal <awais_belal@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 16:40:10 +0500
Message-Id: <1417779610-18291-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gstreamer1.0-libav: specify proper cross-prefix
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
X-List-Received-Date: Fri, 05 Dec 2014 11:40:34 -0000

This avoids a compile failure locating ranlib by providing
the correct cross-prefix for build.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../gstreamer/gstreamer1.0-libav_1.4.1.bb          |    3 ++-
 .../gstreamer/gstreamer1.0-libav_git.bb            |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb
index 8bba831..f962ff0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb
@@ -18,7 +18,8 @@ SRC_URI[sha256sum] = "fc125521187fa84f3210269a0eecc51f8a856802f1ca4bb251f118dab9
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \
-  ${GSTREAMER_1_0_DEBUG}"
+  ${GSTREAMER_1_0_DEBUG} \
+  --cross-prefix='${HOST_PREFIX}'"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 5ce28cc..aa2de69 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -18,7 +18,8 @@ SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
 
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-  ${GSTREAMER_1_0_DEBUG}"
+  ${GSTREAMER_1_0_DEBUG} \
+  --cross-prefix='${HOST_PREFIX}'"
 
 do_configure() {
 	./autogen.sh --noconfigure
-- 
1.7.9.5


