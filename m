Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgmw-0000dm-56
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:08:42 +0200
Received: by dadv2 with SMTP id v2so499403dad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=G80+FSR83TWUi/oiiP4rTooI/KltL5RnuU3V8SapNzU=;
	b=DVz3GoOxtHCuAgzLpQZwodYHkh3JaOaBCC/FM5VyGErX4mewTRvXvStoDsBTEFZZ8I
	kgWBNlxatIptP2wObN6psVyHy7vSoZ0W2yCrZPwvMPQ9e8d11Vbb6X4NcqCZ0av95+hV
	32lEHhA786d7gyT9lwzDQmN4G1kElxzjndVkTzRwAkU52TsqOulnUr4FXU3FVUEeb7bK
	BItUUTQ4SBcIsVqpTnSLk9WmF3oOPIAkwBfl5nfAMIe4PMHHBB+JM2D0H/0xpyKR1Mgz
	Imrjmq7S0c3qJ4GlZasqA7DCL8+OGmH3jCXGG1yy0Wvdsm9RP5AQ7H/kn07bnG2A7joP
	vDYg==
Received: by 10.68.138.134 with SMTP id qq6mr1032900pbb.8.1335992336755;
	Wed, 02 May 2012 13:58:56 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nd7sm2954025pbc.63.2012.05.02.13.58.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:58:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:58:01 -0700
Message-Id: <cover.1335992192.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Add and use kmod
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
X-List-Received-Date: Wed, 02 May 2012 21:08:42 -0000

We add kmod and use it for module management and remove module-init-tools

The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:

  eglibc-package: remove /var (2012-05-01 12:36:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/kmod
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/kmod

Khem Raj (3):
  kmod: Add recipes
  module-init-tools: Delete
  image.bbclass,kernel.bbclass: Use kmod-native instead of
    module-init-tools-cross

 meta/classes/image.bbclass                         |    2 +-
 meta/classes/kernel.bbclass                        |    7 +-
 meta/recipes-kernel/kmod/kmod-native_git.bb        |   14 +++++
 meta/recipes-kernel/kmod/kmod.inc                  |   31 ++++++++++
 meta/recipes-kernel/kmod/kmod/depmod-search.conf   |    6 ++
 meta/recipes-kernel/kmod/kmod_git.bb               |   62 ++++++++++++++++++++
 .../module-init-tools/files/disable_man.patch      |   25 --------
 .../files/grab_module_memset.patch                 |   21 -------
 .../files/modutils_extension.patch                 |   25 --------
 .../module-init-tools-cross_3.16.bb                |   10 ---
 .../module-init-tools/module-init-tools.inc        |   24 --------
 .../module-init-tools/module-init-tools_3.16.bb    |   42 -------------
 .../files/PD.patch                                 |    0
 .../files/modutils.sh                              |    0
 .../modutils-initscripts.bb                        |    0
 15 files changed, 117 insertions(+), 152 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
 create mode 100644 meta/recipes-kernel/kmod/kmod.inc
 create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
 create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/disable_man.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/modutils_extension.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools.inc
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/files/PD.patch (100%)
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/files/modutils.sh (100%)
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/modutils-initscripts.bb (100%)

-- 
1.7.5.4



