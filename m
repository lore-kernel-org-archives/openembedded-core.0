Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2122861FE4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:59:22 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so4362586wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 02:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=d2srFG8pW6mM9QQjNH33qXQGaBDvuADBR4aVy3UmT/Y=;
	b=NAlxoriV4M3yQtiJhCHPmiHa/OOz6pYYce3M4dvK7Zb5KRlWxXbxGeC8Ax/vBjrulg
	V/PzjUUsQ7RE+nVQG3c1fnwjezx5Jc+5fuw1ig/AmfCOHQRppo2560Cv4jTfBDP+4wnQ
	vngo4BqVRQ3XF4iaCH/iwPYGJpb31ML2aw3PkXo5mxHb9/vNcbQUVp/J0axQmzIbNy+s
	E13rcil/AbGmm3xq8O0QRsnbA7Vge/PUlDdWxmHp6Qt8wCqK+yDe6wJkLWlD+Xisq1uO
	dgOu6CDgKVaYl5iQFZwdRu/gEb/Vgr19lkfTbhCSmN76XYC9ODCK7+f46a6wWwK/4hed
	wVLQ==
X-Gm-Message-State: ALoCoQmPOj9SkdLUtFV5ragYHouM+cKFaqxwqOFozzq9Lzkv3/Nm5pFZxVxmMu6XtyupNZWDchO4
X-Received: by 10.180.211.161 with SMTP id nd1mr1918877wic.41.1389956362856;
	Fri, 17 Jan 2014 02:59:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id 12sm5284260wjm.10.2014.01.17.02.59.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 02:59:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 10:59:16 +0000
Message-Id: <1389956356-18435-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib-2.0: add explicit build dependency on DBus when ptest is enabled
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
X-List-Received-Date: Fri, 17 Jan 2014 10:59:23 -0000

If the tests are enabled then configure will check for the presence DBus.  It's
generally present through the runtime dependencies so this often succeeds but as
it isn't a build dependency it's possible for DBus to be present at configure
time but removed at compile time, resulting in build failures.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7b471e7..fe94767 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -16,8 +16,10 @@ SECTION = "libs"
 BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native"
 DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-libffi nativesdk-zlib ${BPN}-native"
+
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
 LEAD_SONAME = "libglib-2.0.*"
-- 
1.7.10.4


