Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 858477825B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 07:16:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7B7GfmT032007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 11 Aug 2017 08:16:42 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dg4BV-0004CH-5t; Fri, 11 Aug 2017 08:16:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 08:16:36 +0100
Message-Id: <1502435796-16094-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 11 Aug 2017 08:16:42 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] image-prelink: Disable for musl images
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
X-List-Received-Date: Fri, 11 Aug 2017 07:16:43 -0000

For some reason prelink was refusing to prelink musl images but now sometimes
does modify the binaries. Since musl has no support for this, such images
end up broken and unable to boot.

To avoid this, be explicit and only apply prelinking for libc-glibc.

[YOCTO #11913]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-prelink.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 4157df0..6fcd699 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -1,6 +1,6 @@
 do_rootfs[depends] += "prelink-native:do_populate_sysroot"
 
-IMAGE_PREPROCESS_COMMAND += "prelink_setup; prelink_image; "
+IMAGE_PREPROCESS_COMMAND_append_libc-glibc = " prelink_setup; prelink_image; "
 
 python prelink_setup () {
     oe.utils.write_ld_so_conf(d)
-- 
2.7.4


