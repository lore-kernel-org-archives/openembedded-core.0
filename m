Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.56950.1629303861817748785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tV7mQxsP;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id g138so1978798wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9k6IHgcE0MxtfKX03olhYF8u8fosM18hhbsTa/5EmWc=;
        b=tV7mQxsPBGzwEmUf2gdUUvaOy0E+gABpkCQe49ABP7M2CsPd/4s/qv1rQ1UNrMctms
         u/f4thm3cbVzCPA2A9sbRRwXTI8P/4hp21iP9CB445+AyQoSZV5db2WMP4CnYCJMBK1B
         K61mscjjvgjx77REaHcBUkJ4FWYIgg8IQU4QO4uJA+G2sKeiIeVYQ86YWcB47xFFRtzR
         TbO7cXiX09c7zDWqHuR/dsp9oGgi0Qs1xxqYrO36vmk4+PgbD1w3Bi/WA42i9nFKomus
         9132w7Bi/5NgbWFTuTYoleS00vfGFRI1hNutiWbW/S1fkH0yWddAFAbO3G1s0cb8YTTe
         a6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9k6IHgcE0MxtfKX03olhYF8u8fosM18hhbsTa/5EmWc=;
        b=jzo8db+JWI+O2w7gXg4jmMc0zoultcVNkj0PI4QD9aQWrhQKU0SPbC32oPuj/y4oCe
         UPGINoYLJp93ZcJ8nMV/hZjRbLpJYJThzsBgQWJ3ZrSEawoXxpynGQUC8Pz3VcVw7enE
         JrdW0nWhVIt24zOgJPWHKdxDEgSVOb34m4zKzp2SAnBAZ0tnFF8xmE1GIEOrWyCig45b
         I0jngUgIGh7AscgKS56AqjzvNaq0fhIyg8ho1kJImQd4+BlNFCD/K/QMz7OpEwph8KaZ
         DbyKAY03s9VynSj5oeIFwkna1YBOhcQtfmMqberhjgIwFTQ/f/1/T09ISFyqaAq4Cuyz
         4h2A==
X-Gm-Message-State: AOAM532oS94jgBgZ1Pt5gUFjBxRpSfc6PQc2uAqon6fVcvgvCv7QrHI8
	aAxR77Hca0mf36KC0Duk4IGuygcO6PQ=
X-Google-Smtp-Source: ABdhPJxtJgod9VoLWi1jCUWXpchYP554UkS5tRvd0X+m8rx6I7QqzP5Ip4WKN+uk9eSxU5CaO6XvEQ==
X-Received: by 2002:a05:600c:3ba9:: with SMTP id n41mr9010669wms.111.1629303860119;
        Wed, 18 Aug 2021 09:24:20 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id g35sm6086688wmp.9.2021.08.18.09.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:24:19 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 1/4] sstate.bbclass: track found files on mirrors with a counter
Date: Wed, 18 Aug 2021 17:24:01 +0100
Message-Id: <20210818162404.130067-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't need extra python collections to count the found files
on the sstate cache and sstate mirrors.
The main found collections provides all the files that were found,
then we only need to count the files on sstate mirror

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2175ace4c4..2575750247 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -871,8 +871,6 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     found = set()
-    foundLocal = set()
-    foundNet = set()
     missed = set()
 
     def gethash(task):
@@ -905,12 +903,11 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             found.add(tid)
-            foundLocal.add(tid)
-            continue
         else:
-            missed.add(tid)
             bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
+            missed.add(tid)
 
+    foundMirrors = 0
     mirrors = d.getVar("SSTATE_MIRRORS")
     if mirrors:
         # Copy the data object and override DL_DIR and SRC_URI
@@ -950,8 +947,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                             connection_cache=thread_worker.connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
+                foundMirrors += 1
                 found.add(tid)
-                foundNet.add(tid)
+
                 if tid in missed:
                     missed.remove(tid)
             except:
@@ -1013,7 +1011,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         match = 0
         if total:
             match = len(found) / total * 100
-        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal), len(foundNet),len(missed), currentcount, match, complete))
+        bb.plain("Sstate summary: Wanted %d Local %d Mirrors %d Missed %d Current %d (%d%% match, %d%% complete)" %
+            (total, len(found)-foundMirrors, foundMirrors, len(missed), currentcount, match, complete))
 
     if hasattr(bb.parse.siggen, "checkhashes"):
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
-- 
2.32.0

