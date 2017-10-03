Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 57E3277CCC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 02:16:14 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i23so7461956pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 19:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=K4mrwoMmAmZ2L0cO+5HLOE5YQKaBZfwoyivFUap5phY=;
	b=f5z4NWS7gQDV8av0rOYM0D+eSgkSYvgRL2e+YUPpIfLKMk1CssFrD8/rcOGYeQyTI2
	R4kDVdWi1dlZLZdcm9JcIMJp2z024Az8C5pqYlg75WULkb84raGGd1cSoKC54XNz7l5f
	JLu5Fmm/zOqKoiYibkKp2Z9437Ts6iC/+I8QtsAWiUuzW26cLdGrWH5nm9U8zdDvCQDP
	IhJHbJZPupIoBDgoVzP8+d45N4RkBCVIkr/44eRyB9rZM4dAbdNpsNVkITmaIsbFzyiH
	XCUSS5/gCmUeRYNmxJFNbm8aKCl6Ea9XEK3D4YFedJBgE0OVM61aVwijRco9cWXlxcNx
	UZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K4mrwoMmAmZ2L0cO+5HLOE5YQKaBZfwoyivFUap5phY=;
	b=CkbgGfpov2beL0pDe/AZLjsI7BBLz1ujjmUVuf0D752rhZB7efnXq3Fd8FyoPXChey
	UKqmoMPKtUEJOGgJN/e+I9xfHiryory4vmi7VYLrkN7jGHs2+4nqUYX+HsOWsr/wo8lq
	kMYaHuR/COWIX+wAcnmHgCxQOgG6CngmS4OzSkMxT2J0dgW1X6nBp9NOwJ87D5seoGZ3
	nGMbn1yWtwVE6psB9uqGSslLdAYI+B9ovrYZfQgantkQmn2QBNytygL36IxuCj8c39Fk
	lpQmsVHLvtv8GVQ9WkYa1cCeNFnypeVZZXYSdWpxjrIXHo8AXa1bVGSC6iSqVGEF43JF
	qPqg==
X-Gm-Message-State: AMCzsaXxKS41QSNZa0Msqn7O0sLKEkJDTvs2mpFFJ4b1PC927BC/GOv+
	/a3VjrgshQ1ZHKQPy8UE6il/qQ==
X-Google-Smtp-Source: AOwi7QDpmhbDppsz9KgDrmFOenit0S8a5u4Ubb2b0iDvUK4vuo1WqhieEcBr8JJX/2/bagNEhXMJ2g==
X-Received: by 10.101.66.135 with SMTP id j7mr7162641pgp.410.1506996975337;
	Mon, 02 Oct 2017 19:16:15 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	20sm19427476pft.109.2017.10.02.19.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Oct 2017 19:16:14 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 19:16:00 -0700
Message-Id: <1506996960-17686-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506996960-17686-1-git-send-email-armccurdy@gmail.com>
References: <1506996960-17686-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
Subject: [morty][PATCH v2 2/2] coreutils_6.9: fix musl compilation
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
X-List-Received-Date: Tue, 03 Oct 2017 02:16:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

As per the patch

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

Cherry-pick from meta-gplv2:

  http://git.yoctoproject.org/cgit/cgit.cgi/meta-gplv2/commit/?id=e42ded0ee35d0aab0de8fa090eda9f1c08bcbb4c

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...-need-charset.alias-when-building-for-mus.patch | 46 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch

diff --git a/meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch b/meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch
new file mode 100644
index 0000000..d661e59
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-6.9/build-don-t-need-charset.alias-when-building-for-mus.patch
@@ -0,0 +1,46 @@
+From 542811eecc05c6c43590bde3852598aa6277abf3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Thu, 23 Mar 2017 12:46:07 +0000
+Subject: [PATCH] build: don't need charset.alias when building for musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [required for coreutils 6.9 (GPLv2) recipe only]
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ lib/gnulib.mk | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e833d14..04b2b74 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -907,7 +907,11 @@ all-local: charset.alias ref-add.sed ref-del.sed
+ charset_alias = $(DESTDIR)$(libdir)/charset.alias
+ charset_tmp = $(DESTDIR)$(libdir)/charset.tmp
+ install-exec-local: all-local
+-	test $(GLIBC21) != no || $(mkinstalldirs) $(DESTDIR)$(libdir)
++	case '$(host_os)' in \
++	    linux-musl*) \
++	      : ;;\
++	    *) \
++	test $(GLIBC21) != no || $(mkinstalldirs) $(DESTDIR)$(libdir) ;\
+ 	if test -f $(charset_alias); then \
+ 	  sed -f ref-add.sed $(charset_alias) > $(charset_tmp) ; \
+ 	  $(INSTALL_DATA) $(charset_tmp) $(charset_alias) ; \
+@@ -918,7 +922,8 @@ install-exec-local: all-local
+ 	    $(INSTALL_DATA) $(charset_tmp) $(charset_alias) ; \
+ 	    rm -f $(charset_tmp) ; \
+ 	  fi ; \
+-	fi
++	fi ;\
++	esac
+ 
+ uninstall-local: all-local
+ 	if test -f $(charset_alias); then \
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 6bcf8de..d04edd8 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -27,6 +27,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://fix_for_manpage_building.patch \
            file://loadavg.patch \
            file://no-man.patch \
+           file://build-don-t-need-charset.alias-when-building-for-mus.patch \
            "
 
 SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
-- 
1.9.1


