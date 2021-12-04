Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECBBC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 21:30:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.30140.1638653424332914200
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 13:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HV1DCInK;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id m27so15264704lfj.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 13:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=80ebvRFEKUNyu8oaYCykhqwo7lwSTXnIavSShEa7+QE=;
        b=HV1DCInK6kAis9+Jh/IvS601eXjnc8Yr3Um5eg0a/hJ2SwraJN1y9eHiHjPE/9SdmW
         68DvoCrXk4xQBp7kZkopfXQh4hERemGjIm7R8jyVkSBJg9QqvFKQfh8JB0iGlIKVyTrC
         9dJMHMmOEDnicfSYtc8ff7J90L4WNzJ7JyMqxwBhZxGA0D9q9wDXS+xb7TPFOB08h1W2
         SxfTUFwjRlHRhByn42sFyxMWcSngu1NFux/mFw85Th4xcM/0zmtfmDzgkUVPN66r9Q7c
         K4BU9TOfM7dmafBBWWgTp/tVv6qXEknHQghcnWQtTTXr++Aahu8FWeaEj+JMIn1VjWQ0
         MNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=80ebvRFEKUNyu8oaYCykhqwo7lwSTXnIavSShEa7+QE=;
        b=m7wSm1/t/jGVl3GvN1ikYa/UPuopMDKdHtxBCB2VidQuQnXcRe4cyksY3gWI5ngCJ0
         uvUzRuWhQKx5nRHagmzG7RvsrX7bW021pTAZisMHIEFh+cyQNNhS5N86/qaTZeQORg8e
         oDamfurZkxR2UBGMMb5/FUiee1TzPHmCWAtk/l40ovMXg+fBMLm2+RzydCw8sjLAPo5h
         rTajkSqt18UFmVI9cIQDmiWY7jGC18Q1lkqkWEO2XW9s0/XFysS5EgcuQ0xXX9MfK42C
         S6UoI4WYpLC0D9yXP2vkB8K1EvgyRrSyGyb58gZbb1Vmp1X8XwcrZMKUDZ+25lErodrU
         810w==
X-Gm-Message-State: AOAM533WV03BKgdBFZ9Ezm3HkgMRIaDPkR/QyVmaWcjRO+COrIsB0xbg
	9Oj2A0MmuWAZ2jPohTTyTqnnlpnDoNgp/w==
X-Google-Smtp-Source: 
 ABdhPJzXIQBDTc57TVZTyCcorMTJkWsowjN0kr7n0Cz3NkT6DAPvk6WhqYb8x2YO23cssPSjiFD7Sg==
X-Received: by 2002:a05:6512:159d:: with SMTP id
 bp29mr25033218lfb.257.1638653422175;
        Sat, 04 Dec 2021 13:30:22 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 p3sm874262lfh.124.2021.12.04.13.30.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:30:21 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v3 2/4] python3-native: Skip testing import of modules
Date: Sat,  4 Dec 2021 22:29:38 +0100
Message-Id: <20211204212940.3787349-3-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204212940.3787349-1-jacob.kroon@gmail.com>
References: <20211204212940.3787349-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 21:30:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159183

Building python3-native involves running the resulting native binary
as part of a test to import the built modules. If this fails the modules
will be renamed with an appended "failed" suffix. One of the upcoming patches
removes ${STAGING_LIBDIR_NATIVE} and ${STAGING_BASE_LIBDIR_NATIVE} from the
rpath, which means this step will fail. Patch python3 not to perform the
import test, so that the modules won't end up with invalid names.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../python/python3/no-import-test.patch            | 14 ++++++++++++++
 meta/recipes-devtools/python/python3_3.10.0.bb     |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/no-import-test.patch

diff --git a/meta/recipes-devtools/python/python3/no-import-test.patch b/meta/recipes-devtools/python/python3/no-import-test.patch
new file mode 100644
index 0000000000..d944e55cc5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/no-import-test.patch
@@ -0,0 +1,14 @@
+Index: Python-3.10.0/setup.py
+===================================================================
+--- Python-3.10.0.orig/setup.py
++++ Python-3.10.0/setup.py
+@@ -644,6 +644,9 @@ class PyBuildExt(build_ext):
+         if CROSS_COMPILING:
+             return
+ 
++        # Skip import test
++        return
++
+         loader = importlib.machinery.ExtensionFileLoader(ext.name, ext_filename)
+         spec = importlib.util.spec_from_file_location(ext.name, ext_filename,
+                                                       loader=loader)
diff --git a/meta/recipes-devtools/python/python3_3.10.0.bb b/meta/recipes-devtools/python/python3_3.10.0.bb
index e3300b6495..c9f21b5e16 100644
--- a/meta/recipes-devtools/python/python3_3.10.0.bb
+++ b/meta/recipes-devtools/python/python3_3.10.0.bb
@@ -40,6 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
+           file://no-import-test.patch \
            "
 SRC_URI[sha256sum] = "5a99f8e7a6a11a7b98b4e75e0d1303d3832cada5534068f69c7b6222a7b1b002"
 

