Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T8w4j-0005Wt-6l
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:34:05 +0200
Received: by bkcik5 with SMTP id ik5so3398270bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=DSJlXhcN9ibwgpDrKEj3fgMCdEhoqT64z+xJU8AVyTg=;
	b=Oi0OzK+v09z2P/jdbldSNGO92PbboOpVrWFuPiiPwUsi2LggTD9Ed1/yeL8hUej78F
	d2NJXAg83NDp3BeHGbD7vz9HWwf8bK0PyNzE043cy0W61l+gvwT5jYcTfrKbhHp7AHbj
	xB6ITRG5H2vcVp2j+4cLR5L2hDcjldIBk01CH3DLpZ+mm/rFIEVycer6sUoX0HWEEa1W
	HCszuJTFGiJYS3i15VAwZANNRQMQ/L/fSGwMKgaCiYn6ROpmB7CXoH+PZArUpuCEEiKp
	/nPs48+j9IZkLYqj5NDWv6mmBFOFWhwBP0Sxt6eEWeiY5odnDZ14qT/05VB0ZufAqawj
	bI7g==
Received: by 10.205.134.133 with SMTP id ic5mr8666393bkc.15.1346775703365;
	Tue, 04 Sep 2012 09:21:43 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id 25sm10894982bkx.9.2012.09.04.09.21.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 09:21:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  4 Sep 2012 18:20:57 +0200
Message-Id: <1346775658-23370-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-ti 1/2] mesa: add appends to avoid providing conflicts
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
X-List-Received-Date: Tue, 04 Sep 2012 16:34:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For libgles-omap3 compatible machines mesa should only provide libgl.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-graphics/mesa/mesa-dri_8.0.4.bbappend  |    1 +
 recipes-graphics/mesa/mesa-dri_git.bbappend    |    1 +
 recipes-graphics/mesa/mesa-omap3-common.inc    |    7 +++++++
 recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend |    1 +
 recipes-graphics/mesa/mesa-xlib_git.bbappend   |    1 +
 5 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
 create mode 100644 recipes-graphics/mesa/mesa-dri_git.bbappend
 create mode 100644 recipes-graphics/mesa/mesa-omap3-common.inc
 create mode 100644 recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend
 create mode 100644 recipes-graphics/mesa/mesa-xlib_git.bbappend

diff --git a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend b/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
new file mode 100644
index 0000000..164ec1b
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
@@ -0,0 +1 @@
+require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa-dri_git.bbappend b/recipes-graphics/mesa/mesa-dri_git.bbappend
new file mode 100644
index 0000000..164ec1b
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-dri_git.bbappend
@@ -0,0 +1 @@
+require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa-omap3-common.inc b/recipes-graphics/mesa/mesa-omap3-common.inc
new file mode 100644
index 0000000..0340770
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-omap3-common.inc
@@ -0,0 +1,7 @@
+PRINC := "${@int(PRINC) + 1}"
+
+# avoid providing conflicts for libgles-omap3 compatibles
+PROVIDES_omap3 = "virtual/libgl"
+PROVIDES_ti814x = "virtual/libgl"
+PROVIDES_ti816x = "virtual/libgl"
+PROVIDES_ti33x = "virtual/libgl"
diff --git a/recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend b/recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend
new file mode 100644
index 0000000..164ec1b
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-xlib_8.0.4.bbappend
@@ -0,0 +1 @@
+require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa-xlib_git.bbappend b/recipes-graphics/mesa/mesa-xlib_git.bbappend
new file mode 100644
index 0000000..164ec1b
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-xlib_git.bbappend
@@ -0,0 +1 @@
+require mesa-omap3-common.inc
-- 
1.7.6.5



