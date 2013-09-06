Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CED7B61867
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 19:47:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r86JlX3p003347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Sep 2013 12:47:33 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 6 Sep 2013 12:47:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Sep 2013 15:47:29 -0400
Message-ID: <fc8a99ffc3974a5cb2b6d12a5a95d019f15c5f22.1378496685.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378496685.git.bruce.ashfield@windriver.com>
References: <cover.1378496685.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kern-tools: support no author patches
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
X-List-Received-Date: Fri, 06 Sep 2013 19:47:34 -0000
Content-Type: text/plain

Updating the kern-toosl SRCREV to pick up the following fix:

    previous versions of the kern-tools supported the ability to import a bare
    patch, with no From: Subject: or other identifying fields that are typically
    in a full commit.

    The same type of commit with kgit-s2q will prompt for a author ID, just
    as git-quilt-import does. In build system environment that leads to an
    infinite loop and the commit is never pushed.

    To fix this issue, we add an interactive flag (-i), that when passed the
    prompt based behaviour is used. When it isn't passed (the default), the following
    name and email will be used for the git author:

       GIT_AUTHOR_NAME="invalid_git config"
       GIT_AUTHOR_EMAIL="<unknown@unknown>"

    And a bare/incomplete header patch will be applied.

[YOCTO #5100]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 2c82199..6cfb624 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native"
 
-SRCREV = "7fb05c54db4ce513fd961c5b71d85de5dafedb30"
+SRCREV = "9bbdd79086c164c82e4f982cbc3eb0b697ba651d"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
1.7.10.4


