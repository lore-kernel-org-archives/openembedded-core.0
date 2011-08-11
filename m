Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qra0j-0005kg-3T
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:29:41 +0200
Received: by gwb11 with SMTP id 11so1526880gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CoYlDB2zHPTCL3p09SUWoYZqMZ5psuF51W/tJEV5xBU=;
	b=n2iLLuEwFcNAf4oz05VbPBq7l+zlfFbSFo+7zEen/UNQ/Nt7c4appllQw2NC4Q9XAB
	aZjpe20pAzTTKvd2OXxOA1ybSzQGKW9bz5M+VCewO5FwLRxr/5Vq1RPsVQLYWCCQwwMY
	sQgH0WOIrwK3DKjF4YC4MjXWmHaQHm6TY5dt4=
Received: by 10.150.254.20 with SMTP id b20mr1017794ybi.91.1313087108824;
	Thu, 11 Aug 2011 11:25:08 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f5sm1281063ybd.13.2011.08.11.11.25.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 11:25:08 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 11:23:48 -0700
Message-Id: <1a00f4f19846518abdef1e7eaa238c0797e75189.1313086806.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/7] busybox: don't strip the main binary
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
X-List-Received-Date: Thu, 11 Aug 2011 18:29:41 -0000

From: Chris Larson <chris_larson@mentor.com>

With this, we get a useful busybox-dbg package.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/recipes-core/busybox/busybox.inc       |    3 ++-
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 5eba0ca..d46c135 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -120,7 +120,8 @@ do_configure () {
 
 do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	base_do_compile
+	oe_runmake busybox_unstripped
+	cp busybox_unstripped busybox
 }
 
 do_install () {
diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index d18af6f..b4681a4 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.4.1



