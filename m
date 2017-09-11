Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A251B60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:01:18 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id i189so37788275wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ikKycz9TP8uMw5xUKZQQ+8yVsuBMazEV589dT60ZbKI=;
	b=OyY1PH7jZb6VbRo1MBP2I8cWu5JOpjGiQRKGTT3ZbULMb0fytWSblMMYvgaWRLLAb4
	4TN0/vt5iJu4dDyfyIe0bvvH/l+d4chlUorpo8kEabJY1auVxRixwZbjPLv/7nwZR8FO
	r5ocgPOr/Fq/NmURPyyVIJZ//pdW17DK/Y16s2mrfPyXigPlKWZ33PnVsi7AeCdeXgJE
	iYixtH5n6cYWvFvhA8mNojOOalOFnkEp9ZTuYc6ptDTQwvBy1i8NUwjDXy7o4e4AmRXv
	nsESTGKTQyswCXoUgpLGj+FGJy98p2+GnKPfbRFMENyO2j21IOI94fLGO61cG9oJEOLY
	yu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ikKycz9TP8uMw5xUKZQQ+8yVsuBMazEV589dT60ZbKI=;
	b=I71Av6kpBKlJaXlS/ko7GXepfMbeBqXYWpYAOxIR7G+nGwt5Z58r2OzN6tMCbgZrxH
	8ZXSVPYFkMjD1VUkWQG0wFOSRX1CjxpbEv/iPVsHjV0EviYMplxqt35r1SYgH/XihLa/
	xTaEmOiDGZUrkuUTzSQ56fmRAl4pVLKdTcXp2sbqqlcs/kOh5Sfy58m5qUIXQiQgeF5+
	XvKXZcatjhwKOwgsPGwOV6ke4OUaClQ18d2VSdCUyn4YQ0Z2XA7w6ujCqxvv6MINBh3w
	ffc7LpViMNCVmCUMlOkJTGnYVA53MfSuM1tAgQQWRJYVr1mIS1Tb21J0Rd7Z8NEAG3nc
	bLhQ==
X-Gm-Message-State: AHPjjUh8Fg47QNWhb7HgjK0eQigvC/efLyQP/pPqPLlJk9kfbz+coBto
	v95VezKQKqIYKAsEGTM=
X-Google-Smtp-Source: AOwi7QAHVi2bmY1HUzTh8Dl70N32tzY1pRg5l7fEtab0cU0ZriU5uLo0nTU0F7f+cBAPAGdHUNybpA==
X-Received: by 10.28.135.5 with SMTP id j5mr1110651wmd.21.1505131278815;
	Mon, 11 Sep 2017 05:01:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	109sm7119866wrc.25.2017.09.11.05.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 05:01:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Sep 2017 13:01:14 +0100
Message-Id: <20170911120114.9490-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][V2] staging: gracefully abort if two recipes conflict in the sysroot
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
X-List-Received-Date: Mon, 11 Sep 2017 12:01:18 -0000

When building the per-recipe sysroot keep track of what files we're installing
and where they came from, so we can detect when a file is installed by two
different recipes and tell the user what these recipes are (instead of just
showing a os.link() stack trace).

[ YOCTO #11631 ]

(From OE-Core rev: 606a8e0ca218f023e362c3678122d36d537f95de)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index a7740883932..6185aefecda 100644
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
+                    hashname = targetdir + dest
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


