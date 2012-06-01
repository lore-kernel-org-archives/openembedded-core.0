Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaHK2-00034k-Vn
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 04:10:39 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so2151336dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 19:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=eY2EEDcwsNjN15x8IfclKTFpF2l+eog2eW+8CLLVRZE=;
	b=MHoYtUMo2onxqrtrLyJ//z80XuS2MDdlThsB5TrvKoz5OVHALZh2J1wSPf5KbAWFsc
	mm6jcsCSiT7QSXwKpuaClVMNxRX1zL5D4k5/q7DJXAMJhPBMkiRTzYSRSB2jHGZROVTN
	kW6unQ6w8SHBR7DtxaDjhPaC1/AaP4+dcn/5d0JEoXfHMewmJjnRsEZbwPS1H5n0RnRe
	otXOfgLq425n5KbcehHJb0kd8zDLnzAHRndMevJqbFa3UgN0Enn9BgSyHSMcpVvVhe1h
	ENTzUBSWyJuklNxOUF8zfLkbOS8bftjQSawRn3p8T2aJQwIBY1qz034wYn3OODPwfJPI
	4rYg==
Received: by 10.68.236.129 with SMTP id uu1mr5264927pbc.77.1338516020448;
	Thu, 31 May 2012 19:00:20 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id tk1sm994850pbc.8.2012.05.31.19.00.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 19:00:19 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2012 19:00:05 -0700
Message-Id: <db4b4b5e8d88bce06edb9b53e296f8cb31c89db4.1338515870.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.10.3
In-Reply-To: <cover.1338515870.git.chris_larson@mentor.com>
References: <cover.1338515870.git.chris_larson@mentor.com>
In-Reply-To: <cover.1338515870.git.chris_larson@mentor.com>
References: <cover.1338515870.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] tcmode-external-sourcery: pass -msgxx-glibc for x86
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
X-List-Received-Date: Fri, 01 Jun 2012 02:10:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is needed to work around an issue with the toolchain search paths. It can
pick up the wrong features.h without it, it seems, even with the system32
symlink in the oe sysroot. Investigate this further in the future.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../distro/include/tcmode-external-sourcery.inc    |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
index d5abc16..834a4d9 100644
--- a/meta/conf/distro/include/tcmode-external-sourcery.inc
+++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
@@ -56,11 +56,8 @@ EXTERNAL_TOOLCHAIN_SYSROOT ??= "${@exttc_run(d, EXTERNAL_TOOLCHAIN_SYSROOT_CMD)}
 # These bits are here temporarily to sidestep the need to use a separate set
 # of tune files to pass the appropriate multilib selection arguments to the
 # sourcery toolchain, as is needed to extract the sysroot content.
-CSL_MULTILIB_ARGS[i586] = "-msgxx-glibc"
-CSL_MULTILIB_ARGS[i686] = "-msgxx-glibc"
-CSL_MULTILIB_ARGS[core2] = "-msgxx-glibc"
-CSL_MULTILIB_ARGS[x86] = "-msgxx-glibc"
-CSL_MULTILIB_ARGS[x86-64] = "-msgxx-glibc"
+TUNE_CCARGS_append_x86 = " -msgxx-glibc"
+
 CSL_MULTILIB_ARGS[ppce500] = "-te500v1"
 CSL_MULTILIB_ARGS[ppce500mc] = "-te500mc"
 CSL_MULTILIB_ARGS[ppce500v2] = "-te500v2"
-- 
1.7.4.1



