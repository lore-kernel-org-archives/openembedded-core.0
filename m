Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.6436.1589292347721308069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=jdC+HeqL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id u16so23452548wmc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 07:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a9VyeXn7xYNYh71tyfxs8Gh8QguTCHjHqQxpSfISYaM=;
        b=jdC+HeqLMdGlwlCW5e2HkjDnSYbMrrc3hq5/DD1MXqPf1cSL8UJBASDGwgnmj6ygST
         u927m6GX44DqU8QbH7HecngzUzK0YTrla+bk/FJKF0O/+fqdkqbKS1OrDCasna5VHLpr
         4UIO4qzMLgYI8gS1G+VFsk3DSUkzKNQ7n7Vdebxi20x13gDnQaj1jzsNnqXGTyaauPGD
         ZC7vl21b9vs29EXCaPXh0KMjuTZQjikTy6YET2FGdFQ6tB75znewjDv2KdAC/Ic1c/xT
         KitLGWDzFxHiofvUgBM2sIFUdojjojRXwaw0GgMgbcHdG5lL2WdLra+6V36AoA/ck+tQ
         tjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a9VyeXn7xYNYh71tyfxs8Gh8QguTCHjHqQxpSfISYaM=;
        b=P161I3woSnvHV43Jpztcd6zV5o9djV6EC7CywuRNcQR6ImWTZ1idjKJkcep/nIWJ1j
         6qBEX2mzb2QsJV7ECqoFaRymEFay3m4+VbaQfcEoEeNfPw1F2VV5TQOOXWE/QG+nQN+5
         ym2thwxqX7kDIfgxJinJLv08PwippT2UevRaEbCTUdGzB0nUijfLCcm3NTvRaEipt7Z4
         IJ+P372l4tGVDYGD8VkWGaRe0qsS9pIh9KnWGISp0bis8LLEt6kTYRDJkoDuqV+crQjb
         +61uur3HoD++8NJFoOdANaDYnNOnF4sedRfFEzv4ZmohlT/uYY91C6OA1Y01HlaTQrzL
         nqTQ==
X-Gm-Message-State: AOAM533TTmm8od8iWVTRxe/U+KbAymHwN+yspVxmmvHSCv2OfdtYaDJg
	8M21rhZ27MSMbxnYobvUHxfJvw==
X-Google-Smtp-Source: ABdhPJxlXpw5cqfI53AicFSxd3obY+G0smmAd409wUGK0ESePYYKVYx25OjK/8y6L6jYS64c7YVRNQ==
X-Received: by 2002:a1c:4088:: with SMTP id n130mr2612524wma.43.1589292346165;
        Tue, 12 May 2020 07:05:46 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id h74sm23878024wrh.76.2020.05.12.07.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 07:05:45 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-OE][PATCH v3] image.bbclass: deploy image artifacts in stages
Date: Tue, 12 May 2020 16:05:29 +0200
Message-Id: <20200512140529.27606-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
override. This way each generated set of artifacts is deployed as soon
as it's ready instead of the do_image_complete task handling the entire
deployement. This allows us to better fine-tune dependencies e.g. we
can make do_image_wic depend on fitImage task which can in turn depend
on do_image_ext4.

We need delete the IMGDEPLOYDIR variable from the data object passed
to each image task so that it gets expanded with the correct override.

In order to make sure that tasks added to SSTATETASKS in anonymous python
functions are correctly setup, move the code that assigns pre- and
postfuncs to an event handler invoked on bb.event.RecipeTaskPreProcess
in sstate.bbclass. This event is fired right after the anonymous
functions.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Changes since v2:
- dropped the qemuboot patch (already upstream)
- switched to % string formatting instead of using .format() for consistency

 meta/classes/image.bbclass  | 17 +++++++++++++++++
 meta/classes/sstate.bbclass |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 694b58fc9f..3cf8ceb2d6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -425,10 +425,12 @@ python () {
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
@@ -499,6 +501,21 @@ python () {
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
+
+        imgdeploydir = d.getVar('IMGDEPLOYDIR')
+        task_override = task[3:].replace('_', '-') # 'do_image_ext4' becomes 'image-ext4'
+        taskdeploydir = '%s/deploy-%s-%s' % (os.path.dirname(imgdeploydir),
+                                             d.getVar('PN'), task_override)
+
+        # Each image task gets its own IMGDEPLOYDIR directory and is added to
+        # SSTATETASKS. This way every set of artifacts gets deployed right after
+        # the do_image_foo task completes.
+        d.setVar('IMGDEPLOYDIR_task-%s' % task_override, taskdeploydir)
+        d.appendVar('SSTATETASKS', ' %s' % task)
+        d.setVarFlag(task, 'sstate-inputdirs', taskdeploydir)
+        d.setVarFlag(task, 'sstate-outputdirs', d.getVar('DEPLOY_DIR_IMAGE'))
+        d.setVarFlag(task, 'cleandirs', taskdeploydir)
+        d.setVar('SSTATE_SKIP_CREATION_task-%s' % task_override, '1')
 }
 
 #
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index aa9c30b4e1..5bdada673f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -138,13 +138,17 @@ python () {
         d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
         d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}")
         d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/")
+}
 
+python sstate_setup_tasks() {
     unique_tasks = sorted(set((d.getVar('SSTATETASKS') or "").split()))
     d.setVar('SSTATETASKS', " ".join(unique_tasks))
     for task in unique_tasks:
         d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
         d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
 }
+addhandler sstate_setup_tasks
+sstate_setup_tasks[eventmask] = "bb.event.RecipeTaskPreProcess"
 
 def sstate_init(task, d):
     ss = {}
-- 
2.25.0

