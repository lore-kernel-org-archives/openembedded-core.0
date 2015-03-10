Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B06F9739CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 10:11:03 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so8118973iec.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=joJNNLR8J7uF5WK2ZP4cK8nACtIkFTmWcFLjQnWKel4=;
	b=LnqTTkuQVlid9PX9ZbIglrTpihAiB8kmZ2J0nI14EjVA41OkeBDJnIMQ8BXU0UwLwv
	Mk4fk8uvnvf1jrzUlg7xAX2Zme5jmdQNvxoDtAV+s1imrb2p4A3JYwndh6VCYyELobYw
	7PAQJYGvdFrIEEJ+1FgEdac7aCsQHXtjk24KirqvQnmJSP5oBMbamqvkt/QFy2BVLF9Q
	FGrI5cSIMJIlKmht503LQvBkb2CUjE+fu/2q5Ae0Rub4qgfH+77pSzyYAjRgNBKbLBuy
	mBL4Y5r8sFvXOn+IdGUViSbFwoJIaHQofzV5rmqsUtm2ool3CnmDOaVbLh5/Ikr+yO2d
	DYpg==
X-Gm-Message-State: ALoCoQnycEuYQUgNLSa5FxvzkOFBGFsrPvQgXAK5FPTHNAW8d63Ay3y7029H1m4pVQPyXMLib7pg
X-Received: by 10.42.66.208 with SMTP id q16mr33310764ici.11.1425982264454;
	Tue, 10 Mar 2015 03:11:04 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8F5CE.dip0.t-ipconnect.de.
	[93.232.245.206])
	by mx.google.com with ESMTPSA id k9sm225110ige.6.2015.03.10.03.11.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 03:11:03 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 11:10:48 +0100
Message-Id: <1425982249-17652-2-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425982249-17652-1-git-send-email-patrick.ohly@intel.com>
References: <1425982249-17652-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH 1/2] combo-layer: runcmd() with separate output
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
X-List-Received-Date: Tue, 10 Mar 2015 10:11:03 -0000

Allow the caller to specify a separate output stream. stderr is always
a temporary file opened by runcmd(), so read from that to capture
output for error reporting *and* the return value.

The reasoning for the latter is a) that this preserves the traditional
behavior when out=None and b) if the caller wants the content of
stdout, it can read from the stream itself, which is not possible for
the temporary stderr.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 5f10e83..fb3fb50 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -149,23 +149,27 @@ class Configuration(object):
             logger.error("ERROR: patchutils package is missing, please install it (e.g. # apt-get install patchutils)")
             sys.exit(1)
 
-def runcmd(cmd,destdir=None,printerr=True):
+def runcmd(cmd,destdir=None,printerr=True,out=None):
     """
         execute command, raise CalledProcessError if fail
         return output if succeed
     """
     logger.debug("run cmd '%s' in %s" % (cmd, os.getcwd() if destdir is None else destdir))
-    out = os.tmpfile()
+    if not out:
+        out = os.tmpfile()
+        err = out
+    else:
+        err = os.tmpfile()
     try:
-        subprocess.check_call(cmd, stdout=out, stderr=out, cwd=destdir, shell=True)
+        subprocess.check_call(cmd, stdout=out, stderr=err, cwd=destdir, shell=isinstance(cmd, str))
     except subprocess.CalledProcessError,e:
-        out.seek(0)
+        err.seek(0)
         if printerr:
-            logger.error("%s" % out.read())
+            logger.error("%s" % err.read())
         raise e
 
-    out.seek(0)
-    output = out.read()
+    err.seek(0)
+    output = err.read()
     logger.debug("output: %s" % output )
     return output
 
-- 
2.1.4


