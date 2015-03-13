Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFBA73810
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:08 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so104875206iec.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=UgIx7wm3MtOSYs9sdFOuq6kF7jDTylogSzdJG0V4FTE=;
	b=XvpTr4Bsa1pCG3JOdve1sybcqL75/zSfueI63HK6b8FoIpRSJuWdi7REw8vxh6CYHa
	BAvPWZ3WPFZr2VNpU4slrN/L/GKjkugzaQjc6zjWbN9YzThy7e6eNygtpUOo/JISX6M6
	NQUx6GBwmEpvKfz/l0I1RjkHgumArxKci8HERWc5oINC0GNibBWufgJqNBgIV9C22rc+
	i+M0Tf9FWyHZqeBeGYMRhHPY3lKNGVQutG2H/cDqla63jokVUALF8aBIobbqzrGu3zMR
	TgOc83tBB/wJJC9hkYES6zZXdJl7xqJPN3bLWjaVLWOtpDwrr8Z5i8MUnFzQ7SLKjpAS
	RS0w==
X-Gm-Message-State: ALoCoQnWbrxrmsnvPm0hIaIlu04/rc0Bx0UBIuMl31c+1SymKvuK+9mv7f5+7ZGLkWyqlrtplrJw
X-Received: by 10.51.17.40 with SMTP id gb8mr83385059igd.44.1426253409280;
	Fri, 13 Mar 2015 06:30:09 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:08 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:32 +0100
Message-Id: <db472c3abdb97d71c6fd78273db5a63e6211ef33.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 03/11] combo-layer: runcmd() with separate output
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:08 -0000

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
index 62f2cf8..3ee9eb2 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -152,23 +152,27 @@ class Configuration(object):
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


