Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3A277A42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 10:34:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2RAYiT9007593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 03:34:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 03:34:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Mar 2017 03:34:42 -0700
Message-ID: <2f711e48736f36ead014a28d077975ab457fae99.1490610854.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1490610854.git.liezhi.yang@windriver.com>
References: <cover.1490610854.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bitbake.conf: add sudo to HOSTTOOLS
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
X-List-Received-Date: Mon, 27 Mar 2017 10:34:43 -0000
Content-Type: text/plain

Fixed:
$ bitbake meta-ide-support
$ . ./tmp/environment-setup-i586-poky-linux
$ runqemu tmp/deploy/images/qemux86/core-image-sato-qemux86.qemuboot.conf

[snip]
/bin/sh: sudo: command not found
runqemu - ERROR - Failed to setup tap device. Run runqemu-gen-tapdevs to manually create.
[snip]

The qemu can start, but the IP was wrong, this patch fixes the problem.

[YOCTO #11232]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fa5445b65b..0b1d8d82e0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -468,6 +468,9 @@ HOSTTOOLS += " \
 # Tools needed to run testimage runtime image testing
 HOSTTOOLS += "ps stty ip ssh scp ping"
 
+# Tools needed by runqemu in meta-ide-support environment
+HOSTTOOLS += "sudo"
+
 # Link to these if present
 HOSTTOOLS_NONFATAL += "ccache ld.bfd ld.gold gcc-ar gpg sftp nc socat sudo"
 
-- 
2.11.0.rc2.dirty


