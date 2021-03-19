Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.308.1616174820867472849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JdwN6/yS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so8724845wma.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 10:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLbwH/zQDw+rNIVqFjaoMf706JJELrDixzO2q/AlRjM=;
        b=JdwN6/ySzuXkaHIX2huJgtNCOfi2Vi2BQ7f6mM/ga9yqt3nDJqRct+g9iz+Mk+k7iR
         jwqDr/xEZdYr3aCkDvtGp3Fn5DzoLfkENTrpf5AIEqwbOw1YcFqVqLUG1F33gZn1A/Qk
         025wOfkPZNvrZRpUJOtJKOgpsz+1Y3Ri/qQXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLbwH/zQDw+rNIVqFjaoMf706JJELrDixzO2q/AlRjM=;
        b=C+WdUSkzxqNCB9oxIr6Sg/GNSLnGlsd+sYG67STgg+q4V9LIN7CFR857uxBvn2WPJC
         KmXW3sk+RQsmFnHuy2lHbJHPiQLx70GSxrJwQrvDEG7Cw3jHDV+C8HSibD6GEDsDghhY
         oFzkLHdAbqWTTdfOCuDfGq93N/pnvhYGAgVWn5g0Pd15b/HpH7PTO+Y7VYQeTncOZW4r
         //egbd2T6vZSoJweTD3JIFAc0m9C2MCzloBhCI+7w6/lXRGNwTUMaFQP0c05W3qiSv8C
         AdOVVpfZT7Lm0qfFQf5WlZwg4eaDBtGF9UP4hKttd6iqe2Mj7nN2J3oNTDNDtAU3nSMm
         m4wg==
X-Gm-Message-State: AOAM532MD7FxCZkM8Z/EreYKwng/m/ialsKRhnOpbsAruzNSLib1LG8c
	F2ig24qa7ZdpNx4xHs1ibr34qZgKjDXbSQ==
X-Google-Smtp-Source: ABdhPJyGBQlmZc6P1FMiyibhIEMyu1A0TPFlhBJV52PxR2I/NcNnD/5B3VQekAyGFQ/9uyArV1n65A==
X-Received: by 2002:a1c:7fc9:: with SMTP id a192mr4475364wmd.15.1616174819012;
        Fri, 19 Mar 2021 10:26:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id e17sm10691283wra.65.2021.03.19.10.26.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:26:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Remove stale objects before the main build
Date: Fri, 19 Mar 2021 17:26:58 +0000
Message-Id: <20210319172658.228940-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The split of util-linux-uuid out from util-linux caused some interesting
sstate file overlap errors on existing build directories. This is a
challenge to handle since util-linux depends on util-linux-uuid and has
overlapping files in package data and deploy/packages directories.
The util-linux build happens later and is what would clean up those files
but it happens too late for uuid.

Fixing this is hard as we don't know the taskhashes until the task
graph is calculated. Once that is ready, we can compare the hashes
with the existing hashes and know which sstate tasks are "stale".

This patch adds a handler which iterates the sstate manifests looking
for matching stamp paths and then removes the manifests along with the
associated stamp files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f5791681625..673292c450d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1223,3 +1223,48 @@ python sstate_eventhandler2() {
     if preservestamps:
         os.remove(preservestampfile)
 }
+
+addhandler sstate_eventhandler_stalesstate
+sstate_eventhandler_stalesstate[eventmask] = "bb.event.StaleSetSceneTasks"
+python sstate_eventhandler_stalesstate() {
+    d = e.data
+    tasks = e.tasks
+
+    bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
+
+    for a in sorted(list(set(d.getVar("SSTATE_ARCHS").split()))):
+        toremove = []
+        i = d.expand("${SSTATE_MANIFESTS}/index-" + a)
+        if not os.path.exists(i):
+            continue
+        with open(i, "r") as f:
+            lines = f.readlines()
+            for l in lines:
+                try:
+                    (stamp, manifest, workdir) = l.split()
+                    for tid in tasks:
+                        for s in tasks[tid]:
+                            if s.startswith(stamp):
+                                taskname = bb.runqueue.taskname_from_tid(tid)[3:]
+                                manname = manifest + "." + taskname
+                                if os.path.exists(manname):
+                                    bb.debug(2, "Sstate for %s is stale, removing related manifest %s" % (tid, manname))
+                                    toremove.append((manname, tid, tasks[tid]))
+                                    break
+                except ValueError:
+                    bb.fatal("Invalid line '%s' in sstate manifest '%s'" % (l, i))
+
+        if toremove:
+            msg = "Removing %d stale sstate objects for arch %s" % (len(toremove), a)
+            bb.event.fire(bb.event.ProcessStarted(msg, len(toremove)), d)
+
+            removed = 0
+            for (manname, tid, stamps) in toremove:
+                sstate_clean_manifest(manname, d)
+                for stamp in stamps:
+                    bb.utils.remove(stamp)
+                removed = removed + 1
+                bb.event.fire(bb.event.ProcessProgress(msg, removed), d)
+
+            bb.event.fire(bb.event.ProcessFinished(msg), d)
+}
-- 
2.30.2

