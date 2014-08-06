Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8291A65E2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 20:38:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s76KcxBs014498
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Aug 2014 13:38:59 -0700 (PDT)
Received: from yow-pgortmak-d4.wrs.com (128.224.56.60) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 6 Aug 2014 13:38:59 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Aug 2014 16:38:35 -0400
Message-ID: <1407357515-6147-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] coreutils: drop patch that unconditionally mangles manpages
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
X-List-Received-Date: Wed, 06 Aug 2014 20:39:04 -0000
Content-Type: text/plain

commit 841ec528ec04e64bd09ff10f8d9ad2d6e3aac05d ("coreutils: update
to upstream version 9.21") added a patch which bypassed the check
for perl and hence defaults to using the dummy man page for all
of the coreutils manpages.  This results in all manpages looking like:

  NAME
       chmod - a GNU coreutils 8.22 program

  DESCRIPTION
       OOOPS!   Due to the lack of perl on the build system, we were unable to
       create a proper manual page for chmod.

It is unclear why the test was disabled, but since it clearly
causes the manpages to be useless, we need to drop this patch.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch b/meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch
deleted file mode 100644
index 4757f52aa0be..000000000000
--- a/meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd coreutils-8.21/man/local.mk coreutils-8.21/man/local.mk
---- coreutils-8.21/man/local.mk	2013-02-05 16:01:21.000000000 +0200
-+++ coreutils-8.21/man/local.mk	2013-03-23 09:12:53.360470192 +0200
-@@ -19,11 +19,11 @@
- EXTRA_DIST += man/help2man man/dummy-man
-
- ## Graceful degradation for systems lacking perl.
--if HAVE_PERL
--run_help2man = $(PERL) -- $(srcdir)/man/help2man
--else
-+#if HAVE_PERL
-+#run_help2man = $(PERL) -- $(srcdir)/man/help2man
-+#else
- run_help2man = $(SHELL) $(srcdir)/man/dummy-man
--endif
-+#endif
-
- man1_MANS = @man1_MANS@
- EXTRA_DIST += $(man1_MANS:.1=.x)
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index d5373ae9d66a..b19c1691eb10 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -14,7 +14,6 @@ inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://dummy_help2man.patch \
            file://fix-for-dummy-man-usage.patch \
           "
 
-- 
1.9.1


