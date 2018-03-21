Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 921B578984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:40:53 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t7so10936754wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lU48sTuvtOUOr9xhd7xiURuu1ZDgXyGjRTA3+pb+/xI=;
	b=ot24ZwNhR6vWA22DHljYoz0EwjiP8glMQCTUnNnXRpEoFe223GANwhppMxfKqIFdZ0
	vTdGn4CRWlUPKSpBF0SufSQ43twpc7yVaaqu/TUfOhYWoaXcuRfnx8EeOa2HmCoKrdZr
	g+PMk/Ka8gsBnIz2qg8oavebJfqtH037zBsSBqi2+zGUHf7BH8fjXpUDCOad4NZDyl1T
	u6/MHk90I/O6lAHiZdSEkj0i8oAJ2Kq6duEl9gy7epwe6i4sPqoUCVsaqr6x7qdDKVkK
	VrRR3WYaXn2DfZyXYY+BvHowk4yImUcz/KYVlqOgjXx+o8cR5JqlHZtjVqsb9KRkkxNf
	1plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lU48sTuvtOUOr9xhd7xiURuu1ZDgXyGjRTA3+pb+/xI=;
	b=hyHheMOiu3VdgUjJDhpFhfgVcZ1qPhN+HaONwjwih4rYaQAwwK5UliTRvIHT3WqTUZ
	j1rtO0jcUJTH1dbtwRyVnYWbL1MANLjfvK5uNCQ5IybGfAslIcRtYZqwrVsMSjFXKY/R
	qX89rdyoFzy6LhblDtYer/jMtWHPRLcQQT3gfnTxBMS8iBwS/PrmtVMt2xs4h/OVbqr7
	Olz0KFnxJwtIlH2QrZmjGUplEHRuOdZekZ5VibnlRqJwE43IEZqnjIvSLZFrErYr6ZUG
	WNA2/yNk265vlfKBkDauyyJxiAoNchZOU61yOzwU4E0CTpkQpxZUIw1citJv8rsC4gl/
	6UgA==
X-Gm-Message-State: AElRT7G5+akY6Nu8t0OuA5EG4ljXD/+dUIoAtS6HT8L5UMufbcgIvmdU
	kWrolEexRTNagLkjvtweIesfsjEp
X-Google-Smtp-Source: AG47ELv1odNS/2Pm29VBVrUOfEm+/EFdAJ2gZtrSnzQkbXmpRmraEJc4xD2Q9xZc9lxnPwooa4gSeQ==
X-Received: by 10.28.19.13 with SMTP id 13mr3458378wmt.89.1521650454004;
	Wed, 21 Mar 2018 09:40:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id x78sm8055164wmd.2.2018.03.21.09.40.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 09:40:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2018 16:40:51 +0000
Message-Id: <20180321164051.22869-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
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
X-List-Received-Date: Wed, 21 Mar 2018 16:40:53 -0000

In out-of-tree builds gtk-doc's setup-build target copies all the content from
$srcdir to $builddir. However, if some of this content is regenerated at
configure time this can happen:

1) configure writes new build/version.xml
2) make compile copies content, including the tarball's src/version.xml
   to build/version.xml, and generates gtk-doc.
3) make install notices build/version.xml is older than configure.status,
   so regenerates gtk-doc.

gtk-doc generation is a slow process at the best of times, so doing it twice
isn't good.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk-doc/files/no-clobber.patch | 27 +++++++++++++++++++++++
 meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb        |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk-doc/files/no-clobber.patch

diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
new file mode 100644
index 00000000000..b0a5dcade21
--- /dev/null
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -0,0 +1,27 @@
+In out-of-tree builds gtk-doc's setup-build target copies all the content from $srcdir to $builddir.
+
+However, if some of this content is regenerated at configure time this can happen:
+
+1) configure writes new build/version.xml
+2) make compile copies content, including the tarball's src/version.xml
+   to build/version.xml, and generates gtk-doc.
+3) make install notices build/version.xml is older than configure.status,
+   so regenerates gtk-doc.
+
+gtk-doc generation is a slow process at the best of times, so doing it twice isn't good.
+
+Solve this by changing cp --force to cp --no-clobber, so setup-build only copies
+files which don't already exist.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/gtk-doc.make b/gtk-doc.make
+index f87eaab..246f3c0 100644
+--- a/gtk-doc.make
++++ b/gtk-doc.make
+@@ -113,3 +113,3 @@ setup-build.stamp:
+ 	      test -f $(abs_srcdir)/$$file && \
+-	        cp -pf $(abs_srcdir)/$$file $(abs_builddir)/$$file || true; \
++	        cp -pn $(abs_srcdir)/$$file $(abs_builddir)/$$file || true; \
+ 	    done; \
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
index b907bae1478..45528111c13 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.27.bb
@@ -23,6 +23,7 @@ SRC_URI[archive.sha256sum] = "e26bd3f7080c749b1cb66c46c6bf8239e2f320a949964fb9c6
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
+           file://no-clobber.patch \
            "
 SRC_URI_append_class-native = " file://pkg-config-native.patch"
 
-- 
2.11.0


