Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.159.1586192557543191216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 10:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=mGpPAKWv;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f46.google.com with SMTP id c195so51288wme.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 10:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5GHTHsIYef9NMZuLhh7Qvo4B2wL50kJbfNQwRyIqXqU=;
        b=mGpPAKWvXFb6pGNZ+7RPlpVHiGeMWzk/9JKnZrryslh8smvqporzMgl5kZTyYrvvrQ
         ofEZlGissd7jbOnCOUQcHvYDP9PlO8HJ51xSaPUgTwple1DZnxSgsKNDy/pbRTjpZ90k
         5wEg6h2nmBoxMiLq1qiLSz65G+w9fRisSZS90AFy9eDN33zLFfzlR6sX5GPbwVPDLRzK
         t5S0vF3ba4WnruYi9tKkzTUQL+w3YjwndV3OUhWEG40hb7N4LjaJybEYmWYPOI2xUAsa
         z5w82sNeKfISR6rjbo8/ElWGn3am+fHWtgB7uL9+dtjjmXEMTf/LjYp8aUvQWqKLxUsc
         ezYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5GHTHsIYef9NMZuLhh7Qvo4B2wL50kJbfNQwRyIqXqU=;
        b=kL0tGf0G3ENc3sajiLQEskimkAfVN6f2i4qg/IzovCExb3SpqTJhGq7zK0bqmPJ0eE
         ZosFjkqqnL6A6R09gDxhjErAQQXfxEgh5ORiJIb7XalbNUxUI4V0oFTPzB3YdvJtgtiG
         pnVe0Aro+kHxawKT1XtN3uTznuKtwNZFvYt8zsy/hByoLQmE9oMNv7U12TYRoipfbIeD
         lPoMkDgoVKW8d4rBPXQsHSKdcnjw+N/FXfP5aLDyRXu+nYHewPLGYSgo6mmhWqPzMjH+
         zDyOwrTTcIy7UfbzcKuH1+JVrPT8k5c6cqXi4qn45xgIOilCe+abXCJacVICKfKn04Qp
         nOgQ==
X-Gm-Message-State: AGi0PuYnA9WNiiBBrSsaWmlMMLrYKtEH705Roi+oR5WD9eBD/RkqLTiq
	I+0oqUFmQ0/dVwuutyUbTxH6aw==
X-Google-Smtp-Source: APiQypIOQjkjgggSk+Kc1CpW2yT512VYnR4gZQMVmqYAwZpIyyHMfGpBRbS3uTaUrcE9FQ/3ZG1xGg==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr327453wmg.65.1586192556089;
        Mon, 06 Apr 2020 10:02:36 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id u17sm30614386wra.63.2020.04.06.10.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 10:02:35 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][PATCH v2 2/2] image.bbclass: deploy image artifacts in stages
Date: Mon,  6 Apr 2020 19:02:29 +0200
Message-Id: <20200406170229.25363-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200406170229.25363-1-brgl@bgdev.pl>
References: <20200406170229.25363-1-brgl@bgdev.pl>
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
 meta/classes/image.bbclass  | 17 +++++++++++++++++
 meta/classes/sstate.bbclass |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07aa1f1fa5..ffd63aa82a 100644
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
@@ -502,6 +504,21 @@ python () {
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
+
+        imgdeploydir = d.getVar('IMGDEPLOYDIR')
+        task_override = task[3:].replace('_', '-') # 'do_image_ext4' becomes 'image-ext4'
+        taskdeploydir = '{}/deploy-{}-{}'.format(os.path.dirname(imgdeploydir),
+                                                 d.getVar('PN'), task_override)
+
+        # Each image task gets its own IMGDEPLOYDIR directory and is added to
+        # SSTATETASKS. This way every set of artifacts gets deployed right after
+        # the do_image_foo task completes.
+        d.setVar('IMGDEPLOYDIR_task-{}'.format(task_override), taskdeploydir)
+        d.appendVar('SSTATETASKS', ' {}'.format(task))
+        d.setVarFlag(task, 'sstate-inputdirs', taskdeploydir)
+        d.setVarFlag(task, 'sstate-outputdirs', d.getVar('DEPLOY_DIR_IMAGE'))
+        d.setVarFlag(task, 'cleandirs', taskdeploydir)
+        d.setVar('SSTATE_SKIP_CREATION_task-{}'.format(task_override), '1')
 }
 
 #
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c73c3b42a7..3c71312010 100644
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

