Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id C6C77601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 19:01:53 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id o4so15985727lbp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 12:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xytQFjRzFGbbPQilzJwfb1Vc0qwiO8My3iEGhysCUnY=;
	b=vVZUOCTr6GTXdB9c4ojuqQUKyAqqr8VYpfRdLNP3QBV1QVRSAeL988C5H166bVu8B/
	XP1QwGJKmUGcEvBrIf0+TXNmj3VcX/Mm9rZTl83AhIiwYXBSDocfVBJtKHaE89FaQSj3
	YlZvFTBmMKNmyCJ8WojqLS0a98+SJYP61IvVQK9XxjkF0UgotAQAO4HofP7SkfaJn/HW
	BNwtD6vNf9FtYXIitCEIM1BcpfF1bylppb8/Gu5LOX0uv/9uvyU0X6XkvZpAt//I2mKm
	o03wJAkeg/dbVcRfQGC4rULyRr2gOrRT1KCVni7tGoWLDMePVGrBCtJmVa8fdbr0ZATe
	P1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xytQFjRzFGbbPQilzJwfb1Vc0qwiO8My3iEGhysCUnY=;
	b=QpPUwMh303tCQJHGuT+62YfuJoBri7sAUOuGgavDBNeuUogshG0nHuLZZfaq40+Zyd
	PDLLZgpSARKC5haghaj3Sclm76+7aXoNwFPklMn405PqrmBrpjwaCz7vkZwURL6YLBcK
	MhAtpYDxcQIzzCzElD3cgEQmfL9YxKozL5qZLshxqKoxgoPLDYzvnuUZLeRtA5J5O6LI
	M8MqBjzL5bpjP70gByhTscvEyRW9OAdKezbGMP+XckyxZGmGjvSXE3egcWo9KMHfmySl
	/R/uoA7yqg3wP+e1C9sCp2X2YsHXFL9ozgYOu4I5aobM+ljpBHGn4fGygcAjA7aS4nyd
	3Cbg==
X-Gm-Message-State: ALyK8tLO8f9tqBhs/dVh4GNrlZLitVwuZ2DRK7Nxb5ywEF6CG3m8N+vBVhYg5BRtOHUo/kEb
X-Received: by 10.194.162.168 with SMTP id yb8mr23042432wjb.32.1466535712810; 
	Tue, 21 Jun 2016 12:01:52 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u64sm4271766wmd.8.2016.06.21.12.01.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jun 2016 12:01:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 20:01:50 +0100
Message-Id: <1466535710-30739-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] puzzles: fix Samba conflict, clean up recipe
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
X-List-Received-Date: Tue, 21 Jun 2016 19:01:55 -0000

The impetus for this was that puzzles-extra contains /usr/bin/net which
conflicts with Samba.  Hopefully it's not controversial to say that Samba has
priority here, so rename the binary in this recipe to puzzles-net.

Also fix the out-of-tree build problems (just run mkfiles in ${S}) so
autotools-brokensep doesn't need to be used.

Modernise the anonymous Python block.

Use ${bindir} instead of ${prefix}/bin.

Use autotools do_install and append instead of brokenly replicating the install
logic.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index a9daacd..2c755d8 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -21,7 +21,7 @@ PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep distro_features_check pkgconfig
+inherit autotools distro_features_check pkgconfig
 
 PACKAGECONFIG ??= "gtk3"
 PACKAGECONFIG[gtk2] = "--with-gtk=2,,gtk+,"
@@ -32,46 +32,41 @@ FILES_${PN} = ""
 FILES_${PN}-extra = "${prefix}/bin ${datadir}/applications"
 
 python __anonymous () {
-    var = bb.data.expand("FILES_${PN}", d, 1)
-    data = d.getVar(var, True)
+    var = d.expand("FILES_${PN}")
+    data = d.getVar(var, False)
     for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
-        data = data + " ${prefix}/bin/%s" % name
+        data = data + " ${bindir}/%s" % name
         data = data + " ${datadir}/applications/%s.desktop" % name
     d.setVar(var, data)
 }
 
-
 do_configure_prepend () {
+    cd ${S}
     ./mkfiles.pl
+    cd ${B}
 }
 
-do_install () {
-    rm -rf ${D}/*
-    export prefix=${D}
-    export DESTDIR=${D}
-    install -d ${D}/${prefix}/bin/
-    oe_runmake install
-
-
-    install -d ${D}/${datadir}/applications/
+do_install_append () {
+    # net conflicts with Samba, so rename it
+    mv ${D}${bindir}/net ${D}${bindir}/puzzles-net
 
     # Create desktop shortcuts
+    install -d ${D}/${datadir}/applications/
     cd ${D}/${prefix}/bin
     for prog in *; do
 	if [ -x $prog ]; then
             # Convert prog to Title Case
-            title=$(echo $prog | sed 's/\(^\| \)./\U&/g')
+            title=$(echo $prog | sed 's/puzzles-//' | sed 's/\(^\| \)./\U&/g')
 	    echo "making ${D}/${datadir}/applications/$prog.desktop"
 	    cat <<STOP > ${D}/${datadir}/applications/$prog.desktop
 [Desktop Entry]
 Name=$title
-Exec=${prefix}/bin/$prog
+Exec=${bindir}/$prog
 Icon=applications-games
 Terminal=false
 Type=Application
 Categories=Game;
 StartupNotify=true
-X-MB-SingleInstance=true
 STOP
         fi
     done
-- 
2.8.1


