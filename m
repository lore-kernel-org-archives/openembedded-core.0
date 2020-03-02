Return-Path: <scott.murray@konsulko.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB289618F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 18:58:32 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i14so759082qtv.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2020 10:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O0h9fi4txY3NIEHU6gu2VlUgyeL8xLPfRqi4UtB7GLA=;
	b=B87uo+jEaHoU77LiKicELhVW1QUu8KR5VUI9Z1wi5KgByqLG6dgETF+DgXHtoZmYCu
	q4xRyAUTY/yGPK2B2mJE4IzoRPfKA6zVu0Lp1OhjNfpfMmi7Di/nTeawyjWBQKlik7vm
	1LZAlNcdJ6/Yi6odVaf/iaM28ndLUotmXVKDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O0h9fi4txY3NIEHU6gu2VlUgyeL8xLPfRqi4UtB7GLA=;
	b=oZ0a3lRLhetPuGzVw5CfluLZmRMzEIc3oatK22kREUDKcYZipyZ4I0Wams6h5r1LEu
	uOOB3+vz6Fxx49qXRLmICKbjymhfRNZbL7kV3CCky2dNbcVwoVDpLemTz0guECS3jgyN
	bIRDJ1cTDOEsfG2N4Vq3pAbzCFgAYF0m8gvlJM/9f58GfRVVJhe2wjoobwz/8S7jGqn3
	98tVw+4t54LruHQ9V+75rKsvic6XVt9D30cw2O5kSHb2Ng8sOqTnd9HE9lg1xiQL5h2n
	/5NC4UTqVzkzDWg8RCUiVKYuCAo/X4ZvPiZl+1q9aDVk2zKFzmDsokJslX+e6aQ6p+se
	OFdg==
X-Gm-Message-State: ANhLgQ1cci0Idr0ntQsSCbi6tydMHHyImp8+5YYwNf6+AYMtleZ0ecb/
	8gOynNbPGGrAidvzoCKBRLDnUY93j3o=
X-Google-Smtp-Source: ADFU+vthLWH0Y7WzZzrnGwxfUc3slHsLK4qAmbtTQh9oHvPOjYt/6i9+9HdytdBeH+hg3fTEJ+TdEA==
X-Received: by 2002:ac8:4792:: with SMTP id k18mr1105122qtq.192.1583175513226; 
	Mon, 02 Mar 2020 10:58:33 -0800 (PST)
Received: from ghidorah.spiteful.org (198-84-179-103.cpe.teksavvy.com.
	[198.84.179.103]) by smtp.gmail.com with ESMTPSA id
	w83sm9905614qkb.83.2020.03.02.10.58.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Mar 2020 10:58:32 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2020 14:14:26 -0500
Message-Id: <20200302191426.4167152-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] psplash: update to latest git revision and clean up
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
X-List-Received-Date: Mon, 02 Mar 2020 18:58:33 -0000
Content-Transfer-Encoding: 8bit

Update SRCREV to pick up:

c359546 Fix psplash-systemd failures
3c0a4f3 Remove generated psplash-poky-img.h

Also:
* set the unit type in psplash-start.service to "notify" to
  complete the psplash-systemd race fix
* remove the rest of the now unnecessary has_png logic bits
* change the generated image header destination to B instead of S
  since that now works after the recent makefile changes, and will
  avoid unnecessarily polluting the source tree

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta/recipes-core/psplash/files/psplash-start.service | 1 +
 meta/recipes-core/psplash/psplash_git.bb              | 7 ++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index af9d5d6c20..a8c97c7a75 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -4,6 +4,7 @@ DefaultDependencies=no
 RequiresMountsFor=/run
 
 [Service]
+Type=notify
 ExecStart=/usr/bin/psplash
 
 [Install]
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 875adb13fc..22c71f099b 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "aea172a24c5b0bdc0f4efa780c0faa00c9238362"
+SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
@@ -24,7 +24,6 @@ python __anonymous() {
     splashfiles = d.getVar('SPLASH_IMAGES').split()
     pkgs = []
     localpaths = []
-    haspng = False
     for uri in splashfiles:
         fetcher = bb.fetch2.Fetch([uri], d)
         flocal = os.path.basename(fetcher.localpath(uri))
@@ -42,8 +41,6 @@ python __anonymous() {
             bb.fatal("The output name '%s' derived from the URI %s is not valid, please specify the outsuffix parameter" % (outname, uri))
         else:
             pkgs.append(outname)
-        if flocal.endswith(".png"):
-            haspng = True
         localpaths.append(flocal)
 
     # Set these so that we have less work to do in do_compile and do_install_append
@@ -82,7 +79,7 @@ python do_compile () {
     # Build a separate executable for each splash image
     workdir = d.getVar('WORKDIR')
     convertscript = "%s/make-image-header.sh" % d.getVar('S')
-    destfile = "%s/psplash-poky-img.h" % d.getVar('S')
+    destfile = "%s/psplash-poky-img.h" % d.getVar('B')
     localfiles = d.getVar('SPLASH_LOCALPATHS').split()
     outputfiles = d.getVar('SPLASH_INSTALL').split()
     for localfile, outputfile in zip(localfiles, outputfiles):
-- 
2.24.1


