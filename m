Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 898F57328A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 23:24:08 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id vv3so7398192pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=y1YGsn3esR2nSvmbCiTUAZd0vBhHEel86Ciyzoggapw=;
	b=u+QnBQ410lztvte81/7NaHwqMIh4wxTCe4H18tGJ/o98RIru5peWrPzQUFrYkqoE4h
	Ck8DlHGlu6ds5jJyMc515qtgAvURp1NJa0eNslXFl9O12UMFLldvaR5JT0qgf3pVQFb9
	exrI4LJqEypk0UpEAGp3+3RXrZGIuWRZ0OUKa9EUf7V3b1n4NTD5FAU0WzVhwylHyRm7
	J2+JfpO+bncXygCPZ6q10mFTyomws/xabj1WP6jA++dqqZIvzGR4YZPjDIi9ZRKU/5CP
	DBfIKb/3uL1h2A6R2t10aWj4t7TnSnt/rgxYqY1Vevnh7EWUogM59sPF5LEjU7k2iA+u
	G5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=y1YGsn3esR2nSvmbCiTUAZd0vBhHEel86Ciyzoggapw=;
	b=G5wqeOZVvNssJPuFi8hWPMnVYa6NnDt9CrFYWm16CMcbVE07b46YC7kvkbJPwzfW1J
	svJj8lTjfufst483ZT3EHHDMJVmssLN51fpA59fZ2fvBEax9n8HKd+nv17XlbbhhYpTx
	qkbZ6aiy54A8YViudmCNkomiEkZhUOkS2ne5EnpPFU7i7NHL0Fg9djgxcRPlA25OkgVf
	gfAauI5dPpj43WQehuHV8VyQVDKt4xOjqBQv8IJJxeL2i7pfzkTVpgxQetAgepV4ALhx
	ZvoCl5m2TTlqxYwJV11YvNDDHiipLIXCyjdGZYTNTICtpzAQEevkSIzPcpqFsqZNIzhY
	b99A==
X-Gm-Message-State: AOPr4FWzFfvQL7NUJUkMRG6DD9ZEsgbM+d0YIEiPPB77/sbNsE1/E2dXPIepon3vpTx79w==
X-Received: by 10.66.250.132 with SMTP id zc4mr16047773pac.130.1461799449056; 
	Wed, 27 Apr 2016 16:24:09 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yl5sm9554679pac.38.2016.04.27.16.24.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 16:24:07 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:23:59 -0700
Message-Id: <ade6c1ed288e2108d8df1555ce95a06b9329946e.1461790921.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <126ec11f40f6758d062fe7ec7da23ee247752960.1461790921.git.chris_larson@mentor.com>
References: <126ec11f40f6758d062fe7ec7da23ee247752960.1461790921.git.chris_larson@mentor.com>
In-Reply-To: <cover.1461790921.git.chris_larson@mentor.com>
References: <cover.1461790921.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][PATCH 2/4] scripts/lib/argparse_oe: show subparser help for unrecognized args
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
X-List-Received-Date: Wed, 27 Apr 2016 23:24:09 -0000

From: Christopher Larson <chris_larson@mentor.com>

As an example, `recipetool create foo bar baz` shows `recipetool: error:
unrecognized arguments: bar baz` and then displays the main help, not the help
for the create command. Fix by saving the subparser name and using it in
parse_args() to look up the subparser.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/argparse_oe.py | 49 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index 95b42e7..75002d0 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -27,15 +27,20 @@ class ArgumentParser(argparse.ArgumentParser):
 
     def error_subcommand(self, message, subcommand):
         if subcommand:
-            for action in self._actions:
-                if isinstance(action, argparse._SubParsersAction):
-                    for choice, subparser in action.choices.items():
-                        if choice == subcommand:
-                            subparser.error(message)
-                            return
+            action = self._get_subparser_action()
+            try:
+                subparser = action._name_parser_map[subcommand]
+            except KeyError:
+                self.error('no subparser for name "%s"' % subcommand)
+            else:
+                subparser.error(message)
+
         self.error(message)
 
     def add_subparsers(self, *args, **kwargs):
+        if 'dest' not in kwargs:
+            kwargs['dest'] = '_subparser_name'
+
         ret = super(ArgumentParser, self).add_subparsers(*args, **kwargs)
         # Need a way of accessing the parent parser
         ret._parent_parser = self
@@ -48,6 +53,38 @@ class ArgumentParser(argparse.ArgumentParser):
     def add_subparser_group(self, groupname, groupdesc, order=0):
         self._subparser_groups[groupname] = (groupdesc, order)
 
+    def parse_args(self, args=None, namespace=None):
+        """Parse arguments, using the correct subparser to show the error."""
+        args, argv = self.parse_known_args(args, namespace)
+        if argv:
+            message = 'unrecognized arguments: %s' % ' '.join(argv)
+            if self._subparsers:
+                subparser = self._get_subparser(args)
+                subparser.error(message)
+            else:
+                self.error(message)
+            sys.exit(2)
+        return args
+
+    def _get_subparser(self, args):
+        action = self._get_subparser_action()
+        if action.dest == argparse.SUPPRESS:
+            self.error('cannot get subparser, the subparser action dest is suppressed')
+
+        name = getattr(args, action.dest)
+        try:
+            return action._name_parser_map[name]
+        except KeyError:
+            self.error('no subparser for name "%s"' % name)
+
+    def _get_subparser_action(self):
+        if not self._subparsers:
+            self.error('cannot return the subparser action, no subparsers added')
+
+        for action in self._subparsers._group_actions:
+            if isinstance(action, argparse._SubParsersAction):
+                return action
+
 
 class ArgumentSubParser(ArgumentParser):
     def __init__(self, *args, **kwargs):
-- 
2.8.0


