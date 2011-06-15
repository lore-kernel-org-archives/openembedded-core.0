Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QWjkP-00024E-JC
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 08:38:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5F6ZEjZ029069
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 23:35:14 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 14 Jun 2011 23:35:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jun 2011 14:33:42 +0800
Message-ID: <cover.1308108460.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/4 V2] Share gcc work directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2011 06:38:42 -0000
Content-Type: text/plain

Changes of V2:
1) Fix the Makefile.in to read the t-oe in ${B}/gcc/

2) Fix the confiure to read the defaults.in ${B}/gcc/

3) Now the only command that would modify ${S} is gnu-configize, but
   this is compatible, it would do nothing in the second run once
   config.sub and config.guess were installed to ${S}.

4  I have renamed ${S}/gcc/defaults.h during my testing to confirm that it
   really use the one in ${B}/gcc.

5) Here is the rough improvement data:

   gcc-cross, gcc-cross-initial and gcc-cross-intermediate will use the
   same ${S} and "do_fetch, do_unpack and do_patch", so:
   
   a) $ time bitbake gcc-cross -cpatch -f
      real    0m55.742s 

      so 55s * 2 = 110s will be saved.
   
   b) $ du -sh tmp/work-shared/gcc-4.6.0/
      795M    tmp/work-shared/gcc-4.6.0/
   
      so 795M * 2 = 1590M (about 1.5G) disk space will be saved.
   
   
      If we also build gcc-crosssdk, then all the 6 buildings will use
      the same ${S}, then:
   
      55s * 5(About 275s) will be saved.
   
      795M * 5 = 3975M(About 3.9G) disk space will be saved.



The following changes since commit 7aa7673459376aff911cef820c9417c998d1aa96:

  meta-yocto/linux-yocto: update to match the renamed linux-yocto recipes (2011-06-14 09:21:32 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/share_gcc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/share_gcc

Robert Yang (4):
  bitbake: share source directory
  Share gcc work directories
  gcc-4.5.1: share work directories
  gcc-4.6.0: share work directories

 bitbake/lib/bb/build.py                            |    4 +-
 bitbake/lib/bb/cache.py                            |    3 +
 bitbake/lib/bb/runqueue.py                         |   10 +++
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    1 +
 .../gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch   |   57 ++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    1 +
 .../gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch   |   80 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-common.inc           |   32 +++++++-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   34 ++++-----
 9 files changed, 199 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch



