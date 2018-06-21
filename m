Return-Path: <kergoth@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E654077BD2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:07:49 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id z1-v6so1953864pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iUNwyW+hWil8yjnFA5NFNeCrTbzqBnLTUo51AJZSDRQ=;
	b=NVvWwvU9wg9TzsUCPQWGkM9eZfM2LoTjTx+pnPHWa3aoM1fxazyM3iaknOdyIAGVdF
	zZ1MNP9xrMt0+oarXX0/i5DAbmLLaPVeznItegPS0fMa59u6FK0Wdp+hddLoZXNhi0zt
	jFlCNIR44cIEUZ+HGHeTqKh1BYn0Tc6xvCSY7IcszQkc6IdhKa5cb6ETJOYqUR0v9Axy
	bxxa8+sxTyKhrxdbTpgCwnQJwjOV1RaQAnVcIQaww3Y26Iufahx7jTgThJjhlvtmYRTV
	iO4X8HM9FmWzt5q+6fdRjh/2tFIkEq18FT90FtgEBjn/LGG5xojONYpmJqw3x/vIckgl
	Qvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iUNwyW+hWil8yjnFA5NFNeCrTbzqBnLTUo51AJZSDRQ=;
	b=HNEMXuPP5d2GdFgd++WDHnu7cm+/+GAp6dNvac/nf18a9cQDxWh390j4RPWcwo9fX0
	d7Y3VqzoThWE7x6VkQU1Z7sy5YhVOKK4ljr38lJPGPD7xYwmYrB6PSvm+LPtS8AanNk4
	/7ux0ioogxQwpcjarz5/JM8sRhX0l3WHRAjaso+J+VQnFs5mj/q9ExfAxs8yQfw6HRCo
	fbNs9wa8nyYrbf6UVb8Fpq4LIH25lUrA/axowul9JqXQ5o/w3xbJvXsHQBsOwwKlImlK
	a7X2RrO/3gyvPq+VARAFZc8AGOi/paIKZpZZqnx4chzMktc16lbkkAdtT2tuyeCMpBCR
	CtGg==
X-Gm-Message-State: APt69E23wDlk+qXqfyBd3tGqk6c3cUAIKe39/jhim3YauI+Vbv9WH5dw
	GNOC1N8H4ZSaO+QZm0VSXixY/DUz
X-Google-Smtp-Source: ADUXVKInlhvpKsg1QGLLdbPlNpZIo+FqfpMY/2xNyq4MexVdlmDLOJ8W3PC+qe7jHdPF1i9bf7hPtA==
X-Received: by 2002:a65:4308:: with SMTP id
	j8-v6mr23793620pgq.351.1529615270785; 
	Thu, 21 Jun 2018 14:07:50 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm8448499pga.21.2018.06.21.14.07.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:07:49 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:07:31 +0500
Message-Id: <dc42596e94fa1548971c5e4fe703eea79d5f2dfb.1529604086.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529604086.git.chris_larson@mentor.com>
References: <cover.1529604086.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/6] oe.scriptutils.run_editor: ditch the error-prone argument quoting
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
X-List-Received-Date: Thu, 21 Jun 2018 21:07:50 -0000

From: Christopher Larson <chris_larson@mentor.com>

Rather than trying to construct a string by quoting the files in an
error-prone way, parse $EDITOR to pass a list to subprocess rather than
a string.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/scriptutils.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 85b1c949bf5..470f76995f0 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -15,16 +15,17 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
-import sys
-import os
-import logging
-import glob
 import argparse
-import subprocess
-import tempfile
-import shutil
+import glob
+import logging
+import os
 import random
+import shlex
+import shutil
 import string
+import subprocess
+import sys
+import tempfile
 
 def logger_create(name, stream=None):
     logger = logging.getLogger(name)
@@ -214,15 +215,14 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
 
 def run_editor(fn, logger=None):
     if isinstance(fn, str):
-        params = '"%s"' % fn
+        files = [fn]
     else:
-        params = ''
-        for fnitem in fn:
-            params += ' "%s"' % fnitem
+        files = fn
 
     editor = os.getenv('VISUAL', os.getenv('EDITOR', 'vi'))
     try:
-        return subprocess.check_call('%s %s' % (editor, params), shell=True)
+        print(shlex.split(editor) + files)
+        return subprocess.check_call(shlex.split(editor) + files)
     except subprocess.CalledProcessError as exc:
         logger.error("Execution of '%s' failed: %s" % (editor, exc))
         return 1
-- 
2.11.1


