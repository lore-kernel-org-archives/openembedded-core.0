Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDB877E0D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:26 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y11so8128587pfm.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TeOVYa2ke0ygMV019630thbPdoF9ngN2F/c+BPPo8ok=;
	b=K9LGR8e52pTqgxXQAAuUTOL9lzOfST+Y7QGpx7bPep7+Zyw4gyoLlZc3SLY6Boi3xA
	MdfJEa6swwn4M4usAcLLrccPtgvH4C/6xGTquL3nztzVQGeDUdnh4zt6v9Yycda1p8vV
	f9/VKJYwgLyvXUXsUGTtRi+okzKpjKQJhzr4Y7Tg5Nj+JAWrRsvwg9nGrCUqPi9Vuepg
	0gNbWggyT+Yvp0LK6L7ffgFZzzYcJWx1OGvWAqRvKJ9RqMv4Rncm+tbPFV2oDeOeUyzs
	p4gg9C8cQQB6j4Oe3VarEW90xTiZ7P2tATy9wt/BtPm0E7DH4xIzWsbqB6iw82UGlJhD
	Ae1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TeOVYa2ke0ygMV019630thbPdoF9ngN2F/c+BPPo8ok=;
	b=ZW+j1SMfUQ4OTH2AR/n8M0AwozF7WtR0l0EaHjF0dNTW0/MJzBOAUTEYMnqGq6BVTC
	TFGxwlpPyXZGURFMy3uiQDSN09cZtdgMt6j/qKUAyuMNHp/VtNLb1WwDllSzxZATNim+
	nJPpq9mqwI7rE5DVColkPiUcOpWxAJL6J26dy/cPSneYmNbEZoL2XLLbRdsLc8jhyj2c
	8ahAS3wq55AjF5VQ7y5P6fmWZiBzo6pCBdjF9d+ZAkwWBizbc8bUYESinw6qNzRAiXTJ
	yUjuNZkoR77LP6ODsZFCiSeCGViLpoHTgKgFhY+23+3LVPyq3x26rCuMH5f2/ww/E9RE
	+/mg==
X-Gm-Message-State: APjAAAVNuyGrJr8GsDoIG7EDpgraAaT5FbRVTG6SnJFoKoukh+s23m57
	7YfaxgDLw2QUBSk3Mq0pU83NMgov
X-Google-Smtp-Source: APXvYqzAqIaurQ7fOEF5pchRE1R3VXkrItvT7L6whfZw0QQIDkyW6h3PkaABEz4XuVoD3rh8SEImXQ==
X-Received: by 2002:a63:6cc5:: with SMTP id
	h188mr17953234pgc.105.1558403007772; 
	Mon, 20 May 2019 18:43:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:09 -0700
Message-Id: <8e6adc82d944a8dc8061ccf27e077aca58732de1.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 07/15] oeqa/sdk: use bash to execute SDK test commands
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
X-List-Received-Date: Tue, 21 May 2019 01:43:27 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

The commands only work with with bash. If /bin/sh is
dash like in Debian, the command execution fails with
errors like:

Standard Output: /bin/sh: 5: export: --sysroot: bad variable name

and all SDK tests fail.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/sdk/case.py                  | 2 +-
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index d8611c8..5334237 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -9,7 +9,7 @@ from oeqa.core.case import OETestCase
 class OESDKTestCase(OETestCase):
     def _run(self, cmd):
         return subprocess.check_output(". %s > /dev/null; %s;" % \
-                (self.tc.sdk_env, cmd), shell=True,
+                (self.tc.sdk_env, cmd), shell=True, executable="/bin/bash",
                 stderr=subprocess.STDOUT, universal_newlines=True)
 
     def fetch(self, workdir, dl_dir, url, archive=None):
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 6fed73e..eafbd7a 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -42,7 +42,8 @@ class SDKBuildProject(BuildProject):
     def _run(self, cmd):
         self.log("Running . %s; " % self.sdkenv + cmd)
         try:
-            output = subprocess.check_output(". %s; " % self.sdkenv + cmd, shell=True, stderr=subprocess.STDOUT)
+            output = subprocess.check_output(". %s; " % self.sdkenv + cmd, shell=True,
+                                             executable='/bin/bash', stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as exc:
             print(exc.output.decode('utf-8'))
             return exc.returncode
-- 
2.7.4


