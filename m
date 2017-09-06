Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 961F377C17
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 16:10:52 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u26so32942135wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Sep 2017 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qwybkePSaKF8/alhp68aR05NZsHYTx3tZyH2qZb7amw=;
	b=IJCW7PxqPlIPBruHAkO0RwtK5QMI9iNCNtx1y6IlcGyq8IIEEZVt1OEe2GJ6FztehE
	8ofri/5UvglKk5qGvhGy9vidMkbkNat7cN5MpPkdaxr5ICjFtjPNMCkbvqzGDMrDh4G2
	54JLqsycnMwAXpGs7ldmkZFB1Kj4D62rKLFDlSubisXmkbH2l1CO3DGGmGCesbOU/qsz
	p1oFRNeMkeMHhXLWFLtQhPSbIjwLvaexXLjw9WzOIQ19ftvCVVW90ilo3CW32b7UUhO/
	9gFbJPItBqQu9gofyXVsolBgc3zhWMW8UgVQiUQeeUVcid5KhRIw1+rqkQi3ID+RHlPw
	yoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qwybkePSaKF8/alhp68aR05NZsHYTx3tZyH2qZb7amw=;
	b=gAoJHUBz8KvYi5ZxP18gKSrq+4ZvfybuU0aD8ZxQ+rX3saQ4+emA7ltzEQNRBEpG93
	+9gYA3fpn1Za0F3S0Nm8kOoe5n6TlvpTmwVY5SJGcyEP3IB4/3qUomvNlvUOHF+4GX3Z
	rmjIpRt2Ff0rbIdyCI1PXE7oNZzFJ/qdDCxG+1v0z9JJuVMNqTLVXHGv+GgodSJh7BjV
	1s27q3eS8zPxPSmEMk19VWI5pegbB5zSAkbGVDr1iBBHAHnanozt7tTJz6f8S/zf9NZ5
	S9RNMRyZajykaGsh76Da1Ujo39VtKFmDLdO7f6IySx8+Z3DcTlgl5LmnAXfSvlcuZgzy
	tvEg==
X-Gm-Message-State: AHPjjUiFIN6n7XhnO90vbpwMHFHiHbLSpAq1rK9CDUUV7xK7e61239qQ
	iIRkHsTPUKoplAODHgI=
X-Google-Smtp-Source: ADKCNb4GzHEh+2F7nAcF2FdQ7quN8QOjm/VLx044XB6zDclS0oNfPHy08qJa7e4ol/RXoygRF7M+dw==
X-Received: by 10.28.148.75 with SMTP id w72mr179756wmd.132.1504714252935;
	Wed, 06 Sep 2017 09:10:52 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p80sm1592156wmf.42.2017.09.06.09.10.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 09:10:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 17:10:50 +0100
Message-Id: <20170906161050.11303-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] staging: gracefully abort if two recipes conflict in the sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 16:10:52 -0000

When building the per-recipe sysroot keep track of what files we're installing
and where they came from, so we can detect when a file is installed by two
different recipes and tell the user what these recipes are (instead of just
showing a os.link() stack trace).

[ YOCTO #11631 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/staging.bbclass | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index a7740883932..9e822517237 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -388,6 +388,8 @@ python extend_recipe_sysroot() {
     postinsts = []
     multilibs = {}
     manifests = {}
+    # All files that we're going to be installing, to find conflicts.
+    fileset = {}
 
     for f in os.listdir(depdir):
         if not f.endswith(".complete"):
@@ -514,8 +516,19 @@ python extend_recipe_sysroot() {
                     if l.endswith("/fixmepath.cmd"):
                         continue
                     dest = l.replace(stagingdir, "")
-                    dest = targetdir + "/" + "/".join(dest.split("/")[3:])
-                    newmanifest[l] = dest
+                    dest = "/" + "/".join(dest.split("/")[3:])
+                    newmanifest[l] = targetdir + dest
+
+                    # Check if files have already been installed by another
+                    # recipe and abort if they have, explaining what recipes are
+                    # conflicting.
+                    hashname = (native and "native:" or "target:") + dest
+                    if not hashname.endswith("/"):
+                        if hashname in fileset:
+                            bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
+                        else:
+                            fileset[hashname] = c
+
             # Having multiple identical manifests in each sysroot eats diskspace so
             # create a shared pool of them and hardlink if we can.
             # We create the manifest in advance so that if something fails during installation,
@@ -594,4 +607,3 @@ python staging_taskhandler() {
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
 addhandler staging_taskhandler
-
-- 
2.11.0


