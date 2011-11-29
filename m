Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVHnH-00036Q-IJ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:07:55 +0100
Received: by faar15 with SMTP id r15so568113faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=P6qlc+FmqYagr7eO8WoGAK1DC51d2pgLCPwQFs2KRPw=;
	b=u+wzWR+DNADHfkfTVG2CtNCQ9K9nvUOMUqKN4U/Uw+LQP9OdM/BUcb8s6TTuHTmVef
	J3NMbypr38kkFsJDxhm1F+Up0DJfAV+tOuyJ7N5Er/1uK5hQcFm7pAijytmT8MpKefm3
	tR/cTccNy8EaOa9GURPhWTf5UjHqUm+tpPbvA=
Received: by 10.204.149.212 with SMTP id u20mr3211430bkv.120.1322550076863;
	Mon, 28 Nov 2011 23:01:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id jf4sm29392829bkc.5.2011.11.28.23.01.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 23:01:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 08:00:52 +0100
Message-Id: <3203398eecfc0215abbca487c516006bca4305ef.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
References: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 02/10] util-linux: use u-a to provide /sbin/getty from util-linux-agetty
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
X-List-Received-Date: Tue, 29 Nov 2011 07:07:55 -0000

* inittab and systemd-serialgetty expects /sbin/getty not agetty

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |    8 ++++++++
 meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 855a545..acc4a39 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -236,6 +236,14 @@ pkg_prerm_util-linux-fdisk () {
 	update-alternatives --remove fdisk fdisk.${PN}
 }
 
+pkg_postinst_util-linux-agetty () {
+	update-alternatives --install ${base_sbindir}/getty getty agetty 100
+}
+
+pkg_prerm_util-linux-agetty () {
+	update-alternatives --remove getty agetty
+}
+
 pkg_postinst_util-linux-mount () {
 	update-alternatives --install ${base_bindir}/mount mount mount.${PN} 100
 }
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index b65e761..82040ef 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r11"
+PR = "r12"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.8.rc3



