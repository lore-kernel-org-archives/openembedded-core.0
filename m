Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6259873F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 08:12:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4E8CBZ8013018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 01:12:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 01:12:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 May 2015 01:12:11 -0700
Message-ID: <1d5613e4fd152ea48562b919ef8e8970c63a18ce.1431591106.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431591106.git.liezhi.yang@windriver.com>
References: <cover.1431591106.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kernelshark: fix for rebuild
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
X-List-Received-Date: Thu, 14 May 2015 08:12:10 -0000
Content-Type: text/plain

Fixed when rebuild:
| NOTE: make prefix=/usr bindir_relative=bin libdir=lib NO_PYTHON=1 gui clean
| make: *** No rule to make target `sysroots/x86_64-linux/usr/lib/i586-poky-linux/gcc/i586-poky-linux/4.9.2/include/stddef.h', needed by `event-parse.o'.  Stop.
| ERROR: oe_runmake failed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/trace-cmd/kernelshark_git.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
index b2ef1fc..9deccae 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
@@ -16,8 +16,7 @@ EXTRA_OEMAKE = "\
     NO_PYTHON=1 \
     gui \
 "
-
-do_compile_prepend() {
+do_configure_prepend() {
     # Make sure the recompile is OK
     rm -f ${B}/.*.d
 }
-- 
1.7.9.5


