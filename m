Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003F4C433FE
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 12:12:34 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web12.33651.1639311153566951779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NiJCH+fb;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id p8so20001858ljo.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3CpC56VXv5G5MotkI6eWusRHzQwHw9ZwKJ7pmV8oWA4=;
        b=NiJCH+fbJC1P/7tSFKntRzecPGEKDLiuRbGt7tiyRcNVRpsSoYcyQ1MdpxdLi14jOJ
         wL774kpI2RerWJFWvJ1bXlgM5/0vd1a6E4S9UiruUcPpQ7d85DYRQfMlOYqjYAwK+2YR
         68V4ocsPsFwV7qOS/agbdHhAO6dxXisIp5tcctJ+L/fxtZyVBL//QnDaK0W574qDoUM8
         +Qe0lKpiiDv/f1c3cW4vpb+JRETWP4l3rDqXXrbIuWWD1W866cW0v9WVQ/+oGv+C37x7
         DWsYhadIAWDhrG/azWsSNwjIalj1SKl+5N2aol+U7ZD9AcYlVH/N0dqWYHz0KTjZvGcv
         5zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3CpC56VXv5G5MotkI6eWusRHzQwHw9ZwKJ7pmV8oWA4=;
        b=a5eBMWlcnjESYPqNHg+Ma81jnEOW2uPgIho/GDciGbSUEVKlFcjuCjTYoWe0/XX7xF
         QEEf9APappmqUDo8DtV+HIJqviGU4tykIbKpIl0n8SoRFrb5nyG9jjD/LzkyRKo95Zjs
         nYq1tn8cgsGuNJfeaMoe3krzdhEXsUapMWJM8spNsdBwhTDh3ql4UkJ0ti5SYsXdpb3T
         P9TLNw0opz7BKRhN0wLUbsIJLqe2QjLRBaSBbGwq71ewp2jnHzl0M8pn7+GVkuuBtONS
         Fg7ajrSds+PwgxBymVJFWVgdhTAgvdUZriQsdqBtdwk23y19BCJ2imxtSN2FhQoR46R6
         EN6w==
X-Gm-Message-State: AOAM530qSVOQE1SClkMCuWP2P3pZppWWfS92oiFzugFatrEMWh0hZtD7
	kvEX3F8USj5pRwFJrjrfByyGPfWbjieC7A==
X-Google-Smtp-Source: 
 ABdhPJzhg2XsUTHk7skgGnUBT2QK+T01Scb1hNmARmm756ftnNdN3TLu7fKcQ8bXGl/MPyl/LWCoFA==
X-Received: by 2002:a2e:7a11:: with SMTP id v17mr22469780ljc.33.1639311151721;
        Sun, 12 Dec 2021 04:12:31 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 q3sm1011596lfr.295.2021.12.12.04.12.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 04:12:31 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v4 1/2] bitbake.conf: Pad rpath in native binaries
Date: Sun, 12 Dec 2021 13:11:55 +0100
Message-Id: <20211212121156.3271203-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212121156.3271203-1-jacob.kroon@gmail.com>
References: <20211212121156.3271203-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 12:12:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159578

Try to make sure that the RUNTIME dynamic entry size is the same for all
binaries produced with the native compiler. This is necessary in order to
produce identical binaries when using differently sized buildpaths.

Remove the build ID since it depends on the rpath at link-time, otherwise
binaries built in two different build paths will differ.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/chrpath.bbclass | 3 +++
 meta/classes/sstate.bbclass  | 1 +
 meta/conf/bitbake.conf       | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 26b984c4db..f3fb3eb323 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -24,6 +24,9 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlin
     new_rpaths = []
     modified = False
     for rpath in rpaths:
+        if rpath.startswith('/native-rpath-padding-'):
+            modified = True
+            continue
         # If rpath is already dynamic copy it to new_rpath and continue
         if rpath.find("$ORIGIN") != -1:
             new_rpaths.append(rpath)
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0326d27c74..92c816a692 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -101,6 +101,7 @@ SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
 SSTATEPOSTINSTFUNCS = ""
 EXTRA_STAGING_FIXMES ?= "HOSTTOOLS_DIR"
+EXTRA_STAGING_FIXMES:append:class-native = " NATIVE_RPATH_PADDING"
 
 # Check whether sstate exists for tasks that support sstate and are in the
 # locked signatures file.
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fba99e8f0c..330aab3c91 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -580,6 +580,7 @@ BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
 TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
+NATIVE_RPATH_PADDING = "/native-rpath-padding-${@'x' * (512 - len(d.expand('${STAGING_LIBDIR_NATIVE}:${STAGING_BASE_LIBDIR_NATIVE}:/native-rpath-padding-')))}"
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -L${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,--enable-new-dtags \
@@ -587,6 +588,8 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} \
+                        -Wl,-rpath,${NATIVE_RPATH_PADDING} \
+                        -Wl,--build-id=none \
                         -Wl,-O1"
 
 BUILDSDK_LDFLAGS = "-Wl,-O1"

