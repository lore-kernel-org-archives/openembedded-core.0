Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SHBtC-00021P-Va
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 12:32:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q39AMjBE028209
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 03:22:45 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 9 Apr 2012 03:22:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Apr 2012 18:22:32 +0800
Message-ID: <39c1bc8164acaa0d6f461bd8d614a7dbd30df22c.1333966697.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333966697.git.liezhi.yang@windriver.com>
References: <cover.1333966697.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64
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
X-List-Received-Date: Mon, 09 Apr 2012 10:32:03 -0000
Content-Type: text/plain

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
1.7.1



