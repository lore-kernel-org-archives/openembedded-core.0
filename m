Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF63760812
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:49:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5H5nYFh007965
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 22:49:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 16 Jun 2013 22:49:31 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 13:49:26 +0800
Message-ID: <cover.1371447869.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 0/9] busybox miscellaneous fixes
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
X-List-Received-Date: Mon, 17 Jun 2013 05:49:31 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patchset mainly serves two purposes.
1) Switch to using busybox as the default login manager.
2) Fix to support FEATURE_INDIVIDUAL in busybox.

I'd really appreciate it if you could review it. And any comment or suggest is
really welcome.

In this cover letter, I'll describe why we switch to using busybox instead of
tiny login, how we do it and the final result of this change.

The reason is well explaned by Saul's comment in bug#4207.
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4207)
So I quote it here.
'''
tinylogin has been deprecated and the functionality ported into busybox, the
size is smaller than tinybox. The issue to be concerned about is having busybox
being setuid, a possibility is to use busybox as a separate binary.
'''

That's exactly what this patchset does.
*) switch to using busybox as the default login manager
*) remove tinylogin as it's deprecated
*) add the ability to split the busybox binary into two parts, one with suid and the other not.

Following's a brief design. You could also see it on the bugzilla.
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4207)
Design:
1) Add a configuration fragment to the SRC_URI. The configuration fragment will
   be called login-utilities.cfg, as its main purpose is to enable the login utility
   of busybox.

2) set the default login manager to 'busybox' instead of 'tinylogin'

3) Add a variable, BUSYBOX_SPLIT_SUID, to control whether to split the busybox
   binary into two parts, one with suid and the other not. We default it to "1"
   to enable the splitting, but users could still override it to disable the
   splitting. After all, busybox has no internal support for this suid apps splitting,
   so there might be users out there who trust busybox and want just one busybox binary.

4) Patch busybox to make it able to list configuration items of suid apps and non-suid
   apps. These two lists are used to separate the busybox binary.

5) Busybox supports building individual apps, so the change above should still
   support this feature.

Here's the final result of this change:
1) FEATURE_INDIVIDUAL enabled
   We'll have links on target like below.
   /bin/ls -> /bin/ls.busybox
   /bin/cat -> /bin/cat.busybox
   /bin/su -> /bin/su.busybox
2) FEATURE_INDIVIDUAL disabled (this is the default behavior) and BUSYBOX_SPLIT_SUID enabled
   /bin/ls -> /bin/busybox.nosuid
   /bin/cat -> /bin/busybox.nosuid
   /bin/su -> /bin/busybox.suid
3) FEATURE_INDIVIDUAL disabled and BUSYBOX_SPLIT_SUID disabled
   /bin/ls -> /bin/busybox
   /bin/cat -> /bin/busybox
   /bin/su -> /bin/busybox

//Chen Qi

The following changes since commit a62aed41f2d8f874f7ae24d0e5be5dbc66ea2199:

  lrzsz: check locale.h in configure (2013-06-04 15:55:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/busybox-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-fixes

Chen Qi (9):
  busybox: remove the postinst part of the recipe
  busybox: add support for CONFIG_FEATURE_INDIVIDUAL
  busybox: add a config fragment to enable login utilities
  busybox: enable to list suid and non-suid app configs
  busybox: add the ability to split the busybox binary
  packagegroup-core-boot: use busybox as the default login manager
  packagegroup-core-basic: set the default login manager
  mingetty: lower the ALTERNATIVE_PRIORITY
  tinylogin: remove recipe

 ...usybox-list-suid-and-non-suid-app-configs.patch |  179 +++++
 .../busybox/busybox-1.20.2/login-utilities.cfg     |   13 +
 meta/recipes-core/busybox/busybox.inc              |  105 ++-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    4 +-
 .../packagegroups/packagegroup-core-boot.bb        |    2 +-
 .../tinylogin/tinylogin-1.4/add-system.patch       |  117 ---
 .../tinylogin-1.4/adduser-empty_pwd.patch          |   45 --
 .../tinylogin/tinylogin-1.4/avoid_static.patch     |   33 -
 .../tinylogin/tinylogin-1.4/cvs-20040608.patch     |  823 --------------------
 .../tinylogin/tinylogin-1.4/glibc_crypt_fix.patch  |   23 -
 .../tinylogin-1.4/passwd_rotate_check.patch        |   41 -
 .../tinylogin/tinylogin-1.4/remove-index.patch     |   13 -
 .../tinylogin/tinylogin-1.4/use_O2_option.patch    |   21 -
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |   45 --
 meta/recipes-extended/mingetty/mingetty_1.08.bb    |    2 +-
 .../packagegroups/packagegroup-core-basic.bb       |    3 +-
 16 files changed, 268 insertions(+), 1201 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-list-suid-and-non-suid-app-configs.patch
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/login-utilities.cfg
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/add-system.patch
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/adduser-empty_pwd.patch
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/avoid_static.patch
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/cvs-20040608.patch
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/glibc_crypt_fix.patch
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/passwd_rotate_check.patch
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/remove-index.patch
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin-1.4/use_O2_option.patch
 delete mode 100644 meta/recipes-core/tinylogin/tinylogin_1.4.bb

-- 
1.7.9.5


