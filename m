Return-Path: <sstncr@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72B4C78817
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 14:39:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p1so5397475pfh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 06:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hix9/qtMRR6dVTgvhwOudQpQnlGRmkclA3D6+QamMSI=;
	b=f4DJVoAPXowZQTOsu7QtvzaAS9PuXaxSgIR1iuy9D2yRwmntjaC0qgWQORGWiZtM+Z
	OjkYPY8j8Ksn9oW2EsL3yJkpGJLTPAzr5elwcNnQmT8/xp4VJNHr5NoJ2Vz1bq6Z8aZN
	HlfqAFEGI3KjDZGEfqcuztPtX12tbxSfkfMrXVhbMGVGuw7vjJBDPVQbYYxlZPkZcC95
	nfFe09iXXOtTKPwAtwmWiBocrW6XE1m3vkWnnd93C+2nJflBrImoSHyFFbHryBzb7/vp
	o9W7V7XBp4MeC4JD/ELolW4oBlIKaAmDFkfui/kyacQBVhEuplv9gJlHvRqnHb/bcIRB
	WYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hix9/qtMRR6dVTgvhwOudQpQnlGRmkclA3D6+QamMSI=;
	b=PeuuhxmCqTgtMitTpSlD/Neh2xcd0yPuD+N30Dmgi0ANurY4oY/pLsKStz2m30XH9n
	ivB0+vwaXHRG7QE6hjKHp+/Lhvb9zdD8y9xt8Xaxiva3w5sKJHm6FwexurekYNA8gnHD
	OMGERggIFdeWcaH8w+WIA9cbUSG1F1fSm8lDlMiF+/+NPxCKyn3djjXDr2B/Xa8tS4yr
	Dmm83/o3KxV80D0VCknlZ0a1miokAbhdgC7oO1HBjfZuA5ONIDuGycbPFoAPrqxc5RpN
	j9Gw44WlzkOf6+QnkxkAC3OK0Zs6RmescRLJ4JSXQUAd3zIz+ebSmmPCjDoJkCk57f/p
	bg6A==
X-Gm-Message-State: AKwxyteVbPufnXRCT+afj48MqZO/W0sRrma/K9ytggPGiBDl9/AqQ1mN
	JCvqs5l9jWUQgAQmhXh9agNHP/6E
X-Google-Smtp-Source: AH8x226QWFj/968j5dJ2ioNe+mQJ48LUZT6+Eoi/nsQrwlVXXnhWn5hA508kMLnqN0eEqNaBJVLC6w==
X-Received: by 10.99.65.65 with SMTP id o62mr17671174pga.392.1517236762521;
	Mon, 29 Jan 2018 06:39:22 -0800 (PST)
Received: from ubuntu-xenial.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	y18sm32692713pfa.175.2018.01.29.06.39.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Jan 2018 06:39:22 -0800 (PST)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:39:10 +0000
Message-Id: <1517236750-28771-1-git-send-email-sstncr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] kernelsrc/perf: fix dependency on non existant task when using externalsrc
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
X-List-Received-Date: Mon, 29 Jan 2018 14:39:21 -0000

When externalsrc is enabled for kernel, do_patch doesn't exist since is in
SRCTREECOVEREDTASKS, so make these depend on a real task.

Fixes:
    ERROR: Task do_unpack in /data/yocto/poky/meta/recipes-kernel/perf/perf.bb
    depends upon non-existent task do_patch in /data/yocto/poky/meta/recipes-kernel/linux/linux-yocto_4.8.bb

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/classes/kernelsrc.bbclass   | 2 +-
 meta/recipes-kernel/perf/perf.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index 9efd46a..ce6c999 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -1,6 +1,6 @@
 S = "${STAGING_KERNEL_DIR}"
 do_fetch[noexec] = "1"
-do_unpack[depends] += "virtual/kernel:do_patch"
+do_unpack[depends] += "virtual/kernel:do_configure"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 03ae446..145774b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -47,7 +47,7 @@ export PYTHON_SITEPACKAGES_DIR
 #kernel 3.1+ supports WERROR to disable warnings as errors
 export WERROR = "0"
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_configure"
 
 # needed for building the tools/perf Perl binding
 inherit perlnative cpan-base
-- 
2.7.4


