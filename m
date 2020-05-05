Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.1514.1588648853171284071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wAfWpHBX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id ms17so402884pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zS2NzNQ7DZzgdJXcc0hFivdufXydMmA+AxDklIUKpv0=;
        b=wAfWpHBXZUW748Jk/DRsSGPWbSHh5R1z/siqXBjgdKngugxlaFEofoTqKqQEK7w0oi
         N9OdsPuh7eVHjvuhL6fus6PAINmYl+CvOUmu2gmU9RRZq7O/qnu83IdWT3YlkB3Ql0OC
         e+DSPZF45T/iRVmStr3LChAbwTIsfxpUj7gfi+HTS/MQMTybCxNn6OuxFfpzd4xJnw2n
         POBqJshzlxkQQ8gM8N7rynsy4JO3VX2GOk3w8XI+Y2+zsK2uU5WiOGOjNp34eZhG5gyy
         WF55tUwabC6YcrItHF+Yt8OXraBRx+CQm0+GLQdELdDXdpCaVAp3rVAmKjNumYTIhido
         8xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zS2NzNQ7DZzgdJXcc0hFivdufXydMmA+AxDklIUKpv0=;
        b=fO2uy3WSSvSSGD6Pyza19LJQXLBuoGYC0CREiG+JTTomAwdvCeElwa6GuuqDcOfb6R
         2nXpLv2Xb0tVffTTj4JKIiaESir5enl/dEVUMlrm3Qu5FZFo0ZL9sG4NAxhiPEwtwjbY
         DC/P16PU4zNInxydYa1fw8o+PZ7HI08NyjdW9kkVd3pJA5tosjm6UKnt4v+LK2AzeOsf
         S+Qw4hImYDUxkZfAw2v3sBd1AfnaeosqueWUDeibwzvDPS2TCm9KrTKlYwzn0p4x//yJ
         3Rh0d74qAevpEg3x4+vfx6kerWNsO4+U2/BgV2d2GmzLOhz5bby8r8+lIAnTsteVz5ay
         NYFA==
X-Gm-Message-State: AGi0PubTeXlbrrx6sOCG4f3lKD24TEDx1aYenljiuQ7SypkFiM/oWVqa
	fFGY+plgSBepjlFN0l1Gc56cbf3yj4TKLQ==
X-Google-Smtp-Source: APiQypKOV6cmyhWLVisYBNuEWNFrL9Yy1228laL4ZUQ4kSBzrfYwxSO44BfT0qHcttM9Ddxw5L7GpQ==
X-Received: by 2002:a17:90a:db46:: with SMTP id u6mr323524pjx.15.1588648852077;
        Mon, 04 May 2020 20:20:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/28] staging: Fix overlapping file failures
Date: Mon,  4 May 2020 17:19:13 -1000
Message-Id: <86f36e3f93cdb2f5882b72e736a770aa6f46100d.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/staging.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 5dab42745f..5b04f88b2d 100644
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
2.17.1

