Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99E52794F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 14:37:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7NEb11M016542
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Aug 2018 07:37:01 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 07:37:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 22:36:59 +0800
Message-ID: <1535035019-36956-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] git: create symlink rather than hardlink between bin/ and libexec/
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
X-List-Received-Date: Thu, 23 Aug 2018 14:37:01 -0000
Content-Type: text/plain

In package.bbclass, the split_and_strip_files processes debug splitting,
if two hardlinks locate in different dirs, one of them could not
find separated debug info file
[snip]
$ readelf --debug-dump /usr/libexec/git-core/git-add
Contents of the .gnu_debuglink section:

  Separate debug info file: git

$ gdb --quiet /usr/libexec/git-core/git-add
Reading symbols from /usr/libexec/git-core/git-add...(no debugging symbols found)...done.
[snip]

Define INSTALL_SYMLINKS to have everything that can be symlinked between
bin/ and libexec/ to use relative symlinks between the two. It workarounds
the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/git/git_2.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git_2.18.0.bb b/meta/recipes-devtools/git/git_2.18.0.bb
index 72b43a7..e95097e 100644
--- a/meta/recipes-devtools/git/git_2.18.0.bb
+++ b/meta/recipes-devtools/git/git_2.18.0.bb
@@ -3,7 +3,7 @@ require git.inc
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
                  "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
+EXTRA_OEMAKE += "NO_GETTEXT=1 INSTALL_SYMLINKS=1"
 
 SRC_URI[tarball.md5sum] = "3f210b2dd1613d90ded3b8732b052025"
 SRC_URI[tarball.sha256sum] = "94faf2c0b02a7920b0b46f4961d8e9cad08e81418614102898a55f980fa3e7e4"
-- 
2.7.4


