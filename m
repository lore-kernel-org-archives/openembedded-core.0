Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E163D617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 03:37:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s813bY5W020974
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 20:37:34 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 31 Aug 2014 20:37:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Sep 2014 11:37:28 +0800
Message-ID: <cover.1409541491.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] classes/compress_doc: support compress man/info pages
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
X-List-Received-Date: Mon, 01 Sep 2014 03:37:37 -0000
Content-Type: text/plain

Changed in V2:

Use "compress_mode = d.getVar('DOC_COMPRESS', True)" to instead of
"compress_mode = d.getVar('DOC_COMPRESS', True) or ''"


Test Steps:

1. vim local.conf
...
IMAGE_INSTALL_append = " man info man-doc e2fsprogs-doc vim-doc"
INHERIT += "compress_doc"
DOC_COMPRESS = "xz"
...

2. bitbake core-image-minimal

3. Identify already compressed items, verify they conform to
compression policy. Take man for example ('gz' --> 'xz')

$ cd tmp/work/armv5te-poky-linux-gnueabi/man/1.6g-r1
$ find image/usr/share/man/
image/usr/share/man/
image/usr/share/man/man7
image/usr/share/man/man7/man.7.gz
image/usr/share/man/man1
image/usr/share/man/man1/man2html.1
image/usr/share/man/man1/man.1.gz
image/usr/share/man/man5
image/usr/share/man/man5/manpath.5.gz

$ find package/usr/share/man/
package/usr/share/man/
package/usr/share/man/man7
package/usr/share/man/man7/man.7.xz
package/usr/share/man/man1
package/usr/share/man/man1/man.1.xz
package/usr/share/man/man1/man2html.1.xz
package/usr/share/man/man5
package/usr/share/man/man5/manpath.5.xz

4. The hardlink files could be compressed and re-hardlink correctly.
Take e2fsprogs for example:

$ cd tmp/work/armv5te-poky-linux-gnueabi/e2fsprogs/1.42.9-r0
$ ls -al image/usr/share/man/man8/mk*
-rw-r--r-- 5 jiahongxu jiahongxu 20221 Aug 14 18:17 image/usr/share/man/man8/mke2fs.8
-rw-r--r-- 5 jiahongxu jiahongxu 20221 Aug 14 18:17 image/usr/share/man/man8/mkfs.ext2.8
-rw-r--r-- 5 jiahongxu jiahongxu 20221 Aug 14 18:17 image/usr/share/man/man8/mkfs.ext3.8
-rw-r--r-- 5 jiahongxu jiahongxu 20221 Aug 14 18:17 image/usr/share/man/man8/mkfs.ext4.8
-rw-r--r-- 5 jiahongxu jiahongxu 20221 Aug 14 18:17 image/usr/share/man/man8/mkfs.ext4dev.8

$ ls -al package/usr/share/man/man8/mk*
-rw-r--r-- 10 jiahongxu jiahongxu 6828 Aug 14 18:17 package/usr/share/man/man8/mke2fs.8.xz
-rw-r--r-- 10 jiahongxu jiahongxu 6828 Aug 14 18:17 package/usr/share/man/man8/mkfs.ext2.8.xz
-rw-r--r-- 10 jiahongxu jiahongxu 6828 Aug 14 18:17 package/usr/share/man/man8/mkfs.ext3.8.xz
-rw-r--r-- 10 jiahongxu jiahongxu 6828 Aug 14 18:17 package/usr/share/man/man8/mkfs.ext4.8.xz
-rw-r--r-- 10 jiahongxu jiahongxu 6828 Aug 14 18:17 package/usr/share/man/man8/mkfs.ext4dev.8.xz

5. The symlink files could be compressed and re-symlink correctly.
Take 'vim' for example:

$ cd tmp/work/armv5te-poky-linux-gnueabi/vim/7.4.373-r0
$ ls -al `find image/usr/share/man/man1/ -type l`
lrwxrwxrwx 1 jiahongxu jiahongxu 5 Aug 15 17:17 image/usr/share/man/man1/ex.1 -> vim.1
lrwxrwxrwx 1 jiahongxu jiahongxu 5 Aug 15 17:17 image/usr/share/man/man1/rview.1 -> vim.1
lrwxrwxrwx 1 jiahongxu jiahongxu 5 Aug 15 17:17 image/usr/share/man/man1/rvim.1 -> vim.1
lrwxrwxrwx 1 jiahongxu jiahongxu 5 Aug 15 17:17 image/usr/share/man/man1/view.1 -> vim.1

$ ls -al `find package/usr/share/man/man1/ -type l`
lrwxrwxrwx 1 jiahongxu jiahongxu 8 Aug 15 17:31 package/usr/share/man/man1/ex.1.xz -> vim.1.xz
lrwxrwxrwx 1 jiahongxu jiahongxu 8 Aug 15 17:31 package/usr/share/man/man1/rview.1.xz -> vim.1.xz
lrwxrwxrwx 1 jiahongxu jiahongxu 8 Aug 15 17:31 package/usr/share/man/man1/rvim.1.xz -> vim.1.xz
lrwxrwxrwx 1 jiahongxu jiahongxu 8 Aug 15 17:31 package/usr/share/man/man1/view.1.xz -> vim.1.xz

6. Start qemu

7. On target, check the compressed man/info files could work. Currently only gz could work.

8. Change DOC_COMPRESS = "xz" to DOC_COMPRESS = "bz2" and repeat steps 2-7.

//Hongxu


The following changes since commit fd0398f2c1355597a95242e6c8400eae6ad60fa4:

  poky-tiny: Fix qemu build failure (2014-08-31 23:40:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/compress-doc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/compress-doc

Hongxu Jia (1):
  classes/compress_doc.bbclass: compress man/info pages

 meta/classes/compress_doc.bbclass | 213 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)
 create mode 100644 meta/classes/compress_doc.bbclass

-- 
1.9.1


