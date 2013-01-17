Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvkSk-0007pu-Lq
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 09:04:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0H7nGJp000163
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 23:49:16 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 16 Jan 2013 23:49:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 15:49:10 +0800
Message-ID: <cover.1358408649.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2]fix native package compile error with gcc 4.3.4 on x86 host
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 08:04:57 -0000
Content-Type: text/plain

Add an option `-march' to BUILD_CFLAGS, GCC 4.3.4 on x86 host needs this
option to let the atomic operations ("lock free") be available while it
is used to compile glib-2.0-native

It's a bad idea to modify bitbake.conf to add option -march to BUILD_CFLAGS,
because it's global and its side effect is unknown, such as beecrypt-native
do_compile will fail if we do that.

So it's best to test most of the native recipes to have a check about the
similar problem and fix them separately. The glib-2.0-native and qemu-native
need to be fixed.

[YOCTO #3563]

The following changes since commit 9f263a60e3521b800121a6f527a7b30dc9b62432:

  oprofile: add AArch64 support (2013-01-16 16:10:39 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/glib-2.0-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/glib-2.0-native

Hongxu Jia (2):
  glib-2.0-native:fix do_configure failed with gcc 4.3.4 on x86 host
  qemu-native:fix do_compile failed with gcc 4.3.4 on x86 host

 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    7 ++++++-
 meta/recipes-devtools/qemu/qemu.inc           |    5 +++++
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
1.7.10.4



