Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4B778801
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 07:46:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w197kVqO024574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Feb 2018 23:46:31 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.244) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 8 Feb 2018 23:46:23 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Feb 2018 15:49:32 +0800
Message-ID: <4a64681d801f0f424da0b53c921e55b5e63c1bca.1518162342.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1518162342.git.Qi.Chen@windriver.com>
References: <cover.1518162342.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: fix hostname conflict with other packages
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
X-List-Received-Date: Fri, 09 Feb 2018 07:46:30 -0000
Content-Type: text/plain

The hostname utility is also provided by busybox and net-tools. So
use alternatives mechanism to manage it in coreutils. Make its priority
higher than busybox. As hostname is not built by default for coreutils,
we make its priority lower than net-tools.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.29.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.29.bb b/meta/recipes-core/coreutils/coreutils_8.29.bb
index 8df8802..0b8acc5 100644
--- a/meta/recipes-core/coreutils/coreutils_8.29.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.29.bb
@@ -52,7 +52,7 @@ bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
 
 # hostname gets a special treatment and is not included in this
-base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
+base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname stat"
 
 sbindir_progs= "chroot"
@@ -95,6 +95,8 @@ do_install_append() {
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
+# Make hostname's priority higher than busybox but lower than net-tools
+ALTERNATIVE_PRIORITY[hostname] = "90"
 ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df"
 ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1  hostname.1"
 
-- 
1.9.1


