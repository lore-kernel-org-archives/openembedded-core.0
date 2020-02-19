Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6E4613BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:23:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z3so1033346wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 07:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1hyIWcDC5HuMfpvuDYKjDheKEfoibW8ueF/zwUNSJPQ=;
	b=LdQb8sO7bld9ilIvGWX/lwSTgvfkcXWwkvzW4qSwBnuM8phrJJZQZSVb2Put4BHX2D
	0Te5OtE6+GU92LsVtHsNxyxfrBh9+K2lIqH7J80I++waAGduRybxLN+3cHtO04bA2tIH
	5UFMbrsFU9FTGUefeVi49Rm2plGNCFkhNpnpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1hyIWcDC5HuMfpvuDYKjDheKEfoibW8ueF/zwUNSJPQ=;
	b=juAscKJr3vylzPxR6yvrSfeRx8byqbk8HqnhCkDU+kNyGqsYC+AfBsZy7NBxMdEwzm
	8+2XDCxgpVIp1B0jOR7iW6lQaeVTZZuVoUweLnKYzaoHHT9eJSVQk1fF1Gqp8k8hLcfg
	TAkLI1pvkzYnaYJvgmVHuHYhy50BszEcpYzvbNyHkgdsIktjKIbYWbHfr3Oyc4Nc0ziX
	teOoLTkvGOxjXMgWwj0mbr+OhFsCWo2M+naV8bTQjTB7fPBQXfkGG3f5q/uCYsoMO5F/
	oKmPdDRxr/C7qi2kG4us6HxDtBqcB4TN+8da3R3efwJM5NLUwKwjH0oEiiou3sJXmLcD
	EX8Q==
X-Gm-Message-State: APjAAAWSMztGj3DKPrK7xXs5gUJR05Jz85O4Q9xVp1pmyZYqzksrnrIB
	Tf0wF4Vz8MJr1t/yubDw7PMND83O9DA=
X-Google-Smtp-Source: APXvYqy5AXtvdR/yHr7crSHQsZTQ1dHg8r15RtZVkkR8N6CLWEbtZC2D/08oANs0IrloAHBQoS96Cg==
X-Received: by 2002:adf:f886:: with SMTP id u6mr37184406wrp.409.1582125837338; 
	Wed, 19 Feb 2020 07:23:57 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n8sm120207wrx.42.2020.02.19.07.23.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 07:23:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 15:23:55 +0000
Message-Id: <20200219152355.123718-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] gstreamer: Fix reproducibility issue around libcap
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
X-List-Received-Date: Wed, 19 Feb 2020 15:23:57 -0000
Content-Transfer-Encoding: 8bit

Add an option to avoid builds depending on the presence of setcap
from the host system.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gstreamer/gstreamer1.0/capfix.patch       | 37 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.1.bb          |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
new file mode 100644
index 00000000000..7ca3d5ad4a6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
@@ -0,0 +1,37 @@
+Currently gstreamer configuration depends on whether setcap is found on the host
+system. Turn this into a configure option to make builds deterinistic.
+
+RP 2020/2/19
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
+===================================================================
+--- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
++++ gstreamer-1.16.1/libs/gst/helpers/meson.build
+@@ -73,7 +73,12 @@ if have_ptp
+     endif
+   endif
+ 
+-  setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
++  setcap_feature = get_option('setcap')
++  if setcap_feature.disabled()
++    setcap = find_program('dontexist', required : false)
++  else
++    setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
++  endif
+ 
+   # user/group to change to in gst-ptp-helper
+   ptp_helper_setuid_user = get_option('ptp-helper-setuid-user')
+Index: gstreamer-1.16.1/meson_options.txt
+===================================================================
+--- gstreamer-1.16.1.orig/meson_options.txt
++++ gstreamer-1.16.1/meson_options.txt
+@@ -26,6 +26,7 @@ option('libunwind', type : 'feature', va
+ option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to generate better backtraces from libunwind')
+ option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
+ option('bash-completion', type : 'feature', value : 'auto', description : 'Install bash completion files')
++option('setcap', type : 'feature', value : 'auto', description : 'Use setcap')
+ 
+ # Common feature options
+ option('examples', type : 'feature', value : 'auto', yield : true)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index 6b8a5a0eb01..68f5ca649fe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
+    file://capfix.patch \
 "
 SRC_URI[md5sum] = "c505fb818b36988daaa846e9e63eabe8"
 SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d"
@@ -39,6 +40,7 @@ PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
 PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
 PACKAGECONFIG[tools] = "-Dtools=enabled,-Dtools=disabled"
+PACKAGECONFIG[setcap] = "-Dsetcap=enabled,-Dsetcap=disabled,libcap"
 
 # TODO: put this in a gettext.bbclass patch
 def gettext_oemeson(d):
-- 
2.25.0


