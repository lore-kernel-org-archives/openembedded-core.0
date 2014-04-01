Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2E03A6F7CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:08:04 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id z6so9261718yhz.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=xrOLsIGZ9CjvnlZE2L22I2Yr2I1SnKHqTVMpQ6KAJSo=;
	b=xG9b8h9ndtCh1gL6mPAiv6D8Rd+cI2CQXNteu/g4MF0Ye5kbfGk6GD4TCXJU75TGEI
	/UF0/J7zQUkZ9HKVFIj2DhvxMfiKRpVjqEGYzBhFyJKAf3IX8C95VO8q9XpkxMtgU0p9
	wnTOIVBCU3JGW4kTt95sAuyt3wY31qPD8tjAgtN5gXKdzXYw5OIIu1ul/we0FjIcB4nD
	zSueYuYGBEihPqK5BAuSWhkIrbq7EsfgmZDCRdvpU2eb1hVeR9+Uf0EOpWALSthPYB7n
	FaEaITSUvWMW96b7u5J5UxD44CyZkSYJeanLVoZXP5YPeVCgM0UvWghA5fR1go0e//tf
	Kxog==
X-Received: by 10.236.151.83 with SMTP id a59mr46371136yhk.48.1396372085621;
	Tue, 01 Apr 2014 10:08:05 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	j76sm31320028yhi.33.2014.04.01.10.08.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:08:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 2299C19F8126A; Tue,  1 Apr 2014 14:08:01 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  1 Apr 2014 14:07:59 -0300
Message-Id: <1396372080-27607-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] oe.utils, utils.bbclass: Add any_contains and base_any_contains
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
X-List-Received-Date: Tue, 01 Apr 2014 17:08:07 -0000

This is similar to the contains but matches any of values. This is
useful to match for example several DISTRO_FEATURES which ought to
include a PACKAGECONFIG option.

For example:

PACKAGECONFIG ??= "${@base_any_contains('DISTRO_FEATURES', 'x11 wayland', 'gtk+', '', d)}"

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/utils.bbclass |  3 +++
 meta/lib/oe/utils.py       | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 0a533af..966eda1 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -26,6 +26,9 @@ def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
 def base_contains(variable, checkvalues, truevalue, falsevalue, d):
     return oe.utils.contains(variable, checkvalues, truevalue, falsevalue, d)
 
+def base_any_contains(variable, checkvalues, truevalue, falsevalue, d):
+    return oe.utils.any_contains(variable, checkvalues, truevalue, falsevalue, d)
+
 def base_both_contain(variable1, variable2, checkvalue, d):
     return oe.utils.both_contain(variable1, variable2, checkvalue, d)
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index defa536..029d713 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -54,6 +54,19 @@ def contains(variable, checkvalues, truevalue, falsevalue, d):
         return truevalue
     return falsevalue
 
+def any_contains(variable, checkvalues, truevalue, falsevalue, d):
+    val = d.getVar(variable, True)
+    if not val:
+        return falsevalue
+    val = set(val.split())
+    if isinstance(checkvalues, basestring):
+        checkvalues = set(checkvalues.split())
+    else:
+        checkvalues = set(checkvalues)
+    if checkvalues in val:
+        return truevalue
+    return falsevalue
+
 def both_contain(variable1, variable2, checkvalue, d):
     if d.getVar(variable1,1).find(checkvalue) != -1 and d.getVar(variable2,1).find(checkvalue) != -1:
         return checkvalue
-- 
1.9.1


