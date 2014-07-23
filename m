Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEBF7078D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:07:44 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so8564898wib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 15:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lnovM2AEVfD4UDX6bMOVc8/R4OoXLMP/y22WhVdbIDk=;
	b=M4gKYhD52HUpn85SdV++sbSKa+B9+aLFMPgE3Xh3UBzaHlTVWtgcXbZOLcnnEnVvDp
	Vc4bxyT4O3Z2jxxwjlfX6igr62i6OfiKzd9KjzaXrmKrjWf67KBiWU6jrbAQhUvfHT/x
	XRSkTczfsw5qg48oyBKhBgz8aaE6jV+XKA5F1IR5uwQ36BbLKCSoWZESERGGbgjQAXRr
	hudkIVct3gBIYEuQZ1z8IqEgRRaBKkyLPYm+gDU8I5IWG6UcZQcGM/VEbY+lD0qDKBuz
	hfnZ+nGUK7sp/8eTAt6h08j/gZrVdBCptLZEVZRc1CmE9esH1vYBddku4eHCGVi/a7NO
	TmSw==
X-Gm-Message-State: ALoCoQmM4zXIvJM5iKmiwRsXbP87cQzGwrB8RbDjXeXVPWCbccLV1ZwwoTCBQvXFSuWP0QtPLZoA
X-Received: by 10.180.72.98 with SMTP id c2mr3654254wiv.68.1406153265867;
	Wed, 23 Jul 2014 15:07:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ch5sm9833562wjb.18.2014.07.23.15.07.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 15:07:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 23:07:23 +0100
Message-Id: <1406153243-12346-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406153243-12346-1-git-send-email-ross.burton@intel.com>
References: <1406153243-12346-1-git-send-email-ross.burton@intel.com>
Subject: [RFC][PATCH 2/2] glib-2.0: use ptest-gnome
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
X-List-Received-Date: Wed, 23 Jul 2014 22:07:48 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2eda8a1..ce908cf 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -25,14 +25,13 @@ PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
-inherit autotools gettext gtk-doc pkgconfig ptest
+inherit autotools gettext gtk-doc pkgconfig ptest-gnome
 
 S = "${WORKDIR}/glib-${PV}"
 
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-man"
 
-PTEST_CONF = "${@bb.utils.contains('PTEST_ENABLED', '1', '--enable-installed-tests', '--disable-installed-tests', d)}"
-EXTRA_OECONF = "--enable-included-printf=no ${CORECONF} ${PTEST_CONF}"
+EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
 EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 EXTRA_OECONF_append_libc-uclibc = " --with-libiconv=gnu"
 
@@ -51,8 +50,6 @@ FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb \
 FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d \
                                ${datadir}/bash-completion"
-FILES_${PN}-ptest += "${libexecdir}/installed-tests \
-                      ${datadir}/installed-tests/glib"
 
 ARM_INSTRUCTION_SET = "arm"
 USE_NLS = "yes"
-- 
1.7.10.4


