Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOw4-00046A-EG
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:48 +0200
Received: by dalh21 with SMTP id h21so3401908dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=encZj/1QV/JncS4XiSrW9NY8gv0rIh5pn0P6Q00eTIc=;
	b=IzXN5gb9dfbH9CEpL3W2D1ZlCgFPdQp+2aNXr+5Y5qW/xYkztpmNkEjihT07boSLgZ
	9lyBaLwinO5d6/VoksmeSzlijbIAl4QJbXuKdPefwRtxiBgU4J5RKrjST5wCCzG3QMdc
	w8RT51iRQMRxceQ09cGxGtJgaYfOmLntYmnWw+65GQ4o9C5Tg48l+RdUUz6Pxv1qMbeB
	lf8lz7HZM85k0iozvzdU60uW+r86f+73RSCVs8SP0E5dBa6pa1LHw9ZNwJCqsQntmc9H
	8mMnqQ8WI1e5+sexylv6F/JdKffFMGeo3aarqPKlYyIFYSMA3HAWtDZCm1gjDSHgdhFX
	QTDw==
Received: by 10.68.211.170 with SMTP id nd10mr8103818pbc.68.1339260256696;
	Sat, 09 Jun 2012 09:44:16 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:01 -0700
Message-Id: <ce1bc57318df68beea0cef0510693ddae4912305.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 03/16] pth: Mark incompatible with uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jun 2012 16:54:48 -0000

pth does not work with uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/pth/pth_2.0.7.bb |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index 61865b7..cdd5eaf 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -3,9 +3,17 @@ HOMEPAGE = "http://www.gnu.org/software/pth/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=12;endline=15;md5=a48af114a80c222cafd37f24370a77b1"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "${GNU_MIRROR}/pth/pth-${PV}.tar.gz"
+python __anonymous () {
+    import bb, re
+    uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS', True)) != None)
+    if uc_os:
+        raise bb.parse.SkipPackage("incompatible with uClibc")
+}
+
+SRC_URI = "${GNU_MIRROR}/pth/pth-${PV}.tar.gz \
+          "
 
 SRC_URI[md5sum] = "9cb4a25331a4c4db866a31cbe507c793"
 SRC_URI[sha256sum] = "72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0bc77232"
-- 
1.7.5.4



