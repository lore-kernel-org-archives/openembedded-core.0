Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 35C2061EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 04:31:31 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lj1so1651435pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 21:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HkH1oo+HART9nsyUDHMxJgw7DjV0ma7hBLSnOvgekkg=;
	b=k24mGEmxi/lVA2BZtEAlv7GTnGUYLQouNRTlBTnFRjlWqFFDygP/zb6qeKnyGkqSHX
	Mm+9Wzhwps5t8toyaSwZ4RL7xRAL8huMG3SVHHowaJ0nD36Fl+Y4T7WgZLfX6nwo1G37
	v7CKv2+QtC3XkLMqGvcKhmpjcsAfjymo29gG6S5OT4Q20gu9axnyVaFlHotwE31yyq32
	tF16mry3Vbj2XpqeWBoviK9i27AfcpKKytjugK5uuN1EmG6HXzzYPosl3O0KEYCbhDyo
	QS+HFFqWpsGmsc4dOPBtoQhuxP7QQuhJp4bjFcKDBvjY2QURfpoMFuYI+jdij+Lj3tju
	kIEQ==
X-Received: by 10.66.142.42 with SMTP id rt10mr12940021pab.1.1377145891130;
	Wed, 21 Aug 2013 21:31:31 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm11993568pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 21:31:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 21:30:40 -0700
Message-Id: <cover.1377145501.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH 0/3] Update systemd/kmod
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
X-List-Received-Date: Thu, 22 Aug 2013 04:31:32 -0000

This patchset updates systemd to 206 and kmod to 14
kmod 14 is now minimum version needed for systemd >= 206

glib-2.0 fix is needed for minimal-image to build
with uclibc

This has been boot tested on all supported qemus in OE-Core with
minimal-image build with both eglibc/uclibc and systemd-image
on angstrom

The following changes since commit d98f08a7ad95d0b17846276b028a6614f16b6846:

  genext2fs: fix memory corruption on powerpc (2013-08-20 07:11:44 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/systemd-206
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-206

Khem Raj (3):
  kmod: Upgrade to version 14
  systemd: Upgrade to 206
  glib-2.0: Specify libiconv when building on uclibc

 meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb      |   1 +
 ...1-uClibc-doesn-t-implement-pwritev-preadv.patch |  37 +++
 .../0001-use-CAP_MKNOD-ConditionCapability.patch   |  32 ++
 ...ystemd-update-utmp-shutdown.service-into-.patch | 367 ---------------------
 .../systemd/systemd/install-quotaon-once.patch     |  34 --
 .../systemd/systemd-pam-fix-getty-unit.patch       |  24 +-
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  59 ++--
 .../systemd/{systemd_204.bb => systemd_206.bb}     |  19 +-
 meta/recipes-kernel/kmod/kmod-native_git.bb        |   1 -
 meta/recipes-kernel/kmod/kmod.inc                  |   9 +-
 ...-man-page-generation-because-we-don-t-hav.patch |  26 --
 .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        |  16 +-
 meta/recipes-kernel/kmod/kmod_git.bb               |   3 +-
 13 files changed, 134 insertions(+), 494 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/install-quotaon-once.patch
 rename meta/recipes-core/systemd/{systemd_204.bb => systemd_206.bb} (95%)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch

-- 
1.8.3.4


