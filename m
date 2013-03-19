Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UHm1z-0002i4-4Z
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 03:12:14 +0100
Received: by mail-da0-f46.google.com with SMTP id y19so368697dan.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 18:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=SXsiWBCf7Q7ULjOtRgj2zizIm3XfZage6wb5OYmBFcw=;
	b=syuu74KL0GiAFRhwJ/Rblo7v5Ul5bxOcC1lpcgJNSGVZ54sO9LY7+Fn979FFfWMM3J
	IT0LMdFlVOrc2Y76CCfIbMiZQFBuxNF24IpTSbhlsCMi1jmMQzal6EHZn60E5DlWS5/d
	/YXlRQW64j9UXhh0w1Xn9wfAACfZ0lTvWc8ABOMt9+9rGqQP8NMPdJyyXj3W2Tu/Bm9d
	2zhdUjTwqmueUarf5l4OjDPn2I/cpoCag2ft0MtrL2HOuCgUCCK5RR+7KhuoxutI1vLw
	9Ikgr2+LncEWhlT/wdCcvhpMTIuhrkLaOunE2yz1RLmX+5yLVl5CrbyG+1DcX5dVi+2z
	wtlg==
X-Received: by 10.68.59.199 with SMTP id b7mr324976pbr.167.1363658113564;
	Mon, 18 Mar 2013 18:55:13 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id kt5sm22143351pbc.30.2013.03.18.18.55.11
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 18:55:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 18:55:07 -0700
Message-Id: <1363658107-23954-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] layer.conf: avoid unnecessary early expansion with :=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 02:12:18 -0000

From: Christopher Larson <chris_larson@mentor.com>

bitbake handles immediate expansions of LAYERDIR for us automatically.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-hob/conf/layer.conf      | 6 +++---
 meta-skeleton/conf/layer.conf | 6 +++---
 meta/conf/layer.conf          | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-hob/conf/layer.conf b/meta-hob/conf/layer.conf
index ea977e2..6df27ac 100644
--- a/meta-hob/conf/layer.conf
+++ b/meta-hob/conf/layer.conf
@@ -1,11 +1,11 @@
 # We have a conf and classes directory, add to BBPATH
-BBPATH := "${BBPATH}:${LAYERDIR}"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a packages directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "hob"
-BBFILE_PATTERN_hob := "^${LAYERDIR}/"
+BBFILE_PATTERN_hob = "^${LAYERDIR}/"
 BBFILE_PRIORITY_hob = "1"
 
 # This should only be incremented on significant changes that will
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index 4cf4767..10031c1 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -1,11 +1,11 @@
 # We have a conf and classes directory, add to BBPATH
-BBPATH := "${BBPATH}:${LAYERDIR}"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a packages directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "skeleton"
-BBFILE_PATTERN_skeleton := "^${LAYERDIR}/"
+BBFILE_PATTERN_skeleton = "^${LAYERDIR}/"
 BBFILE_PRIORITY_skeleton = "1"
 
 # This should only be incremented on significant changes that will
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 6e5cd0c..81f1071 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -4,7 +4,7 @@ BBPATH .= ":${LAYERDIR}"
 BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "core"
-BBFILE_PATTERN_core := "^${LAYERDIR}/"
+BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
 # This should only be incremented on significant changes that will
@@ -12,10 +12,10 @@ BBFILE_PRIORITY_core = "5"
 LAYERVERSION_core = "1"
 
 # Set a variable to get to the top of the metadata location
-COREBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
+COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
 # Set path to qemu image tests included in this layer
-QEMUIMAGETESTS := "${COREBASE}/scripts/qemuimage-tests"
+QEMUIMAGETESTS = "${COREBASE}/scripts/qemuimage-tests"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
-- 
1.8.2



