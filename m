Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7261.1631609830239479094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 01:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rbi2VVCW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id b21-20020a1c8015000000b003049690d882so1406665wmd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C+GrKZspXVcmMIVnX1dWzthERU1FGHzT9cQJvSErxDI=;
        b=Rbi2VVCWE/Dt4OIUeLkR8qkaybFq30M87gE+gP8MjCiOPo0BPz7U5AZBcspNMqrhzJ
         gfSTWHzqrf5tcHoqupvwWAdeN3+BRTmrM3/gVYD6EbN50MdvXvl3DtCDKxP8Pb7kGQS4
         7o+sZ+FiF75XwiOpBPybbI3+R5RmK9KUB4ZF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C+GrKZspXVcmMIVnX1dWzthERU1FGHzT9cQJvSErxDI=;
        b=wBlas6IHgXwY+KSXJ2a7ud9MPmXGHTnxwOArAboS3Bo/UkbM8IB8ft41tEuAi6Gke/
         PyQNFrhQtVrJUSSjQrPvT4bp4fVPrQRDL8OVoz8J7uJuvaVzRojaB1ieth3ZR3ng2bAx
         sBhwPe4OB4rq/CHXhm13773f+zVyU1c3Z+OZLyiL/E6yQpl8itOup4ZXdWipsGHTwsuZ
         jS5SkMjGQBdA+krYPta3720n45taNfgZLVVJLQ48ZZhidN4Zd6AM2R4BgYFQX6vEkZpW
         kcOHOVb+RE89zSKiCqdVbEDRatMMnd39uZ3ISi0SmZpbXjctU8c6zmP9/fqYWV8RP1wk
         KBlg==
X-Gm-Message-State: AOAM531ndTRkiZlHWlQ/dfzQtNQHC4RIrehSDHWVXkRiyls4gTHBryFB
	T6R+0YsP74NSDtJ81x1ASznhAPUysMKCzfLi
X-Google-Smtp-Source: ABdhPJy8t2dmPY0GrL0ueEZ0RoezcNS8F2A6t3k21XldgaeJr6gUM8wsBsdGcUGoUG7dSfaAB8PFuA==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr962115wmi.10.1631609828563;
        Tue, 14 Sep 2021 01:57:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2da1:111a:66bf:1f1])
        by smtp.gmail.com with ESMTPSA id k19sm484683wmr.21.2021.09.14.01.57.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 01:57:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] sstate: Ensure SDE is accounted for in task timestamps
Date: Tue, 14 Sep 2021 09:57:05 +0100
Message-Id: <20210914085707.1367456-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914085707.1367456-1-richard.purdie@linuxfoundation.org>
References: <20210914085707.1367456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When creating packages we build them with --clamp-mtime and use
SOURCE_DATE_EPOCH as the maximum mtime. This makes the end packages
reproducible. The data stored in sstate for do_package and the package
tasks doesn't benefit from this though and have varying timestamps.
This means their outhash varies and means hash equivalance isn't
effective at all and doesn't work as intended/desired.

We could create the sstate archives with the same clamping however
that would lead to different results depending on whether a task was
installed from sstate or not. Making that differ is a path to madness.
It also wouldn't fix the outhash of the task to be determninistic
without clamping of the date in the hash calculation code.

Instead, iterate over the files in sstate output and clamp them at
the code level. This isn't ideal but does make the file timestamps
determnistic everywhere and means we don't have to change the hash
calculation code.

This issue can be clearly seen looking at the do_package outhash for
a recipe which you then re-run the package task for after adding
something like whitespace to the install task. The outhash shouldn't
change but currently does.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 62e45cb4a8b..657a9dfb91f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -640,10 +640,17 @@ python sstate_hardcode_path () {
 
 def sstate_package(ss, d):
     import oe.path
+    import time
 
     tmpdir = d.getVar('TMPDIR')
 
+    def fixtimestamp(root, path):
+        f = os.path.join(root, path)
+        if os.lstat(f).st_mtime > sde:
+            os.utime(f, (sde, sde), follow_symlinks=False)
+
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
+    sde = int(d.getVar("SOURCE_DATE_EPOCH") or time.time())
     d.setVar("SSTATE_CURRTASK", ss['task'])
     bb.utils.remove(sstatebuild, recurse=True)
     bb.utils.mkdirhier(sstatebuild)
@@ -656,6 +663,7 @@ def sstate_package(ss, d):
         # to sstate tasks but there aren't many of these so better just avoid them entirely.
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files + dirs:
+                fixtimestamp(walkroot, file)
                 srcpath = os.path.join(walkroot, file)
                 if not os.path.islink(srcpath):
                     continue
@@ -677,6 +685,10 @@ def sstate_package(ss, d):
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
         bb.utils.rename(plain, pdir)
+        fixtimestamp(pdir, "")
+        for walkroot, dirs, files in os.walk(pdir):
+            for file in files + dirs:
+                fixtimestamp(walkroot, file)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
-- 
2.32.0

