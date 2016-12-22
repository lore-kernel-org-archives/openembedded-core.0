Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 958B2774F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:20:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2016 18:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="1102758800"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2016 18:20:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 15:19:56 +1300
Message-Id: <fc6a2fc60d142a7c56bde2a86b172da7ff5f40cd.1482373109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482373109.git.paul.eggleton@linux.intel.com>
References: <cover.1482373109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/package_rpm: handle square brackets in filenames
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
X-List-Received-Date: Thu, 22 Dec 2016 02:20:10 -0000

When constructing a spec file we list files and directory paths in the
%files section. If ] or [ characters are in a file or directory name,
rpm treats them as wildcards which will mean it won't properly match the
filename. Instead, transform these into an ? wildcard so they don't
cause a problem.

(This fixes packaging the npm package "file-set" and anything that
happens to depend upon it, since it includes tests with files that
contain unusual characters including ] and [).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 638cc1b..b9f049e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -197,6 +197,8 @@ python write_specfile () {
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
             path = path.replace("%", "%%%%%%%%")
+            path = path.replace("[", "?")
+            path = path.replace("]", "?")
 
             # Treat all symlinks to directories as normal files.
             # os.walk() lists them as directories.
@@ -216,6 +218,8 @@ python write_specfile () {
                     if dir == "CONTROL" or dir == "DEBIAN":
                         continue
                     dir = dir.replace("%", "%%%%%%%%")
+                    dir = dir.replace("[", "?")
+                    dir = dir.replace("]", "?")
                     # All packages own the directories their files are in...
                     target.append('%dir "' + path + '/' + dir + '"')
             else:
@@ -230,6 +234,8 @@ python write_specfile () {
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
                 file = file.replace("%", "%%%%%%%%")
+                file = file.replace("[", "?")
+                file = file.replace("]", "?")
                 if conffiles.count(path + '/' + file):
                     target.append('%config "' + path + '/' + file + '"')
                 else:
-- 
2.5.5


