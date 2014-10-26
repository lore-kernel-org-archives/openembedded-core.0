Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 01D0C65CAC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 19:36:33 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id u10so4753714lbd.15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7Kvbypy4m39rsnSqxbuwzItddKI7G9XUMT7LxkjfZrA=;
	b=V4Vi9FO1QDw9oFB952kzZ8TuzadGw5i2Jv27TWIXTiTP18xHlXTqv8c6XVk+rzoOwb
	AUIfoU1/b5p5Qxeb+MWyidAJidgD7etji1A4QII6bj87ArqcgSyd+/N9td0CmxEqpxT4
	rJ4pH5ikP5NuZYKgNBQpsuB48dUkW76xp6z/1cvFJ5AgUgfvkIGfKRrWO8wqZfGQjen/
	DYEdXJZ2XB8fWakIlr+sQdTSZDFCAonzlUqDyYjoG9cpIu769dWeu0B/HxtvmUEot10s
	ak9TNkUt2hDOywK/T3MqfstZ31i9AgfyDg+rAv+nT+NwzsxY6TnLDBvKnGJoJUcUmBFs
	2KpQ==
X-Received: by 10.152.120.133 with SMTP id lc5mr18820941lab.62.1414352192925; 
	Sun, 26 Oct 2014 12:36:32 -0700 (PDT)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id xs6sm4198917lbb.13.2014.10.26.12.36.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Oct 2014 12:36:32 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Oct 2014 19:36:22 +0000
Message-Id: <1414352182-30029-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.2
Cc: Chris Carr <chris.carr@ge.com>
Subject: [PATCH] package_manager: Fix BAD_RECOMMENDATIONS for opkg
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
X-List-Received-Date: Sun, 26 Oct 2014 19:36:38 -0000

In package_manager.py, when using opkg as the packager, the command 'opkg <args>
info <pkg>' is called to get information about each pkg in BAD_RECOMMENDATIONS
in a format that can be written to the status file. The 'Status: ...' line is
modified and all other lines are passed through. Changing the verbosity level
argument for this command will change what it written into the status file.
Crucially, with the default verbosity level, no blank lines are being printed by
the opkg command and so no blank lines are being written to the status file to
separate each package entry.

The package parsing code in opkg expects package entries in the status file to
be separated by at least one blank line. If no blank line is seen, the next
package entry is interpreted as a continuation of the last package entry, but
the new values overwrite the old values.

So with the default verbosity level, a blank line follows some package entries
and these are parsed. The others are dropped due to the lack of blank lines. As
the verbosity increases, more debugging messages add blank lines and more
packages are parsed.

The solution to ensure that this works correctly regardless of the verbosity
level is simply add a blank line after the output of 'opkg info' is written to
the status file, ensuring that the next package is separated from the current
package.

[YOCTO #6816]

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
Cc: Chris Carr <chris.carr@ge.com>
---
 meta/lib/oe/package_manager.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index ffb83b2..85d7fd4 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1408,6 +1408,10 @@ class OpkgPM(PackageManager):
                     else:
                         status.write(line + "\n")
 
+                # Append a blank line after each package entry to ensure that it
+                # is separated from the following entry
+                status.write("\n")
+
     '''
     The following function dummy installs pkgs and returns the log of output.
     '''
-- 
2.1.2


