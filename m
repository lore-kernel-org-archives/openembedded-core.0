Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id B23E86B4C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 11:09:41 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so4366823wgg.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 03:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pNKit7oHkfGr5ZxII+/PdAVwgEE1EXpifSK1zdn3SkE=;
	b=KmnfnrDTIUoHydxtxjlRdkuOuNPmy5+CZC1SgVY/lSFx355Az8MHELmX6JcPvrFS5a
	T/7J3GhK7ZZbf/G8byuqUJkWb5Kyflr62q6kl+8nbDoNZ1ZDhCCO6e74a9p/fI7KmsFx
	6fjbrEUIBRPwX/c8Xy86v4CZlGF3B4wWjG6HSCDbtpzesch/hu4InzcQu0Ahe5dg8PZP
	GYFu4UwAxbMlj7ejHK1JPirBHOhmoqLjz8fFHoyW7btS+FGpdaxx/XDr6OEQW/AZuevs
	NvhtElg7QcSndT4X9CMhlrDQXC29MJxnVo1cHGqIEdVBpXYPdbyAbHspCkVJfGVqYB4t
	mauQ==
X-Gm-Message-State: ALoCoQmiG2x3hR9qig22V+dFkcPHsmLHiPkO8dSSObbJTAOyaV+INfGoFCzsKlL/OXXjkjCmO+Si
X-Received: by 10.180.189.211 with SMTP id gk19mr1244371wic.29.1389956981926; 
	Fri, 17 Jan 2014 03:09:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hv3sm2633123wib.5.2014.01.17.03.09.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 03:09:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 11:09:32 +0000
Message-Id: <1389956972-18688-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V2] glib-2.0: add explicit build dependency on DBus when ptest is enabled
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
X-List-Received-Date: Fri, 17 Jan 2014 11:09:42 -0000

If the tests are enabled then configure will check for the presence DBus.  It's
generally present through the runtime dependencies so this often succeeds but as
it isn't a build dependency it's possible for DBus to be present at configure
time but removed at compile time, resulting in build failures.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7b471e7..33d30c1 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -16,8 +16,10 @@ SECTION = "libs"
 BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
+DEPENDS_append_class-target = "${@base_contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native"
 DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-libffi nativesdk-zlib ${BPN}-native"
+
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
 LEAD_SONAME = "libglib-2.0.*"
-- 
1.7.10.4


