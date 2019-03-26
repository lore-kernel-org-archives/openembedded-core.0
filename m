Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 048197D0FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 12:02:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y7so9895039wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=z2d4PcLq6ZQTSrzluwXT/RRFNHRs1iI1oc0CqjZ+gg4=;
	b=lhmnu83FON4rGxnT8yCS1zOcURKRO1MmNciJ8RD/seMXREOWEbz+y022fFCosganOE
	8NfARMGdFklqG8ln2Clge0b0N7NXKakfpebWJY5gInNgb0Fsak2zwk3Egm2D+LRQYIBq
	yyKlrt28PhV+AWp8lmFTWi2AxE9Nd/ShFeFEHx+k0gG0iJWP+FAHFrZuuoI6sgQHuxgY
	+fWC8qI/A2EGM6CqHB/hmUfznLX14wLR0m8tiTDBy0JHbKdusJFl36iJNoTWz94XxjO2
	rjaB0Lr5wSya4TXEIxcP0WzGfa1sI/3WKPooAFcytFmihBuIft97IEF4tgSlaWFcd6im
	p8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=z2d4PcLq6ZQTSrzluwXT/RRFNHRs1iI1oc0CqjZ+gg4=;
	b=H7ECTw9qAqK8qkkhoqZiN/98jexhmR+2mOTpScK1/fo4cQMr46FEyWdjWYxhyWz9hC
	n/YeqbP+xtvmkVhTIHvDLqckoovYbJwJL0hHcxOVy+ZKPbODDI0eiYhFKq66wrkwftPV
	ku85K0IHRWVYRU0in6U0WDuKy1ELr/6P6hQcb43DUHdSCqFAJoVcF0BFpJPhLkdoNWDG
	1XaUvDmii51VruuQ/edq91AvoROAjz5f28fkFc2q/XxYekeSL7q6hdOu4oZGTvuG3XPg
	tq0GH5bOKuTyt08jlntsSp/ZFly6/wHAM312WAHROkB9bI/Fov6RfeIlfWiup4G2g5m6
	t7jA==
X-Gm-Message-State: APjAAAUglL3mDK3sphaAsFeAeAsPU9glwvlPXvdshJ0OKsH/O5QvTXBX
	k6k4Zb9mwkrrEtR3e0/6gIo38Wqs4b4=
X-Google-Smtp-Source: APXvYqy/YjOUGPxSVctz2QithfYdu0/JIMjmDCGvZ8Rhlml3nvKklyvrlnce6tlFz/Jl2NUtv/+EGA==
X-Received: by 2002:a5d:6604:: with SMTP id n4mr21251575wru.42.1553601725403; 
	Tue, 26 Mar 2019 05:02:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j66sm33303221wrj.51.2019.03.26.05.02.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 05:02:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 12:02:02 +0000
Message-Id: <20190326120202.4448-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib: do a build check for strlcpy before runtime
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
X-List-Received-Date: Tue, 26 Mar 2019 12:02:05 -0000

There's no need to do a runtime check for the behaviour of strlcpy if it doesn't
even exist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...build-time-check-for-strlcpy-before-attem.patch | 62 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch
new file mode 100644
index 00000000000..d1ed028759a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Backport [fc88e56bfc2b09a8fb2b350e76f6425ab0a056d7]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 141acf6a2f3b21d63c9cfe620b8e20a506e78493 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 13 Mar 2019 16:22:09 +0000
+Subject: [PATCH] meson: do a build-time check for strlcpy before attempting
+ runtime check
+
+In cross-compilation environments the runtime check isn't possible so it is up
+to the builder to seed the cross file, but we can definitely state that strlcpy
+doesn't exist with a build test.
+---
+ meson.build | 30 ++++++++++++++++--------------
+ 1 file changed, 16 insertions(+), 14 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 15039e448..414f2d9b1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1860,22 +1860,24 @@ endif
+ 
+ # Test if we have strlcpy/strlcat with a compatible implementation:
+ # https://bugzilla.gnome.org/show_bug.cgi?id=53933
+-if cc_can_run
+-  rres = cc.run('''#include <stdlib.h>
+-                   #include <string.h>
+-                   int main() {
+-                     char p[10];
+-                     (void) strlcpy (p, "hi", 10);
+-                     if (strlcat (p, "bye", 0) != 3)
+-                       return 1;
+-                     return 0;
+-                   }''',
+-                name : 'OpenBSD strlcpy/strlcat')
+-  if rres.compiled() and rres.returncode() == 0
++if cc.has_function('strlcpy')
++  if cc_can_run
++    rres = cc.run('''#include <stdlib.h>
++                    #include <string.h>
++                    int main() {
++                      char p[10];
++                      (void) strlcpy (p, "hi", 10);
++                      if (strlcat (p, "bye", 0) != 3)
++                        return 1;
++                      return 0;
++                    }''',
++                  name : 'OpenBSD strlcpy/strlcat')
++    if rres.compiled() and rres.returncode() == 0
++      glib_conf.set('HAVE_STRLCPY', 1)
++    endif
++  elif meson.get_cross_property('have_strlcpy', false)
+     glib_conf.set('HAVE_STRLCPY', 1)
+   endif
+-elif meson.get_cross_property('have_strlcpy', false)
+-  glib_conf.set('HAVE_STRLCPY', 1)
+ endif
+ 
+ python = import('python').find_installation('python3')
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index c872c749202..733a2d46d98 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
+           file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
            file://glib-meson.cross \
            "
 
-- 
2.11.0


