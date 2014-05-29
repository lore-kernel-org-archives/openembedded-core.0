Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (unknown [209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id F2A886FC56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:58:26 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz1so12341130pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4J2FhLvsVePhHbfH/XK1Oj0myIApUYF7EmLqDCIYWY4=;
	b=O7IBN7FFTc6LeczItMXpl+l5TTAsSweKJcox2A/C+RZATLU0VNg11CnZoeVonRXGf7
	muvTPqxTERXXwWuAykbYdLo566YZ8ViKQ1lA7K47DNNCh6QkJd/ccMhI3pi0MP3zIFci
	Hbk7E3Arb7PZdv0fwiYHeI8L6X57D46sykERB/vxS7CGipEBqT4uWKViwo+n/rOA0dnu
	+nmpgaFzeHZ5DS7AFKJB4h2H2CunuoKaJg3/CPrFQ0ok3GuKz+FsrcIB2SI76Uh/XKwY
	5k+69ZCHJwuHR/RvB+vaCJ5GLZAGxlRqf/BklpJVULrdn8qr+0HqTfKTCZ4ILSDp9fnX
	ETIQ==
X-Received: by 10.68.161.101 with SMTP id xr5mr6074922pbb.168.1401346707856;
	Wed, 28 May 2014 23:58:27 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	sh5sm31748177pbc.21.2014.05.28.23.58.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:58:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:01:02 -0700
Message-Id: <738e1dfd8195afe1f70912a69283b9a35a5482d4.1401346650.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
References: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
In-Reply-To: <cover.1401346650.git.raj.khem@gmail.com>
References: <cover.1401346650.git.raj.khem@gmail.com>
Subject: [PATCH 2/7] tclibc-musl.inc: Add musl specific distro policy file
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
X-List-Received-Date: Thu, 29 May 2014 06:58:27 -0000

With this we could use TCLIBC=musl to switch to images
based on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/conf/distro/include/tclibc-musl.inc

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
new file mode 100644
index 0000000..d375d8d
--- /dev/null
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -0,0 +1,27 @@
+#
+# musl specific configuration
+#
+
+LIBCEXTENSION = "-musl"
+
+# Add uclibc overrides to the overrides.
+LIBCOVERRIDE = ":libc-musl"
+OVERRIDES .= "${LIBCOVERRIDE}"
+
+PREFERRED_PROVIDER_virtual/libc ?= "musl"
+PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
+PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
+PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
+PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
+
+USE_NLS ?= "no"
+
+CXXFLAGS += "-fvisibility-inlines-hidden"
+
+IMAGE_LINGUAS = ""
+
+LIBC_DEPENDENCIES = "\
+    musl \
+    musl-dbg \
+    musl-dev \
+    "
-- 
1.9.3


