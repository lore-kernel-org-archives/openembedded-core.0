Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3B72C6A9A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:49:35 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 4so8024618pdd.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 18:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+R3J1onsN/KrtKiX3Vjg4gWZefe5cD50dbk2uInuVao=;
	b=V0vy7muuEeDKkmwnchAdESoPDWwavLPmJoLoIE85smq3J5xJwo1fzlKPflWvs1067v
	DOCsagEA4dDfGUySy9Lq3Y+BScO2R3XR0RMP3u7Yc9D/PlcYWJcgemd6vM4ROJE6HFkx
	eHojXz0UXiDcYOfE50kUM4SPxvMYF+MJpqU8Xbdt6Zi1Ra7jCqZ5AK5vB/pD1ImSv6XG
	IrzjU+eUi7RXkXf2KyIqbBJa9slkdL7gVsCq95NrMxe+XqvFL2WC9j9NIi1+If5LZkxB
	8uak/DzDt0E+9BFmNkyGNCIpUcX2ctFvQ0zyGgxs2ZCeQGBS43UKNiBwonfVwJJmW1q8
	2bIA==
X-Received: by 10.66.157.67 with SMTP id wk3mr16491692pab.88.1370915376662;
	Mon, 10 Jun 2013 18:49:36 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z19sm3388361paf.12.2013.06.10.18.49.34
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 18:49:35 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 18:49:33 -0700
Message-Id: <66bc155394de2e9d2625f08bff8893d9a3b79b3f.1370915304.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370915304.git.chris_larson@mentor.com>
References: <cover.1370915304.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370915304.git.chris_larson@mentor.com>
References: <cover.1370915304.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 3/4] insane.bbclass: quiet package errors not in *_QA
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
X-List-Received-Date: Tue, 11 Jun 2013 01:49:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

Currently, if a package QA type from package.bbclass is not listed in
ERROR_QA, it gets shown, regardless of whether it's in WARN_QA. This differs
from the behavior of the rest of the QA handling (which doesn't call
package_qa_handle_error at all if it's in neither _QA variable), and is
nonintuitive. Change this to use bb.note() if it's listed neither in ERROR_QA
nor WARN_QA, so it ends up in the task logs, but doesn't clutter up the user's
output.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/insane.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c091005..2b30538 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -143,9 +143,11 @@ def package_qa_handle_error(error_class, error_msg, d):
         bb.error("QA Issue: %s" % error_msg)
         d.setVar("QA_SANE", False)
         return False
-    else:
+    elif error_class in (d.getVar("WARN_QA", True) or "").split():
         bb.warn("QA Issue: %s" % error_msg)
-        return True
+    else:
+        bb.note("QA Issue: %s" % error_msg)
+    return True
 
 QAPATHTEST[libexec] = "package_qa_check_libexec"
 def package_qa_check_libexec(path,name, d, elf, messages):
-- 
1.8.3


