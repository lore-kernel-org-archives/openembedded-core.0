Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVHnO-000367-Qr
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:08:02 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so8947887bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kIkLml6teyz5KKRWdG4qzeZGfHZTj9yk9EPsJLViPv8=;
	b=F9IBilj2DsgG88g7bYGMCoUQY1kM59brTcr//SFTnVOYjGs9BPpsYCyT15HyzuPoQy
	Rot2J20DD7blGCwZwkeTfEYs87HKPmRd9OBDjKPlQBdW194deMTcTfvvUtSF6u4sVeZE
	VFqDAjt1yqAhm6QbfUc8VteTWYH7ZhAOWmZlo=
Received: by 10.205.128.19 with SMTP id hc19mr49640134bkc.9.1322550084838;
	Mon, 28 Nov 2011 23:01:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d2sm11567961bky.11.2011.11.28.23.01.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 23:01:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 08:00:53 +0100
Message-Id: <0a551c0551391cf10a1b12d53d9223e3dc0fc4d1.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
References: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 03/10] mingetty: use u-a to provide /sbin/getty (also provided by util-linux-agetty and tinylogin)
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
X-List-Received-Date: Tue, 29 Nov 2011 07:08:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index ce4b3d4..fed5dfd 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -2,7 +2,7 @@ DESCRIPTION = " A compact getty program for virtual consoles only"
 SECTION = "console/utils"
 HOMEPAGE = "http://sourceforge.net/projects/mingetty/"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
 SRC_URI = "http://cdnetworks-kr-1.dl.sourceforge.net/project/mingetty/mingetty/${PV}/mingetty-${PV}.tar.gz"
@@ -17,3 +17,10 @@ do_install(){
     mkdir -p ${D}/sbin
     oe_runmake install DESTDIR=${D}
 }
+
+inherit update-alternatives
+
+ALTERNATIVE_NAME = "getty"
+ALTERNATIVE_LINK = "${base_sbindir}/getty"
+ALTERNATIVE_PATH = "${base_sbindir}/mingetty"
+ALTERNATIVE_PRIORITY = "50"
-- 
1.7.8.rc3



