Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C4A617018D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 02:02:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6T22Ptb028009
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 19:02:25 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 19:02:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jul 2014 10:02:01 +0800
Message-ID: <cover.1406598828.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V3 0/1] gcc-4.9.inc: fix parallel building failure
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
X-List-Received-Date: Tue, 29 Jul 2014 02:02:27 -0000
Content-Type: text/plain

Changed in V3:

Rebase it against master as we have already
merged the first version.

Change in V2:

As the upstream of gcc suggested:
- The previous fix is too hack;
- Use '$(ALL_HOST_OBJS) : | $(generated_files)' rule to
  handle the dependency.

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

The following changes since commit addeef1dc91306175824b1f5587e40a22773cff4:

  lib/oe/rootfs: Improve error message whitespace (2014-07-28 12:21:24 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-gcc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-gcc

Hongxu Jia (1):
  gcc-4.9.inc: fix parallel building failure

 ...Makefile.in-fix-parallel-building-failure.patch | 79 ++++++++++++----------
 1 file changed, 42 insertions(+), 37 deletions(-)

-- 
1.8.1.2


