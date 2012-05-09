Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRuuY-0000aM-BY
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:37:46 +0200
Received: by pbbrq2 with SMTP id rq2so7381180pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5vdMVF+tFNb0+WrASupEKbPZITGRToVOYJHnIgTGNV0=;
	b=FJZP8/EgQ7xMcXbAUT+/20hSoAeGizBZEYJ66fYuSUIHtExDdEN4Kjs8speZyhv6gq
	GkqvfbVcDKCVEnkk4JRpH4eCPzy/2xrOsGfxWaNDFQXisTsXrX2VxADS5Yr6H6ZnZcKL
	jGIZTRfbxkUo8FKgu+uvMo6PIhGGmDPnpC903rVEur2O8BWTLtrw4s+BuuX62gs6icRp
	Dr3GyPKJ1AXvu/S2+sWLZbc8+gf/9r7UImEW2F9ZnbnoGTpGi0BaZDqSh3XiVPzt+aH6
	sZpcKTiZzqHwU9eHUpcHh/YDKAGzvC0elJoD0BIewkTDEzl8qt6CAsuP8cCXnZ0QaPv+
	OYww==
Received: by 10.68.226.129 with SMTP id rs1mr3129455pbc.29.1336523273171;
	Tue, 08 May 2012 17:27:53 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pl7sm3995496pbb.59.2012.05.08.17.27.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 17:27:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 17:27:36 -0700
Message-Id: <cover.1336522880.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH V2 0/3] Enable xserver-xorg for all qemumachines
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
X-List-Received-Date: Wed, 09 May 2012 00:37:46 -0000

XSERVER has a weak definition like below

meta/recipes-sato/tasks/task-core-x11-mini.bb:XSERVER ?= "xserver-kdrive-fbdev"
meta/recipes-sato/tasks/task-core-x11.bb:XSERVER ?= "xserver-kdrive-fbdev"

which means when we user ??= in qemu.inc it does not work since the
above definitions kick in before ??=

so for now we re-arrage inclusion of qemu.inc in x86 and x86-64
case so that the XSERVER definition from respective machine file
is preferred and for all other qemu machines the definition from
qemu.inc is used. Non qemu machines will still use kdrive
as they used to.

The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:

  kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/qemu-xserver-xorg
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-xserver-xorg

Khem Raj (3):
  qemumachines: Enable xserver-xorg as default xserver
  xserver-xf86-config: Add xorg.conf for arm,mips,ppc,sh qemu machines
  xserver-xorg: Fix build on powerpc

 meta/conf/machine/include/qemu.inc                 |    9 ++-
 meta/conf/machine/qemux86-64.conf                  |    3 +-
 meta/conf/machine/qemux86.conf                     |    3 +-
 .../xserver-xf86-config/qemuarm/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips/xorg.conf         |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips64/xorg.conf       |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemuppc/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemush4/xorg.conf          |   69 ++++++++++++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 ++-
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 +++++++++
 11 files changed, 396 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch

-- 
1.7.5.4



