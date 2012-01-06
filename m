Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RjA4l-0002tO-Cw
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 14:43:19 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0C802F81264; Fri,  6 Jan 2012 06:35:56 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id A2984F81261;
	Fri,  6 Jan 2012 06:35:54 -0700 (MST)
Message-ID: <4F06F8BA.8010700@mlbassoc.com>
Date: Fri, 06 Jan 2012 06:35:54 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] filesystems: fix mount order
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
X-List-Received-Date: Fri, 06 Jan 2012 13:43:19 -0000
X-Groupsio-MsgNum: 15534
Content-Type: multipart/mixed; boundary="------------020704020107020300040302"

--------------020704020107020300040302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This changes the order that file system [types] are tried
when using 'mount' in busybox when the file system type is
not explictly specified.  The pervious ordering is
incorrect in that less capable file system types are tried
first, e.g. ext2 before ext3, which will cause an ext3 file
system to be mounted as ext2, disabling some of the ext3
features such as journaling.

The change also moves infrequently used file system types to
the end as checking for them is just a waste of effort in
most cases.  The list now also includes ext4.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
  .../recipes-core/base-files/base-files/filesystems |    9 +++++----
  1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/filesystems b/meta/recipes-core/base-files/base-files/filesystems
index 2af6a7e..7e6c41c 100644
--- a/meta/recipes-core/base-files/base-files/filesystems
+++ b/meta/recipes-core/base-files/base-files/filesystems
@@ -1,7 +1,8 @@
-minix
-fat
-vfat
-ext2
+ext4
  ext3
+ext2
+vfat
+fat
  btrfs
+minix
  *
-- 
1.7.7.5

--------------020704020107020300040302
Content-Type: text/plain;
 name="Attached Message Part"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Attached Message Part"



--------------020704020107020300040302--
