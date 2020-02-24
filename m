Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96644601CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 11:13:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01OBDb09011246
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 24 Feb 2020 03:13:38 -0800 (PST)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 24 Feb 2020 03:13:37 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Armin Kuster
	<akuster808@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20200224031226.6965-1-akuster808@gmail.com>
	<1f5759550013cdb49ebfb34194863af3d9dbcf6c.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <89e6bbf2-51ca-4dcf-46b3-e484d228f579@windriver.com>
Date: Mon, 24 Feb 2020 19:13:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1f5759550013cdb49ebfb34194863af3d9dbcf6c.camel@linuxfoundation.org>
Subject: Re: [PATCH] e2fsprogs: update to 1.45.5
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
X-List-Received-Date: Mon, 24 Feb 2020 11:13:40 -0000
X-Groupsio-MsgNum: 135513
Content-Type: multipart/mixed; boundary="------------596BD23410D4EF5A78DDB00E"
Content-Language: en-US

--------------596BD23410D4EF5A78DDB00E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/24/20 6:23 PM, Richard Purdie wrote:
> On Sun, 2020-02-23 at 19:12 -0800, Armin Kuster wrote:
>> Dropping patch 0001-misc-create_inode.c-set-dir-s-mode-
>> correctly.patch as upstream has not been accepted for over 2 years
>> and we should not carry it if upstream has not taking it after all
>> that time.
> 
> Looking at the patch, this worries me a lot. Why have upstream not
> taken it? Did they say it was incorrect?

I can't find any records about it, maybe I didn't send it because of
some reason.

We still need it. I refreshed the patch and sent to upstream.

@Armin, The refreshed patch is in the attachment.

// Robert

> 
> We wrote the original code to handle offline root here so its entirely
> possible this is a value issue and we'll break filesystems if we don't
> have that patch :(
> 
> I can't take a change like this without more info, CVE or not.

> 
> Cheers,
> 
> Richard
> 
> 
>> Includes: CVE-2019-5188
>>
>> see http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.5
>> for more information.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   ...ate_inode.c-set-dir-s-mode-correctly.patch | 41 ---------------
>> ----
>>   ...2fsprogs_1.45.4.bb => e2fsprogs_1.45.5.bb} |  3 +-
>>   2 files changed, 1 insertion(+), 43 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-
>> misc-create_inode.c-set-dir-s-mode-correctly.patch
>>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.4.bb =>
>> e2fsprogs_1.45.5.bb} (97%)
>>
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-
>> create_inode.c-set-dir-s-mode-correctly.patch b/meta/recipes-
>> devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-
>> correctly.patch
>> deleted file mode 100644
>> index fc4a5409860..00000000000
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-
>> create_inode.c-set-dir-s-mode-correctly.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From f6d188580c2c9599319076fee22f2424652c711c Mon Sep 17 00:00:00
>> 2001
>> -From: Robert Yang <liezhi.yang@windriver.com>
>> -Date: Wed, 13 Sep 2017 19:55:35 -0700
>> -Subject: [PATCH] misc/create_inode.c: set dir's mode correctly
>> -
>> -The dir's mode has been set by ext2fs_mkdir() with umask, so
>> -reset it to the source's mode in set_inode_extra().
>> -
>> -Fixed when source dir's mode is 521, but tarball would be 721, this
>> was
>> -incorrect.
>> -
>> -Upstream-Status: Submitted
>> -
>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ----
>> - misc/create_inode.c | 9 ++++++++-
>> - 1 file changed, 8 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/misc/create_inode.c b/misc/create_inode.c
>> -index 8ce3faf..50fbaa8 100644
>> ---- a/misc/create_inode.c
>> -+++ b/misc/create_inode.c
>> -@@ -116,7 +116,14 @@ static errcode_t set_inode_extra(ext2_filsys
>> fs, ext2_ino_t ino,
>> -
>> - 	inode.i_uid = st->st_uid;
>> - 	inode.i_gid = st->st_gid;
>> --	inode.i_mode |= st->st_mode;
>> -+	/*
>> -+	 * The dir's mode has been set by ext2fs_mkdir() with umask, so
>> -+	 * reset it to the source's mode
>> -+	 */
>> -+	if S_ISDIR(st->st_mode)
>> -+		inode.i_mode = LINUX_S_IFDIR | st->st_mode;
>> -+	else
>> -+		inode.i_mode |= st->st_mode;
>> - 	inode.i_atime = st->st_atime;
>> - 	inode.i_mtime = st->st_mtime;
>> - 	inode.i_ctime = st->st_ctime;
>> ---
>> -2.10.2
>> -
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>> similarity index 97%
>> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>> index 6e69eea21c3..7cd42b8137a 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>> @@ -4,7 +4,6 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>>              file://run-ptest \
>>              file://ptest.patch \
>>              file://mkdir_p.patch \
>> -           file://0001-misc-create_inode.c-set-dir-s-mode-
>> correctly.patch \
>>              file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
>>              file://0001-intl-do-not-try-to-use-gettext-defines-that-
>> no-longe.patch \
>>              "
>> @@ -13,7 +12,7 @@ SRC_URI_append_class-native = "
>> file://e2fsprogs-fix-missing-check-for-permissio
>>                                   file://quiet-debugfs.patch \
>>   "
>>   
>> -SRCREV = "984ff8d6a0a1d5dc300505f67b38ed5047d51dac"
>> +SRCREV = "c2b1ec5fbc99ab8a2b71dae45d486b3ea004f618"
>>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>>   
>>   EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
>> -- 
>> 2.17.1
>>
> 
> 

--------------596BD23410D4EF5A78DDB00E
Content-Type: text/x-patch;
	name="0001-misc-create_inode.c-set-dir-s-mode-correctly.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-misc-create_inode.c-set-dir-s-mode-correctly.patch"

From f6d188580c2c9599319076fee22f2424652c711c Mon Sep 17 00:00:00 2001
From: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 24 Feb 2020 18:46:55 +0800
Subject: [PATCH][e2fsprogs] misc/create_inode.c: set dir's mode correctly

The dir's mode has been set by ext2fs_mkdir() with umask, so
reset it to the source's mode in set_inode_extra().

Fixed when source dir's mode is 521, but dst dir's mode is 721 which was
incorrect.

Upstream-Status: Submitted [linux-ext4@vger.kernel.org]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 misc/create_inode.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/misc/create_inode.c b/misc/create_inode.c
index 5161d5e..f82f74e 100644
--- a/misc/create_inode.c
+++ b/misc/create_inode.c
@@ -124,7 +124,14 @@ static errcode_t set_inode_extra(ext2_filsys fs, ext2_ino_t ino,
 	ext2fs_set_i_uid_high(inode, st->st_uid >> 16);
 	inode.i_gid = st->st_gid;
 	ext2fs_set_i_gid_high(inode, st->st_gid >> 16);
-	inode.i_mode |= st->st_mode;
+	/*
+	 * The dir's mode has been set by ext2fs_mkdir() with umask, so
+	 * reset it to the source's mode
+	 */
+	if S_ISDIR(st->st_mode)
+		inode.i_mode = LINUX_S_IFDIR | st->st_mode;
+	else
+		inode.i_mode |= st->st_mode;
 	inode.i_atime = st->st_atime;
 	inode.i_mtime = st->st_mtime;
 	inode.i_ctime = st->st_ctime;
-- 
2.7.4


--------------596BD23410D4EF5A78DDB00E--
