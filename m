Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id DE42465D73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 15:01:34 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id w7so1044245qcr.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=sckAigY21jN5BRQYM84449ytU0cMpvxirESNtUu1Deo=;
	b=RDc5VUcNcSaZD9KM/ZrDvvI/TZHk5Q33iSS9r3NZgaaIO7wh3xJlZaH01lk8aA+4r8
	eB1Or73Oe38DuRlaNLN/zhl0YAyOsmxcb/YH9K0obBJNCB10OAJmPdlGt8lYS3WMa0AZ
	nRLCrt/8x0udth45E37VMGUjlero5UzVsGnWPQZ9cijUFg90zFp+GQU6upHYgXJVSmE9
	cbe35ipzPEHqo9vrVKBJJBM9xPHIRAXJNvc5eVys75/v5iMlS+u31QDtSMe/pfNePdRt
	RILl6x9MUDpPMwvgwHvXrbwMLVCQbp9bdpud/bwiF97Mg+oD96DX5JySpGXANISXTEGq
	GL0g==
MIME-Version: 1.0
X-Received: by 10.224.51.5 with SMTP id b5mr49628915qag.42.1398265289494; Wed,
	23 Apr 2014 08:01:29 -0700 (PDT)
Received: by 10.96.148.2 with HTTP; Wed, 23 Apr 2014 08:01:29 -0700 (PDT)
Date: Wed, 23 Apr 2014 09:01:29 -0600
Message-ID: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] systemd: fix tests when not using gold
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
X-List-Received-Date: Wed, 23 Apr 2014 15:01:35 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Explicitly mark the dummy function as externally visible
so that ld can find the symbol at link time. This is needed
when the DISTRO_FEATURE ld-is-gold is not enabled; systemd
uses -flto anyway.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/systemd/systemd/systemd-lto-fix.patch | 14 ++++++++++++++
 meta/recipes-core/systemd/systemd_211.bb                |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-lto-fix.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
new file mode 100644
index 0000000..90875e4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
@@ -0,0 +1,14 @@
+diff --git a/src/test/test-udev.c b/src/test/test-udev.c
+index b064744..3753c87 100644
+--- a/src/test/test-udev.c
++++ b/src/test/test-udev.c
+@@ -36,7 +36,8 @@
+ #include "udev.h"
+ #include "udev-util.h"
+
+-void udev_main_log(struct udev *udev, int priority,
++void __attribute__((externally_visible))
++     udev_main_log(struct udev *udev, int priority,
+                    const char *file, int line, const char *fn,
+                    const char *format, va_list args) {}
+
diff --git a/meta/recipes-core/systemd/systemd_211.bb
b/meta/recipes-core/systemd/systemd_211.bb
index df632ab..ddf89b8 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -23,6 +23,7 @@ PV = "211+git${SRCPV}"

 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git
\
            file://binfmt-install.patch \
+           file://systemd-lto-fix.patch \
            file://systemd-pam-configure-check-uclibc.patch \
            file://systemd-pam-fix-execvpe.patch \
            file://systemd-pam-fix-fallocate.patch \
-- 
1.9.0

