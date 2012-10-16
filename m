Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TNyJR-000626-2x
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 05:59:25 +0200
Received: by mail-gh0-f175.google.com with SMTP id z2so1604700ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2012 20:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=aZBzDbpQsD8+ys5wwQ7eX6Qmm3Yx5fTZXCLmixSb9sU=;
	b=R8CTVN7WN194Fd/wbzGhHj5DdDFFyU89Waryc1FkwJhf1pGY5N0c6MrMS0SW21d97K
	vV3q5ivlgKiGpbujY+9GQKfXyg79LFb/xU5EXKQyL/eVMkuZyKKjxQqTQK4TollSbCzb
	fXiGRtihEc0SlpguAaKxGK3AOfUGEJfTUbH2woSIbHNP8N9DWgG2Jvi9E34dYljO6FMz
	Zt+/SG3wfmof7SekUfcPNpEG8GXiam9UIC7xRsYZSE4lynVCYrrE6K2tixJGtdqFzMb1
	MIldzsn60ZWtAn5Te10Aie2vxYCcfLV2HhNF8CodlqNNacQLsRAP3lmcWiw2f/0RqntV
	DZjg==
Received: by 10.101.50.8 with SMTP id c8mr3929411ank.9.1350359168277;
	Mon, 15 Oct 2012 20:46:08 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id j8sm13905580ann.3.2012.10.15.20.46.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Oct 2012 20:46:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2012 00:45:57 -0300
Message-Id: <1350359157-6110-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] buildhistory.bbclass: Fix hostname print for 'No changes' case
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
X-List-Received-Date: Tue, 16 Oct 2012 03:59:25 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 49f2ea5..0a5753f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -403,9 +403,9 @@ END
 		fi
 		# Check if there are new/changed files to commit (other than metadata-revs)
 		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
+		HOSTNAME=`hostname 2>/dev/null || echo unknown`
 		if [ "$repostatus" != "" ] ; then
 			git add .
-			HOSTNAME=`hostname 2>/dev/null || echo unknown`
 			# porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
 			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
-- 
1.7.2.5



