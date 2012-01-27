Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rqdig-0006fa-Mj
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 05:47:26 +0100
Received: by iaby12 with SMTP id y12so710605iab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=o+mAeErpXXdppxeQvHWETnqpheZtYPgfds4NexwrMPU=;
	b=XzB21dAOD1up5eFPQu2obP1pqsVnTolUvB4nu8D3XXkKCl+opgny4oH+8eukc6bXWH
	lIBIts0BEBmJAZCj8jEKVkawUXsMmCnP4NDkiIrnj6aMUEtS0s/dT3OszYJl0CcTSKr/
	lCzefqNcDxyWe60tOaYn6ojEcnLSaLBvSNdKc=
Received: by 10.42.180.9 with SMTP id bs9mr3978677icb.0.1327639176945;
	Thu, 26 Jan 2012 20:39:36 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l35sm6448996ibj.0.2012.01.26.20.39.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 20:39:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2012 20:39:17 -0800
Message-Id: <cover.1327638861.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [PATCH 0/5] Fix arm/tune-features for thumb instruction set
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
X-List-Received-Date: Fri, 27 Jan 2012 04:47:26 -0000

There are three new patches addressing the issue where thumb was being
added to OVERRIDES for thumb capable cores but not denoting if the mode
used for code compliation was thumb. This was originally the case in oe.dev
this patch make it behave in that way

thumb-intework addition to OVERRIDES had a reverse logic fixed it

now we dont need to have tune-thumb-arm.inc anymore. Distro's using
it will have to delete it from there usage if they are depending on
oe-core version of this file. Just setting ARM_INSTRUCTION_SET = "thumb"
should be sufficient to change the mode.

The following changes since commit 6437e7315a0f2e077f9d69e4b65b48280ea8edbc:

  shadow-sysroot: Simplfy login.defs installation (2012-01-26 20:52:32 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Khem Raj (5):
  gdb-common: Drop elfutils from DEPENDS
  task-core-tools: Divide it into 3 recipes
  arm/tune: Correct the logic which added thumb-interwork to OVERRIDES
  tunearch/arm: Differentiate between thumb code generation and thumb
    capability
  tune-thumb.inc: Delete

 .../conf/distro/include/distro_tracking_fields.inc |   26 +++++--
 .../conf/machine/include/arm/feature-arm-thumb.inc |   20 ++++-
 meta/conf/machine/include/tune-strongarm1100.inc   |    4 +-
 meta/conf/machine/include/tune-thumb.inc           |   32 --------
 meta/conf/multilib.conf                            |    4 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb   |   26 ++++++
 ...sk-core-tools.bb => task-core-tools-profile.bb} |   81 ++++++--------------
 .../recipes-core/tasks/task-core-tools-testapps.bb |   46 +++++++++++
 meta/recipes-devtools/gdb/gdb-common.inc           |    6 +-
 9 files changed, 138 insertions(+), 107 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc
 create mode 100644 meta/recipes-core/tasks/task-core-tools-debug.bb
 rename meta/recipes-core/tasks/{task-core-tools.bb => task-core-tools-profile.bb} (48%)
 create mode 100644 meta/recipes-core/tasks/task-core-tools-testapps.bb

-- 
1.7.8.3



