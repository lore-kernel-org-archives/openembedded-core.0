Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.1000.1587481164299209455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 07:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gekv3fqt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id u127so4055894wmg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TywuJHLNNuglrlr2F6V7J240mkqNXrPNxdnzATBwWe4=;
        b=Gekv3fqtvW8mB2fm5oW1924sYET70aFlSCBw9FZ2QXWWZecJqUH4ihwiyZjqmAJk9k
         H46Ab+mkT9fNfSgCl7cfKJOkYV8VRNWWbJTdAVo6PS69KGX3ZFEqrAKiWSgvYCcoX9EF
         ehv5H/Z2gMueRbahfLOYJWve6LqlFL/YgMpQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TywuJHLNNuglrlr2F6V7J240mkqNXrPNxdnzATBwWe4=;
        b=VCS2lKwWSbM3se6IcmHwhi6oHrR7FmjmrHjo5USTHDV91TBVwLpPasNW7zRw7EOX6r
         Gk7dvYFXPjQiwWhhS4XZ1u1UAWQYTkr8JbOAOaHmkusCEc00LnRHGbQHHyfuXmFXb1e8
         h82rW10iML9pb2GVYjq+TxMrX5RFFtCmkzrkzGITfyucLwJBHv1yU9qoh8Rqm4L9ISij
         Iqqnb7ul614bZU47qhFQz5pMlEV8ZliybeYdiUWl04TRhI8Il3PPgMJLsWVEFXg1z/BP
         sv9O1VlSn+7y3fGVggISVBzfkfiPGb4nhv1AojfhoiuGS41TRxDxw7eVOEPzW+BkccNc
         rCug==
X-Gm-Message-State: AGi0Pub5rVaoijSOGXoZJS4hpwbzIF4X49IwSybpPuEhS6e1FWFm9S40
	0uFIe0hXrGSWCPZMH+iz5j17n0Vd0/M=
X-Google-Smtp-Source: APiQypLmIE5krtqjWrdvOp18uV+5KVBpLU1MNRaQ96ZBXfCLQxQPGTOMuQc0/tDaleJSDaMVqjAm/A==
X-Received: by 2002:a05:600c:2645:: with SMTP id 5mr5197027wmy.168.1587481162453;
        Tue, 21 Apr 2020 07:59:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s12sm3662033wmc.7.2020.04.21.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 07:59:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: licensing@lists.yoctoproject.org
Subject: [PATCH 2/2] staging: Fix overlapping file failures
Date: Tue, 21 Apr 2020 15:59:16 +0100
Message-Id: <20200421145916.861422-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421145916.861422-1-richard.purdie@linuxfoundation.org>
References: <20200421145916.861422-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If there are different providers of a file and they are swiched when the
recipe isn't machine specific, we can get tracebacks due to the overlapping
files. The issue is that the previous provider isn't uninstalled since
the system can't tell whether some later task needs them.

By tracking which tasks we depend upon, the code can now choose to
uninstall more things since a later task can reinstall if/as needed.

The code here was to protect against code with two different tasks
running in parallel which is still protected agaisnt.

[YOCTO #13702]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 5dab42745f7..5b04f88b2d8 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -277,11 +277,13 @@ python extend_recipe_sysroot() {
 
     start = None
     configuredeps = []
+    owntaskdeps = []
     for dep in taskdepdata:
         data = taskdepdata[dep]
         if data[1] == mytaskname and data[0] == pn:
             start = dep
-            break
+        elif data[0] == pn:
+            owntaskdeps.append(data[1])
     if start is None:
         bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
 
@@ -427,7 +429,7 @@ python extend_recipe_sysroot() {
                         # Was likely already uninstalled
                         continue
                     potential.append(l)
-        # We need to ensure not other task needs this dependency. We hold the sysroot
+        # We need to ensure no other task needs this dependency. We hold the sysroot
         # lock so we ca search the indexes to check
         if potential:
             for i in glob.glob(depdir + "/index.*"):
@@ -435,6 +437,11 @@ python extend_recipe_sysroot() {
                     continue
                 with open(i, "r") as f:
                     for l in f:
+                        if l.startswith("TaskDeps:"):
+                            prevtasks = l.split()[1:]
+                            if mytaskname in prevtasks:
+                                # We're a dependency of this task so we can clear items out the sysroot
+                                break
                         l = l.strip()
                         if l in potential:
                             potential.remove(l)
@@ -588,6 +595,7 @@ python extend_recipe_sysroot() {
         os.symlink(manifests[dep], depdir + "/" + c + ".complete")
 
     with open(taskindex, "w") as f:
+        f.write("TaskDeps: " + " ".join(owntaskdeps) + "\n")
         for l in sorted(installed):
             f.write(l + "\n")
 
-- 
2.25.1

