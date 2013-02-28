Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UAxs3-0003Ul-Nf
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 08:25:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1S79GRk001968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 23:09:16 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Wed, 27 Feb 2013 23:09:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Feb 2013 15:09:12 +0800
Message-ID: <cover.1362033854.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH V3 0/2]fix native package compile error with gcc 4.3.4 on x86 host
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
X-List-Received-Date: Thu, 28 Feb 2013 07:25:46 -0000
Content-Type: text/plain

Change from V2: as Khem Raj suggested, use `-march=native' to cause the
compiler to auto-detect the architecture of the build computer, if the
auto-detect is unsuccessful the option has no effect.

When compile glib-2.0-native and qemu-native with with gcc 4.3.4 on x86 host ,it 
needs to add `-march' to CFLAGS, because the GCC needs this option to let the 
atomic operations ("lock free") be available.

It's a bad idea to modify bitbake.conf to add option -march to BUILD_CFLAGS,
because it's global and its side effect is unknown, such as beecrypt-native
do_compile will fail if we do that.

So it's best to test most of the native recipes to have a check about the 
similar problem and fix them separately. The glib-2.0-native and qemu-native
need to be fixed.

[YOCTO #3563]

The following changes since commit db3b539218e4ca9b348fe1338a50d91aced55c7f:

  lttng-ust: cannot find -llttng-ust-tracepoint (2013-02-26 08:02:28 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/glib-2.0-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/glib-2.0-native

Hongxu Jia (2):
  glib-2.0-native:fix do_configure failed with gcc 4.3.4 on x86 host
  qemu-native:fix do_compile failed with gcc 4.3.4 on x86 host

 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    6 ++++++
 meta/recipes-devtools/qemu/qemu.inc           |    6 ++++++
 2 files changed, 12 insertions(+)

-- 
1.7.10.4



