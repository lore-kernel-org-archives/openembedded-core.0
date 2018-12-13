Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4820C751D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:25 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id 64so1727040pfr.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dhmOjnDQbMpqqv0hxdP/dBNdSjEF4e+XhptGrObKQOg=;
	b=I2kVnDbKEaIcfKyTfuxQR2CWjfsnoXqUdvsXsqBrsTHXQpgm51UPV/ZgQsbxtKYwMU
	iQ3qiSUGUWuYEFnWBfRx308K0EArAfBEp3nWNrbUSyUvMQblREEN3SWvUuaAOJ/6emO7
	I06yVnimebiOTtLAM6cfCLs+EMMeFnn0E8tN0+Y3nNCfCy9zzZ5hJvIf5/dvJ2WdwolV
	wGmJAwXbfRsAO1WAhhADT+HLfqTcq2DFh+zYrE8NObtNfB84CucvhXqZ1XQOPk+RJXqI
	1/pe3WSQlj3dg5Ijvn+YOrCtl/AYLrRbs/8f9N6TdcmlNrNufHX4lREQMHcDRcAW4Gww
	Tnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dhmOjnDQbMpqqv0hxdP/dBNdSjEF4e+XhptGrObKQOg=;
	b=Lw/s2pQMx2CiFaoSTF4pilhwy+ujony0dhawFEzEkgLooBDYhac5xcTAs369i9C2kb
	dAQQ3YGsyIyLylSh6hmThZd3aXPNRpViC/2TUcP02Y5wJiRnrVtWnBlW5Rq5RDPpX8N+
	YdcO1dnNatC3Y5qKunA6ALHnG8DqXiAoGT/aU0008zWWk4qdltM8bYMFHHZEeWcEwOOz
	ovngdI+Fhyog/6Ngb0SNkmNBOFKi89vfiPgqePUUi00H5Tu3L75hhhaUkX0t4kAzOQxy
	KcHq2+aqeQhqBMbsJ/23wKLqsqH+iXTNf3pGplCOhoM2uLOg2dKe98LbiZWZU/XUhDUI
	I6jA==
X-Gm-Message-State: AA+aEWYhw+BrDLatFv1r0+k5YxQhekcl4mDkMV0QeDFXR/InFNnn7Hcs
	6CvmkX4fsCxFluZAYssKfFrlpuPi
X-Google-Smtp-Source: AFSGD/XxWSbNQXoE0aAf+hMcQMHE58amxv0YP5zZhi0dzoBVajMZtrRWi0PGdymJJeUZDXjXTFOzzA==
X-Received: by 2002:a63:3703:: with SMTP id e3mr407028pga.348.1544737166294;
	Thu, 13 Dec 2018 13:39:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:29 -0800
Message-Id: <8ee2443c0f2c0bfc95dc444d783d1055da3a4e53.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 21/45] oeqa/utils/commands: Avoid unclosed file warnings
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:25 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid warnings such as:

meta/lib/oeqa/utils/commands.py:213: ResourceWarning: unclosed file <_io.BufferedReader name=4>
  return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)

(From OE-Core rev: 6a68c42de08cffbadb59ebda63fa5e19f6e5acef)

(From OE-Core rev: 682d7b2810b235e86a28a8afe034e3853dbe8c45)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/commands.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index da70529..2e6a228 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -146,6 +146,9 @@ class Command(object):
         # At this point we know that the process has closed stdout/stderr, so
         # it is safe and necessary to wait for the actual process completion.
         self.status = self.process.wait()
+        self.process.stdout.close()
+        if self.process.stderr:
+            self.process.stderr.close()
 
         self.log.debug("Command '%s' returned %d as exit code." % (self.cmd, self.status))
         # logging the complete output is insane
-- 
2.7.4


