Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A43DC754B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 16:45:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v16-v6so2849082wmv.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=RTtXdq9U9TOji1qvREMVxGWUN+2/rGyV5bPAzpszZuU=;
	b=AXs0QUXafEUb5YhcKg94mhSCDOWPG6Iz+6d9jf8L98PnDHYxDOF1lNU5NbKeVtdGUD
	AYOlOAegBBjIi0Eb+DU32BLiIV472FGZ2bqBVnHlSWJtCJw3W5/AhlRlldzz6n8FJd4M
	4hdWaI6FVIM5vuInMG4D/ztjbb6SCvnISkOHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RTtXdq9U9TOji1qvREMVxGWUN+2/rGyV5bPAzpszZuU=;
	b=rQ9+x3R0uPj6vyTXVln6r851pUFT+2HN6xgsC+pnbwFSF1edPx9t5AdYUfAf7dEAB+
	2D/wvLuI7JrNtMkXODOxq1gGTcsGQW75ow+S5n26p+QmZz3XMoQxUPQT12x64rHGhokH
	p/hDcsPT0s6owIRAMfM3QBGUlJ75VeD5EORI2bVYXIBYlszSFE+tFc5PSsUwz0DPSFUJ
	XgGSfJgG/9eAsl3IkQc8hPtkw/+heHOW/9E6FvFNQot4mD4Oi9wLJpi9V2AZuFYWlgWQ
	DBsYg7WGJ2C8jKQfIjiXe/rubSLSdfsUKHpBxFKGxcZ7wW70oenHPfqGbuHL9DwDCBFb
	4KqA==
X-Gm-Message-State: APt69E3qV6UTtPW77KrCaup/HxMw9BXMYN83ierMywxxxPKDQnLzw80v
	IlHVRY99yWPM40cUKUcl1tMRmGQTnTY=
X-Google-Smtp-Source: AAOMgpdePzy6LlG+x9ZemEeLKq3OEXT+nu1UyHv/KwcI85wnBPzQVb7oTrBXiAwZsHit113BU6pivg==
X-Received: by 2002:a1c:3b82:: with SMTP id
	i124-v6mr2407881wma.57.1530290731973; 
	Fri, 29 Jun 2018 09:45:31 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p7-v6sm1649062wmc.0.2018.06.29.09.45.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 09:45:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2018 17:45:26 +0100
Message-Id: <20180629164527.6325-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] staging/image: Fix multilib recipe sysroot issues
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
X-List-Received-Date: Fri, 29 Jun 2018 16:45:32 -0000

Currently if you enable multilib, then build an image, the multilib
recipe sysroot is build in the wrong WORKDIR. If you then clean and
rebuild the image you see "file exists" errors.

This patch ensures the real WORKDIR is used consistently and then
cleans/rebuilds also work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 3fcbc9f15d3..f04c7b637d9 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -471,6 +471,10 @@ python extend_recipe_sysroot() {
         os.symlink(c + "." + taskhash, depdir + "/" + c)
 
         manifest, d2 = oe.sstatesig.find_sstate_manifest(c, setscenedeps[dep][2], "populate_sysroot", d, multilibs)
+        if d2 is not d:
+            # If we don't do this, the recipe sysroot will be placed in the wrong WORKDIR for multilibs
+            # We need a consistent WORKDIR for the image
+            d2.setVar("WORKDIR", d.getVar("WORKDIR"))
         destsysroot = d2.getVar("RECIPE_SYSROOT")
 
         native = False
-- 
2.17.1


