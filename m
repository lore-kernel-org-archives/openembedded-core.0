Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F631E77176
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:05 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.21465.1733334900437498939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QsGiC5kn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fc41b4c78bso40338a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334900; x=1733939700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fptav1KW7SbXcwI5XuNHn+bN/D0qXV+c8Hnp7A4kqfs=;
        b=QsGiC5kn7qCLjumcNoUofHaF53NZ/9R40/uFnGg+1P4gY6m348s24LghsrpacvddT5
         cxFgROnoTdhyMFg2IQVpnQweiMQD5uemNvWL5zTzHnj8/VhetzEoq4guEGcECqImQude
         qfPh8QoX9lJ9sGbAK9csTFF2BK5unE6VrgBagA0gIZ42gS8o59L2v9Nt3irzKUjKeIvh
         Cwkyz1qH09wMLM/IxeBCsQeGny/KVA4AIazuGVSMcZjRAE62jpcAlCVjMVo9gNu817Zj
         EIF5YQNYqqQTb8bXi9rArl4pATrmgLHLrYACKJXYZ0Pg5zgUIkZ7PuyMjGZKHLBcn1bm
         5StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334900; x=1733939700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fptav1KW7SbXcwI5XuNHn+bN/D0qXV+c8Hnp7A4kqfs=;
        b=IhIYRoyByXqPiKZXmigkm5vXcBoOPWgP3sQRzS4m56fiCzztDWBQ7ZWJ0oN3+86BGX
         Dvgkb5EnKSAzU7WSfW9S7oXPDvG+bS+VmR0Z26p8dpPLTtCh5VFMNgz+qihTHu60usNC
         eDYk+GA1rLCDHXPY2GvaGGKqLelX53KDzAeGSiZCrhB4xz2/CZVcVsNtjP5DFoTk+fds
         KUGjyeeY2N/C9iVt7NPbtvF6/LylwL2Y7JNvwjQ2cM0YLShsQVtkaDXOyfPfbCIOmhLo
         sIbHLoe/upyxTtt6K0Q+TFDMyrIdexPC7La5lKLLBANktLCqGlJrh98Z+cdQG1nj092V
         TLgw==
X-Gm-Message-State: AOJu0YxLdwUT8Lu4k3ftN6CbejYsqTO+ngSOsjkBXbrnW1NiXhKJa43j
	QqvPVHJomsqkX81ZzPCsJIyH8dxjArSUkSbKBUtEmTEysdUKPzSGsthccrZRGC4bctGYAoD7UhC
	Y
X-Gm-Gg: ASbGncvoNfPbsU3XFV21y30vQo/d2S5iEP3Slgybf0dHe6rhi5FbUrWxyIJVMAhOC46
	yDcV9vTwX5JJbuf5FJeZC1rPk1AZWv322lW5m8gVtgpJEw/9KyAQpn+ipK7fhu6RQiy4uZyh/sK
	u8xrUhLJWWIhrdQL7jvHWEO1QodP1S9ncBalWfz+QE81aPTAHzV0ROMFRCt+t/NIFkslIaYSK0y
	NPo1RmdyF+dpX02i2JHpe24iZ+NWQENDNb/qCE=
X-Google-Smtp-Source: AGHT+IFhtAyBznBToItXo8R5I0B+q62uIYpg9NsjLaL6J68fbt6WZVQSeFLzRR9BqBHbxa3G5yMCfw==
X-Received: by 2002:a05:6a20:9f9b:b0:1e0:da90:5f1f with SMTP id adf61e73a8af0-1e1653b9d15mr10284243637.16.1733334899704;
        Wed, 04 Dec 2024 09:54:59 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/38] do_package/sstate/sstatesig: Change timestamp clamping to hash output only
Date: Wed,  4 Dec 2024 09:53:53 -0800
Message-Id: <0c93bb692b39af51f0ca109dfd1f949abe7eea9c.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208309

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
 meta/classes/sstate.bbclass | 16 ----------------
 meta/lib/oe/sstatesig.py    |  7 ++++++-
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 91d42665c1..6bfccbb907 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -660,15 +660,6 @@ def sstate_package(ss, d):
 
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
@@ -683,8 +674,6 @@ def sstate_package(ss, d):
         # to sstate tasks but there aren't many of these so better just avoid them entirely.
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files + dirs:
-                if fixtime:
-                    fixtimestamp(walkroot, file)
                 srcpath = os.path.join(walkroot, file)
                 if not os.path.islink(srcpath):
                     continue
@@ -706,11 +695,6 @@ def sstate_package(ss, d):
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
index 30f27b0f4f..331b67c6e4 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -510,6 +510,7 @@ def OEOuthashBasic(path, sigfile, task, d):
     if task == "package":
         include_timestamps = True
         include_root = False
+        source_date_epoch = float(d.getVar("SOURCE_DATE_EPOCH"))
     hash_version = d.getVar('HASHEQUIV_HASH_VERSION')
     extra_sigdata = d.getVar("HASHEQUIV_EXTRA_SIGDATA")
 
@@ -601,7 +602,11 @@ def OEOuthashBasic(path, sigfile, task, d):
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


