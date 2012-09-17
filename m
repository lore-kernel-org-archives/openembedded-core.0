Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TDZ6G-0000bL-A6
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 13:02:48 +0200
Received: by daks35 with SMTP id s35so3908714dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Tt6wWs8T7UqiBjEDK82Xdbe5eQRaXEO0qBsWU48/+bQ=;
	b=Ofi5ERCZr7SuexH5SG27xtDTLzEphQz+BA5K1HTM3WORJhqqSIYRt5/ahtOdBkW9KS
	COywmkCdFPdO8b1DPleZkHE/XOMmtBJlfW8rC+1tl/nn2hSDFfHTxardFhDFbpdl/x2A
	PQX4Rdp0Igt7jSgpwzqhu63FmT3PwtclYd2o2KjVAnBG1y2R50KfIP7Ih3Fj44q9Iwfa
	pDxwEI6q93vFUI64eRfnXQSXFzf4rh6MTHVI1tTjj/fGHosrd5itryOruwutS0Mklrzv
	aKYNnjZnQTOUH1fgQ8nJdFLboC6Lw1PWPe7PE2dRdubEd5hoCml9QvgJA8p5S4L6lhiT
	iTfw==
Received: by 10.68.224.73 with SMTP id ra9mr22007886pbc.85.1347879008915;
	Mon, 17 Sep 2012 03:50:08 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id qw6sm6750536pbc.26.2012.09.17.03.50.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:50:08 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 13:49:58 +0300
Message-Id: <1347878998-19019-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlHMLqv0/dduPO4sXcFlWvwLYuDW5oN+ot6j3d6sP1oWrUuqRaGxM8F7Akl0wwM0v1eq0SJ
Subject: [PATCH] util-linux: Fix bloken swapoff symlink
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
X-List-Received-Date: Mon, 17 Sep 2012 11:02:48 -0000

There were 2 issues with this symlink.
1. Is was installed in base_bindidir but packaged in bindir. Fixed to
be packaged in base_bindir
2. The symlink swapoff was created to point to swapon. The problem is
that swapoff is an alternative so it would end up pointing to
swapoff.util-linux which was an inexistent file. The fix is to create
a symlink swapoff.util-linux to swapon.util-linux.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/util-linux/util-linux.inc       |    4 ++--
 meta/recipes-core/util-linux/util-linux_2.21.2.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 00e5d7c..79e0608 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -46,7 +46,7 @@ FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
 FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
 FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
-FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${sbindir}/swapoff.${BPN}"
+FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${base_sbindir}/swapoff.${BPN}"
 FILES_util-linux-losetup = "${base_sbindir}/losetup.${BPN}"
 FILES_util-linux-mount = "${base_bindir}/mount.${BPN}"
 FILES_util-linux-mcookie = "${bindir}/mcookie"
@@ -121,7 +121,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/default/
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
 
-	ln -sf swapon   ${D}${base_sbindir}/swapoff
+	ln -sf swapon.${BPN}   ${D}${base_sbindir}/swapoff.${BPN}
 	rm -f ${D}${sbindir}/swapoff
 }
 
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.2.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
index 0f5fdc6..6ef3163 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r1"
+PR = "r2"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.9.5



