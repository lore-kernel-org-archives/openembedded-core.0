Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcT-0000tx-J7
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584253"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:35 -0700
Message-Id: <4d114516ca92f29f258cbf7a99ff96ffff745323.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 08/14] meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:05 -0000

From: Robert Yang <liezhi.yang@windriver.com>

runqemu can't launch a target image on Fedora 16 64bit or Opensuse 12.1
64bit, this is because runqemu needs the host's libGL.so, which requires
GLIBC_2.14 which is defined in libc.so.6, but our default libc.so.6 is
version 2.13, here is the message from Richard:

The easiest solution would be to change the nativesdk libc to 2.15. I don't
think we plan to do this for the target libc for 1.2 but we could change
nativesdk's version if its well tested

[YOCTO #1968]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index b481163..3dc0932 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -44,9 +44,9 @@ PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_linux-libc-headers-nativesdk ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-locale            ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-nativesdk         ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-nativesdk         ?= "2.15"
 PREFERRED_VERSION_eglibc-initial           ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-initial-nativesdk ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-initial-nativesdk ?= "2.15"
 PREFERRED_VERSION_cross-localedef-native   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_uclibc                   ?= "${UCLIBCVERSION}"
 PREFERRED_VERSION_uclibc-initial           ?= "${UCLIBCVERSION}"
-- 
1.7.7.6



