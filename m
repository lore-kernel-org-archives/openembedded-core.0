Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD47C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.46442.1638092775857809483
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kPpyBvot;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id b1so36223529lfs.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UCsO+3gW/6FopheE/9M04MoZDwrvEEktMkXcl1MbP/w=;
        b=kPpyBvotMlTRsB4yqeGXVilAi5MkKe2IyZWYHiXVRWEc9Xoe6XSYpy2HXhMr2ifNB+
         WomXEqXI6BXuh6dong1Fn7T1PvKrgiy8RA2YMNgMNrExjnqQEp5AOvYVXOHxt7Hboes9
         Xv65tDx1GoM/iwy/s20KwI2WQlPxODh1w+IXnmyvSs5MbQgq7669rWkk2vn77ZkNlPcl
         9/qObQVRhZyff83SrpHL1gO8o+4OScT20fNDBoptdYahIIYxshI7pzP/vDgmc7PpJq/S
         JsrFC7R4pxiKa1U7G5gGc8JosPt5ypcHtkc1f6qyPWRLvUX2vEH+v2gSiI3dbwT6OKhP
         fJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UCsO+3gW/6FopheE/9M04MoZDwrvEEktMkXcl1MbP/w=;
        b=wSJAcIZwblB0rnXJpTl0rcGxJpGKy8EqE7/CEpBE5s171wBOyDr7PrsNyy/MokcjSC
         4GYrO8X9mypHjIbgVMksPXEJJOQQYtXcMKPVd0rChcuDoo5Uii+LXFewNWiqhTmM9k1T
         D6mL+qM93h4rBOOaQVT5qvlmQj6mf3FvDYW/jv8mOX7o5etdJ2IJvlwFFXDFjQNrnZv1
         YJSyRAzw1zfplgCojd8t0xFYMFTG9izPRNBsSgbLzI3KEHhpJLN2elPqiIgfFiud+fmK
         OZCyZEHSp+IkFCWkx2Bg17q/WE7mqX5iI42nR/IkwtCKrHptq6vaf3Hl/6uash9+lyER
         Xovg==
X-Gm-Message-State: AOAM532FlZEQHg793JjUlYHCX+IIl8oKDxbj9L92YMDtQazxqnZalb5V
	QYOnvgnSziS9qiydkOWr50f9rHmPT4kVMA==
X-Google-Smtp-Source: 
 ABdhPJz7NbHAHtcKMWOgLILkXBuLR3dm6PbbfrT2Mum4zYrscdcfpbkTsC9yTQmVBHGNYMSEpvlwsw==
X-Received: by 2002:a05:6512:1113:: with SMTP id
 l19mr40908540lfg.184.1638092773923;
        Sun, 28 Nov 2021 01:46:13 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:13 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/9] bitbake.conf: Pad rpath and remove build ID in native
 binaries
Date: Sun, 28 Nov 2021 10:45:24 +0100
Message-Id: <20211128094532.1145820-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158868

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
 meta/conf/bitbake.conf       | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 26b984c4db..3c6956304a 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -24,6 +24,9 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d, break_hardlin
     new_rpaths = []
     modified = False
     for rpath in rpaths:
+        if rpath.startswith('rpath-padding-'):
+            modified = True
+            continue
         # If rpath is already dynamic copy it to new_rpath and continue
         if rpath.find("$ORIGIN") != -1:
             new_rpaths.append(rpath)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fba99e8f0c..9621023354 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -580,6 +580,8 @@ BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
 TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
+RPATH_PADDING ?= "rpath-padding-${@'x' * (512 - len(d.expand('${STAGING_LIBDIR_NATIVE}:${STAGING_BASE_LIBDIR_NATIVE}:rpath-padding-')))}"
+RPATH_PADDING_FLAG ?= "-Wl,-rpath,${RPATH_PADDING}"
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -L${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,--enable-new-dtags \
@@ -587,7 +589,9 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} \
-                        -Wl,-O1"
+                        ${RPATH_PADDING_FLAG} \
+                        -Wl,-O1 \
+                        -Wl,--build-id=none"
 
 BUILDSDK_LDFLAGS = "-Wl,-O1"
 

