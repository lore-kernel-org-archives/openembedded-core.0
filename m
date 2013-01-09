Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tsz5l-00087n-1i
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:05:34 +0100
Received: from mail-la0-f71.google.com ([209.85.215.71])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 08:50:15 -0800
Received: by mail-la0-f71.google.com with SMTP id fn20so1871101lab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 08:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=FODr4Ze+w6mHV+gROroG5LIiSo+5gv0kazRnLYIWfpk=;
	b=SIkQS0vWKSM03kWFpo9Jj72YQy8w+Lc15Y8zW2a48CEDtMlKXWbQzuWGKyu6zE17ik
	Nr5k4QzRV9pZnRfnEAEnlEn7ZtwhNRaDgqO9oyXa/f+kaqEl3QasgLbmzCmRor2is0dZ
	YRAf+B9XAU/G/PGrsQFAQOWbm+MG8N8GP0ETyQ8RmMwKToKH7JjUpaVSeeu9YTqyeKsk
	uwghJ/SwCnxSN5Sidi++0SxA6dLrjq8IQtAOAsyT6iva0fDIcSguvneokPz5uTPdI/R8
	me/GnWHAmFZjA4E9BdT50GDnSiFEWz1QV9/57T4H9vL1scaBLJcx2sbQKHUI3L8DHNVf
	Gfmw==
X-Received: by 10.194.77.13 with SMTP id o13mr109709635wjw.58.1357750213527;
	Wed, 09 Jan 2013 08:50:13 -0800 (PST)
X-Received: by 10.194.77.13 with SMTP id o13mr109708940wjw.58.1357750206680;
	Wed, 09 Jan 2013 08:50:06 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gz3sm4637422wib.2.2013.01.09.08.50.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Jan 2013 08:50:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 16:48:07 +0000
Message-Id: <89426bf8656ae89b397e6e0c77efd973e1cac1bd.1357749457.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357749457.git.ross.burton@intel.com>
References: <cover.1357749457.git.ross.burton@intel.com>
In-Reply-To: <cover.1357749457.git.ross.burton@intel.com>
References: <cover.1357749457.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmSWHs+8zDG/n9lw3Po39lTm5yQgMlJpKHvbHLje0Xx+viJgP3aeBpodQjjYiR40/2IP06emtPpsZYgdtYvf5UVdbqv0qih9ItJpiCKshzQr4yUgXtJdHzO7ROuTUKXMccGF62PyhnhpIOZ2SNsUBpyrYtymEI5xuZ73KGGxR+7PYy6KjMY8AGtWXQzMHTIOSRwButX
Subject: [PATCH 2/3] pkgconfig: add -native script that uses the native sysroot instead of target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 17:05:51 -0000

pkg-config-native is useful when building a package for the target that needs to
compile a build-time tool, to avoid having to hard-code many paths.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc                |   10 ++++++++++
 .../pkgconfig/pkgconfig/pkg-config-native.in                 |    7 +++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index c54e325..c4fa456 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -15,6 +15,7 @@ DEPENDS_class-nativesdk = ""
 SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz \
            file://autofoo.patch \
            file://glibconfig-sysdefs.h \
+           file://pkg-config-native.in \
            file://disable-legacy.patch"
 
 S = "${WORKDIR}/pkg-config-${PV}/"
@@ -43,3 +44,12 @@ FILES_${PN} += "${datadir}/aclocal/pkg.m4"
 # will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
 # specifying an appropriate provide.
 RPROVIDES_${PN} += "pkgconfig(pkg-config) (= ${PV})"
+
+# Install a pkg-config-native wrapper that will use the native sysroot instead
+# of the MACHINE sysroot, for using pkg-config when building native tools.
+do_install_append_class-native () {
+    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+}
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
new file mode 100644
index 0000000..5e44bb4
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -0,0 +1,7 @@
+#! /bin/sh
+
+PKG_CONFIG_PATH="@PATH_NATIVE@"
+PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+unset PKG_CONFIG_SYSROOT_DIR
+
+pkg-config "$@"
-- 
1.7.10.4



