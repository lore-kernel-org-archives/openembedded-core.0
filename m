Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48BD17740A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 06:15:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u866F75a024554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2016 23:15:07 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 5 Sep 2016 23:15:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Sep 2016 23:15:05 -0700
Message-ID: <e605fb92782aedd4c5a7f577cfe83e5e68e50c16.1473142439.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473142439.git.liezhi.yang@windriver.com>
References: <cover.1473142439.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [master-next] [PATCH 1/1] qemuarm.conf: set PREFERRED_VERSION_linux-yocto
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
X-List-Received-Date: Tue, 06 Sep 2016 06:15:08 -0000
Content-Type: text/plain

The base_version_less_or_equal() will raise errors if
PREFERRED_VERSION_linux-yocto is None. For example, when we build
DISTRO = "nodistro", PREFERRED_VERSION_linux-yocto is not be defined
since it is defined in poky.conf, and then bitbake will
choose the higher version which is 4.8 currently, so set
PREFERRED_VERSION_linux-yocto to 4.8, otherwise, runqemu can't boot it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/qemuarm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 3ca4d6e..4c5891a 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -15,4 +15,5 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
+PREFERRED_VERSION_linux-yocto ??= "4.8%"
 QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
-- 
2.9.0


