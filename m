Return-Path: <ross@burtonini.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 69D7960B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 17:32:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a6so3724548wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 09:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cQPYv/kpOShDiY1+XRKTWo/ntvH86USHKuc7ZNJ6T1I=;
	b=udPhYRkXuwGeyjBJ/wSjnIxSQbGuOPYLoctpWQr0UgxpgWoKqI/EZ316RS6N01Prw+
	eFjbw+YdQeaDW/HZOhHX+mO3lJlVrV30vC6PZb+pXSRygIA8rLEJ4Uv5uhHU5ALJC3BJ
	E67NJkRXidXEBGlWqqhGBf4+X2qi2BwQnpubDiXZEoNlOgKne54lUVP2MYp0x9XVE1nQ
	lBZiQWc8g01mb521qT+ZzAmqvuytEFeVeMJobW1hQEVjwJjWoCf8nn3yh06h/ep04YbB
	GrkS79z7C+3DCmu5wii21qTnNZxi86oDzrrwPr3v/ua1S/qI/bKbO1Tn1/AmyNR/DU5/
	spSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cQPYv/kpOShDiY1+XRKTWo/ntvH86USHKuc7ZNJ6T1I=;
	b=BRfDA4hWbXCVKSswM0jfMLC3Zdp2AF4/MgRYfklH13c3ibaargiwi/xtqtNkOKHrv5
	AGHBQiLMVqTPOVxjel7dCW2XXPWytSCR/2W4L4JJtMvcNZGOtYdGckWuKCXME457EqxU
	Gg1KGvu1dyqRQrppO/g4NMCmoi1gwt65FFKh6zKcB0DcQpdW8UYEqbtUxCSRpFGE9NMH
	SaAZUrOACweOFW02uqMYNZlenhiPCHwlS3KoShgG0XqdJ69AOO9a7d5/ek0SqgPHXCw2
	4Bg/+rwat2zpPZ2s+JMQ9IYAORo0+cP394fIca0wf7aELzP/4Xv6h7t56cOimCy5Iu95
	voZw==
X-Gm-Message-State: APjAAAXzS69jGgR/aEx7PzGVvSdjivizGSDTGsbfcYmaEdPweQePmRP/
	M93usMfePvxvLJRe1RTJ02tvZcSSI9ZlUQ==
X-Google-Smtp-Source: APXvYqwe1cW9Mk0khbMEr7bKK26pWXmTNomJ7XIwh8G8QANs6DIttVJ2h1eNaY4G8h7YJqWFSac03A==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr28957193wrm.24.1580923923803; 
	Wed, 05 Feb 2020 09:32:03 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a198sm310960wme.12.2020.02.05.09.32.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 09:32:03 -0800 (PST)
From: Ross Burton <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2020 17:32:01 +0000
Message-Id: <20200205173201.8669-1-ross@burtonini.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] gtk+3: sort resources for reproducible binaries
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
X-List-Received-Date: Wed, 05 Feb 2020 17:32:03 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

The list of resources is gathered with $(wildcard) in Make, which isn't
sorted. If this order changes then the generated libraries will differ.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gtk+/gtk+3/sort-resources.patch           | 19 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb      |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch b/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
new file mode 100644
index 00000000000..7f87372c52d
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
@@ -0,0 +1,19 @@
+If the resources file isn't sorted in some way then libgdk.so will differ
+depending on the inode order of the resource files.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/gdk/Makefile.am b/gdk/Makefile.am
+index e25b57ba50..26f2d57c6e 100644
+--- a/gdk/Makefile.am
++++ b/gdk/Makefile.am
+@@ -465,7 +465,7 @@ stamp-gc-h: $(top_builddir)/config.status
+ # Resources
+ #
+ 
+-glsl_sources := $(wildcard $(srcdir)/resources/glsl/*.glsl)
++glsl_sources := $(sort $(wildcard $(srcdir)/resources/glsl/*.glsl))
+ 
+ gdk.gresource.xml: Makefile.am
+ 	$(AM_V_GEN) echo "<?xml version='1.0' encoding='UTF-8'?>" > $@; \
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb
index 18976b54c5c..025d8870e23 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
+           file://sort-resources.patch \
           "
 SRC_URI[md5sum] = "f65515e7bfa2199bd2188e871d69c686"
 SRC_URI[sha256sum] = "4c775c38cf1e3c534ef0ca52ca6c7a890fe169981af66141c713e054e68930a9"
-- 
2.20.1


