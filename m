Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWxmP-000192-PQ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 00:42:13 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 00:31:58 +0200
Message-Id: <1337725918-16650-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] ppp: avoid host contamination
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
X-List-Received-Date: Tue, 22 May 2012 22:42:13 -0000

* Import patch from OE-Classic commit f7c547ede1bfc94c24f6315a23ff48a4c5b9ffaf.
* Fixes linking with libpcap (ppp filter).

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../makefile-remove-hard-usr-reference.patch       |   16 ++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch
index 8cc354a..d59717e 100644
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch
@@ -1,6 +1,9 @@
 The patch comes from OpenEmbedded.
 Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
 
+Updated from OE-Classic to include the pcap hunk.
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
 Upstream-Status: Inappropriate [configuration]
 
 diff -urN ppp-2.4.5-orig/pppd/Makefile.linux ppp-2.4.5/pppd/Makefile.linux
@@ -19,3 +22,16 @@ diff -urN ppp-2.4.5-orig/pppd/Makefile.linux ppp-2.4.5/pppd/Makefile.linux
  
  ifdef NEEDDES
  ifndef USE_CRYPT
+@@ -169,10 +169,10 @@
+ endif
+ 
+ ifdef FILTER
+-ifneq ($(wildcard /usr/include/pcap-bpf.h),)
++#ifneq ($(wildcard /usr/include/pcap-bpf.h),)
+ LIBS    += -lpcap
+ CFLAGS  += -DPPP_FILTER
+-endif
++#endif
+ endif
+ 
+ ifdef HAVE_INET6
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index ed815d3..587871a 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://makefile.patch \
-- 
1.7.9.5



