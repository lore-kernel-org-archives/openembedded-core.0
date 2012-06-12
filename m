Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeXzy-00027a-73
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:34 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 3B7F62FE87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:36:56 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:36 -0700
Message-Id: <23b7d7dab475caca4558e3b20db534122bee1525.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 3B7F62FE87.D54C4
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 05/16] image.bbclass: Ensure ${S} is cleaned at the start of rootfs generation
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:34 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some image classes such as bootimg save files into ${S} as part of rootfs
generation. For correctness we should therefore clean this at the start of
image generation to ensure reproducibility.

I found this issue when some files I thought should disappear from my rootfs
would not disappear.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 907c59b..9557433 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -131,6 +131,7 @@ PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
 do_rootfs[nostamp] = "1"
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
+do_rootfs[cleandirs] += "${S}"
 do_build[nostamp] = "1"
 
 # Must call real_do_rootfs() from inside here, rather than as a separate
-- 
1.7.9.5



