Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CEDD872646
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:35:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0R5ZJsi026035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:35:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 26 Jan 2015 21:35:19 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 13:35:23 +0800
Message-ID: <c15af3e02cb5027fb7eb2aaebf72a5f2bf016d23.1422336778.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422336778.git.Qi.Chen@windriver.com>
References: <cover.1422336778.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] udev-cache: avoid using '-L' for stat
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
X-List-Received-Date: Tue, 27 Jan 2015 05:35:23 -0000
Content-Type: text/plain

stat command from stat package doesn't support '-L' option, so avoid
using it to get rid of boot errors like below.

Populating dev cache
stat: invalid option -- 'L'
Usage: stat [-l] [-f] [-s] [-v] [-h] [-t] [-c format] file1 [file2 ...]

[YOCTO #7210]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev/init       | 2 +-
 meta/recipes-core/udev/udev/udev-cache | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 94dbba3..0ab028b 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -29,7 +29,7 @@ META_FILE_LIST="lib/udev/rules.d/* etc/udev/rules.d/*"
 # Command to compute system configuration.
 sysconf_cmd () {
 	cat -- $CMP_FILE_LIST
-	stat -L -c '%s %Y %n' -- $META_FILE_LIST | awk -F/ '{print $1 " " $NF;}'
+	stat -c '%s %Y %n' -- $META_FILE_LIST | awk -F/ '{print $1 " " $NF;}'
 }
 
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 895b197..df97000 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -32,7 +32,7 @@ META_FILE_LIST="lib/udev/rules.d/* etc/udev/rules.d/*"
 # Command to compute system configuration.
 sysconf_cmd () {
 	cat -- $CMP_FILE_LIST
-	stat -L -c '%s %Y %n' -- $META_FILE_LIST | awk -F/ '{print $1 " " $NF;}'
+	stat -c '%s %Y %n' -- $META_FILE_LIST | awk -F/ '{print $1 " " $NF;}'
 }
 
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
-- 
1.9.1


