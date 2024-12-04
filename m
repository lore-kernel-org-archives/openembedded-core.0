Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5A7E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:37 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.25625.1733345132261903003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wmSw6qXj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-724d23df764so235182b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345131; x=1733949931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFZA8aQuopove7ylwndLUtDoEtblC8MOPaxwl5JNNvM=;
        b=wmSw6qXj6PUJ5qdYno+4lJ8msEGUrWyayC4NE80uZlpWrOuDDVCpyvQ6CqYk/5HCiO
         LOjrHEXwnBPK8YR3bqcagGPqlycD7GU/ATD7vO1f79sq3hIE/9S7TWngM9Xc03z7iOxC
         uftMfQseJQuKhYojjrsvijuv/BuTS0dzWradBlRpOxIOKb7YXxBMbpu9ZkbNYDQZDLM8
         /CO5uNRIqkFPikiJnpIg+xjnmYbNxQQjgKr5VLmQGR8px54m6dXL6NHJ2o+vixBYTqdN
         nBG/fMhp0hDL+hNHLGoygCsvV9tl98btao/O+2ua43z8Gy7CovHn7s9K5J0yLzL6nCx1
         68MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345131; x=1733949931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFZA8aQuopove7ylwndLUtDoEtblC8MOPaxwl5JNNvM=;
        b=gA72RbV/vP0nFdKAGV0lUJuPPJHwX+2XIHPt/Yg+1tlzpP0gFaKo1T26AbP3EK72Xh
         dM0oR48L8AgdIO4jE4DGoNdHJ8hZg8JnUTB+QhjDjtYKgQyjsNJDJCDd7uLbufp8SNy+
         FNTq9qVIZaGo6UXvD03d+GgWdi85wb9P8As1Ayd7aOzsHjHYBiQBEEw1Sha76YyJx73m
         oIobu8toYcxj79NS87Levwc/TvF3QEZ1e/hUa+Lg2Y6dYCbwKxpTp8H+wQCgz3B24j3E
         W6LOigaqo+2VmV3kEtWROPR6rP7aBOZ+QANDX/iEHggvnzOXZAeTSl2PxVM/xXDo8bhx
         /Aqw==
X-Gm-Message-State: AOJu0YwLXImxMlJVkL3eEX5dgRrgdX71gY+z0Zqej7TNSWbFoTLngkY8
	nIdUqCCZ9NspNDn369nPNiFZtkXOt4aLs6ZvJecz7rkdiXX8FGq3/fDO2Q4Bk7S4mYkqWBa161a
	I
X-Gm-Gg: ASbGncuQlmH6lpGB3uklQN1YyJ6INt9jQE4myJvnbhMjX2J9gSWvI3LQUvO2rYd1kCQ
	2UvATl6vHJ+7PyVZGfpw/tC3KpTVlHZJnmtE5RgQI3GaRX19anuvEBIgCOnUAJJithYL+Q/nXIB
	/HdgnbFX/r5j+I16sbDN6OSWixObzt/yf457cANKz1+NfeSGVrxugyxtVRZ/NGnA9/4mFBbopjN
	zqpXrZa5GylFSO7Ks+KjOQq7sENFoFaMpGjO78=
X-Google-Smtp-Source: AGHT+IG2ExkLs9Oyi9+fLxHffPeNFlhwziZhFKe2aOF51aEphH/sYvvTVWExQ55Wm6Limr6i52Jg3g==
X-Received: by 2002:a17:902:ecc9:b0:215:931c:8fa7 with SMTP id d9443c01a7336-215bd0f88f6mr100070255ad.31.1733345131389;
        Wed, 04 Dec 2024 12:45:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 03/14] do_package/sstate/sstatesig: Change timestamp clamping to hash output only
Date: Wed,  4 Dec 2024 12:45:12 -0800
Message-Id: <0e6b2c761f6d727fe21a0ce2803a0f0aef236f59.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208347

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
index 11bb892a42..8e0391c666 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -641,15 +641,6 @@ def sstate_package(ss, d):
 
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
@@ -664,8 +655,6 @@ def sstate_package(ss, d):
         # to sstate tasks but there aren't many of these so better just avoid them entirely.
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files + dirs:
-                if fixtime:
-                    fixtimestamp(walkroot, file)
                 srcpath = os.path.join(walkroot, file)
                 if not os.path.islink(srcpath):
                     continue
@@ -687,11 +676,6 @@ def sstate_package(ss, d):
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
index f883497292..1f97606763 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -564,6 +564,7 @@ def OEOuthashBasic(path, sigfile, task, d):
     if task == "package":
         include_timestamps = True
         include_root = False
+        source_date_epoch = float(d.getVar("SOURCE_DATE_EPOCH"))
     hash_version = d.getVar('HASHEQUIV_HASH_VERSION')
     extra_sigdata = d.getVar("HASHEQUIV_EXTRA_SIGDATA")
 
@@ -655,7 +656,11 @@ def OEOuthashBasic(path, sigfile, task, d):
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


