Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.4934.1625055137564466547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 05:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BuyghtsB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id r9-20020a7bc0890000b02901f347b31d55so1386297wmh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 05:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DUHs56WsBIZYNUVQgnHM76o4fDXNil981RgGM9A/NNo=;
        b=BuyghtsBCIU3rCMCEnkqVYauCAs8AX8zJomo2AJB3Q7JmL2jIL2KuzM4iDflAeb50k
         HJLFbJ2mHoqduNwlXeD4tnVF05Zm+fbXSD9f80xcpx1BfnJeEHuEEe+Sxk+nLsBt1Pv/
         Lsy43u07GJK85Z8Es1sKmH/k5sPMWDXKL2Odk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DUHs56WsBIZYNUVQgnHM76o4fDXNil981RgGM9A/NNo=;
        b=I3ZaNPVGqzx1z5tg0gH9XZ5XYCBGYghjojC5RCSoEZSydJTrA/+uloFIh95yuES/9r
         WAfekSxQ3ChbyLU2ltTa76v6YmM1RkUIkEueXDYcMumHETcHgQ4+osZb7gPflxQguFoV
         BOpmkl8X5xolVZstwaSCvjTnkW9d+JnqO3G0E6FZ3pcm9Uc2YuBUgn8beeswWi8cfTwY
         TQ82OeNeHEcx9G/ZFSySi1Uoz2PDFhe9+ELv0DQfc3IER+cf2vCm64/nKO/VsGJ9C5jN
         jBt7CgL/b8gEadnaTISvf4o48g5cml1G2S0hMeDE7oKMcGjLlByjBFrZkCldOMzmUmJ9
         2+Cg==
X-Gm-Message-State: AOAM533p6l4LyMhePWSI6M8ee4RF9usPrXELa2iVjWosgqH0ybcKluJD
	CJQeAfGp7xd13ZY4veTVvStuEDG6BEv5bQ==
X-Google-Smtp-Source: ABdhPJwduG11FyJEo6/CmVSDeTpBv5oufqnACTmkD1PalGowLYJRbZIlGUdQG9RFrOgbj7lbpAnJxw==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr6001342wma.33.1625055136106;
        Wed, 30 Jun 2021 05:12:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fa9c:ff43:b5c6:d04f])
        by smtp.gmail.com with ESMTPSA id i14sm6862076wmq.5.2021.06.30.05.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 05:12:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate/staging: Handle directory creation race issue
Date: Wed, 30 Jun 2021 13:12:14 +0100
Message-Id: <20210630121214.1965373-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630121214.1965373-1-richard.purdie@linuxfoundation.org>
References: <20210630121214.1965373-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sstate code tries to be careful about racing around directory creation.
In particular, the copyhardlinktree code creates the directory tree first
allowing for "already exists" errors and ignoring them, then hardlinks the
files in.

Unfortunately the sstate removal code can race against this since it
will try and remove empty directories. If there is some bad timing,
a newly created directory can be removed before it was populated, leading
to build failures.

We could try and add locking but this would damage performance, we've been
there before. It is also unclear where to actually place locks just based on
the contents of a manifest file which may cover multiple sstate install
locations for a given task.

Instead, lets disable directory removal in the problematic "shared" core
path. This could result in a few more empty directories being left on disk
but those should be harmless and better than locking hurting performance
or rare build races.

[YOCTO #13999]
[YOCTO #14379]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass  | 8 +++++---
 meta/classes/staging.bbclass | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 72eebd70c91..6c8e64ed00d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -483,7 +483,7 @@ def sstate_clean_cachefiles(d):
         ss = sstate_state_fromvars(ld, task)
         sstate_clean_cachefile(ss, ld)
 
-def sstate_clean_manifest(manifest, d, prefix=None):
+def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     import oe.path
 
     mfile = open(manifest)
@@ -501,7 +501,9 @@ def sstate_clean_manifest(manifest, d, prefix=None):
             if entry.endswith("/"):
                 if os.path.islink(entry[:-1]):
                     os.remove(entry[:-1])
-                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
+                elif os.path.exists(entry) and len(os.listdir(entry)) == 0 and not canrace:
+                    # Removing directories whilst builds are in progress exposes a race. Only
+                    # do it in contexts where it is safe to do so.
                     os.rmdir(entry[:-1])
             else:
                 os.remove(entry)
@@ -539,7 +541,7 @@ def sstate_clean(ss, d):
         for lock in ss['lockfiles']:
             locks.append(bb.utils.lockfile(lock))
 
-        sstate_clean_manifest(manifest, d)
+        sstate_clean_manifest(manifest, d, canrace=True)
 
         for lock in locks:
             bb.utils.unlockfile(lock)
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 806a85773af..29005ac0b62 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -409,7 +409,7 @@ python extend_recipe_sysroot() {
         if os.path.islink(f) and not os.path.exists(f):
             bb.note("%s no longer exists, removing from sysroot" % f)
             lnk = os.readlink(f.replace(".complete", ""))
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            sstate_clean_manifest(depdir + "/" + lnk, d, True, workdir)
             os.unlink(f)
             os.unlink(f.replace(".complete", ""))
 
@@ -454,7 +454,7 @@ python extend_recipe_sysroot() {
             fl = depdir + "/" + l
             bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
             lnk = os.readlink(fl)
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            sstate_clean_manifest(depdir + "/" + lnk, d, True, workdir)
             os.unlink(fl)
             os.unlink(fl + ".complete")
 
@@ -475,7 +475,7 @@ python extend_recipe_sysroot() {
                 continue
             else:
                 bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
-                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+                sstate_clean_manifest(depdir + "/" + lnk, d, True, workdir)
                 os.unlink(depdir + "/" + c)
                 if os.path.lexists(depdir + "/" + c + ".complete"):
                     os.unlink(depdir + "/" + c + ".complete")
-- 
2.30.2

