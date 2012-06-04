Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sbfpl-00015a-L0
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 00:33:09 +0200
Received: by pbbrq2 with SMTP id rq2so6811339pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 15:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=encZj/1QV/JncS4XiSrW9NY8gv0rIh5pn0P6Q00eTIc=;
	b=bf23qYX6V7Hg3lk1LY4y/hDO3F8qfgg+16ZQxmRvBAwiGw1nU9h7VhVR9D421jLnu3
	oTtMg8c7G6tzGqjabqt7cvOYip5q3AFAisZ7FWVGvyzeQ298s/VzKCxfGdXNpBZUObsE
	Uvc/hiHR3TqW5no9LS4t76nQx5IJ9s8WpVuJidpA5qeVa/avaCg5lxAWTFtWe4sGqv69
	2v1BGhbsUEhJu2PzJi7y4v3SGzt1y1wCMIjT/xqcEauJPRJ9k0FkXKaj6H76mitoI7rY
	r/3JehqubWa3TuQOfblhArhob8UL9pklgLZEbbx9QXL8YZ20hffhN09l4GqBz0fhjz5F
	re3g==
Received: by 10.68.230.105 with SMTP id sx9mr2618547pbc.114.1338848563815;
	Mon, 04 Jun 2012 15:22:43 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id we10sm34017pbc.13.2012.06.04.15.22.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 15:22:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2012 15:21:42 -0700
Message-Id: <cd4ed4a96dd683667c4bd05a9c74ef600d67a977.1338848379.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
References: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
In-Reply-To: <cover.1338848379.git.raj.khem@gmail.com>
References: <cover.1338848379.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] pth: Mark incompatible with uclibc
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
X-List-Received-Date: Mon, 04 Jun 2012 22:33:09 -0000

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



