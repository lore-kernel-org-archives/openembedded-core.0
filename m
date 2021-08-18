Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.60477.1629318602637055778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 13:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PbZjHqWQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id a201-20020a1c7fd2000000b002e6d33447f9so4171905wmd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 13:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MCE6BY8os7Ks088Ms2HyoePhzOnazbf4r70QqJVU0+s=;
        b=PbZjHqWQCRWthu73LXPBunDdkk8GoynjKccni9j5Efxv136pRQN3Mi4N4iSJoYwL5y
         GTKp7GOb7HzU19Xwu8EqtvecUCRe6SNYFrHZpRYMv/522e+9427lHsJra/Tr+H7o17iG
         dBkIHABahh9XFvhkPdmwKg+EoVMAxoHyNjnU+YyQnu3UShlUvV7qeYpzP+fS7JJOmJ3e
         FtteAfrG+hmq1ekOo0UC3+GJzO+yJ8Wh96WWI8a+WcR2lPELifIBmQMYzyATQ+ECvwee
         9xbUQtpI2MVy6yG7yi4XVXADhZPn6SpE+IXHmQHxDyL3p9oE826Oukll3XKs0PzkG9mY
         s7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MCE6BY8os7Ks088Ms2HyoePhzOnazbf4r70QqJVU0+s=;
        b=COfdDYYJZD4vG0oJs+XWCNOlQX6YasRpXAxDNTNIsxg3LmdAUY6mTfPXQd1BLkh9uj
         eV8pxr5bv4K3Cd7fu5ys+Z2rA7eeSq0T+n9tf5aPXpjnRPfxV4lX05F4MzYfLGaI9ID9
         PJQFc0MAX+udehLzLtaCEchTlZdYTJ1ldBVulPP13QMAk4biTvkdWgpXqDOxIjpBcPRT
         LdXK3BdT3lfmJJWQmivMEfL48lc4UGmtHfICj45nKEQi379SHYB4uQ/HJ0WCW89ffK7C
         LGxCyTcNgiNVGxtB2fEyLTqNjErCzvsJinwxD5ruXBld21s1yP/1UJhzNakEE2tr4Y+o
         ZIvQ==
X-Gm-Message-State: AOAM533OMe2IclFmEGDV4fHwDRFbeOIyy24eWl86IInl6a0cTaUtvJPd
	e2O02pOHhGLkNuQcd9d33u27iYA8rek=
X-Google-Smtp-Source: ABdhPJzEhZSFxPQjGo4PQZ69m4D6MFhFusvkLJnxXGO15XT7pE0ZlLRkhhiiXnKRbVATq9BpBGqxbQ==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr9892807wmj.131.1629318600689;
        Wed, 18 Aug 2021 13:30:00 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id d145sm5966189wmd.3.2021.08.18.13.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:30:00 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 1/4] sstate.bbclass: track found files on mirrors with a counter
Date: Wed, 18 Aug 2021 21:29:51 +0100
Message-Id: <20210818202954.143099-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
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
2.33.0

