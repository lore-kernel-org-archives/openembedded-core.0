Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1SXBtw-0003xT-HB
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:46:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="143741951"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 06:35:41 -0700
Received: from moolinex.rb.intel.com (unknown [10.237.105.40])
	by linux.intel.com (Postfix) with ESMTP id 9349A2C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 06:35:41 -0700 (PDT)
Message-ID: <4FBCE7E7.6040704@linux.intel.com>
Date: Wed, 23 May 2012 16:36:39 +0300
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120420 Thunderbird/12.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] sudo: fixed wrong `chmod` path
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
X-List-Received-Date: Wed, 23 May 2012 13:46:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Placed $D between braces ${D} to be correctly expanded to the
workdir path, instead of a path relative to host rootfs.
Currently, bitbake sudo fails on host systems where sudo is not
installed.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
  meta/recipes-extended/sudo/sudo_1.8.4p4.bb |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
index 2315322..20c4a14 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
@@ -1,6 +1,6 @@
  require sudo.inc
  
-PR = "r0"
+PR = "r1"
  
  SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
             file://libtool.patch \
@@ -24,6 +24,6 @@ do_install_append () {
  		fi
  	done
  
-	chmod 4111 $D/usr/bin/sudo
-	chmod 0440 $D/etc/sudoers
+	chmod 4111 ${D}/usr/bin/sudo
+	chmod 0440 ${D}/etc/sudoers
  }
-- 1.7.10



