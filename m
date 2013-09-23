Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7768610FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 03:55:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8N3tmM1012691
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Sep 2013 20:55:48 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 22 Sep 2013 20:55:48 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 22 Sep 2013 23:55:44 -0400
Message-ID: <ae57c9e065b10894c9d88607e95219650d8e4835.1379908369.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379908369.git.bruce.ashfield@windriver.com>
References: <cover.1379908369.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] kern-tools: fix multi patch application without headers
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
X-List-Received-Date: Mon, 23 Sep 2013 03:55:49 -0000
Content-Type: text/plain

Updating the kern-tools SRCREV to import the following change:

    kgit-s2q: always update ORIG_HEAD after applying changes

    In situations where git am fails to apply patches, and git apply is used,
    we must update ORIG_HEAD as well as HEAD. This is required, since if the
    next patch in the queue also fails git am application, it will reset to
    ORIG_HEAD before using git apply. If we haven't updated ORIG_HEAD, we'll
    end up warping back to the top of the branch each time.

This problem can only be seen in very specific situations, in particular if
a generated BSP branches from qemuppc, and has a series of non git "am able"
patches. We fail, since all of the qemuppc patches are not applied due to
the branch head constantly being reset.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 6cfb624..8c68ff3 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native"
 
-SRCREV = "9bbdd79086c164c82e4f982cbc3eb0b697ba651d"
+SRCREV = "a42509b01ccfe5020a226b23d3a52c07b3fb2051"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
1.7.10.4


