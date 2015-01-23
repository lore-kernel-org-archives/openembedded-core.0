Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD7F6AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 00:21:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0N0Llj0005153
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:21:47 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 Jan 2015 16:21:46 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 18:21:45 -0600
Message-ID: <1421972505-161759-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] gcc/libgcc-common.inc: Add missing 'fakeroot' to two tasks
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
X-List-Received-Date: Fri, 23 Jan 2015 00:21:49 -0000
Content-Type: text/plain

Without the fakeroot flag the two tasks may create files or
symbolic links that end up being owned by the user and not
root:root as expected.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index c81a80c..ab83013 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -52,7 +52,7 @@ addtask multilib_install after do_install before do_package do_populate_sysroot
 # by creating this symlink to it
 #    /usr/lib64/x86_64-poky-linux/4.7/32
 
-python do_multilib_install() {
+fakeroot python do_multilib_install() {
     import re
 
     multilibs = d.getVar('MULTILIB_VARIANTS', True)
@@ -115,7 +115,7 @@ python do_multilib_install() {
 }
 
 addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
-python do_extra_symlinks() {
+fakeroot python do_extra_symlinks() {
     targetsysnoext = d.getVar('TARGET_SYS_NO_EXTENSION', True)
 
     if targetsysnoext != d.getVar('TARGET_SYS', True):
-- 
1.9.3


