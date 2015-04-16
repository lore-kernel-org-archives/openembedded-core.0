Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8B04173D55
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 02:00:35 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so73369271pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TLnE26p0dU3c/mjQKQbPu1+OM9i38cOG+Utb3kU662s=;
	b=vBqwR7xWeCenut4gXeQO/wsX1aqeFrrze5t371ZggnFukcnGBSnAbsXYxoX3fAXJ/k
	lZJ7OG6CJOZINWx4havYh02KLGhC3rd24fVU/sig0XF+xvqYmpIIGjuYXrkoVxKMnUhi
	1vSrlRd8XBoiersb0spfRY6IdwELT4/oHIUd3SLBUqhnCsk0pq5RK8QabIgNgon6G1vU
	rCxtKiQbprhgFuzzs088CleqdDbRacfKfyLi9kza0Yi7cpf2m/e0yv9mXiQKRaUq6+K8
	ujoefWRGdig3oPJEGu7Dc+r05qfWRr5tbmSPnnNVX+F2TAkXAwhiQztTCNMo5XRbj8hX
	7AJw==
X-Received: by 10.70.29.4 with SMTP id f4mr41823566pdh.23.1429149636584;
	Wed, 15 Apr 2015 19:00:36 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	nt15sm5371563pdb.14.2015.04.15.19.00.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 19:00:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:00:19 -0700
Message-Id: <8ac8e1d307ce60290b9487375ba080b85f54d18c.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
References: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429149397.git.raj.khem@gmail.com>
References: <cover.1429149397.git.raj.khem@gmail.com>
Subject: [PATCH 02/10] coreutils: Add code to consider musl when selecting charsets
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
X-List-Received-Date: Thu, 16 Apr 2015 02:00:36 -0000

The real issue is in gnulib where it should be fixed
but gnulib gets imported in source into various components
and that may take a while. So lets fix the componnets versions
and as/if they land in new gnulib with a fix we can take
it off.

Change-Id: I63bbcb7bc4d92cb1ec74bb4f4f5109a377060253
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...need_charset_alias-when-building-for-musl.patch | 33 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.23.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.23/0001-Unset-need_charset_alias-when-building-for-musl.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.23/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-core/coreutils/coreutils-8.23/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..abdfa2a
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.23/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,33 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e1d74db..c0e92dd 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.23.bb b/meta/recipes-core/coreutils/coreutils_8.23.bb
index 63df75e..70c04a5 100644
--- a/meta/recipes-core/coreutils/coreutils_8.23.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.23.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://man-decouple-manpages-from-build.patch \
            file://remove-usr-local-lib-from-m4.patch \
            file://fix-selinux-flask.patch \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
 SRC_URI[tarball.md5sum] = "abed135279f87ad6762ce57ff6d89c41"
-- 
2.1.4


