Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 46E4860796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 18:13:22 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id sy18so8665634igc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dUp6UE4SKmVIe5QcZFRTFunPvfTQEETMXy6AizdeCPM=;
	b=la2QA8jMYI+16/0aV3Abe22MyOjomkrdus5f4VXDrU4H3ZemNZAGs7lhV28EZddyKo
	PHCROJ9TDAXxdZnx4xBxrASW+zUKhuCF03o7Se755xZrqPRJyVDldEuTtk4nEy2PlJ4C
	rykh3DYJqdBceJPLV8LctF6oK69RgkWBnQGbHHTVc5kxNsqh9/SG69JdZEwYRVFP8XtH
	yesmXc41XgvfOg2CruzT3sOBJJUZDyiU2UwytVUDPU2hMtEVLpLafZUSvJq/+CWGbY7L
	y6EgLyLSHDGrOmNKrftwOAecn4rG0XJ7J1odQTpbwBflN8qQ1RIIXzJVuCBMhH7A7Yu7
	qeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dUp6UE4SKmVIe5QcZFRTFunPvfTQEETMXy6AizdeCPM=;
	b=JolfsJDO3jCeXbHzsjFpYVKGiQHW8bNlglK6px5VR9Ocl1GJB079PnAq6Oro8A3fpy
	SAXNcTSrR6ZiCORahSlts+jruPy+S22fhfytMpPrduamLgCePsFVcpORrCdVHjECt9+A
	ZMt+Nwjd72iBfGclK1l4V8X+dShVQLU3RECdIig/fcvYBb/jQFHensB2H9h33SHW3Zwx
	yhJ1d/q3Cx4iG/Vb95pMQ9ZRbNNRiQCbVvj8LVtXYuIhQacpb1X4eWM7JMSSD6K+Ml+j
	y9yjXAN/h+A9yg2K+Cvs7E7RzH1oebU22eGsrqZA0VV5yQHAK+BtkWiVuAhH2mJsVbiS
	L+ew==
X-Gm-Message-State: AD7BkJK6WZy2b8b7vAajqn/WWn7EfT3fnGfvXaDrxBVBxUbwxYnlxYp0lbeyL7mkHLfhtA==
X-Received: by 10.50.60.9 with SMTP id d9mr389424igr.54.1459448003417;
	Thu, 31 Mar 2016 11:13:23 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p1sm4252058iop.12.2016.03.31.11.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 11:13:22 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 11:13:07 -0700
Message-Id: <1459447989-25263-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
References: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] base.bbclass: avoid duplicate call to d.getVar('LICENSE', True)
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
X-List-Received-Date: Thu, 31 Mar 2016 18:13:25 -0000

Reuse the 'license' variable, instead of calling
d.getVar('LICENSE', True) again.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index ab8715e..67b3370 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -516,7 +516,6 @@ python () {
                         incompatwl.extend((d.getVar(w + spdx_license, True) or "").split())
 
             if not pn in whitelist:
-                recipe_license = d.getVar('LICENSE', True)
                 pkgs = d.getVar('PACKAGES', True).split()
                 skipped_pkgs = []
                 unskipped_pkgs = []
@@ -528,14 +527,14 @@ python () {
                 all_skipped = skipped_pkgs and not unskipped_pkgs
                 if unskipped_pkgs:
                     for pkg in skipped_pkgs:
-                        bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + recipe_license)
+                        bb.debug(1, "SKIPPING the package " + pkg + " at do_rootfs because it's " + license)
                         mlprefix = d.getVar('MLPREFIX', True)
                         d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, 1)
                     for pkg in unskipped_pkgs:
                         bb.debug(1, "INCLUDING the package " + pkg)
                 elif all_skipped or incompatible_license(d, bad_licenses):
-                    bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, recipe_license))
-                    raise bb.parse.SkipPackage("incompatible with license %s" % recipe_license)
+                    bb.debug(1, "SKIPPING recipe %s because it's %s" % (pn, license))
+                    raise bb.parse.SkipPackage("incompatible with license %s" % license)
             elif pn in whitelist:
                 if pn in incompatwl:
                     bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
-- 
1.9.1


