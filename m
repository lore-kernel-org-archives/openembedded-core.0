Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3C42873DA7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 20:06:53 +0000 (UTC)
Received: by wifm2 with SMTP id m2so99903305wif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 13:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OSeuMml2tJOpf9tZrSCJPLvyvO8v4P1sWCbFtGKMRRQ=;
	b=Q2eVxdX+nMQj94WfDzd5OTldS5BC/Nhv3vG0zUqngVXKcEZZ27x0z9wavJ6qh/qqKP
	Kw0VjHaJSafTIibFT8ufqByh/rqcGvi4ftduwPa9UpLA9yhdGPGoAkRop20J/EPG8CuV
	mczD827xdkXWCHuV/BrP1uVl5bYhDjy6qpfroLVj+f28EwIMOW8Q75A+/gZj+3PP7IiU
	PVfyiCx4HP0hG6AtXJEBsAJYMDrHAxxcOsrgBXpMdy/taU9lPLD0IgvAN3dvng1gM7vR
	tcAunl0VDy/tUJtLkzl8e1FyAO3ENhWANkO82JW4PxXswLEBLxin0FbYfJGIW3ZNZX17
	iasg==
X-Gm-Message-State: ALoCoQkozXrWByonEORFk845llF63YFA0M7MRJjNXreW4G+3HqIy/LvSdEdbjsRlVUelIYG+tsa0
X-Received: by 10.180.77.233 with SMTP id v9mr77714090wiw.87.1436386013428;
	Wed, 08 Jul 2015 13:06:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	di7sm4533761wib.23.2015.07.08.13.06.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jul 2015 13:06:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 21:01:23 +0100
Message-Id: <1436385683-16945-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2] intltool: Upgrade 0.50.2 -> 0.51.0
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
X-List-Received-Date: Wed, 08 Jul 2015 20:06:56 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

* Remove uclibc.patch as the whole localedir guessing code has been
  removed upstream.

* Add patch to fix deprecation warnings (and the resulting broken install paths)
  when using Perl 5.22 (RB)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../intltool/intltool-0.50.2/uclibc.patch          | 19 --------
 .../intltool-nowarn.patch                          |  0
 .../noperlcheck.patch                              |  0
 .../intltool/intltool/perl-522-deprecations.patch  | 55 ++++++++++++++++++++++
 .../remove-xml-check.patch                         |  0
 .../use-nativeperl.patch                           |  0
 .../{intltool_0.50.2.bb => intltool_0.51.0.bb}     |  6 +--
 7 files changed, 58 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/intltool-nowarn.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/noperlcheck.patch (100%)
 create mode 100644 meta/recipes-devtools/intltool/intltool/perl-522-deprecations.patch
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/remove-xml-check.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/use-nativeperl.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool_0.50.2.bb => intltool_0.51.0.bb} (74%)

diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch b/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
deleted file mode 100644
index 145c181..0000000
--- a/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-on uclibc systems localedir should point to /usr/'share' as usual.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: intltool-0.50.2/intltool.m4
-===================================================================
---- intltool-0.50.2.orig/intltool.m4	2014-03-15 22:09:01.016627665 -0700
-+++ intltool-0.50.2/intltool.m4	2014-03-15 22:12:09.732631206 -0700
-@@ -173,6 +173,9 @@
-     AC_CHECK_FUNC(bind_textdomain_codeset,
-       [DATADIRNAME=share], [DATADIRNAME=lib])
-     ;;
-+    *-*-*uclibc*)
-+    [DATADIRNAME=share]
-+    ;;
-     *)
-     [DATADIRNAME=lib]
-     ;;
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/intltool-nowarn.patch b/meta/recipes-devtools/intltool/intltool/intltool-nowarn.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.2/intltool-nowarn.patch
rename to meta/recipes-devtools/intltool/intltool/intltool-nowarn.patch
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/noperlcheck.patch b/meta/recipes-devtools/intltool/intltool/noperlcheck.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.2/noperlcheck.patch
rename to meta/recipes-devtools/intltool/intltool/noperlcheck.patch
diff --git a/meta/recipes-devtools/intltool/intltool/perl-522-deprecations.patch b/meta/recipes-devtools/intltool/intltool/perl-522-deprecations.patch
new file mode 100644
index 0000000..eb52172
--- /dev/null
+++ b/meta/recipes-devtools/intltool/intltool/perl-522-deprecations.patch
@@ -0,0 +1,55 @@
+Perl 5.22 has deprecated some regex features, which causes warnings when
+intltool-update runs:
+
+Unescaped left brace in regex is deprecated, passed through in regex; marked by
+<-- HERE in m/^(.*)\${ <-- HERE ?([A-Z_]+)}?(.*)$/ at
+/data/poky-master/tmp/sysroots/x86_64-linux/usr/bin/intltool-update line 1065.
+
+Take a patch from Debian to solve this.
+
+Upstream-Status: Submitted (https://bugs.launchpad.net/intltool/+bug/1465010)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- intltool-0.51.0-ORIG/intltool-update.in	2015-05-27 00:20:43.038379963 +0200
++++ intltool-0.51.0/intltool-update.in	2015-05-27 00:23:53.309078052 +0200
+@@ -1062,7 +1062,7 @@
+ 	}
+     }
+ 
+-    if ($str =~ /^(.*)\${?([A-Z_]+)}?(.*)$/)
++    if ($str =~ /^(.*)\$\{?([A-Z_]+)\}?(.*)$/)
+     {
+ 	my $rest = $3;
+ 	my $untouched = $1;
+@@ -1190,10 +1190,10 @@
+ 	$name    =~ s/\(+$//g;
+ 	$version =~ s/\(+$//g;
+ 
+-	$varhash{"PACKAGE_NAME"} = $name if (not $name =~ /\${?AC_PACKAGE_NAME}?/);
+-	$varhash{"PACKAGE"} = $name if (not $name =~ /\${?PACKAGE}?/);
+-	$varhash{"PACKAGE_VERSION"} = $version if (not $name =~ /\${?AC_PACKAGE_VERSION}?/);
+-	$varhash{"VERSION"} = $version if (not $name =~ /\${?VERSION}?/);
++	$varhash{"PACKAGE_NAME"} = $name if (not $name =~ /\$\{?AC_PACKAGE_NAME\}?/);
++	$varhash{"PACKAGE"} = $name if (not $name =~ /\$\{?PACKAGE\}?/);
++	$varhash{"PACKAGE_VERSION"} = $version if (not $name =~ /\$\{?AC_PACKAGE_VERSION\}?/);
++	$varhash{"VERSION"} = $version if (not $name =~ /\$\{?VERSION\}?/);
+     }
+ 
+     if ($conf_source =~ /^AC_INIT\(([^,\)]+),([^,\)]+)[,]?([^,\)]+)?/m)
+@@ -1219,11 +1219,11 @@
+ 	$version =~ s/\(+$//g;
+         $bugurl  =~ s/\(+$//g if (defined $bugurl);
+ 
+-	$varhash{"PACKAGE_NAME"} = $name if (not $name =~ /\${?AC_PACKAGE_NAME}?/);
+-	$varhash{"PACKAGE"} = $name if (not $name =~ /\${?PACKAGE}?/);
+-	$varhash{"PACKAGE_VERSION"} = $version if (not $name =~ /\${?AC_PACKAGE_VERSION}?/);
+-	$varhash{"VERSION"} = $version if (not $name =~ /\${?VERSION}?/);
+-        $varhash{"PACKAGE_BUGREPORT"} = $bugurl if (defined $bugurl and not $bugurl =~ /\${?\w+}?/);
++	$varhash{"PACKAGE_NAME"} = $name if (not $name =~ /\$\{?AC_PACKAGE_NAME\}?/);
++	$varhash{"PACKAGE"} = $name if (not $name =~ /\$\{?PACKAGE\}?/);
++	$varhash{"PACKAGE_VERSION"} = $version if (not $name =~ /\$\{?AC_PACKAGE_VERSION\}?/);
++	$varhash{"VERSION"} = $version if (not $name =~ /\$\{?VERSION\}?/);
++        $varhash{"PACKAGE_BUGREPORT"} = $bugurl if (defined $bugurl and not $bugurl =~ /\$\{?\w+\}?/);
+     }
+ 
+     # \s makes this not work, why?
\ No newline at end of file
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool/remove-xml-check.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.2/remove-xml-check.patch
rename to meta/recipes-devtools/intltool/intltool/remove-xml-check.patch
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/use-nativeperl.patch b/meta/recipes-devtools/intltool/intltool/use-nativeperl.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.2/use-nativeperl.patch
rename to meta/recipes-devtools/intltool/intltool/use-nativeperl.patch
diff --git a/meta/recipes-devtools/intltool/intltool_0.50.2.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
similarity index 74%
rename from meta/recipes-devtools/intltool/intltool_0.50.2.bb
rename to meta/recipes-devtools/intltool/intltool_0.51.0.bb
index 483239d..d520d43 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.2.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI += "file://intltool-nowarn.patch \
-           file://uclibc.patch \
+            file://perl-522-deprecations.patch \
            ${NATIVEPATCHES} \
            "
 
@@ -15,5 +15,5 @@ NATIVEPATCHES = "file://noperlcheck.patch \
                  file://remove-xml-check.patch"
 NATIVEPATCHES_class-native = "file://use-nativeperl.patch" 
 
-SRC_URI[md5sum] = "23fbd879118253cb99aeac067da5f591"
-SRC_URI[sha256sum] = "67f25c5c6fb71d095793a7f895b245e65e829e8bde68c6c8b4c912144ff34406"
+SRC_URI[md5sum] = "12e517cac2b57a0121cda351570f1e63"
+SRC_URI[sha256sum] = "67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
-- 
2.1.4


