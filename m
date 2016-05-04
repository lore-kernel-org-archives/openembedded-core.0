Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B05970100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u44HrJTU012611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 4 May 2016 10:53:19 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:06 -0400
Message-ID: <9433e19b1bce00703d59be61875ab98217356c15.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] kern-tools: handle directories with, or without, trailing /
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
X-List-Received-Date: Wed, 04 May 2016 17:53:20 -0000
Content-Type: text/plain

Robert P. J. Day reported that configuration fragments and kernel
features were not being found when organized in a particular manner:

  linux
   - $BOARD
       - mm.patch
       - mm.scc
   - ssd_sil.cfg
   - ssd_sil.patch
   - ssd_sil.scc
   - uio.cfg
   .. etc

There was a bug in the tools that did not handle the mix of subdirs
properly and ended up leaving a trailing / on the elements *not* in
the $BOARD subdir. As a result, the configuration fragments were not
properly found when searching the include paths, and a configuration
failure was triggered (due to missing files).

This change tweaks the tools to always check a path with and without
a trailing / when processing config fragments so they can be later
found when processing the configuration of the kernel.

Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 445d03a876b4..c3ded983328d 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native"
 
-SRCREV = "17d89d1861b532bbf1a81c1f024953e440db8de7"
+SRCREV = "a6a6f6e1e738d2ecd26b675e9bec867105703416"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


