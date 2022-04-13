Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3128DC48BD2
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.7258.1649861587718226995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 07:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ii/7OXQd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id u3so3021620wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 07:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJsbi/DAg84hfWTX3RnemOhhq+CKcR39QXBDniaqK+k=;
        b=ii/7OXQdhHjYPndYYOUMqbWNTxS5N8M30lULc620wfjhNmYLaDoPdhL6EPKVHmGXLR
         wBJtv9BqH7SZlBcGKBBvRwv8sawpQ8q1tuux78za8B+n5bRZo6RjhhqzH+fYviZ48vVu
         ZSx4Uc6eJOfKSyuWBWpS60qiHThWOvGceltbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJsbi/DAg84hfWTX3RnemOhhq+CKcR39QXBDniaqK+k=;
        b=kymc+CS5m0ad4YCNdZvGVBUGZN3ltUVudEc5v/D+ql4E2ELuAO0TbSS9xaqH+VLsjm
         KRkStJdA+VQU7F+Uti1J+UlNibQ8fN+y7YzwvNBpbTaJ/q3e9lsqnnV0+UFDbgrrNY1P
         QBLdjg2dgizmuZuo5Ccwym/0YMow2nPooYNVzjcz+Aymx6AI2Crl3CQ62Gq24iGlyyhd
         EJ8cZTs9o2jlOx5aAtOo6gukreQJd6xUX8QqxLmnMB6Ev6Myi18x5csLlas6AvFYSlEz
         UMXeS3ZrZZgFudK2wsDkX4HphRldJhS+eTu9QLjECnSfO/1taiCuLgO5Kt7My/Kz1RRc
         hPNA==
X-Gm-Message-State: AOAM533UBn0MuUtyd0TwlWRKTTM7EEpeP34tuO+r+8g/kS/Y2QfQTIKn
	TYAxMsxMaTGTKuh7nS//qyvlCmG/7eKQaA==
X-Google-Smtp-Source: 
 ABdhPJw7/kdG0xlSRJzQNVGemoK+mER7jzImjT7ir821JRrACCnhoCquL6nTdxbT544aVTCyvVy7NQ==
X-Received: by 2002:a05:6000:184d:b0:207:bca5:6306 with SMTP id
 c13-20020a056000184d00b00207bca56306mr346649wri.63.1649861585899;
        Wed, 13 Apr 2022 07:53:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm3521971wmq.40.2022.04.13.07.53.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 07:53:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "adwaita-icon-theme: upgrade 41.0 -> 42.0"
Date: Wed, 13 Apr 2022 15:53:04 +0100
Message-Id: <20220413145304.2172155-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164327

This reverts commit 131b143b6ea37963a0380975718cbf8420e5b87f.

Upstream dropped many 'legacy' low res bitmap icons and also plans to
phase out 'generic app' icons in the svg format, saying that all apps
must carry their own icons. This breaks the icons displayed in sato
so revert for now until we have a plan to mitigate that.

[YOCTO #14782]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch    |  6 +-
 ...-installation-commands-as-shell-jobs.patch | 84 +++++++++++++++++++
 ...eme_42.0.bb => adwaita-icon-theme_41.0.bb} |  7 +-
 3 files changed, 92 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_42.0.bb => adwaita-icon-theme_41.0.bb} (87%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 32f98e049b9..5afba3c6443 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 15ffd817b3e334dc7c0508761c7ef417d76379c5 Mon Sep 17 00:00:00 2001
+From 63d97fefdbc90f5c68f67bdc30844776d9a1b720 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 040975e..5f7b53a 100644
+index f2659a5..1e8b016 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [42.0],
+ AC_INIT([adwaita-icon-theme], [41.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
new file mode 100644
index 00000000000..a1d39cf5584
--- /dev/null
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
@@ -0,0 +1,84 @@
+From 79da031e9811f3eef34b14cce419be93fea34319 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 13 Jun 2017 18:10:06 +0300
+Subject: [PATCH] Run installation commands as shell jobs
+
+This greatly speeds up installation time on multi-core systems.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/merge_requests/39]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ src/fullcolor/Makefile.am |  5 +++--
+ src/spinner/Makefile.am   |  7 ++++---
+ src/symbolic/Makefile.am  | 11 ++++++-----
+ 3 files changed, 13 insertions(+), 10 deletions(-)
+
+diff --git a/src/fullcolor/Makefile.am b/src/fullcolor/Makefile.am
+index d73529b..b7d0808 100644
+--- a/src/fullcolor/Makefile.am
++++ b/src/fullcolor/Makefile.am
+@@ -9,9 +9,10 @@ install-data-local:
+ 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size && find . -name "*.png"`; do \
+ 			context="`dirname $$file`"; \
+ 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
+-			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
++			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
+ 		done; \
+-	done;
++	done; \
++	wait
+ 
+ ## FIXME we should add a way to remove links generated by icon mapping
+ uninstall-local:
+diff --git a/src/spinner/Makefile.am b/src/spinner/Makefile.am
+index c14caf6..322dc0d 100644
+--- a/src/spinner/Makefile.am
++++ b/src/spinner/Makefile.am
+@@ -24,13 +24,14 @@ install-data-local:
+ 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
+ 		      context="`dirname $$file`"; \
+ 		      $(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
+-		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
++		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
+ 	      done; \
+ 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
+ 		context="`dirname $$file`"; \
+ 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable-up-to-32/$$context; \
+-		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
+-	done
++		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file & \
++	done; \
++	wait
+ 
+ uninstall-local:
+ 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
+diff --git a/src/symbolic/Makefile.am b/src/symbolic/Makefile.am
+index 957c0ee..e1f8818 100644
+--- a/src/symbolic/Makefile.am
++++ b/src/symbolic/Makefile.am
+@@ -34,18 +34,19 @@ install-data-local:
+ 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
+ 			context="`dirname $$file`"; \
+ 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
+-			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
++			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
+ 		done; \
+-	done
++	done; \
+ 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
+ 		context="`dirname $$file`"; \
+ 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable/$$context; \
+-		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file; \
++		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file & \
+ 		for size in $(symbolic_encode_sizes); do \
+ 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
+-			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context; \
++			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context & \
+ 		done \
+-	done
++	done; \
++	wait
+ 
+ uninstall-local:
+ 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
similarity index 87%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
index c4f3b1c9996..46f9f4772ca 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
@@ -12,9 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
 
-SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
+SRC_URI += " \
+           file://0001-Don-t-use-AC_CANONICAL_HOST.patch \
+           file://0001-Run-installation-commands-as-shell-jobs.patch \
+           "
 
-SRC_URI[archive.sha256sum] = "5e85b5adc8dee666900fcaf271ba717f7dcb9d0a03d96dae08f9cbd27e18b1e0"
+SRC_URI[archive.sha256sum] = "ef5339d8c35fcad5d10481b70480803f0fa20b3d3cbc339238fcaceeaee01eba"
 
 DEPENDS += "librsvg-native"
 
-- 
2.32.0


