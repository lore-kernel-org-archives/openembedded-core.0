Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id C38FB731C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:57:03 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id bi2so15905403igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=s5ync83WQ94azrUcVxbqHqY3vXqBcq2BypD4pDuxwCc=;
	b=P1ig4/4pIjNX4Unbn20Azo7ISqUdg0uDteb+VrP+3NklpqPAlgZET72EdMFMMH1EfV
	+we4ct4HduUZVsTzP24woikPWGjQb5OGuk+/+dF+vV8xBF4W0sT1L7p44amczWXlOYkd
	Y4soSn/hhP9q2y/3dKnYws6t6A5wT4VA7jLZtflpSTUfoeQJ1EQGOEeeeRWOq15WHwWw
	75EkWjESo6tajvnhPWKjC/iMcEZ4UgNBsiHBHMH2ZEhMNeXWfqjSEoJPKBM6IXQweGTV
	K7CfNecTQSzoRV3fQ2gQYoKO6j+/R9Q7yMNBgCeuB/U5MA613yL5aOIQ2851QdjF40Ua
	mIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=s5ync83WQ94azrUcVxbqHqY3vXqBcq2BypD4pDuxwCc=;
	b=LoQl4YnBy1qouHOZhJ5AVJLYRGFk6c8jqa0pex9t1rDWCqFKUbSLnhJSWq1szkqa+R
	ROrdFhh4dUs3sdvsSZL9Jd3HrRIztZBM+KwO2y3G4OZJmmlzLW7wF//Tfl2Tpk8FM87z
	u0R/iqS5pMCNTyT0Lic3EmYgzjjUbQLQMtO32ISBMIeAc8lyXpwX7aa0KYkat29/ynSY
	0Nm03I6SuzegU/sq2TpJ7PVWWNJNwI5ppeBKcdR0X8uh5lL8tse/BYn3alysp+PN/VY8
	lME0J77HXiBpajc5smUWVKaX0bC+egNlC6QTqdRuOyso/3CplPEPuTKL7wZLWh+BsXfO
	OfZw==
X-Gm-Message-State: AOPr4FVJZBRJDKsE8qmEom/BT5CY2Cy9A/sJMa0Mx7qf/3ORUldcIkPY1qnbRmfoueSKt97J
X-Received: by 10.50.29.45 with SMTP id g13mr1464388igh.93.1463158623955;
	Fri, 13 May 2016 09:57:03 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8DAE6.dip0.t-ipconnect.de.
	[93.232.218.230]) by smtp.gmail.com with ESMTPSA id
	gn3sm1227509igb.16.2016.05.13.09.57.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:57:03 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 18:56:57 +0200
Message-Id: <2448140692e3009e8e2a4d49669fc30ce3d08404.1463158480.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0cb46598518d5ec4e8a0d0277a4cd6fe82be21d1.1463158480.git.patrick.ohly@intel.com>
References: <0cb46598518d5ec4e8a0d0277a4cd6fe82be21d1.1463158480.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1463158480.git.patrick.ohly@intel.com>
References: <cover.1463158480.git.patrick.ohly@intel.com>
Subject: [PATCH 2/2] combo-layer: avoid too long command lines in update with history
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
X-List-Received-Date: Fri, 13 May 2016 16:57:04 -0000

As suspected, invoking "git archive" with all intended files as
parameters can run into command line length limitations. Splitting up
the parameters into multiple invocations (xargs-style) works and was
tested after encountering the situation in practice.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index a0a737d..1ca2ce6 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -1266,8 +1266,35 @@ def apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=None):
         target = os.path.join(wargs["destdir"], dest_dir)
         if not os.path.isdir(target):
             os.makedirs(target)
-        runcmd("git archive %s %s | tar -C %s -xf -" % (rev, ' '.join([pipes.quote(x) for x in update]), pipes.quote(target)), **largs)
-        runcmd("git add -f".split() + [os.path.join(dest_dir, x) for x in update], **wargs)
+        quoted_target = pipes.quote(target)
+        # os.sysconf('SC_ARG_MAX') is lying: running a command with
+        # string length 629343 already failed with "Argument list too
+        # long" although SC_ARG_MAX = 2097152. "man execve" explains
+        # the limitations, but those are pretty complicated. So here
+        # we just hard-code a fixed value which is more likely to work.
+        max_cmdsize = 64 * 1024
+        while update:
+            quoted_args = []
+            unquoted_args = []
+            cmdsize = 100 + len(quoted_target)
+            while update:
+                quoted_next = pipes.quote(update[0])
+                size_next = len(quoted_next) + len(dest_dir) + 1
+                logger.debug('cmdline length %d + %d < %d?' % (cmdsize, size_next, os.sysconf('SC_ARG_MAX')))
+                if cmdsize + size_next < max_cmdsize:
+                    quoted_args.append(quoted_next)
+                    unquoted_args.append(update.pop(0))
+                    cmdsize += size_next
+                else:
+                    logger.debug('Breaking the cmdline at length %d' % cmdsize)
+                    break
+            logger.debug('Final cmdline length %d / %d' % (cmdsize, os.sysconf('SC_ARG_MAX')))
+            cmd = "git archive %s %s | tar -C %s -xf -" % (rev, ' '.join(quoted_args), quoted_target)
+            logger.debug('First cmdline length %d' % len(cmd))
+            runcmd(cmd, **largs)
+            cmd = "git add -f".split() + [os.path.join(dest_dir, x) for x in unquoted_args]
+            logger.debug('Second cmdline length %d' % reduce(lambda x, y: x + len(y), cmd, 0))
+            runcmd(cmd, **wargs)
     if delete:
         for path in delete:
             if dest_dir:
-- 
2.1.4


