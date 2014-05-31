Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBB66FD17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 May 2014 00:12:00 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x48so2642239wes.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 17:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rQ9N9I0RKtO0lMAHL3jERBA/wExrqgnafP0TJP9ZZVk=;
	b=is6dkz2f/ztTh9iriBQn9scAgKqJBcA2fLY6Ha0EBCxitv4pZv9ZblvhNoaGal1ObM
	zmJJEsAl+EiHmhOXARHMihZAaLWwatgn6biGOltsqfI63+3L0Xd+b9sTdvy2uExsvinC
	/M26jaYplfnpPHFPP2Nv5VYkyQq520iYzl3JBP0MhOpS3g6RipScxlmASOlevsFfCta+
	edlkSXyWHeo/P+z3YfIjmDHK0JO8VgaP4CTcoRG7sIgso41r4Zl2rPHx3/YX96xP7gpH
	eh3oJjBR0qT5GavGToa5lu1GFH8IVG/KVMy0aGIY9xFYliLnbCjnkZT9W2tfmdtpE140
	TGCQ==
X-Gm-Message-State: ALoCoQnlUORKjYRIMWWzBqJLGq+n86ojnqkv+MGBvp7s299Pv84tVW47wco6hnZPepKL8Ys/OXYK
X-Received: by 10.180.74.114 with SMTP id s18mr1135476wiv.37.1401495120910;
	Fri, 30 May 2014 17:12:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id c2sm13963166wja.18.2014.05.30.17.11.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 May 2014 17:12:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 May 2014 01:11:54 +0100
Message-Id: <1401495115-25542-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] lrzsz: fix autoheader warning due to missing AC_DEFINE template
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
X-List-Received-Date: Sat, 31 May 2014 00:12:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch |   19 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb             |    1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch
new file mode 100644
index 0000000..682cf41
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/acdefine.patch
@@ -0,0 +1,19 @@
+Add a description to the AC_DEFINE for LOCALEDIR so that it appears in config.h
+and silences a fatal warning.
+
+Upstream-Status:Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.in b/configure.in
+index c10460c..aa20263 100644
+--- a/configure.in
++++ b/configure.in
+@@ -258,7 +258,7 @@ AC_SUBST(LIBS)
+ 
+ AM_GNU_GETTEXT
+ 
+-AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME")
++AC_DEFINE_UNQUOTED(LOCALEDIR,"$prefix/$DATADIRNAME",[locale directory])
+ 
+ AC_OUTPUT([Makefile intl/Makefile lib/Makefile testsuite/Makefile  m4/Makefile \
+ man/Makefile po/Makefile.in src/Makefile debian/rules Specfile systype \
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 0147b3d..e0ce57d 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 	   file://autotools.patch \
 	   file://makefile.patch \
 	   file://gettext.patch \
+	   file://acdefine.patch \
 	   file://lrzsz_fix_for_automake-1.12.patch \
            file://lrzsz-check-locale.h.patch \
            "
-- 
1.7.10.4


