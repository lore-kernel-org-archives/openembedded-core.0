Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E00C2D0D1
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.16479.1718787605407247632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRKy9QXz;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4218008c613so48551005e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787604; x=1719392404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEfillKjX83+nGsyRCONQq1I/fn967HUa4cfman2ZaU=;
        b=NRKy9QXz12Bep486aMa4CT7ZL5OxON/9CpM6AN0Aa6CFlodhhvdeo+2cMxqV9KaOWi
         Y2PaiPaDhOGCsbvN5UjlBuJYSFizvA0hpIfSj1JRTONytGYJ/Uzgtu4NyxQrmFffriyc
         +Pjj+LHn/b3ms/Mu2a+a1vgxoOQnKjTPNHRCmFsc2ihE/RFRPmXYwj3zivLUMS98AyQv
         trAZ8V63jBnzsZ1OjvO1ONUoNA3y/tGjx+uao7Y94A0TCWzGY0QlCogpS/eg+hfqEGMx
         M2q5NR8CKwEkuQk67yTLMlRbtinNLry4Xu+fDyWhZpALs1CnRdRI7F5sW2U45lX2N/Bm
         qrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787604; x=1719392404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEfillKjX83+nGsyRCONQq1I/fn967HUa4cfman2ZaU=;
        b=NxQ4vlbD5vcf92TZ06s0iTRQb1oZOrBHK47U3ha5L+wQkabVar7ZAFTVr0BpCuxl1d
         0w1CUXTKTZmux/Yan9ck0MvZFdOog+drTXmggW72zN1Ay84l9Jytl7sM3nc+5yJqjD10
         CaNiskck0t49J260rrs9qTrMzl8X4EvmqhGYzkpm0GMQ0LlK5ISmqY7xjpXISCgx2YTO
         EXe2j/BHiAQsEr9YfAH6w1DWsGmqF/SAxJ6Qvukz1Stsu7fY44KvkasT1XNGx9YCVhEJ
         3J3wvTGLluIr0rpbIy+ZHTCDhuyZOJqb24chasVnfdYQCaBU9+ixXQHfii0V5B9L6dUz
         sfPw==
X-Gm-Message-State: AOJu0YxCizrjNQcrR2LG8i8VPsjqXbgsWdxz1vY2ktnd6/LKgNTtrjkj
	aBs3xO0TqGjmNq7koGuFmxWiu18r2tmPfUGpDFhueTWcw9VXlbBNRO5dzw==
X-Google-Smtp-Source: AGHT+IEA+n/sq0XYTvz8Iy5vxjkkwSL2BAmALXYu+6UJrcs2OFSHUj6KzNBB8xtzVq6VMhIxqHoxiA==
X-Received: by 2002:a05:600c:4baa:b0:424:761f:edbb with SMTP id 5b1f17b1804b1-424761fef16mr10235305e9.31.1718787603761;
        Wed, 19 Jun 2024 02:00:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/15] psmisc: merge .inc into .bb
Date: Wed, 19 Jun 2024 10:59:47 +0200
Message-Id: <20240619085957.2787700-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200891

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/psmisc/psmisc.inc     | 59 --------------------
 meta/recipes-extended/psmisc/psmisc_23.7.bb | 60 ++++++++++++++++++++-
 2 files changed, 59 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-extended/psmisc/psmisc.inc

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
deleted file mode 100644
index 23e98d21bed..00000000000
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ /dev/null
@@ -1,59 +0,0 @@
-SUMMARY = "Utilities for managing processes on your system"
-HOMEPAGE = "http://psmisc.sf.net/"
-DESCRIPTION = "The psmisc package contains utilities for managing processes on your \
-system: pstree, killall and fuser.  The pstree command displays a tree \
-structure of all of the running processes on your system.  The killall \
-command sends a specified signal (SIGTERM if nothing is specified) to \
-processes identified by name.  The fuser command identifies the PIDs \
-of processes that are using specified files or filesystems."
-SECTION = "base"
-DEPENDS = "ncurses virtual/libintl"
-LICENSE = "GPL-2.0-only"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
-
-S = "${WORKDIR}/psmisc-${PV}"
-
-inherit autotools gettext
-
-# Upstream has a custom autogen.sh which invokes po/update-potfiles as they 
-# don't ship a po/POTFILES.in (which is silly).  Without that file gettext 
-# doesn't believe po/ is a gettext directory and won't generate po/Makefile.
-do_configure:prepend() {
-    ( cd ${S} && po/update-potfiles )
-}
-
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
-
-ALLOW_EMPTY:${PN} = "1"
-
-PACKAGES =+ "fuser fuser-doc killall killall-doc pstree pstree-doc"
-PACKAGES += "psmisc-extras"
-
-FILES:${PN} = ""
-RDEPENDS:${PN} = "fuser killall pstree"
-
-FILES:fuser = "${bindir}/fuser.${BPN}"
-FILES:fuser-doc = "${mandir}/man1/fuser*"
-
-FILES:killall = "${bindir}/killall.${BPN}"
-FILES:killall-doc = "${mandir}/man1/killall*"
-
-FILES:pstree = "${bindir}/pstree"
-FILES:pstree-doc = "${mandir}/man1/pstree*"
-
-FILES:psmisc-extras = "${bindir}"
-FILES:psmisc-extras-doc = "${mandir}"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "90"
-
-ALTERNATIVE:killall = "killall"
-
-ALTERNATIVE:fuser = "fuser"
-
-ALTERNATIVE:pstree = "pstree"
diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index ea272cd92d5..e1dde7dafb4 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -1,4 +1,62 @@
-require psmisc.inc
+SUMMARY = "Utilities for managing processes on your system"
+HOMEPAGE = "http://psmisc.sf.net/"
+DESCRIPTION = "The psmisc package contains utilities for managing processes on your \
+system: pstree, killall and fuser.  The pstree command displays a tree \
+structure of all of the running processes on your system.  The killall \
+command sends a specified signal (SIGTERM if nothing is specified) to \
+processes identified by name.  The fuser command identifies the PIDs \
+of processes that are using specified files or filesystems."
+SECTION = "base"
+DEPENDS = "ncurses virtual/libintl"
+LICENSE = "GPL-2.0-only"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
+
+S = "${WORKDIR}/psmisc-${PV}"
+
+inherit autotools gettext
+
+# Upstream has a custom autogen.sh which invokes po/update-potfiles as they 
+# don't ship a po/POTFILES.in (which is silly).  Without that file gettext 
+# doesn't believe po/ is a gettext directory and won't generate po/Makefile.
+do_configure:prepend() {
+    ( cd ${S} && po/update-potfiles )
+}
+
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+
+ALLOW_EMPTY:${PN} = "1"
+
+PACKAGES =+ "fuser fuser-doc killall killall-doc pstree pstree-doc"
+PACKAGES += "psmisc-extras"
+
+FILES:${PN} = ""
+RDEPENDS:${PN} = "fuser killall pstree"
+
+FILES:fuser = "${bindir}/fuser.${BPN}"
+FILES:fuser-doc = "${mandir}/man1/fuser*"
+
+FILES:killall = "${bindir}/killall.${BPN}"
+FILES:killall-doc = "${mandir}/man1/killall*"
+
+FILES:pstree = "${bindir}/pstree"
+FILES:pstree-doc = "${mandir}/man1/pstree*"
+
+FILES:psmisc-extras = "${bindir}"
+FILES:psmisc-extras-doc = "${mandir}"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "90"
+
+ALTERNATIVE:killall = "killall"
+
+ALTERNATIVE:fuser = "fuser"
+
+ALTERNATIVE:pstree = "pstree"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-- 
2.39.2


