Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9D671979
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so5768762wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=L4hT31SIyjURmo5ODWABFntQo2qqgbLDb5JYF58i/Os=;
	b=CNRO52EkcfMW9JmqaDJmXpEDHuKIfMS4uwEF1TuYLUsx6Z7IRUKa9twwndpLJKXAOS
	YPvOgxJZxMQ1vC4GY5IoCdi3nIo+9AF2qp2212XnoLkeY79+pDWGMoPt695qrFl76XiH
	QP4hM3G07MhrA+ALxryop7dJ3SWbzvqjFixv1gJ+wTUoXdkimlW8qTcA2n/Lh3MaDDs3
	LGLxLMyATi/8f4Ni7to93yOgWBAwBf4rXyfEuUenV8noN1yARLaizbWuBilT6F4Sqh34
	XiU8EmCzMxHMj7YS3V64znj/Gy7tEvup/33q7RSEBeuVfl3KOh6K0ZhLldQYEDN9XTiW
	TrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L4hT31SIyjURmo5ODWABFntQo2qqgbLDb5JYF58i/Os=;
	b=GubCR9b7+2u/eU9c1ynObAD3PrhEhBM49HWm0bDu0VP4gxf2wX4Wyw1UIgx+z7W9sq
	pOUvJG6Dmrld9IXwL2WJQoleGXWmJwxdNg2BL45CJZbDArFoGRtshdTT9QdHnx++xtle
	MQxMDIIle7CcMNOcCY55ZbNQfPrb4sAEJ0rRA3Tyu5ncNEluu094aidwzt4iWZ5gXqvR
	+1mzuLSJYg0oHLdZk6Ha+A2zHMXS1O+jYJMks36GtnHAg3Y/F/1gF4IAICyYYHFS1XZf
	TQVPUvRqHNQZP4becWJ843c3Aj3WARwyKi7NyHZLThSSzCvHqH8A1MgP7jTnnw8upKw3
	UA/w==
X-Gm-Message-State: AA6/9Rle3EGg3oYYdJwYpigEaWToaCqsp3HOBb08DOPpI/ywPJK43JxcwWIk3xc6DOWknw==
X-Received: by 10.28.91.12 with SMTP id p12mr340980wmb.34.1475290063243;
	Fri, 30 Sep 2016 19:47:43 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:42 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:54 +0200
Message-Id: <1475290031-20568-6-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 05/22] useradd-staticids.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:42 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/useradd-staticids.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 46d4a4b..afb580a 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -16,7 +16,7 @@ def update_useradd_static_config(d):
             error(message)
 
         def error(self, message):
-            raise bb.build.FuncFailed(message)
+            bb.fatal(message)
 
     def list_extend(iterable, length, obj = None):
         """Ensure that iterable is the specified length by extending with obj
@@ -54,7 +54,7 @@ def update_useradd_static_config(d):
         # For backwards compatibility we accept "1" in addition to "error"
         if d.getVar('USERADD_ERROR_DYNAMIC', True) == 'error' or d.getVar('USERADD_ERROR_DYNAMIC', True) == '1':
             #bb.error("Skipping recipe %s, package %s which adds %sname %s does not have a static ID defined." % (d.getVar('PN', True),  pkg, type, id))
-            raise bb.build.FuncFailed("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
+            bb.fatal("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
         elif d.getVar('USERADD_ERROR_DYNAMIC', True) == 'warn':
             bb.warn("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
 
@@ -107,7 +107,7 @@ def update_useradd_static_config(d):
             try:
                 uaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
             except:
-                raise bb.build.FuncFailed("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
+                bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
 
             # Read all passwd files specified in USERADD_UID_TABLES or files/passwd
             # Use the standard passwd layout:
@@ -242,7 +242,7 @@ def update_useradd_static_config(d):
                 # If we're processing multiple lines, we could have left over values here...
                 gaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
             except:
-                raise bb.build.FuncFailed("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
+                bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
 
             # Read all group files specified in USERADD_GID_TABLES or files/group
             # Use the standard group layout:
-- 
2.7.4


