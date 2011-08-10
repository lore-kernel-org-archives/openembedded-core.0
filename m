Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Qr5UI-0000q0-Ln
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 11:54:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7A9nd3Y008234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 02:49:39 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 10 Aug 2011 02:49:39 -0700
Message-ID: <83a60eb818d866533f9ac2069eae38b03fcedac6.1312967662.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1312967662.git.xiaofeng.yan@windriver.com>
References: <cover.1312967662.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 10 Aug 2011 16:57:32 +0800
Date: Wed, 10 Aug 2011 17:49:41 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rootfs_rpm: Fix bug 936
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
X-List-Received-Date: Wed, 10 Aug 2011 09:54:11 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #936]
"update-alternatives" installed: one in /usr/sbin from chkconfig \
(symlinked to "alternatives"), and the other in /usr/bin \
from update-alternatives-cworth.
It appears for whatever reason that the one from chkconfig is run \
during postinst processing but if you run the script from the command \
line it gets the other one.
this is due to differences in the PATH environment variable.

The following is the sequence to call scripts after kernel booting
inittab
  -->rcS
     -->./S40networking(PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin)
     -->S98configure(call rpm-postinstall)
        #"/usr/sbin" is found prior to "/usr/bin", so update-alternatives from chkconfig is run in this script
  -->rc5.d
  -->profile(profile:4:PATH="/usr/local/bin:/usr/bin:/bin" profile:15: PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin)
  #"/usr/bin/" is found prior to "/usr/sbin", so update-alternatives from update-alternatives-cworth is run in this script

So I remove the symlink (update-alternatives linked to chkconfig). The one from update-alternatives-cworth is left alone.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.52.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
index 659f964..6dc8a0e 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
@@ -23,4 +23,5 @@ inherit autotools gettext
 
 do_install_append() {
     mkdir -p ${D}/etc/chkconfig.d
+    rm -f ${D}/usr/sbin/update-alternatives
 }
-- 
1.7.0.4



