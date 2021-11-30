Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1854CC433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:38:01 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.84047.1638311879550932175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jYckH95O;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id z8so44101053ljz.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qx5tWi7Lg/Tk/SxayCZWZYxnDwGBbTQd0Sf6cWboCQc=;
        b=jYckH95OpwlcWFSzTBnOsAUfW0PqNoD3EVf/NZ3lucCoZzl8Ac4YysPXMLhZETSldr
         UqhTEnrA9E1VnN65A7gf7d2Y2t0BHaxSs3b33pf0f2TWwGdpk3+hk6MmJF6q5fDiJBBg
         xYMp1Qw2wFZ7fdtJ4V0JCh/Jif9ouch4ntC+Yni1UUo5vW/tCOOBeqh8L+rCsOEiMs/6
         0R8F/gafuRzt0AND9K3sqgsLxjvc3a5H5uym7M1rmh7FM8kateCRS/UEcaItwLtYgJ+j
         lTyqkR0U47MiW5LsyTXaInbNJv/TBPRagFyd/0DJ1BkAYMejk05piRs2reoK24dEy3z1
         8XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qx5tWi7Lg/Tk/SxayCZWZYxnDwGBbTQd0Sf6cWboCQc=;
        b=NnSesqqin7hA0P0p1XgRJ/PZARyhFMOeR1IwepeJKvJSEoLCW0t+YV4/nbDx+JeauY
         1TvksOTCh1qQDE6eCLzXQGuCnSfYuoH/uF5yZOI/OGTz84KG0w3IMo6oGHcw0mkAG7S6
         F36ada0Out3DN6RpR+4m7yZOYV0g+OS8o+BriQ9LZO26Rez0alk2pzHgUKtq5MT27FIs
         LBGuwBHOxxNdmQW0FxCmAzwKxZCxZW6NQV3GW2Rh5L1++YGk5Up7Ctpjb6ubtUXwhNgE
         7ZMfBbvGn862Hl+ERvQC8pGxuceaOQo/YF85fAZ9mCicvUjMtQzimjLQqNOlPVAQZXgH
         E9rw==
X-Gm-Message-State: AOAM533kbZKyqtxPF0Jp/xMd1yRAsPNoFtNuY7Ac4OcD+CuinXSn0u2H
	H03anfea9hwQmiGSf7ve9uvZuHIHIXmzkg==
X-Google-Smtp-Source: 
 ABdhPJx2Dv7ng4Q8UyvfSzC0XUHJ07bai8dy+arwxnQHptW0Ypd3WQipdq8Q11Dt1Jv65YH25DqFuQ==
X-Received: by 2002:a05:651c:1305:: with SMTP id
 u5mr1723210lja.15.1638311877918;
        Tue, 30 Nov 2021 14:37:57 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 o14sm1860428lfk.225.2021.11.30.14.37.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:37:57 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v2 1/2] bitbake.conf: Pad rpath and remove build ID in
 native binaries
Date: Tue, 30 Nov 2021 23:37:21 +0100
Message-Id: <20211130223722.852434-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130223722.852434-1-jacob.kroon@gmail.com>
References: <20211130223722.852434-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 22:38:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158999

Try to make sure that the RUNTIME dynamic entry size is the same for all
binaries produced with the native compiler. This is necessary in order to
produce identical binaries when using differently sized buildpaths. I've
tried using only patchelf, and keeping the linker flags as they are, but
I am unable to produce identical binaries. Has anyone else managed to do
this with patchelf ? If not, maybe we can write a new tool that can handle it ?

The build-id also needs to be removed since it is calculated based on
the data present at link time. This includes STAGING_LIBDIR_NATIVE
and STAGING_BASE_LIBDIR_NATIVE. Both will differ and they need to be temporarily
preserved since some recipes will execute the binaries during do_install()
(for example python3-native). Later on these are removed in chrpath.bbclass.

This hack is the first step for producing identical native binaries when using
different build paths. 'zstd-native' is a working example.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/chrpath.bbclass | 3 +++
 meta/conf/bitbake.conf       | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 26b984c4db..56a68768e0 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -24,6 +24,9 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlin
     new_rpaths = []
     modified = False
     for rpath in rpaths:
+        if rpath.startswith('/rpath-padding-'):
+            modified = True
+            continue
         # If rpath is already dynamic copy it to new_rpath and continue
         if rpath.find("$ORIGIN") != -1:
             new_rpaths.append(rpath)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fba99e8f0c..61124e10b2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -580,6 +580,7 @@ BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
 TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
+RPATH_PADDING ?= "/rpath-padding-${@'x' * (512 - len(d.expand('${STAGING_LIBDIR_NATIVE}:${STAGING_BASE_LIBDIR_NATIVE}:/rpath-padding-')))}"
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -L${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,--enable-new-dtags \
@@ -587,7 +588,9 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} \
-                        -Wl,-O1"
+                        -Wl,-rpath,${RPATH_PADDING} \
+                        -Wl,-O1 \
+                        -Wl,--build-id=none"
 
 BUILDSDK_LDFLAGS = "-Wl,-O1"
 

