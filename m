Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.556.1625524622428981667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=F53Jsu4F;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id l26so19732990oic.7
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=huuAcNHBF0pUgqt2vKAGvoysWKhXtEYoJfRL/U9fQ0E=;
        b=F53Jsu4FcTN+dGPEJivTmnRK5gumGNUDH406AL2uoeGDpZF1jjUFuRjbYRbTWMjeQB
         x/HwR6Us1LdMpbz5WYRB30I/9nulmplTZNTWSoUWeX2unr6bg2iAJMqCJwB8sWCE8Pt2
         sey2al6kllF1p3oufVVKN15uYVfjVSzAGn2Vo4HJsfLCXS9ecR2WScpX2aFky38a3ooo
         wtALyzW8/eFs7bE+Py3406wkZuF94XV3BY4CnBsPFaYqAMxV3UbIUxwLZf0zB4Ae+wUv
         ksEf3aEQxBMtje1NxBQ8uZTSlfCkJB0K+5nt0HoOKGROCU9ZjIEzWQyyGqxgpNWueDtu
         BkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=huuAcNHBF0pUgqt2vKAGvoysWKhXtEYoJfRL/U9fQ0E=;
        b=YuKpPWaoPtGMoOvzbhLYQ4ogCFQRrlK1a/XXDXJ/KEX4PXAsRc7qkYrHhQEMe8woy5
         XQ813PO0v0ejhyOycX7xtm1H/INT7lnpVwVTb9jlwW/bkJcrB/QanpZf6DeIzVC72AU5
         VNgSLqs6A+F+hu0tQiVckPjmYeibHgvSTMj+u5am3Nm4kWMbXsF/ycNLEO7udhfIIjky
         S98H9LmKkuTazgcQUVeuRnQChefFMfv7Gap/zMYwFLw7NUbK9Q/aJGO20gUk6LWl1Ajh
         OkaXfcmNdGYjZhZ0HVEF0epFjYL04bdxW100hO/o+mihFOABfQuKcRJZBIQqhG/t/Y8p
         RzEw==
X-Gm-Message-State: AOAM530ROMnvFI0uRHweXfkxYy3wwsLUCmZED7MXcYVv3vPnGUVAw9vy
	Ty1PujtfPLd+UqC/QR+/tiaZlKqQjT0+v+Nv
X-Google-Smtp-Source: ABdhPJy3g87/Gq1vZweeloYggCb0n8tnzE81B1NtKgcMy8oYWyPYFxrhqj5p1j8OfA8z6nqTt2SkLw==
X-Received: by 2002:a05:6808:6d1:: with SMTP id m17mr1076175oih.34.1625524621283;
        Mon, 05 Jul 2021 15:37:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:37:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/19] sstate/staging: Handle directory creation race issue
Date: Mon,  5 Jul 2021 12:34:54 -1000
Message-Id: <cca936fb9e8ecbdd08ec6b0d7de43df5c2bb2323.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit 4f94d9296394bc7ce241439f00df86eb5912875f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass  | 8 +++++---
 meta/classes/staging.bbclass | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 53dcfc8274..9ed0e0c139 100644
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
index 506ce0665e..78eb914921 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -408,7 +408,7 @@ python extend_recipe_sysroot() {
         if os.path.islink(f) and not os.path.exists(f):
             bb.note("%s no longer exists, removing from sysroot" % f)
             lnk = os.readlink(f.replace(".complete", ""))
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            sstate_clean_manifest(depdir + "/" + lnk, d, canrace=True, prefix=workdir)
             os.unlink(f)
             os.unlink(f.replace(".complete", ""))
 
@@ -453,7 +453,7 @@ python extend_recipe_sysroot() {
             fl = depdir + "/" + l
             bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
             lnk = os.readlink(fl)
-            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+            sstate_clean_manifest(depdir + "/" + lnk, d, canrace=True, prefix=workdir)
             os.unlink(fl)
             os.unlink(fl + ".complete")
 
@@ -474,7 +474,7 @@ python extend_recipe_sysroot() {
                 continue
             else:
                 bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
-                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
+                sstate_clean_manifest(depdir + "/" + lnk, d, canrace=True, prefix=workdir)
                 os.unlink(depdir + "/" + c)
                 if os.path.lexists(depdir + "/" + c + ".complete"):
                     os.unlink(depdir + "/" + c + ".complete")
-- 
2.25.1

