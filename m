Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F86E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:36 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.25422.1733344594464527439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FfIQ5/eg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7f71f2b1370so135594a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344594; x=1733949394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3bhmjqvLnBP1LaISkKcgyJpywGaytYP2D0HxkK+hDc=;
        b=FfIQ5/egMe7JDf04MPT1pHk1udoAAK5ONXuAzwiazzgPQ8G8KVgxfc4f42zCEXUDdv
         de2IDnANYnE3V+sWqNgVJnGPKkeYsa8kfn//8CVdFB3mfn6yABl2OpRyJC/ckWhno89X
         byvaHg65Om70lGMePBhax8zslsJm+pSfX2ylWttZsWFia9o0CpzdsK1FFAJ+Qvt41ArW
         NZNOfraArVFjic+gGVWsGwnzFe/AGpSkPLQC6V1PkRPyVO52pYsUFs0CWZJ4o5kWRMqK
         caWYiJQZgkwpz3vYn7LL1/4SgsKEXSUAHoZaTCB1dZdQtLjYUXM/IG1gW/2ogP553jDR
         VXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344594; x=1733949394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3bhmjqvLnBP1LaISkKcgyJpywGaytYP2D0HxkK+hDc=;
        b=IqLg5fbpozCv8DM/flyqzHzPMyYM1+ucsQ63sMEVuXpIuZR1F8xTJLaUY3beSbEVf9
         +cwp70on3hmuBk0d9j8kAENf+rHvqRtaU5+eCViwN09WrNa67m33TviEcvEXimxsexZ5
         zVteF7hLhpDOB4S9K/Sl58gHRdMIoGNPCibhQnmZ1UiIbxvk+COVPlIIcnluZwecSMFK
         ycK8I2Nvg605oLhATuyeJmZhNLKMnimGMmXRUlnl6McwvhfprDgnzyd7SAtJeyNpY/bv
         w7d2azFuXUIOHaxMCMFQkPf3Gpn/AQD1k40OkJo/Q8jYEHPJXNflrO1tk2yhQQBcGXpK
         Dmsw==
X-Gm-Message-State: AOJu0YxvzXfI6EyDLNNdmXJYfxQC70vDQcu/8yco5d28bEVkV71kCrjt
	LtjqGcMbMtklOG3le7gfLCYW11EJic7007Ju4JQBGF2vf56wEHIQ16yOevnzkOJE01vGlUxj44i
	U
X-Gm-Gg: ASbGncutjK+F1phRnEJ6qTlbG2EDJwU8znRptNwj3aN7tvZkOfyfnBRt/lvV6mSJ+Ds
	la9C+0eB6nj6Fh7AVp+F9CvmYPBxJEcPuPI55hvxOdlwOT3smu3wb2MRIvD4+IK+TJ24R+1f+Q0
	npJowderK7MpmOOd45RDqYqnmmdJrcNpqFc3pcmgKGmXa9PCjf7EZtwlmkaIx7pGyoEEqfO3Iyi
	XI44M6qYP766WapFn1+1iKewZhRZeazt9SRQPQ=
X-Google-Smtp-Source: AGHT+IEkVFHuLVE1SedAoyV9KVGDr8dgMWxOl6qkFzJktVWOkYNthBaNTcZpDLyzDTvrq9Z8LLm4sw==
X-Received: by 2002:a05:6a20:7285:b0:1d9:78c:dcf2 with SMTP id adf61e73a8af0-1e16bef0a05mr10082096637.43.1733344593648;
        Wed, 04 Dec 2024 12:36:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/15] do_package/sstate/sstatesig: Change timestamp clamping to hash output only
Date: Wed,  4 Dec 2024 12:36:10 -0800
Message-Id: <9df0bf5775ec96773e77c489ba6a443037d65ab6.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208331

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The code was changing the timestamps of the files in the do_package output,
particularly the files added for debug sources. This was to do two things:

a) make do_package sstate more reproducible
b) ensure better hash equivalence matching

Unfortuately the debug source files are hardlinks into the source tree for
efficiency so touching these, touches a lot of files in ${B} and ${S}. This
causes unpredictable effects if compile is run again for example, or could
cause compiling in the install task.

The hash equivalence matching is of key importance but we can mimic that
using clamping of the file timestamps in the depsig output used to generate
the hashes.

This patch drops the global timestamp clamping, instead allowing the files
to retain their creation timestamps into sstate. This makes do_package sstate
slightly less reproducibile. We could clamp the sstate timestamps but that
would lead to two different sets of timestamps depending on whether the
data came from sstate or not. I'd prefer to have consistent code behaviour,
rather than differing behavhour depending on whether data came from sstate
or not.

If we wanted to have reproducibiliy and fix the "corruption" of S/B and have
consistent codepaths, the only other option would be two copies of the
sources, which could end up huge and seems the least desireable option.

This patch therefore drops the timestamp clamping in the sstate files
and tweaks the depsig data generation to clamp the timestamps for do_package
instead since this seems the best compromise.

I validated that rpm/deb/ipk files still generate correctly as before.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 475759fdab7200488b2a568b2ba1aa31a456d113)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sstate.bbclass | 16 ----------------
 meta/lib/oe/sstatesig.py           |  7 ++++++-
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 93df5fa9e6..567797305f 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -648,15 +648,6 @@ def sstate_package(ss, d):
 
     tmpdir = d.getVar('TMPDIR')
 
-    fixtime = False
-    if ss['task'] == "package":
-        fixtime = True
-
-    def fixtimestamp(root, path):
-        f = os.path.join(root, path)
-        if os.lstat(f).st_mtime > sde:
-            os.utime(f, (sde, sde), follow_symlinks=False)
-
     sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
     sde = int(d.getVar("SOURCE_DATE_EPOCH") or time.time())
     d.setVar("SSTATE_CURRTASK", ss['task'])
@@ -671,8 +662,6 @@ def sstate_package(ss, d):
         # to sstate tasks but there aren't many of these so better just avoid them entirely.
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files + dirs:
-                if fixtime:
-                    fixtimestamp(walkroot, file)
                 srcpath = os.path.join(walkroot, file)
                 if not os.path.islink(srcpath):
                     continue
@@ -694,11 +683,6 @@ def sstate_package(ss, d):
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
         bb.utils.rename(plain, pdir)
-        if fixtime:
-            fixtimestamp(pdir, "")
-            for walkroot, dirs, files in os.walk(pdir):
-                for file in files + dirs:
-                    fixtimestamp(walkroot, file)
 
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index a46e5502ab..d818fce8f1 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -524,6 +524,7 @@ def OEOuthashBasic(path, sigfile, task, d):
     if task == "package":
         include_timestamps = True
         include_root = False
+        source_date_epoch = float(d.getVar("SOURCE_DATE_EPOCH"))
     hash_version = d.getVar('HASHEQUIV_HASH_VERSION')
     extra_sigdata = d.getVar("HASHEQUIV_EXTRA_SIGDATA")
 
@@ -615,7 +616,11 @@ def OEOuthashBasic(path, sigfile, task, d):
                         raise Exception(msg).with_traceback(e.__traceback__)
 
                 if include_timestamps:
-                    update_hash(" %10d" % s.st_mtime)
+                    # Need to clamp to SOURCE_DATE_EPOCH
+                    if s.st_mtime > source_date_epoch:
+                        update_hash(" %10d" % source_date_epoch)
+                    else:
+                        update_hash(" %10d" % s.st_mtime)
 
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
-- 
2.34.1


