Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA454CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 08:39:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15705.1777538357167998394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 01:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o+D1b6cp;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b150559bso4448065e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 01:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777538355; x=1778143155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qng4WIzoyqOl45JkxoiV8gwpdCSy7uqzZaB2+crTTns=;
        b=o+D1b6cpnW0mucFw/On5+d+a/ojdKnyXgjuwVdtq6fs9oE5OJYsMyMgA+aRxQnnuHU
         +r90VzmEa1F+MS1Ezh9EEAwvblAVuScLaJla2Va/jcrnlZo6V8pZYOQr1ZsNBKeUTXq7
         p1zRXrEpLa0n+6ppIzOA0ghtV+GMcJ+Vt/v6/8DYXl82BCfn9BAenpZH4nsTxBCcCSoG
         pAZ+/JdAHMmKTJ1wML/MISK/5ptlEASdziPAzK0/goKiso7T9G9dyJVKTg+iOEmZdWwW
         qGj2In2hMchhKLWSsZYCUfn3gnSFMwARfv4vP/44VpTW0jmmwDkYCcPBc4cfIq1xHXUz
         tBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538355; x=1778143155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qng4WIzoyqOl45JkxoiV8gwpdCSy7uqzZaB2+crTTns=;
        b=hSAyrBB6pgOsU4wHZB2hJMhDk4pfhFwE6qREV8HrrhTXS2SC3l5M3ct0Zk64BZudkj
         VTMQ6qmFXXCBD2pVmY3iNvkw0VfxRq4R8QJAM6adaVfHqic1yzthEUWYZ4ZUo/w16Gw/
         54mFoETHmcyyEk4iOejHgif3FO7HyC1yGX/T3NAlyOYb40+s4Z8BGM6pQspLj3XTukor
         LHVlMMD6bI2es+lj4xD2s7J03/GXJLNbRkKW5sZskP970+svhJk+WmZQN8adrub/Xsfc
         rkKApFPfr9RpYG7u6rMl6bBYUZ10zgmBurgdcQB8m79h/8B2FbqOLPjnm3nTpEPzE4J4
         xDKg==
X-Gm-Message-State: AOJu0Yxa3ZEgOpZo1UIZnItM3tyVFT1CVZ7Q3eOecGzdsiA36CNQKJHh
	+ERUtQfGksB6EYnCMdsLsWzXllZ2JChP9ARHUDi4SrsaoHLh4cJ3kvfp2H13kw6IVI8=
X-Gm-Gg: AeBDiesNtZl9sTEjP+wKuDSTAbFbPYGB9AAd1T5iYAigg12+OpM+7xYyLJpYqu70CY8
	ILIlowtuJYNHvNzB01ITND1NmHTWoFwsPPPc6ycqo9+TkcmfbnnUGtZQ5gLMND76LOFwtdD1Lmr
	RGv/UjA3OCo3vfZdLzTZO2/MpNA2K+z8qOmxLTLQKu0Ddiye3IrCn7O/yGBhwexBQy4ozY0Bal9
	sLfoT84C4ndHiV9BPs3Ev4qYPMhgTxEbPJoIb3EWy8mhRld06U+Vm6K2wy3QjEvJ8hUFXW7vmkT
	TXnSXsGo9X6lBxQcH5+Q7KXgUTEG4OaFO/BAbZeipVIwUuzXl7PtiqpaPYe/JVerhQUHEeHaX+U
	tn0LJRxaybbmS4zw0goO7JwNM/XGnFaApXVUb5uNRixkbe9LjYSkKLkurvYhFLpIH5O4T/7nqeQ
	pG1+2THkgFWqJicAaF1hhr5upSRqphRaJsjBtkjjq2gLdT8RVPkdWqZbOash1D7OSJTJZsn/UCl
	fpWkg5fi3iYEJIVDw==
X-Received: by 2002:a05:600c:c08f:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48a84442fe3mr24480465e9.11.1777538354692;
        Thu, 30 Apr 2026 01:39:14 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([45.12.242.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822be902sm57521485e9.6.2026.04.30.01.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:39:14 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH 1/2] image_types_wic: make do_rootfs_wicenv hash-safe
Date: Thu, 30 Apr 2026 09:39:04 +0100
Message-Id: <20260430083905.2967342-1-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 08:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236144

BBLAYERS and BBPATH contain host-specific paths which contaminate the
hash and result in unnecessary cache misses.

Exclude BBLAYERS and BBPATH from vardeps and instead enumerate the wic
plugin .py files tracking them via file-checksums.

The hash now only changes when a plugin file is actually added, removed,
or modified.

Fixes [YOCTO #15662]

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 meta/classes-recipe/image_types_wic.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index ea8c1c9..e6f77e9 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -68,6 +68,22 @@ def wks_checksums(files, search_path):
             ret = ret + " " + found + ":True"
     return ret
 
+def wic_plugin_checksums(bblayers, bbpath):
+    entries = []
+    seen = set()
+    paths = (bblayers or "").split() + [p for p in (bbpath or "").split(":") if p]
+    for path in paths:
+        if path in seen:
+            continue
+        seen.add(path)
+        plugin_dir = os.path.join(path, "lib", "wic", "plugins")
+        if os.path.isdir(plugin_dir):
+            for root, dirs, files in os.walk(plugin_dir):
+                dirs.sort()
+                for f in sorted(files):
+                    if f.endswith(".py"):
+                        entries.append(os.path.join(root, f) + ":True")
+    return " ".join(entries)
 
 WIC_CREATE_EXTRA_ARGS ?= ""
 
@@ -228,8 +244,13 @@ python do_rootfs_wicenv () {
 addtask do_flush_pseudodb after do_rootfs before do_image do_image_qa
 addtask do_rootfs_wicenv after do_image before do_image_wic do_image_wicenv
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
+do_rootfs_wicenv[vardepsexclude] += "BBLAYERS BBPATH"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
 
+# Track actual plugin files instead of host paths (BBLAYERS/BBPATH excluded above).
+WIC_PLUGIN_CHECKSUMS = "${@wic_plugin_checksums(d.getVar('BBLAYERS'), d.getVar('BBPATH')) if d.getVar('USING_WIC') else ''}"
+do_rootfs_wicenv[file-checksums] += "${WIC_PLUGIN_CHECKSUMS}"
+
 IMAGE_CMD:wicenv () {
 	cp "${STAGING_DIR}/${MACHINE}/imgdata/${IMAGE_BASENAME}.env" \
 	   "${IMGDEPLOYDIR}/${IMAGE_BASENAME}.env"
-- 
2.34.1


