Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A36336B8FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 01:19:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7R1J4qd016008
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Aug 2013 18:19:04 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 26 Aug 2013 18:19:02 -0700
Message-ID: <521BFE8A.803@windriver.com>
Date: Tue, 27 Aug 2013 09:19:06 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1377505592.git.rongqing.li@windriver.com>
	<77319aeee8a2f49fa9ece78c4a0e4e20be3d4165.1377505592.git.rongqing.li@windriver.com>
	<521B6820.1000000@linux.intel.com>
In-Reply-To: <521B6820.1000000@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] btrfs-tools: Add dependency on lzo acl e2fsprog
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
X-List-Received-Date: Tue, 27 Aug 2013 01:19:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/26/2013 10:37 PM, Saul Wold wrote:
>
> Why?
>
> And should the acl be controlled by a PACKAGECONFIG?  Can it be disabled
> during do_configure?
>
> Sau!

btrfs-tools does not inherit autotools, and does not support the 
configuration.

it includes <sys/acl.h> hard-code.

The commit which includes <sys/acl.h> is below:

commit 62a72e7d9ada7a986dd299622b2233fe2e386003
Author: Yan <yanzheng@21cn.com>
Date:   Mon Jan 14 13:35:00 2008 -0500

     xattr support for the ext3->btrfs converter

diff --git a/convert.c b/convert.c
index beb9a96..c047620 100644
--- a/convert.c
+++ b/convert.c
@@ -25,6 +25,7 @@
  #include <stdlib.h>
  #include <sys/types.h>
  #include <sys/stat.h>
+#include <sys/acl.h>
  #include <fcntl.h>
  #include <unistd.h>
  #include <uuid/uuid.h>
@@ -35,11 +36,10 @@
  #include "transaction.h"
  #include "crc32c.h"
  #include "utils.h"
-#include "ext2fs/ext2_fs.h"
-#include "ext2fs/ext2fs.h"
-
+#include <ext2fs/ext2_fs.h>
+#include <ext2fs/ext2fs.h>
+#include <ext2fs/ext2_ext_attr.h>
  #define INO_OFFSET (BTRFS_FIRST_FREE_OBJECTID - EXT2_ROOT_INO)
-
  /*
   * Open Ext2fs in readonly mode, read block allocation bitmap and
   * inode bitmap into memory.
@@ -446,7 +446,8 @@ static int __block_iterate_proc(ext2_filsys fs, 
blk_t *blocknr,
  static int create_file_extents(struct btrfs_trans_handle *trans,
                                struct btrfs_root *root, u64 objectid,
                                struct btrfs_inode_item *btrfs_inode,
-                              ext2_filsys ext2_fs, ext2_ino_t ext2_ino)
+                              ext2_filsys ext2_fs, ext2_ino_t ext2_ino,
+                              int datacsum, int packing)







The btrfs-convert.c which include <sys/acl.h> is below:


  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public
  * License along with this program; if not, write to the
  * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
  * Boston, MA 021110-1307, USA.
  */

#define _XOPEN_SOURCE 600
#define _GNU_SOURCE 1

#include "kerncompat.h"

#ifndef __CHECKER__
#include <sys/ioctl.h>
#include <sys/mount.h>
#endif
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/acl.h>


both are hard-code.


-Roy


>
> On 08/26/2013 01:56 AM, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> index 07e8529..3ec9e8a 100644
>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>> @@ -10,7 +10,7 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM =
>> "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>>   SECTION = "base"
>> -DEPENDS = "util-linux attr"
>> +DEPENDS = "util-linux attr e2fsprogs lzo acl"
>>
>>   SRCREV = "194aa4a1bd6447bb545286d0bcb0b0be8204d79f"
>>   SRC_URI =
>> "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git"
>>
>>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

