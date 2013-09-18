Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7DB6C722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 07:26:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8I7QjgN012689
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 00:26:45 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 18 Sep 2013 00:26:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Sep 2013 15:26:40 +0800
Message-ID: <cover.1379488759.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/1] kernel-grub.bbclass: a method to install/update for bzImage
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
X-List-Received-Date: Wed, 18 Sep 2013 07:26:43 -0000
Content-Type: text/plain

Change in V2: Create a "kernel-grub.bbclass" to do the job which means
              it is disabled by default.

Test Case:
1. Add INHERIT_append = " kernel-grub" to local.conf and build a new kernel
   image rpm package.

2. Prepare a deployed target, and make sure your boot area has enough disk
   space (free space >= 5MB).

3. Download the new kernel image rpm to the target.

4. Before install/update, check boot area and menu
root@qemux86-64:~# ls /boot/
grub        vmlinuz

root@qemux86-64:~# cat /boot/grub/grub.cfg
menuentry "Linux" {
    set root=(hd0,1)
    linux /vmlinuz root=/dev/hdb2  rw  console=tty0  quiet
}

4. Install/update bzImage
root@qemux86-64:~# rpm -i kernel-image-3.10.11-yocto-standard-3.10.12+git0+285f93bf94_702040ac7c-r0.qemux86_64.rpm 
Caution! Update kernel may affect kernel-module!
update-alternatives: Linking //boot/bzImage to bzImage-3.10.11-yocto-standard

5. After install/update, check boot area and menu
root@qemux86-64:~# ls /boot/ -al
drwxr-xr-x    4 root     root          1024 Sep 18 06:58 .
drwxr-xr-x   17 root     root          4096 Sep 18 06:41 ..
lrwxrwxrwx    1 root     root            30 Sep 18 06:58 bzImage -> bzImage-3.10.11-yocto-standard
-rw-r--r--    1 root     root       5601808 Sep 18 06:45 bzImage-3.10.11-yocto-standard
drwxr-xr-x    4 root     root          1024 Sep 18 06:58 grub
-rwxr-x---    1 root     root       5601776 Sep 18 06:38 vmlinuz

root@qemux86-64:~# cat /boot/grub/grub.cfg 
menuentry "Update bzImage-3.10.11-yocto-standard-3.10.12+gitAUTOINC+285f93bf94_702040ac7c" {
    set root=(hd0,1)
    linux /bzImage-3.10.11-yocto-standard root=/dev/hdb2  rw  console=tty0  quiet
}
menuentry "Linux" {
    set root=(hd0,1)
    linux /vmlinuz root=/dev/hdb2  rw  console=tty0  quiet
}


6. Reboot target, 'Update bzImage-3.10.11-yocto-standard-3.10.12+gitAUTOINC+285f93bf94_702040ac7c'
   will be in the boot menu.

7. It supports GRUB 0.97 in which use menu.lst rather than grub.cfg as config
   file.

8. If you install the same rpm more than one time with '--force', there will
   be multiple kernel images in boot area and menu.

//Hongxu

The following changes since commit 825cfeb2e6777a55077ecff32d5b2c0e3da13ae8:

  bitbake: usermanual.xml: Two new sections added to BitBake "Description" (2013-09-17 22:27:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/update-bzimage
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/update-bzimage

Hongxu Jia (1):
  kernel-grub.bbclass: a method to install/update for bzImage

 meta/classes/kernel-grub.bbclass | 79 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 meta/classes/kernel-grub.bbclass

-- 
1.8.1.2


