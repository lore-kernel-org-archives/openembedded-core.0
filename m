Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B455707E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 01:49:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6O1nGP6005700
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Jul 2014 18:49:16 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 23 Jul 2014 18:49:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 09:48:58 +0800
Message-ID: <cover.1406166277.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] gcc-4.9.inc: fix parallel building failure
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
X-List-Received-Date: Thu, 24 Jul 2014 01:49:20 -0000
Content-Type: text/plain

Test Steps:

1. For reproducing the issue every time, manually modify
gcc/Makefile.in to delay the generation of config.h:
...
diff --git a/gcc/Makefile.in b/gcc/Makefile.in
index c4daf69..c502898 100644
--- gcc-4.9.0/gcc/Makefile.in
+++ gcc-4.9.0/gcc/Makefile.in
@@ -1622,9 +1622,12 @@ tm.h: cs-tm.h ; @true
 tm_p.h: cs-tm_p.h ; @true
 
 cs-config.h: Makefile
+   @echo "start to generate config.h `date`"
+   sleep 10
    TARGET_CPU_DEFAULT="" \
    HEADERS="$(host_xm_include_list)" DEFINES="$(host_xm_defines)" \
    $(SHELL) $(srcdir)/mkconfig.sh config.h
+   @echo "config.h generated `date`"
 
 cs-bconfig.h: Makefile
    TARGET_CPU_DEFAULT="" \
...

2. bitbake gcc-cross-arm

//Hongxu

The following changes since commit 1306f263ed7b3de4e85c6dc8b377e5c05afd6bf0:

  package_ipk.bbclass: Support hierarchical feed (2014-07-23 22:06:10 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-gcc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-gcc

Hongxu Jia (1):
  gcc-4.9.inc: fix parallel building failure

 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 ...Makefile.in-fix-parallel-building-failure.patch | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch

-- 
1.8.1.2


