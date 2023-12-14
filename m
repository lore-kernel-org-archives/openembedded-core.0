Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490C2C10F13
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.22351.1702561569440207416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EVbixczW;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c317723a8so72267945e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561568; x=1703166368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDCuA8x0alZUuFuCGsWiaVoAEgDZCzlDf/8YVd2NLg0=;
        b=EVbixczWzYXk7e85e8LzR7Plv2gXdI003HkSHfu6CfyfNMtXFCgA+kc8MiRPzafsM0
         A2KAkFLxjLhhpl1RYCGemBAUxZG2ToNV1rk0zEmMIbY7U19NUhlgggY3OvPImKUfkKvH
         3qVi79Oilqs/h+b9fJCO3kX/uytiZp8nUHNFhVMcMF56nYmMFRs3vzjlIBeZGSFyodQJ
         3nUIjZW7Q1xAQdBWnP9RICm09ncx/iLQRbzcpUa2NEJbwZYNa2wuEeo7ucSuTgz7rxZm
         5REtLvInESVpCfkn1BfMHe41zQfwndpxPImtSm/fu59qafdxbHvY9nqS9FaHBfqnELSg
         ZwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561568; x=1703166368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDCuA8x0alZUuFuCGsWiaVoAEgDZCzlDf/8YVd2NLg0=;
        b=I9sRQ13zddl8dNjWCdNs1K2jcD6OOP/Z7CIsBoG5C2cmCKLCPZ5Yup5pNTA1db8FEh
         WRKTM4A4vqegOa+SHyNpFu48VBbTzoWRR/L1+uAzsTdLUqYDDP2tsyj+iJzw1dfg0qA4
         UB1YKoeR5NUaQW+egGVDbhjj9GEablHHOSdgJ7RTYDud/f1m01yQ0kWd3ItzwU1Vh59C
         LBemFIh7ndLraJNhl0BZSwBENo9pAb4h1S5Q6FPoIrqLeNot2wgYXHaI2s+0niNNZDCq
         E9H9CgE40+AH374CVYFbPVoZyR5Qce4dsYyUEVKk45AJymGDOUDGR/rLpR4WuRnZHs0K
         TX8g==
X-Gm-Message-State: AOJu0YzfHn6/aoUSdUZrcVqjU5LlqsSuzSO2J3N+w2dmhD+/NEKxTIi5
	Ab2jhofAXSB41MOo6DfRmz3ToaY4gQw=
X-Google-Smtp-Source: AGHT+IGGje97Xj/9QpZn5gBCzTBKy63SnNTkDaIM6MSg4wqBAENvtj6BufOOTx1VSSTDoXJi4N0LQw==
X-Received: by 2002:a05:600c:492f:b0:40c:3464:f816 with SMTP id f47-20020a05600c492f00b0040c3464f816mr4854189wmp.51.1702561567836;
        Thu, 14 Dec 2023 05:46:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/9] sstatesig/find_siginfo: unify a disjointed API
Date: Thu, 14 Dec 2023 14:45:25 +0100
Message-Id: <20231214134528.1973602-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214134528.1973602-1-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192376

find_siginfo() returns two different data structures depending
on whether its third argument (list of hashes to find) is empty or
not:
- a dict of timestamps keyed by path
- a dict of paths keyed by hash

This is not a good API design; it's much better to return
a dict of dicts that include both timestamp and path, keyed by
hash. Then the API consumer can decide how they want to use these
fields, particularly for additional diagnostics or informational
output.

I also took the opportunity to add a binary field that
tells if the match came from sstate or local stamps dir, which
will help prioritize local stamps when looking up most
recent task signatures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/buildhistory_analysis.py        |  2 +-
 meta/lib/oe/sstatesig.py                    | 31 +++++++++------------
 meta/lib/oeqa/selftest/cases/sstatetests.py | 10 +++----
 3 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index b1856846b6a..4edad01580c 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -562,7 +562,7 @@ def compare_siglists(a_blob, b_blob, taskdiff=False):
                 elif not hash2 in hashfiles:
                     out.append("Unable to find matching sigdata for %s with hash %s" % (desc, hash2))
                 else:
-                    out2 = bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb, collapsed=True)
+                    out2 = bb.siggen.compare_sigfiles(hashfiles[hash1]['path'], hashfiles[hash2]['path'], recursecb, collapsed=True)
                     for line in out2:
                         m = hashlib.sha256()
                         m.update(line.encode('utf-8'))
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 8a97fb0c04b..0342bcdc87a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -349,7 +349,6 @@ def find_siginfo(pn, taskname, taskhashlist, d):
            pn, taskname = key.split(':', 1)
 
     hashfiles = {}
-    filedates = {}
 
     def get_hashval(siginfo):
         if siginfo.endswith('.siginfo'):
@@ -357,6 +356,12 @@ def find_siginfo(pn, taskname, taskhashlist, d):
         else:
             return siginfo.rpartition('.')[2]
 
+    def get_time(fullpath):
+        try:
+            return os.stat(fullpath).st_mtime
+        except OSError:
+            return None
+
     # First search in stamps dir
     localdata = d.createCopy()
     localdata.setVar('MULTIMACH_TARGET_SYS', '*')
@@ -372,24 +377,21 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     filespec = '%s.%s.sigdata.*' % (stamp, taskname)
     foundall = False
     import glob
+    bb.debug(1, "Calling glob.glob on {}".format(filespec))
     for fullpath in glob.glob(filespec):
         match = False
         if taskhashlist:
             for taskhash in taskhashlist:
                 if fullpath.endswith('.%s' % taskhash):
-                    hashfiles[taskhash] = fullpath
+                    hashfiles[taskhash] = {'path':fullpath, 'sstate':False, 'time':get_time(fullpath)}
                     if len(hashfiles) == len(taskhashlist):
                         foundall = True
                         break
         else:
-            try:
-                filedates[fullpath] = os.stat(fullpath).st_mtime
-            except OSError:
-                continue
             hashval = get_hashval(fullpath)
-            hashfiles[hashval] = fullpath
+            hashfiles[hashval] = {'path':fullpath, 'sstate':False, 'time':get_time(fullpath)}
 
-    if not taskhashlist or (len(filedates) < 2 and not foundall):
+    if not taskhashlist or (len(hashfiles) < 2 and not foundall):
         # That didn't work, look in sstate-cache
         hashes = taskhashlist or ['?' * 64]
         localdata = bb.data.createCopy(d)
@@ -412,22 +414,15 @@ def find_siginfo(pn, taskname, taskhashlist, d):
                 localdata.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
             filespec = '%s.siginfo' % localdata.getVar('SSTATE_PKG')
 
+            bb.debug(1, "Calling glob.glob on {}".format(filespec))
             matchedfiles = glob.glob(filespec)
             for fullpath in matchedfiles:
                 actual_hashval = get_hashval(fullpath)
                 if actual_hashval in hashfiles:
                     continue
-                hashfiles[hashval] = fullpath
-                if not taskhashlist:
-                    try:
-                        filedates[fullpath] = os.stat(fullpath).st_mtime
-                    except:
-                        continue
+                hashfiles[actual_hashval] = {'path':fullpath, 'sstate':True, 'time':get_time(fullpath)}
 
-    if taskhashlist:
-        return hashfiles
-    else:
-        return filedates
+    return hashfiles
 
 bb.siggen.find_siginfo = find_siginfo
 
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index f5b3437d86b..83abcdfdd62 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -765,14 +765,14 @@ addtask tmptask2 before do_tmptask1
                 hashes = [hash1, hash2]
                 hashfiles = find_siginfo(key, None, hashes)
                 self.assertCountEqual(hashes, hashfiles)
-                bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
+                bb.siggen.compare_sigfiles(hashfiles[hash1]['path'], hashfiles[hash2]['path'], recursecb)
 
             for pn in pns:
                 recursecb_count = 0
-                filedates = find_siginfo(pn, "do_tmptask1")
-                self.assertGreaterEqual(len(filedates), 2)
-                latestfiles = sorted(filedates.keys(), key=lambda f: filedates[f])[-2:]
-                bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)
+                matches = find_siginfo(pn, "do_tmptask1")
+                self.assertGreaterEqual(len(matches), 2)
+                latesthashes = sorted(matches.keys(), key=lambda h: matches[h]['time'])[-2:]
+                bb.siggen.compare_sigfiles(matches[latesthashes[-2]]['path'], matches[latesthashes[-1]]['path'], recursecb)
                 self.assertEqual(recursecb_count,1)
 
 class SStatePrintdiff(SStateBase):
-- 
2.39.2


