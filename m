Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.169.1584984495393159361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=QynNR+qG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id s1so18142945wrv.5
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kmpTevHFjQ/oWBiNmAGoa8IM2Zu+Lr4kg2vpdKsC1TE=;
        b=QynNR+qG6bmxCoqIt1qmSH7eof6gyGErPZ0JnK87HwAQqaL77cMh+Bnw1YKP1kctBw
         92apAXz3MbDbQt4u5OmDv2PDYVGkH2VhPYWIZcOw0rhda4wV2bbyIBl04cWIyblZLZMm
         d1agGoL6otFUrLajzSjG0r96dqnEZj/hyIZoYkRz0MK7wNW9b159NCSHp3IiocvQ+cw6
         kXHRNDoz2Fk2URyihRIXR53mO4OSwGbkAzJbkiHzlAL1zJABwO8hAcWhd+m1DwRY2mkG
         UqpOv0qtOrW+g4pUlTSm1k+kEzxId0XIKdxOgZXtClkaDEGRi6qZ45nFKggFbxhP25G0
         PIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kmpTevHFjQ/oWBiNmAGoa8IM2Zu+Lr4kg2vpdKsC1TE=;
        b=hQNnfUyy/QoD/gPxZqav756pcOeRPqOHB6D+VZDpkwzugwFZisrE2IZxdjxF18Vtdf
         kOIYLyFFmusEM9S5wHD3ZIoYKDjU51H91rXT36iZatdL9FV5psOiU0vsSGMOqiPdtjv8
         Wy0eKAd3Ir64DIo3dvvXtFNH803iWi039aiRuyywPv6K2ANraIHBk2FNda+IWYeRrY0M
         p5lGLWa6vuPAePaSEkaLUx/bKfnxmpWMK2MWRanwZXVYuMZT0dNbfDOZAvrqFB7ZJU5U
         o/TypfuvJs3z3LQRGQq1tsexq5TBPhIO6n1gKWzY5zU+uZg0y2YUmCocivIWK6vvLvhd
         unxQ==
X-Gm-Message-State: ANhLgQ1tRtm0oU0FxregPZITpyLpuOu/G6HKgTVZkfOtL/ztz/BsQ0jX
	kIsSKtXfXIhB0/S9HGST67My8g==
X-Google-Smtp-Source: ADFU+vuVN/Lebui9FEutsYcPON0E/lmPaoIZ2rY+SjsMoNsPAdkjtoQuZaBzqqdPtlreBDkZG7Z95A==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr11479710wrq.121.1584984493994;
        Mon, 23 Mar 2020 10:28:13 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id a16sm303574wmm.20.2020.03.23.10.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:28:13 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][RFC PATCH 2/2] image.bbclass: deploy image artifacts in stages
Date: Mon, 23 Mar 2020 18:28:08 +0100
Message-Id: <20200323172808.26338-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200323172808.26338-1-brgl@bgdev.pl>
References: <20200323172808.26338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
override. This way each generated set of artifacts is deployed as soon
as it's ready instead of the do_image_complete task handling the entire
deployement. This allows us to better fine-tune dependencies e.g. we
can make do_image_wic depend on fitImage task which can in turn depend
on do_image_ext4.

We need to completely delete the do_package task in order to avoid
problems with task hash changes as well as delete the IMGDEPLOYDIR
variable from the data object passed to each image task so that it's
expanded with the correct override.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta/classes/image.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07aa1f1fa5..3487e2abe4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -428,10 +428,12 @@ python () {
         # date/time values. It will get expanded at execution time.
         # Similarly TMPDIR since otherwise we see QA stamp comparision problems
         # Expand PV else it can trigger get_srcrev which can fail due to these variables being unset
+        # Delete IMGDEPLOYDIR so that each task gets its own, overriden value
         localdata.setVar('PV', d.getVar('PV'))
         localdata.delVar('DATETIME')
         localdata.delVar('DATE')
         localdata.delVar('TMPDIR')
+        localdata.delVar('IMGDEPLOYDIR')
         vardepsexclude = (d.getVarFlag('IMAGE_CMD_' + realt, 'vardepsexclude', True) or '').split()
         for dep in vardepsexclude:
             localdata.delVar(dep)
@@ -502,6 +504,28 @@ python () {
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
+
+        imgdeploydir = d.getVar('IMGDEPLOYDIR')
+        task_override = task[3:].replace('_', '-') # 'do_image_ext4' becomes 'image-ext4'
+        taskdeploydir = '{}/deploy-{}-{}'.format(os.path.dirname(imgdeploydir),
+                                                 d.getVar('PN'), task_override)
+
+        # Each image task gets its own IMGDEPLOYDIR and becomes part of SSTATETASKS
+        # so that each set of artifacts be deployed right after the task completes.
+        d.setVar('IMGDEPLOYDIR_task-{}'.format(task_override), taskdeploydir)
+        d.appendVar('SSTATETASKS', ' {}'.format(task))
+        d.setVarFlag(task, 'sstate-inputdirs', taskdeploydir)
+        d.setVarFlag(task, 'sstate-outputdirs', d.getVar('DEPLOY_DIR_IMAGE'))
+        d.setVarFlag(task, 'cleandirs', taskdeploydir)
+        d.setVar('SSTATE_SKIP_CREATION_task-{}'.format(task_override), '1')
+
+        # FIXME We need to do this manually if we want to set the sstate flags from
+        # python code. The reason for this is that sstate.bbclass does this from an
+        # annonymous python function too and we can't guarantee correct ordering.
+        # This isn't a problem for most recipes as they define sstate tasks statically
+        # with bitbake variables.
+        d.prependVarFlag(task, 'prefuncs', 'sstate_task_prefunc ')
+        d.appendVarFlag(task, 'postfuncs', ' sstate_task_postfunc')
 }
 
 #
@@ -611,7 +635,7 @@ do_compile[noexec] = "1"
 do_install[noexec] = "1"
 deltask do_populate_lic
 deltask do_populate_sysroot
-do_package[noexec] = "1"
+deltask do_package
 deltask do_package_qa
 do_packagedata[noexec] = "1"
 deltask do_package_write_ipk
-- 
2.19.1

