Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 02C9E72E63
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:32 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id eu11so10695800pac.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+vti5p3a4kPMrygBX5wJvzp1w5m6ygvMZh4A6H0daL0=;
	b=ymJsB3+wZCT0W9uY9GKbXYlx73W1iKyI1Dpim9zIiGo7THA0nPPyziiXRBhBiana2i
	6+fSO3YU0dolwzGkSs5+QrS6ynvrAcdfEiI3ktoITr6VPeMBiMNVhjbg1SslFd5Y/YIJ
	3a8BD/t8z7qm6rIxbR5G+zCDC3MVk0jzMf0zQjIOaLsxGNf2A+p97BqQ51QdU8a3hHl3
	ap79Mo0T7wlMWw0jTs41IQS8pTPEO+iTBS3Y1ACwgBeoapr6A1uE3zJaNkHzj4fKFr9/
	sGUB374sXu/o9nP/XDEhIeuLVLNEtZyXyOU7ypEyGcRlNN4rDlP5kh59eV4B7ORuT37K
	2y4A==
X-Received: by 10.70.118.74 with SMTP id kk10mr6990670pdb.8.1423152334392;
	Thu, 05 Feb 2015 08:05:34 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:48 -0800
Message-Id: <39f918926ea14446ae81d93447909269365c13d4.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 40/61] gcc/libgcc-common.inc: Add missing 'fakeroot' to two tasks
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:33 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Without the fakeroot flag the two tasks may create files or
symbolic links that end up being owned by the user and not
root:root as expected.

(From OE-Core rev: 7e9fd9d34a540fdfc1243d059d1f13f1d09864d2)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index 1e1e1c1..3101762 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -54,7 +54,7 @@ addtask multilib_install after do_install before do_package do_populate_sysroot
 # by creating this symlink to it
 #    /usr/lib64/x86_64-poky-linux/4.7/32
 
-python do_multilib_install() {
+fakeroot python do_multilib_install() {
     import re
 
     multilibs = d.getVar('MULTILIB_VARIANTS', True)
@@ -117,7 +117,7 @@ python do_multilib_install() {
 }
 
 addtask extra_symlinks after do_multilib_install before do_package do_populate_sysroot
-python do_extra_symlinks() {
+fakeroot python do_extra_symlinks() {
     targetsysnoext = d.getVar('TARGET_SYS_NO_EXTENSION', True)
 
     if targetsysnoext != d.getVar('TARGET_SYS', True):
-- 
1.9.1


