Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 22CD67C6FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:32:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g3so997264wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=s/fjDwrh2NdRoUYhAMCpam9oC4FGK2BFm+YQHrmuBjw=;
	b=buDTuEXiNaSoKCDEn9F6bzuAXj3mPzBVv1A2LhjQ6yC06ys7nDyhqlzknT24sPxQ/J
	2L0gbb03CH0hCH7ksEuga+dK9nBQrawsm3krY3IWObJILKNuD8gzON/LQDHUrVO/uRPe
	s/hZDVSDfj7dzPkBnst6SV6QCeqAdGt0lUsE/KRO6WS7McK5yyHuoUkqh0ppkMtsS+h1
	phF4A6r8rv99cporfmt55OxrsRzRdk5DF2otzDkzmI70mBVzg3gLei/lEy+ArbZTDoBS
	5n6tSsjD1dCLa0nYgoifAq7LK12wvw1M97PocxoJaeSvWUHx0PGBrj8r1sWF1ZCohkzc
	wxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=s/fjDwrh2NdRoUYhAMCpam9oC4FGK2BFm+YQHrmuBjw=;
	b=FSidbg/r3un+OupXqncrxqJjuagk+0bFNDJqGk2yYgudWeXGLnHWahP4TCOq7VMFlK
	D41CeFLI//UzkjN5GfJ3wc6bgViCxOaOzKqAPK1TLIheaOXx71L+1V3TKDpRs3vn2MU7
	oYqT/l5e7ITnqu9R2PDaq2gKZgv5D4eNrOLBYWoeNwitYeTM+rXMI0xrfTG/j2k15i+n
	1/xpIDqaoSSYCoriPFhEj3r9ZXaotQYOgVBtv52hed9UoAR/cTFaIjvwYHZnY8aO5hB7
	rW/MK4nEH1jHqjSIQVSOSEoxf/++d6+ab9JR77EnUnozJ0EemfNW69e6ZG8j+cavFq6s
	ECow==
X-Gm-Message-State: APjAAAWb81cpVCZopxFGzACn/a+YduaGfLwINCg2omxgz3yWjKfkgQxM
	tgPbzcPDVSaiPHdAYMm/fFeFNxk6AOM=
X-Google-Smtp-Source: APXvYqwYJlVV/VoSsJTMQinIyqcRnOcFOh7B1omXUdfUWkaT7Dw8Fl3loY4VJX0SVtDlPUMSJxlzLw==
X-Received: by 2002:adf:b651:: with SMTP id i17mr2272152wre.108.1553171539578; 
	Thu, 21 Mar 2019 05:32:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u19sm5204107wmc.7.2019.03.21.05.32.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:32:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:32:17 +0000
Message-Id: <20190321123217.3366-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] meson: warn if the default value from meson.get_cross_property() is being used
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
X-List-Received-Date: Thu, 21 Mar 2019 12:32:19 -0000

Projects such as glib have tests that execute code to check their behaviour, and
in cross-compilation environments where they can't execute code fall back on
meson.get_cross_property() with a default value.  These default values may not
be appropriate: for example if glib can't verify that vsprintf() isn't broken it
assumes that it is, and embeds the gnulib copy of vsprintf() instead of using
glibc's implementation.

Add a warning whenever the default value for get_cross_property() is used so
that we can tell this is happening and set the value appropriately.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc              |  1 +
 .../meson/meson/cross-prop-default.patch           | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/cross-prop-default.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index d5d71c67b61..ca448b00a0c 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://cross-libdir.patch \
            file://0001-modules-windows-split-WINDRES-env-variable.patch \
            file://0002-environment.py-detect-windows-also-if-the-system-str.patch \
+           file://cross-prop-default.patch \
            "
 SRC_URI[sha256sum] = "ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd"
 SRC_URI[md5sum] = "0267b0871266056184c484792572c682"
diff --git a/meta/recipes-devtools/meson/meson/cross-prop-default.patch b/meta/recipes-devtools/meson/meson/cross-prop-default.patch
new file mode 100644
index 00000000000..772395e8791
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/cross-prop-default.patch
@@ -0,0 +1,23 @@
+meson.build files that use cc.run() in native builds can silently fallback to
+meson.get_cross_property() in cross builds without an exe-wrapper, but there's
+no way to know that this is happening.
+
+As the defaults may be pessimistic (for example, disabling the support for a
+feature that should be enabled) emit a warning when the default is used, so that
+the recipe can explicitly set the cross property as relevant.
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/5071]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/mesonbuild/interpreter.py b/mesonbuild/interpreter.py
+index 3c3cfae0..10e741ae 100644
+--- a/mesonbuild/interpreter.py
++++ b/mesonbuild/interpreter.py
+@@ -1890,6 +1890,7 @@ class MesonMain(InterpreterObject):
+             return props[propname]
+         except Exception:
+             if len(args) == 2:
++                mlog.warning('Cross property %s is using default value %s' % (propname, args[1]))
+                 return args[1]
+             raise InterpreterException('Unknown cross property: %s.' % propname)
+ 
-- 
2.11.0


