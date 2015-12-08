Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 17ABD60589
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:39 +0000 (UTC)
Received: by qgcc31 with SMTP id c31so9894628qgc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hsK96mX1HYWKUBxBCPO1llpqbhSu4D0/bTGTwF0IFcc=;
	b=dV3hV3ufyviuz/0yQo5fgVXlKFxscrjTOEA/it1p1Vm2LdJzttGZxDAftRLZeSZMr+
	7tJ/W01YpZaH21WLbOx4tFUyzhZul68lEC7uGgn8htZPp4igBV9qbF4A6qw7puJ8Fb67
	NuUuoUsd/XBUEgVBBCpl5DN6Jk9srN9FIHq6WPdOFJGANNOybtd5Z5lF1L5+HJhW5ryB
	rkdBIWZdkzv1Qm4G8c6dnA+IbQpUoj5KIxQuelGUZk2Ro7lpG2jwPc3DdFKLFTAgPcxR
	UCxZoUhy331koABly9Av+CQhhgWSzy/4e6hqrLTFTO3n2uTqJ8QtmdtndPrg0ydgeElq
	4csw==
X-Received: by 10.140.100.206 with SMTP id s72mr2554640qge.25.1449562360460;
	Tue, 08 Dec 2015 00:12:40 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:22 +0000
Message-Id: <8bdcb45960085af77049ce1ae20be77d2f65744e.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 02/13] autoconf: Add musl support
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:40 -0000

Support musl triplets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../autoconf/autoconf/add_musl_config.patch        | 26 ++++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch b/meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
new file mode 100644
index 0000000..a9094d2
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
@@ -0,0 +1,26 @@
+backport http://git.savannah.gnu.org/cgit/config.git/commit/config.sub?id=062587eaa891396c936555ae51f7e77eeb71a5fe
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+Index: autoconf-2.69/build-aux/config.sub
+===================================================================
+--- autoconf-2.69.orig/build-aux/config.sub
++++ autoconf-2.69/build-aux/config.sub
+@@ -123,7 +123,7 @@ esac
+ maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
+ case $maybe_os in
+   nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc | linux-newlib* | \
+-  linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
++  linux-musl* | linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
+   knetbsd*-gnu* | netbsd*-gnu* | \
+   kopensolaris*-gnu* | \
+   storm-chaos* | os2-emx* | rtmk-nova*)
+@@ -1360,7 +1360,7 @@ case $os in
+ 	      | -chorusos* | -chorusrdb* | -cegcc* \
+ 	      | -cygwin* | -msys* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
+ 	      | -mingw32* | -linux-gnu* | -linux-android* \
+-	      | -linux-newlib* | -linux-uclibc* \
++	      | -linux-newlib* | -linux-musl* | -linux-uclibc* \
+ 	      | -uxpv* | -beos* | -mpeix* | -udk* \
+ 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
+ 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 809007f..b9f6883 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://autoreconf-include.patch \
             file://remove-usr-local-lib-from-m4.patch \
             file://preferbash.patch \
             file://autotest-automake-result-format.patch \
+            file://add_musl_config.patch \
            "
 
 SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
-- 
2.6.3


