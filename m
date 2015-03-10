Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5929739CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:25:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2A9Prs0014717
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 02:25:53 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 02:25:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Mar 2015 02:25:52 -0700
Message-ID: <30f590c7e3d62ff1adb5d6b14fe0dca71f555f5f.1425979509.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425979509.git.liezhi.yang@windriver.com>
References: <cover.1425979509.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] btrfs-tools: workaround DEBUG_BUILD for arm
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
X-List-Received-Date: Tue, 10 Mar 2015 09:25:51 -0000
Content-Type: text/plain

Workaround when:
MACHINE = "qemuarm"
DEBUG_BUILD = "1"

Errors:
{standard input}: Assembler messages:
{standard input}:3383: Error: invalid operands (.text and *UND* sections) for `-'
{standard input}:3389: Error: invalid operands (.text and *UND* sections) for `-'
make: *** [cmds-fi-disk_usage.o] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../btrfs-tools/btrfs-tools_git.bb                 |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index d86075c..382ee7c 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -28,3 +28,10 @@ do_install () {
 }
 
 BBCLASSEXTEND = "native"
+
+# Workaround when DEBUG_BUILD:
+# {standard input}: Assembler messages:
+# {standard input}:3383: Error: invalid operands (.text and *UND* sections) for `-'
+# {standard input}:3389: Error: invalid operands (.text and *UND* sections) for `-'
+# make: *** [cmds-fi-disk_usage.o] Error 1
+CFLAGS_append_arm = " -O2"
-- 
1.7.9.5


