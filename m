Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116D5C46CD7
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:44:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.40234.1702889057376452112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=favvmKXt;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54f4f7e88feso3627723a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 00:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702889056; x=1703493856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpAWXQbY8MP84gzbq4goyuUOCkPrrct4XgapFfia3y0=;
        b=favvmKXtTxqr3JeTDj/yRlrqkFnxr4vZ3jTdo6FIdFu8BXZO+X1tQHgKFRKOAjGEC+
         cRkyyeFkB7IpMvpewiTI+B6WMnlCXXbKpUw3nz2k2qbSYaKwxvb2UcF5fhudk+pMPK3N
         FTpAj+hcbWXy9FdVqt6cxkJ7vTY0E+5tgi6IO3YRQK2sOoIBQ0S4hytViF+K4NYXnymL
         PgxfudGFaVLTxhqNyxtz3vvabeAVxV7SD3QIuiWjJz1wiEG2+ViXVYisahNiUUwDQ1pC
         9WiFxxG4XWAvs+sCYT2oeWy16kbGAMhi5bh00KnQ+OG9GQq+0doOrMtZv64254Rs6XJE
         Hkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889056; x=1703493856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpAWXQbY8MP84gzbq4goyuUOCkPrrct4XgapFfia3y0=;
        b=Z49HV4hIvh5uU1H0hpPejFXPWAp8FvSlTK9Ww3QM1GeaTst7X8H1gqJN7y/fRSR+wf
         qtxN6VO72CjNSfm2iIOjNqXuwCgav3/ZV2htjvVdBfqAVOgsDAlD3A+Wwn7DfY7wz2bc
         XWXOus5dAPJEDsH94TBneKsGnJ3+UOzjGS9F9S+OMvGBCdtkKhg8GWaewg4CPykouXdK
         48UBYOWpw1MpUqQLozTFL0LTavT8IhKw4ZRM7iKBuZsxlpSaZke9KWsdmdHyJliUyNUD
         ZccAgVBZiSKG2vmdxWd4mSOiX+ONPRtdd+ugOgu3ZTOwhjFf+kyJ9SFmyUS/+kmjd9Wo
         nkvw==
X-Gm-Message-State: AOJu0Yw8l281V4R+oenvND6yZpaIlqeNBgSa4PKcDmK1GdpDO9V+JxYM
	h814CFkEK72/qtVf9F8QNH3668OfAXI=
X-Google-Smtp-Source: AGHT+IG8OiXcn8EJAalBzSNzbwTCkXsXPNjYZSzcqu+G9H7dRFx7DEeP5MI1X1sjWg9T3KYlv2/JwA==
X-Received: by 2002:a17:906:73d0:b0:a23:482:ee6e with SMTP id n16-20020a17090673d000b00a230482ee6emr3513431ejl.20.1702889055085;
        Mon, 18 Dec 2023 00:44:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vt6-20020a170907a60600b00a1ce98016b6sm14016299ejc.97.2023.12.18.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 00:44:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] sstatesig/find_siginfo: unify a disjointed API
Date: Mon, 18 Dec 2023 09:43:59 +0100
Message-Id: <20231218084403.599015-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218084403.599015-1-alex@linutronix.de>
References: <20231218084403.599015-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192615

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
index 6af3c8f2178..6da3ef3ca77 100644
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


