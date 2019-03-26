Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 131356011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 12:01:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id h18so12624995wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=583+lgY5CD7TlpjJRDI6/jmzBYbwlGLd2VjL+EZLYo0=;
	b=C1qIcJOn9rjo2KGV+ej7/mAkEx9uKM5NZO3cXQoMIqxJX+PpkI3w9zQjC18WhjamSF
	UQ/OFTMhXgnW+YTIknaS2NjKS3Ujdsx3Sq0/Ev1iYk6KBYAFKvxXFjHwgJXM8YhpjZK5
	qSJkzvCGqZEsp0O6HSjLvR5qbYnyJeIQCofogONDLnV6rzEc+BN0BDHBnyvPEF+3CPSl
	XSXkzmUQZHsDtmA05LUB0NMNRMAO4RvNC8MTr760bYp5Cwcku7emBwM8zubz5n9XPS9A
	v12EO7Sit9Pvcl3EVH5GRNB4FPr8mxjsGhZXjpHzwsLfVa/3IGEraQ0/uu7pPH7vZNIt
	zhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=583+lgY5CD7TlpjJRDI6/jmzBYbwlGLd2VjL+EZLYo0=;
	b=RPIuk8A/PZIWbXa3vPIGZZhdqZmqUSdC2zx/f7poymc88mRM0Pg1JeXle9NJ3+Cbnc
	KQx8pCbnWwDHnvmjEYzL2E3Ui6q5pZPq0lHIxLr8ALBKjK1BGatu9pH0aLU09EmDXRGz
	dDOU2PvQDaz/H0zVZUbMIUgeLPIemjo4yibxWdAg67W/4XUT9cj+zibEZ8ArV73A4er8
	dJhg71cMq2fLoCwO8woRrZTTecXmXFlHXVuD4fZISy2R5SLM06assQeVENReAh+pSIVG
	M2b9gCs/z81qUQ2O/0r3hec/2+3eQ55fHA6a4vwBPSqk2gRJkmBpQ8u6GScug+w6lh+t
	YNyQ==
X-Gm-Message-State: APjAAAUtiepcOAJuZwaRvf+wW3AWSGjcv2QMOHCw3YQzRFi3QB0O2e7+
	eR2o9+dwN+9/epWCpER8XSRGNgnfe3Q=
X-Google-Smtp-Source: APXvYqwRMeGYPhhoyZfSQPAmHKmTh83nsKoho46e9ZNM7KkDMJSAG58swaB+13y26rkuKYwVGoJakw==
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr8515387wmc.112.1553601720589; 
	Tue, 26 Mar 2019 05:02:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z20sm20630201wma.9.2019.03.26.05.01.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 05:01:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 12:01:57 +0000
Message-Id: <20190326120157.4397-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib: set glib-specific cross properties
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
X-List-Received-Date: Tue, 26 Mar 2019 12:02:00 -0000

GLib wants to execute code to identify several properties of the system, for
example is vsprintf() broken and what direction does the stack grow. In
cross-compiled environments these fallback to the default values which are not
always correct (our vsprintf() is fine, but the test assumes it isn't) so set
these properties explicitly.

Ideally this happens magically by meson.bbclass using the same logic as
siteinfo.bbclass, but we need to fix glib now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross | 6 ++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb        | 1 +
 meta/recipes-core/glib-2.0/glib.inc                  | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
new file mode 100644
index 00000000000..8420f9874e1
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
@@ -0,0 +1,6 @@
+[properties]
+have_c99_vsnprintf = true
+have_c99_snprintf = true
+have_unix98_printf = true
+va_val_copy = true
+growing_stack = false
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index 2de2affa51a..c872c749202 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
+           file://glib-meson.cross \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 6f0ec1ad2e9..574bb38557b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -53,6 +53,7 @@ PACKAGECONFIG[libelf] = ",,elfutils"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
 
 EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=false"
+EXTRA_OEMESON_append_class-target = " --cross-file ${WORKDIR}/glib-meson.cross"
 
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
2.11.0


