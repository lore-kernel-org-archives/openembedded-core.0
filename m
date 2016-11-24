Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 17EED71AD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 09:51:23 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id x94so70782614ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 01:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0bg+5v7fGbyBlQkrgpcgNRFJ5ECliys8jElYIJoyNJY=;
	b=r1X2qrxSY7bI27r0VFlJiwnmWsVSGAU4+7wygXQiAiBGkC4rLR6ANLSqHnq/GmKbqf
	pXj6idTsNaA63m1Xo4pxvbYcO084raRoRvYH61zkdWuQuFWXUm+ONMk9QRWtOOycTE9G
	DQ5O3AP86ciI1VAISnXTWjeoXTCSwcfPRuMfFdCAqQYkR048NRugjblDWX5NM8XVnipw
	KhIOTaKJYE/p/qSrmATzjWyTTyrSFhRNhoAoDpXap5Qa55R6Zf/9fVeaJC/hXkZMHTgq
	Ax7qvdFm+QrL0t+hQpDpYfxvCrAV+2tdidOzILQ5YfdIWOgC04uPOvdRwO5YSmq6jrWE
	F3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0bg+5v7fGbyBlQkrgpcgNRFJ5ECliys8jElYIJoyNJY=;
	b=KIhIYuYTW42xqJup3pihXVp0h5eIiCqlBl4GlTRLoS3Lgq7ilzJkh/C/NvD6G48HLl
	/phWgfk8xAXwTaYOVmP4ZYpg+AN48A5fTaRQe+d9pqkJtI+fWgy381YEtVeZNqkDNCcG
	XZI2TtPEXwox9tToBp8MhAZ0fZgMlrKDgIa0gIe91HFJZC6xu/RvRjfUTqnR5npvOV9/
	2B70BXtOjSDjWqpqNUKriy7KlKCmmJ6H/UT5MhebgeiLIBVJ4PVbM9wCjVQWzVIF2XDP
	8hu0UZpSlHTOKrmJJjQjr1EhPRBPU7S6vQoLItcDW3Lh/4IbSfOAFHeRfF0fkjsdt3Qh
	Pweg==
X-Gm-Message-State: AKaTC03ZnkwsVAamegIagujvXdiwesaHGeelCYCVszdAAPcs7cj/9QCf+1ZQtgk8TkZT34E3
X-Received: by 10.107.53.36 with SMTP id c36mr1235198ioa.55.1479981084476;
	Thu, 24 Nov 2016 01:51:24 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8D6D7.dip0.t-ipconnect.de.
	[93.232.214.215]) by smtp.gmail.com with ESMTPSA id
	u73sm2453223ita.22.2016.11.24.01.51.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 01:51:23 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 10:51:13 +0100
Message-Id: <1479981073-2134-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qemuboot.bbclass: do not hook into do_rootfs
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
X-List-Received-Date: Thu, 24 Nov 2016 09:51:24 -0000

Writing qemuboot.conf in write_qemuboot_conf() does not modify the
rootfs and thus conceptually shouldn't be executed as part of rootfs
creation.

Running it as separate task is cleaner and fixes the problem of
missing qemuboot.conf files for meta-swupd virtual images; those
images replace do_rootfs and ROOTFS_POSTPROCESS_COMMANDs don't run at
all.

The task gets added such that it runs roughly at the same time as
before. Probably it doesn't actually need to depend on do_rootfs, but
this way we don't write a useless qemuboot.conf in cases where
do_rootfs fails.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/qemuboot.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 39df3ad..8b1d4d0 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -42,7 +42,7 @@ QB_DEFAULT_FSTYPE ?= "ext4"
 QB_OPT_APPEND ?= "-show-cursor"
 
 # Create qemuboot.conf
-ROOTFS_POSTPROCESS_COMMAND += "write_qemuboot_conf; "
+addtask do_write_qemuboot_conf after do_rootfs before do_image
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
@@ -51,8 +51,8 @@ def qemuboot_vars(d):
                 'STAGING_DIR_HOST']
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
 
-write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
-python write_qemuboot_conf() {
+do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
+python do_write_qemuboot_conf() {
     import configparser
 
     qemuboot = "%s/%s.qemuboot.conf" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_NAME', True))
-- 
2.1.4


