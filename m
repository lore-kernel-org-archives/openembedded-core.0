Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id D21057F2F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 15:16:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b9so3406313wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 08:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=szS/+deR1zffNfIQPv0gLhN+2sdCU1TyrTbPCcEmuq4=;
	b=qjxR/YE/Nyi0TMFKEWs27aI4+Ucx9P8HpKuTMAp1LuFT8SiCCxH5FA5kqqXqSWGxDZ
	uCk05d5IxJ9jvk8Hmmgp5hDWultocA5sPDfXQ+at5+W2pNyTaeCKicrFsfHbYML8xaAN
	leMSM3iT6DHL/tIgokKmkqU06UvkLLZFTBK+AcClTvLkN3PfH3caZMRcaUtjIErr5p7m
	3DB9MZxNST+8V6AnWiFK2h7i+kj0RqnF8ozQlD5yQP3TYGdt/aKzXE63dEb/cIZTTCjo
	NV0TokkbTQ6lfIH0I8gkuwtmqCebwK6kaUcVKGcSlwwVyphvC/o+yOpp/A1sCDHkRsFg
	5z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=szS/+deR1zffNfIQPv0gLhN+2sdCU1TyrTbPCcEmuq4=;
	b=RY/9samOX88NLRvJDsanqGHKK+3zJAt3VKzOaIX/WG8sMJ9D8suNd/CQhHhHhMmJnX
	9NQtcN9W2LMgsH0LT0MW+OrByr369KG3mP+GDWd0mqv/Sb9HiqVJoJrr5515yGFXsOLJ
	sfwR7dXTiInRRso/eLjLNn24B38ntmFMNsf2QtidFxhKqWMQIWMCqP/0emcx6jer2fAu
	LcgeUR8pyMjQB8RQCdCfWPx1DRLlTC+MJzzZcSlPGINRMYa1BoSnhewE3JN39/d/9x9q
	h+HGCrSLp9cVp9tf5nVPrbKeC4M7SGhXif3LCgpaVSJxZQvHFKIQvT7JAAjYJaE8gZWo
	BNNg==
X-Gm-Message-State: APjAAAX1UJFU6jpLJ4hlsrUUwcNwKRTnTOMpC71/DJhjvRIYTZRMq57n
	DtrVdiCLNmzLHIILNh8O+hIOgYzDM+8=
X-Google-Smtp-Source: APXvYqxb18gjpJ8phxLxiTZiisnOWstWqeecLgRNOVZffTwtHrH09Z7+yY6KjRFSewQTZ8+7iU7wPQ==
X-Received: by 2002:a05:600c:2311:: with SMTP id
	17mr7481584wmo.39.1569597419992; 
	Fri, 27 Sep 2019 08:16:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id n1sm5791051wrg.67.2019.09.27.08.16.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 08:16:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 16:16:55 +0100
Message-Id: <20190927151655.30447-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pango: fix the failing testiter test case
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
X-List-Received-Date: Fri, 27 Sep 2019 15:17:00 -0000
Content-Transfer-Encoding: 8bit

The testiter test case fails if libthai support isn't enabled because it
execises codepaths that need libthai to be correct.  Backport a patch to skip
this test if libthai isn't enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...kip-thai-break-tests-without-libthai.patch | 36 +++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.44.6.bb   |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Skip-thai-break-tests-without-libthai.patch

diff --git a/meta/recipes-graphics/pango/pango/0001-Skip-thai-break-tests-without-libthai.patch b/meta/recipes-graphics/pango/pango/0001-Skip-thai-break-tests-without-libthai.patch
new file mode 100644
index 00000000000..3f9ebff33e7
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-Skip-thai-break-tests-without-libthai.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 12beb39925b5a4574a7cfd86073b59bceb49f791 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Wed, 4 Sep 2019 15:51:06 -0400
+Subject: [PATCH] Skip thai break tests without libthai
+
+If we don't have libthai, these tests fail.
+
+Closes: https://gitlab.gnome.org/GNOME/pango/issues/420
+---
+ tests/meson.build | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index 4c22c12c..c617331f 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -89,9 +89,12 @@ test_breaks_data = [
+   'breaks/one',
+   'breaks/two',
+   'breaks/three',
+-  'breaks/four',
+ ]
+ 
++if thai_dep.found()
++  test_breaks_data += [ 'breaks/four', ]
++endif
++
+ test_items_data = [
+   'itemize/one',
+ ]
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/pango/pango_1.44.6.bb b/meta/recipes-graphics/pango/pango_1.44.6.bb
index 882eada7a4e..da7f2156dca 100644
--- a/meta/recipes-graphics/pango/pango_1.44.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.44.6.bb
@@ -15,7 +15,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-Skip-thai-break-tests-without-libthai.patch"
 SRC_URI[archive.md5sum] = "db0a3243ba33e02aaa775412f8e5f412"
 SRC_URI[archive.sha256sum] = "3e1e41ba838737e200611ff001e3b304c2ca4cdbba63d200a20db0b0ddc0f86c"
 
-- 
2.20.1


