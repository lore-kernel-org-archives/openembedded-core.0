Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTv-0000TG-CY
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56k1f000730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:46 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:45 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:37 -0500
Message-ID: <df28843b15183bb8f349f0d68085baac03e4af89.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361940628.git.bruce.ashfield@windriver.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] kern-tools: import configuration, controls and audit updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 05:23:27 -0000
Content-Type: text/plain

Updating the kern-tools SRCREV to import the following fixes:

  commit 7f91d198d32fc90260e52724ef4aac0b997c1e8b

    kconf_check: fix new Kconfig detection

    One of the functions of the kernel configuration audit is to notify
    the user if Kconfig* files have been removed from the kernel, and
    also to notify of new Kconfig files.

    New Kconfig files should be classified as hardware or non-hardware to
    allow BSP audits to notify if boards are setting values that they
    shouldn't, hence why notifying about new "buckets" is important.

  commit c4f26a3296e0e1c3dbdd5ec8e2947d5443a9ffc2

    updateme/scc: allow config fragment exclusion

    It is common to need the features (patches, git operations) of a
    branch, but not want the kernel configuration fragments of a given
    branch. To allow this, we provide a new include flag "nocfg".

    When this flag is used, all of the configuration fragments included
    by the targetted feature will not be applied to the current build,
    with one exception, a base/critical fragment can force it's config
    values, since without them, the system would not be functional.

    Example:

       include ktypes/standard/standard.scc nocfg

  commit c7ec19d55aca6c4b17073c5362fce5be61a89d82

    scc: wrap git merge

    To allow for parameter validation and sanity checking, wrap "git merge"
    as a dedicated "merge" command instead of using the raw git fallback.

    This also makes it consistent with existing top level commands such
    as  'tag', 'branch', 'patch', etc.

    There are no changes to arguments, and existing 'git merge' commands
    continue to work with this change.

[YOCTO #3419]
[YOCTO #3421]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 98cd8b9..9f4438c 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "9284af9b968d40e441b10f5c09961cbe329ccb9b"
+SRCREV = "7f91d198d32fc90260e52724ef4aac0b997c1e8b"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.10.4



