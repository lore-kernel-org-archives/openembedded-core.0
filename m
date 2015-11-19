Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id B30946011A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:05 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so55416289qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hsK96mX1HYWKUBxBCPO1llpqbhSu4D0/bTGTwF0IFcc=;
	b=wFHNefW314b61IRchZql3p//B0xuhm1aeEEhVO/I0M8xhYXD309uNB0cp1YacoPOJF
	MWlnT5oSN9C9HtXPhRsGzW2tRkuwqBDQiogoFkpbuE09xyAlAKlivJLFAS9SEfeagJ94
	cc9nNl+cjvaAHvs124+4brg5J/Xbj7bwDEwOLs53RcLZdkEtgeAsS1zkUt95L9n7pBpV
	4nmqVptpk7IEsp9UDi0Hm00UEHCYNaHi229ouZM9plnO/jxBpvIE1v6NLZzqLwSxryUL
	A46k0o+MgxCCUeLKIUJW0qNfL3f5MTnDOUavQUVLARBEWV6O8iy3P6fHvVKSXYX91Gaf
	ogbQ==
X-Received: by 10.140.20.144 with SMTP id 16mr8326083qgj.45.1447953066123;
	Thu, 19 Nov 2015 09:11:06 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:49 +0000
Message-Id: <a77de24681018733fa12b38c38f1898da2c83447.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:06 -0000

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


