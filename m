Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2623A731A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:51:03 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id j13so130157183iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4RMtjQV2XqmPsGCpiohb6MSs6jrNUxtYiI8021Bu4h8=;
	b=OdQHeKZxg/sZSbLB0dp/ODW5fFrQiUvk/yESgMMarQTCYmGL9WEWm81fsq/AlCEUZM
	2jhJjfaG34lQs2339fPIaO4xvzrqro4jHtVmB9UwlihdPR0Ozu2r+IrzDn+MU2LD5nlQ
	QER+MCdkoKPpV1E7ngRL90aK8wfkKBW+lYO+ScicsHU4LGwQYppopcM9q41NMvXC3GUS
	Gjla8FEkketx3x/3/SknlOslkfq2iQEJ35+MVHv20S4CEi/Lg7/CQ7LyjY4+g/I5FIHb
	//3bl1WJ+91S1POqlKpU10i7q1XY8CRBWsQxF+5GTZomckmMMY/W45pBbhR6w+K50vJG
	RkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4RMtjQV2XqmPsGCpiohb6MSs6jrNUxtYiI8021Bu4h8=;
	b=ZCbvsPTjZfkNZe6vTLhbptJ1/N24dlvnteW5PTD9/uvQre8uDq94YAf1MEzbloiSU3
	Flg8tPaiVEh3qWBsGnRMWOC18l8ctytHrLwrpjvCBRHyMeSNw1hqnMd910ejr1cfUszi
	oyfT4ZfgbeOs+WbNuWNZfUBb120GfYmSBdlKTWf2uI1r4OWetxPV56aInhhktRBjTM+o
	55chEzSspLEMO6gnGVsrrItizLOYolxQvX5ALKmZ2ZwZxN05vJKQkaCTlNTdGAa7luIV
	BWp9oVeJ0HDLsVeXWAHNj42ddf2KVrWkfJJNiaBrG8ERQ20aMUwyMn/ObVeczicUorvy
	pvyA==
X-Gm-Message-State: AIkVDXJarLmtcDFUIHD4uB2iKXnIP/sSk6aKqxkjyxUIjr6b1g7vKs7FwIrPTsa6bFdutov8
X-Received: by 10.107.12.150 with SMTP id 22mr21695979iom.138.1485867063503;
	Tue, 31 Jan 2017 04:51:03 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.51.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:51:02 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:33 +0100
Message-Id: <b4698573e90ebdbdb7c82f6ccb116014c1722a3e.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Subject: [PATCH 8/8] verify-bashisms: support warnings with more than one line of source code
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
X-List-Received-Date: Tue, 31 Jan 2017 12:51:04 -0000

All warnings start with "possible bashism in", followed by one or more
(in the case of line continuation) lines of source code. To support
more than one line, we now split by matching against the known intro
text.

Example:

 $ verify-bashisms guile
 ...
 /.../openembedded-core/meta/recipes-devtools/guile/guile_2.0.13.bb
  possible bashism in guile_cross_config line 94 ($'...' should be "$(printf '...')"):
         	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
 			> ${B}/guile-config.cross

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/verify-bashisms | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 7283980..dab64ef 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -23,6 +23,7 @@ def is_whitelisted(s):
     return False
 
 SCRIPT_LINENO_RE = re.compile(r' line (\d+) ')
+BASHISM_WARNING = re.compile(r'^(possible bashism in.*)$', re.MULTILINE)
 
 def process(filename, function, lineno, script):
     import tempfile
@@ -42,11 +43,18 @@ def process(filename, function, lineno, script):
         # TODO check exit code is 1
 
         # Replace the temporary filename with the function and split it
-        output = e.output.replace(fn.name, function).splitlines()
-        if len(output) % 2 != 0:
-            print("Unexpected output from checkbashism: %s" % str(output))
-            return
-
+        output = e.output.replace(fn.name, function)
+        if not output or not output.startswith('possible bashism'):
+            # Probably starts with or contains only warnings. Dump verbatim
+            # with one space indention. Can't do the splitting and whitelist
+            # checking below.
+            return '\n'.join([filename,
+                              ' Unexpected output from checkbashisms.pl'] +
+                             [' ' + x for x in output.splitlines()])
+
+        # We know that the first line matches and that therefore the first
+        # list entry will be empty - skip it.
+        output = BASHISM_WARNING.split(output)[1:]
         # Turn the output into a single string like this:
         # /.../foobar.bb
         #  possible bashism in updatercd_postrm line 2 (type):
@@ -60,7 +68,8 @@ def process(filename, function, lineno, script):
                 if lineno is not None:
                     message = SCRIPT_LINENO_RE.sub(lambda m: ' line %d ' % (int(m.group(1)) + int(lineno) - 1),
                                                    message)
-                result.extend([' ' + message, '  ' + source])
+                result.append(' ' + message.strip())
+                result.extend(['  %s' % x for x in source.splitlines()])
         if result:
             result.insert(0, filename)
             return '\n'.join(result)
-- 
git-series 0.9.1

