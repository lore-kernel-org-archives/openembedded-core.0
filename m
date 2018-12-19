Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95C337C03C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:42:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBJ7ghfu026910
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 23:42:43 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Dec 2018 23:42:42 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2018 02:42:35 -0500
Message-ID: <cover.1545204865.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/1] grub-efi-native: workaround for fedora 29
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
X-List-Received-Date: Wed, 19 Dec 2018 07:42:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Steps:
1 docker pull fedora 29 image
2 run image with mount /tmp with tmpfs
$ docker run -it --mount type=tmpfs,destination=/tmp fedora:29 /bin/bash

3 check inode of /dev/null
$ stat -c %i /dev/null
6

and then create files under /tmp and make the biggest inode of files is 5.
$ stat -c %i `ls -t /tmp/* | head -1`
5

3 prepare and run
$ bitbake grub-efi-native -c configure

The following changes since commit fef47bd915f6a3960e512b5aba8b461b77a9ea78:

  linux-yocto-4.14: Drop bbappend (2018-12-18 16:20:10 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/grub-efi-native-fedora29
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/grub-efi-native-fedora29

Kai Kang (1):
  grub-efi-native: workaround for fedora 29

 ...workaround-for-as-from-binutils-2.31.patch | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.02.bb        |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/workaround-for-as-from-binutils-2.31.patch

--
2.19.0.rc2


