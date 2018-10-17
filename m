Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBF5F79B92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:44:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9HGhgpX005162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:43:58 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 09:43:26 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 12:43:22 -0400
Message-ID: <20181017164326.67111-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/4] Fix a number of non-machine pkg hash change issues
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
X-List-Received-Date: Wed, 17 Oct 2018 16:44:08 -0000
Content-Type: text/plain

While working on a system with multiple BSPs, but a single distro configuration,
I struggled with an issue of PR numbers increasing quickly and different
behavior from boot to boot.

The systemd one, it looks like there are two alternative solutions.  I choose
the one that was similar to a connman fix.  Add a machine specific configuration
recipe.  The alternative would have been to adjust the test cases to pass the
argument for the longer timeout via the kernel command line.  I was worried
that this could end up being a requirement for more then just test cases.

Note in this patch, I also moved the 'machine-id' file to the config stuff,
with the note it appeared to me this made the most sense as someone may end
up defining some specific semantics to that file in some configurations.

The remaining changes made sense in my configuration, but I'm not entirely
sure they are the right solution.  The other alternative I toyed with was
to declare the package to be machine specific -only- for QEMU BSPs.  But
I'm not sure this really would have solved my PR number/hash problem.

Mark Hatle (4):
  systemd: Remove items that made this machine (qemu) specific
  mesa: Remove machine specific append
  weston: Remove machine specific append
  gstreamer: Remove machine specific append

 meta/recipes-core/systemd/systemd-conf.bb     | 51 +++++++++++++++++++
 ...ange-the-default-device-timeout-to-2.patch | 35 -------------
 meta/recipes-core/systemd/systemd_239.bb      | 28 ++++------
 meta/recipes-graphics/mesa/mesa.inc           |  4 +-
 meta/recipes-graphics/wayland/weston_5.0.0.bb |  4 +-
 .../gstreamer/gstreamer1.0_1.14.2.bb          |  2 -
 6 files changed, 64 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd-conf.bb
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch

-- 
2.18.0


