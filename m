Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA6373D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 19:21:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8IJLeSN017297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Sep 2015 12:21:41 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 18 Sep 2015 12:21:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 18 Sep 2015 15:21:38 -0400
Message-ID: <94f04a92be272ebac0ac9d162d8b9de6f72e3bf2.1442603150.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442603150.git.bruce.ashfield@windriver.com>
References: <cover.1442603150.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kern-tools: optimize patching peformance
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
X-List-Received-Date: Fri, 18 Sep 2015 19:21:45 -0000
Content-Type: text/plain

Updating the kern-tools SRCREV to integrat the following commit:

    patching: only validate user supplied patches by default

    Previously the patching tools would consider both system and user
    supplied patches in the same manner .. they are simply a series of
    patches to be applied to a branch, and that the scripts should determine
    where in the series to start (based on what is already on the
    branch).

    This detection was causing a few problems:

      - time consuming
      - starting in the middle of a series when intermediate patches
        were merged to a branch.

    To solve both the performance and start detection, we instead simply
    note the transition from system (i.e. already defined features and
    series) and user/recipe supplied patches. When the transition is noted,
    the system will start pushing ALL patches without doing autoresume
    detection.

    Control in keeping the series up to date is passed to the user, and
    consistent behaviour/performance is achieved.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 4753094aa40c..27df02ab7a44 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native"
 
-SRCREV = "bd144d43ca5b1eaf9e727bced4ce3b61b642297c"
+SRCREV = "b7642a7c3f685850ffbb961313e6a593adb05370"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.1.0


