Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207DFC2D0D1
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:09 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.69895.1718966579769032319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MypjOnL9;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6fb341a7f2so232941666b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966578; x=1719571378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNNqZ3ktQBwcgIN3uHLVbRfUm2wKIlaW9Mlt6CfIzbs=;
        b=MypjOnL97wcp/ny9kOV32t+roeL66mElKcNoQCj3jVSMrlDvj6Cam5wC4UkjIOC8IB
         KNdo4tDFwqkNolTTCangXGbDgoRpYb46F07FA0SxFiYUiVW4B86M7Eg9eUfQz5qWg2Ec
         sqSq/MWoFmIg2zsjEqt+piShlCaqaqHhWMhB/k9UGx40I5bBMD3NWhH7rj0XktQsyahM
         Ykf4JMvYKWfvW69rhqRqkMmBSQIR8hioyleAqqactd64wzfS7IMCVsdEj+MmVNOQhvqI
         JejzhL3aS2vQ05DcQJeJxntVZOj8VY3Zc/zhZMHmc5UFsyb5Xw1UMZvfCJmTfdkjxw/J
         +nNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966578; x=1719571378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNNqZ3ktQBwcgIN3uHLVbRfUm2wKIlaW9Mlt6CfIzbs=;
        b=hoHK5fuDrA/Iq8pGokrQmT2YYPrShAS78bliuJ5b5nE2HMt6NvF/MfjUBLs+89xYIo
         IyaSif88wlfWmn8XAi1SSHFq9oJjF6pToXwV35ELlbFo9/ow+hgCr4RzARxhG97iGj+U
         +04kHfIkTitwrGid1ywWpE+MaOyDjU/CLJvvhubKtz/fKKmjPdQX1oeY4nUXUHvbCLmt
         LfRcm8HCpPjEnXoGzcXub5RXMpfWU6LoPj63lFIdMzXFc2IFdgnSxL0eRIMn4NvkNjPt
         jfAXBgcpntb2sesEA/p4tyYP184Fb993kVNajXMj4D9WPzEEPrRD/c+6xc9oTr8wW8RI
         +yhQ==
X-Gm-Message-State: AOJu0YwgvFMta622FDGNitG2vYCZndhCVRMFXzgIj6GTSeW4sAJ2rZat
	lP6IlCeQUn4KlqvuxyYDsr4MViNPCbytVHtIsw04mMKyNj37Er3hv2mOsA==
X-Google-Smtp-Source: AGHT+IEwSiuizEwhkGC7Vpt0qCDbQWsJ8LQ9An5zE7YOvMDo1zG0abFKxDwcDU3zXPHBqQk8tpPCYw==
X-Received: by 2002:a17:906:1650:b0:a6f:21e8:ad06 with SMTP id a640c23a62f3a-a6fab62a711mr619758366b.20.1718966577874;
        Fri, 21 Jun 2024 03:42:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:42:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/11] recipe-upgrade-additional-rename.bbclass: add a class
Date: Fri, 21 Jun 2024 12:34:06 +0200
Message-Id: <20240621103414.2842509-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201008

From: Alexander Kanavin <alex@linutronix.de>

Please see the comment in the class for the rationale.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipe-upgrade-additional-rename.bbclass  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/classes-recipe/recipe-upgrade-additional-rename.bbclass

diff --git a/meta/classes-recipe/recipe-upgrade-additional-rename.bbclass b/meta/classes-recipe/recipe-upgrade-additional-rename.bbclass
new file mode 100644
index 00000000000..b173b3d3571
--- /dev/null
+++ b/meta/classes-recipe/recipe-upgrade-additional-rename.bbclass
@@ -0,0 +1,22 @@
+# This class can be used to add file renames in devtool version upgrades
+# operations when there are supplemental recipes that need to be updated
+# in lockstep with the main one by renaming the files. This is common,
+# e.g. glib, cmake, mesa, libva, etc have this issue.
+#
+# Example (from glib which has glib-initial to handle):
+#
+# inherit recipe-upgrade-additional-rename
+# RECIPE_UPGRADE_ADDITIONAL_RENAME = "glib-2.0-initial_{pv}.bb"
+#
+RECIPE_UPGRADE_FINISH_EXTRA_TASKS += "do_recipe_upgrade_additional_rename"
+addtask do_recipe_upgrade_additional_rename
+
+python do_recipe_upgrade_additional_rename() {
+    import glob
+    origpath = d.getVar("THISDIR")
+    newpv = d.getVar("PV")
+
+    for f_pattern in d.getVar("RECIPE_UPGRADE_ADDITIONAL_RENAME").split():
+        for f_disk in glob.glob(os.path.join(origpath, f_pattern.format(pv="*"))):
+            os.rename(f_disk, os.path.join(origpath, f_pattern.format(pv=newpv)))
+}
-- 
2.39.2


