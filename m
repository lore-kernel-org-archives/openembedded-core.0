Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C8C64786B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 17:11:37 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v123so17277750wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=rwS3gMBXSDSCNwNkqFa9ZYCP+zssOoWps0H18efATNo=;
	b=hftL4mPU8ycqGB+/ExQX7pCCtfwmT9AZV85xLIJgo+25Q7TwvVnW1w8tH/tKh6T3gX
	C2TDIHAkpWNCcvfan1FpS88QfGx3PU9NcPDrhPg/1FRrCD8g1BFkAtwF0GCgl3JPOyhN
	dDdSLGRaMq/u49f8OpVV9mhitU7SNVCRYtKaZMzW6hiOk1TcQwSIbsCCQC0ARVTrKu8X
	CyOp8pIt561L/CqVTI0Kog+2k7XHILScxnXKR0oiZ0iDdVo/U4uLnTyhRNkyNGbxLGSJ
	aGXYtMSoeqz3oKnBxsvc3JFwSofTMi0SUL5ppwZHcuY21LmqNqLPLZoxsXS9Vl7IdE3I
	gD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rwS3gMBXSDSCNwNkqFa9ZYCP+zssOoWps0H18efATNo=;
	b=r0oZqsKetBEdcDUk4jdFarTeocMxp/iTePqisysk0mQh2KWphLR6JLtUPs/0Ri0SAH
	sKZOZaz27fgL1/lSjB0ZDIxBniH4iAIAG+/h/j7O+kvU1mabmqpPjU6POB/IuacilFdn
	CBmIojt0hlQWVulgTmVXFEmXX9j6MsxpYq6nSIAH+O8sPL9mfdtUfh+rEFDMQX/dpzek
	dJSSTofM4jJ9IwJFE3iF29VYc2tVclfCfShMQR2gp5m+shoMVeMTwCA3iaOHJr0FWS+C
	GcjUyEe73zuyKk4K/e2ATkcqugyrE38DAZ9ZNYVmw0s9x+CIa9ikopWW5XqieQz//QIL
	J1sg==
X-Gm-Message-State: AKwxyteXmj3evbvjb/6z/aC+nlnxVG5CNrCkjXOQEYRP5OJ9sXPfUp0e
	1f/UUT+vGXBzNKzVcGdfOXWfFvlE
X-Google-Smtp-Source: ACJfBoubT3oW/82CEvibnWLtbmcq7pnfXqlJdyO1EpqI2xS4PpVf69IV97i56pLaALpReWjERwPCZQ==
X-Received: by 10.28.169.76 with SMTP id s73mr2460433wme.122.1516209098352;
	Wed, 17 Jan 2018 09:11:38 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	n69sm4599550wrb.46.2018.01.17.09.11.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 09:11:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 17:11:33 +0000
Message-Id: <20180117171133.2306-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] buildhistory-diff: add support for colourising the output
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
X-List-Received-Date: Wed, 17 Jan 2018 17:11:38 -0000

Colour value removes in red and additions in green, making it easier to scan the
output for relevant changes.

This adds a --colour option to specify whether colouring should be on, off, or
detected.  The default is detected, and depends on whether stdout is a TTY (same
behaviour as git).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 30 +++++++++++++++++++++++++-----
 scripts/buildhistory-diff            |  9 +++++++--
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 3e86a46a3f7..c05841b804c 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -40,6 +40,26 @@ related_fields['PKGSIZE'] = ['FILELIST']
 related_fields['files-in-image.txt'] = ['installed-package-names.txt', 'USER_CLASSES', 'IMAGE_CLASSES', 'ROOTFS_POSTPROCESS_COMMAND', 'IMAGE_POSTPROCESS_COMMAND']
 related_fields['installed-package-names.txt'] = ['IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS', 'NO_RECOMMENDATIONS', 'PACKAGE_EXCLUDE']
 
+colours = {
+    'colour_default': '',
+    'colour_add':     '',
+    'colour_remove':  '',
+}
+
+def init_colours(use_colours):
+    global colours
+    if use_colours:
+        colours = {
+            'colour_default': '\033[0m',
+            'colour_add':     '\033[1;32m',
+            'colour_remove':  '\033[1;31m',
+        }
+    else:
+        colours = {
+            'colour_default': '',
+            'colour_add':     '',
+            'colour_remove':  '',
+        }
 
 class ChangeRecord:
     def __init__(self, path, fieldname, oldvalue, newvalue, monitored):
@@ -110,9 +130,9 @@ class ChangeRecord:
                     lines.append('removed all items "%s"' % ' '.join(removed))
                 else:
                     if removed:
-                        lines.append('removed "%s"' % ' '.join(removed))
+                        lines.append('removed "{colour_remove}{value}{colour_default}"'.format(value=' '.join(removed), **colours))
                     if added:
-                        lines.append('added "%s"' % ' '.join(added))
+                        lines.append('added "{colour_add}{value}{colour_default}"'.format(value=' '.join(added), **colours))
             else:
                 lines.append('changed order')
 
@@ -125,9 +145,9 @@ class ChangeRecord:
                 percentchg = ((bval - aval) / float(aval)) * 100
             else:
                 percentchg = 100
-            out = '%s changed from %s to %s (%s%d%%)' % (self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg)
+            out = '{} changed from {colour_remove}{}{colour_default} to {colour_add}{}{colour_default} ({}{:.0f}%)'.format(self.fieldname, self.oldvalue or "''", self.newvalue or "''", '+' if percentchg > 0 else '', percentchg, **colours)
         elif self.fieldname in defaultval_map:
-            out = '%s changed from %s to %s' % (self.fieldname, self.oldvalue, self.newvalue)
+            out = '{} changed from {colour_remove}{}{colour_default} to {colour_add}{}{colour_default}'.format(self.fieldname, self.oldvalue, self.newvalue, **colours)
             if self.fieldname == 'PKG' and '[default]' in self.newvalue:
                 out += ' - may indicate debian renaming failure'
         elif self.fieldname in ['pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm']:
@@ -163,7 +183,7 @@ class ChangeRecord:
             else:
                 out = ''
         else:
-            out = '%s changed from "%s" to "%s"' % (self.fieldname, self.oldvalue, self.newvalue)
+            out = '{} changed from "{colour_remove}{}{colour_default}" to "{colour_add}{}{colour_default}"'.format(self.fieldname, self.oldvalue, self.newvalue, **colours)
 
         if self.related:
             for chg in self.related:
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index e79cb7ac8d3..27974072fcb 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -53,6 +53,10 @@ def get_args_parser():
     parser.add_argument('-e', '--exclude-path',
                         action='append',
                         help="Exclude path from the output")
+    parser.add_argument('-c', '--colour',
+                        choices=('yes', 'no', 'auto'),
+                        default="auto",
+                        help="Whether to colourise (defaults to auto)")
     parser.add_argument('revisions',
                         default = ['build-minus-1', 'HEAD'],
                         nargs='*',
@@ -107,10 +111,11 @@ def main():
     elif len(args.revisions) == 2:
         fromrev, torev = args.revisions
 
-    from oe.buildhistory_analysis import process_changes
-
+    from oe.buildhistory_analysis import init_colours, process_changes
     import gitdb
 
+    init_colours({"yes": True, "no": False, "auto": sys.stdout.isatty()}[args.colour])
+
     try:
         changes = process_changes(args.buildhistory_dir, fromrev, torev,
                                   args.report_all, args.report_ver, args.sigs,
-- 
2.11.0


