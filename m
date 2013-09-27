Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D1C496CA64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 16:41:19 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hj3so1118642wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 09:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C9uJ+goV0EYAZwsA1ugfU5RJ/PPyE+gD7YrypZnr/zM=;
	b=YVQPO7WtrgfIvZkF+8iJVmL46kf0WTMJpYuwHSoCMFDYnMDDCF0C6RheYzzkO+TeRS
	MZfPNiJWba9N5uPAZv7RrNi4/D9YGHYqIBaOObgXB47zo3mhA3/aG9zNskJRntOyPsaM
	AdKsEGXedQw5oM/FypEqX5hQgoBqLrkfR2+VP5URzrgZymyZgope4hVVJWXh0kylv4iB
	o57ZaaqyYytpx+NJlKKjOoUoAelxeY83HA5kNC7rZkTy6ARoI9Nz+tbLB4oQH4IZH4xx
	xpODDhv2ihRw7pW+f8hX8Xdcqa5kQzqYE1tK4O1H2SinCaA160v7kqeVqhIoKCEmjLhI
	7UDw==
X-Gm-Message-State: ALoCoQmPOsMIMvbQQzeXb36Is8oqdkDsaRQECf8TsegXeA9fTB5hI7eYa3CKbPy+VMblTaNCLVTm
X-Received: by 10.180.39.134 with SMTP id p6mr3401745wik.9.1380300080956;
	Fri, 27 Sep 2013 09:41:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j5sm15523980wia.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 27 Sep 2013 09:41:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2013 17:41:16 +0100
Message-Id: <1380300077-23074-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] pcmanfm: hide the desktop preferences
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
X-List-Received-Date: Fri, 27 Sep 2013 16:41:20 -0000

Sato doesn't use the pcmanfm desktop, so hide the desktop preferences launcher.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/pcmanfm/files/no-desktop.patch |   15 +++++++++++++++
 meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb       |    3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/pcmanfm/files/no-desktop.patch

diff --git a/meta/recipes-sato/pcmanfm/files/no-desktop.patch b/meta/recipes-sato/pcmanfm/files/no-desktop.patch
new file mode 100644
index 0000000..cb4cae0
--- /dev/null
+++ b/meta/recipes-sato/pcmanfm/files/no-desktop.patch
@@ -0,0 +1,15 @@
+Disable the desktop preferences launcher as we don't use the pcmanfm desktop in
+Sato.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/data/pcmanfm-desktop-pref.desktop b/data/pcmanfm-desktop-pref.desktop
+index ccf8abb..3f6fc1c 100644
+--- a/data/pcmanfm-desktop-pref.desktop
++++ b/data/pcmanfm-desktop-pref.desktop
+@@ -97,3 +97,4 @@ Exec=pcmanfm --desktop-pref
+ StartupNotify=true
+ Terminal=false
+ NotShowIn=GNOME;XFCE;KDE;
++NoDisplay=true
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb
index bcfc9db..9a038fe 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb
@@ -20,7 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 	   file://gnome-fs-regular.png \
 	   file://gnome-mime-text-plain.png \
 	   file://emblem-symbolic-link.png \
-	   file://cross-compile-fix.patch"
+	   file://cross-compile-fix.patch \
+	   file://no-desktop.patch"
 
 SRC_URI[md5sum] = "af0cff78690e658f3c06ceabf27bc71a"
 SRC_URI[sha256sum] = "1f6301f330ad648f3322708ec6c0f680a8695a9453932fe19653bab6731e5582"
-- 
1.7.10.4


