Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC3B60ED9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 09:26:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8C9Q02f012131
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 02:26:00 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 12 Sep 2013 02:25:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 17:25:55 +0800
Message-ID: <cover.1378977276.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: cxu@windriver.com
Subject: [PATCH 0/1] kernel.bbclass: Need a method to install/update for bzImage
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
X-List-Received-Date: Thu, 12 Sep 2013 09:26:02 -0000
Content-Type: text/plain

Test Case:
1. Prepare a deployed target, and make sure your boot area has enough disk
   space.

2. Download the new kernel image rpm to the target

3. Before install/update, check boot area and menu
root@qemux86:~# ls /boot/
grub        vmlinuz

root@qemux86:~# cat /boot/grub/grub.cfg
menuentry "Linux" {
    set root=(hd0,1)
    linux /vmlinuz root=/dev/hdb2  rw  console=tty0  quiet
}

4. Install/update bzImage
root@qemux86:~# rpm -i kernel-image-3.10.9-yocto-standard-3.10.9+git0+cd502a8814_7144bcc4b8-r0.qemux86.rpm 
Caution! Update kernel may affect kernel-module!
update-alternatives: Linking //boot/bzImage to bzImage-3.10.9-yocto-standard

5. After install/update, check boot area and menu
root@qemux86:~# ls /boot/ -al
drwxr-xr-x    4 root     root          1024 Sep 12 08:48 .
drwxr-xr-x   17 root     root          4096 Sep 12 07:08 ..
lrwxrwxrwx    1 root     root            29 Sep 12 08:48 bzImage -> bzImage-3.10.9-yocto-standard
-rw-r--r--    1 root     root       6172096 Sep 12 07:39 bzImage-3.10.9-yocto-standard
drwxr-xr-x    4 root     root          1024 Sep 12 08:48 grub
-rwxr-x---    1 root     root       6172096 Sep 12 08:45 vmlinuz

root@qemux86:~# cat /boot/grub/grub.cfg 
menuentry "Update bzImage-3.10.9-yocto-standard-3.10.9+gitAUTOINC+cd502a8814_7144bcc4b8" {
    set root=(hd0,1)
    linux /bzImage-3.10.9-yocto-standard root=/dev/hdb2  rw  console=tty0  quiet
}
menuentry "Linux" {
    set root=(hd0,1)
    linux /vmlinuz root=/dev/hdb2  rw  console=tty0  quiet
}

6. Reboot target, 'Update bzImage-3.10.9-yocto-standard-3.10.9+gitAUTOINC+cd502a8814_7144bcc4b8'
   will be in the boot menu.

7. It supports GRUB 0.97 in which the grub.cfg doesn't exist and menu.lst
   is used.

8. If you install the same rpm more than one time with '--force', there will
   be multiple kernel images in boot area and menu.

//Hongxu


The following changes since commit 1b814498b60d5f354d8cc5bdf568b91baf0745dc:

  bitbake: bitbake/cooker: fix some calls of cookerdata.findConfigFile method (2013-09-02 12:26:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/update-bzimage
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/update-bzimage

Hongxu Jia (1):
  kernel.bbclass: Need a method to install/update for bzImage

 meta/classes/kernel.bbclass | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

-- 
1.8.1.2


