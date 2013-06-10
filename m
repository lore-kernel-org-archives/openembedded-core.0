Return-Path: <kergoth@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1D98F6A9CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:47:47 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id k14so6500224oag.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+R3J1onsN/KrtKiX3Vjg4gWZefe5cD50dbk2uInuVao=;
	b=DZTQlSvWqHYrolW2GiprC2JvrGTC7XAo4toF8azUYoBes4sTogf670UarYghFdw2o2
	QLyo1/NPRoTfPTrbgs3Nvb4wuqcrOgPrzBeevfZ41chZhskHrD3vLS1ZIjFbLLbvo/MM
	QbLd/Nob1zSKLaX6mv0s3Z+iQs/kbOd9iBk7eSKA394KCQA0rXwsoBBvvLajeRYO6SZD
	MZL+WDwz9RLPTmk7ct++H2n6+y91l1TDdU2kjcoFSmiBLTc/XmZXp9PbnYsg+HnJ3bXY
	M0C0ekFNsjRW7oZe/y7rKqCqUWW9oBy/TlVA8VywwRr0bjzHUDuVlGhUBECSb7KA+7ac
	+TxA==
X-Received: by 10.60.133.109 with SMTP id pb13mr9483280oeb.26.1370897267992;
	Mon, 10 Jun 2013 13:47:47 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id kz3sm24258712obb.6.2013.06.10.13.47.46
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:47:47 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:47:07 -0700
Message-Id: <5af88b588ebad66b9e123e80c745be0210eee9f0.1370896990.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] insane.bbclass: quiet package errors not in *_QA
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
X-List-Received-Date: Mon, 10 Jun 2013 20:47:47 -0000

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


