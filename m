Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id EE7C860C02
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Apr 2014 02:14:24 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so3655532yks.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 19:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=xmlQc0aZ8xRIJrn8aSAjUWPBQ7J4RVbg/l1/Dt2I000=;
	b=UQ3dmdzRpsdqns3Ui3E047reyMX+3DlXqdP78EcZiFqUM/Bo7ktLOwkG9OXzWB0wqL
	G/kcEbzmimtIC2w2uLGFoDL3yBConH26sR0eUByCL3CWJnUMfOwTIKzGFAgNDAiYtkfq
	dmXhbCmUiDiah+4RhR6ejo5XaE/J/pWDTA+vh6V9CJghqK2vV1DLp3AVio/Y5kEUs91d
	Hw+QhOoOKdwko11vDqC47K/krLqP8PGgQPQp5TaEFM29jxN/WBUO4kwVP/qfxkKc9pWz
	yrDLs9k8vjQvx5FJrsiwBy3EsBGvXQ3RCYMzpLB//L9y0ShVzujzHJ7bNoTM1nqIiuL+
	Z9Wg==
X-Received: by 10.236.78.168 with SMTP id g28mr161972yhe.157.1396664065111;
	Fri, 04 Apr 2014 19:14:25 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id n5sm18173596yhn.43.2014.04.04.19.14.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 19:14:24 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 23:14:09 -0300
Message-Id: <1396664051-11430-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
References: <1396664051-11430-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 1/3] wic: Move find_bitbake_env_line() to oe.misc
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
X-List-Received-Date: Sat, 05 Apr 2014 02:14:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move find_bitbake_env_line() since they're going to need to be
accessible from source plugins.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/image/engine.py      | 17 -----------------
 scripts/lib/mic/utils/oe/misc.py | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 0643780..311737a 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -60,23 +60,6 @@ def verify_build_env():
     return True
 
 
-def find_bitbake_env_lines(image_name):
-    """
-    If image_name is empty, plugins might still be able to use the
-    environment, so set it regardless.
-    """
-    if image_name:
-        bitbake_env_cmd = "bitbake -e %s" % image_name
-    else:
-        bitbake_env_cmd = "bitbake -e"
-    rc, bitbake_env_lines = exec_cmd(bitbake_env_cmd)
-    if rc != 0:
-        print "Couldn't get '%s' output." % bitbake_env_cmd
-        return None
-
-    return bitbake_env_lines
-
-
 def find_artifacts(image_name):
     """
     Gather the build artifacts for the current image (the image_name
diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
index 7ad3aa9..5436a0a 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -126,6 +126,22 @@ def set_bitbake_env_lines(bitbake_env_lines):
 def get_bitbake_env_lines():
     return __bitbake_env_lines
 
+def find_bitbake_env_lines(image_name):
+    """
+    If image_name is empty, plugins might still be able to use the
+    environment, so set it regardless.
+    """
+    if image_name:
+        bitbake_env_cmd = "bitbake -e %s" % image_name
+    else:
+        bitbake_env_cmd = "bitbake -e"
+    rc, bitbake_env_lines = exec_cmd(bitbake_env_cmd)
+    if rc != 0:
+        print "Couldn't get '%s' output." % bitbake_env_cmd
+        return None
+
+    return bitbake_env_lines
+
 def get_line_val(line, key):
     """
     Extract the value from the VAR="val" string
-- 
1.8.3.2


