Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id E099C78970
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:27:21 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id h10-v6so16139640wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JI7YCWob9n4p5lP+1wVAu3f1vmnroXeaI5PGkK3GSxU=;
	b=ALw+VuIKB7BHVdvi3I8aOJeK4H2BHEb1AdmHyq8IJisMnU2qC0zGyC8/dbCmiN6NBB
	QX5UC1PxOz8oXympYB7m4lmDJu6A3KOD0bdFonZoqu4yExLe+E16oRFHmAC0gciHbxg5
	t626sBMXx634QAfm3PoeinO3dskyK1kDrHksM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JI7YCWob9n4p5lP+1wVAu3f1vmnroXeaI5PGkK3GSxU=;
	b=h/HPC4fyXtfQyMoykDY5WLhpJ8IGQGyDKqgLZEkZhRz76BSevTDON74dYJSNf+hFf1
	UlnyqxPr3gj2EBO8tAAPzjesasdrzD10nattqNHWpy4y7Jx/NnwWJbGyp5IhYf4ezB9R
	vv07xrVESNSqHBSzYvK/8b73ZibSnZ/P9Kli4ZppeIch67mWKzmidrQgUbS4ZKYMwuvf
	xPbYMmYvcIqWu7gqQfF7mVMk7OC2wlzDHFRwUsk+7IVms33WqLAgkYRzsn88fFgyLblK
	2VzgDSUt4BK1fpbJopPurQf7lGzE1vqcuQ6t3Q+LNNkgm6q0GtFMVAi7tAjyRKN8O28f
	Nhzg==
X-Gm-Message-State: APt69E3iFp5qqh7g9esuNA7BpAePhKP12bbuQndhXJw1R1quuvAfF03x
	uVu4U+kBytM2KSDHsRWcoF+nauXdMfI=
X-Google-Smtp-Source: AAOMgpfTNy9AswT2sVg+Fvak120pxhz9QJhIk0Y/BEHD9O2IvoGiu0S6iwnCk/ImdCbTtpqJuGTTpA==
X-Received: by 2002:adf:c4a7:: with SMTP id
	m36-v6mr19770702wrf.103.1530548842391; 
	Mon, 02 Jul 2018 09:27:22 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	17-v6sm12148012wmm.21.2018.07.02.09.27.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jul 2018 09:27:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 17:27:14 +0100
Message-Id: <20180702162718.27038-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
References: <20180702162718.27038-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/6] staging/image: Fix multilib recipe sysroot issues
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
X-List-Received-Date: Mon, 02 Jul 2018 16:27:22 -0000

Currently if you enable multilib, then build an image, the multilib
recipe sysroot is build in the wrong WORKDIR. If you then clean and
rebuild the image you see "file exists" errors.

This patch ensures the real WORKDIR is used consistently and then
cleans/rebuilds also work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 4 ++++
 meta/classes/utils.bbclass   | 2 ++
 2 files changed, 6 insertions(+)

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
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 4f016e3d002..3f4f51b56be 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -338,6 +338,8 @@ def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = '
     variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
         localdata = get_multilib_datastore(item, d)
+        # We need WORKDIR to be consistent with the original datastore
+        localdata.setVar("WORKDIR", d.getVar("WORKDIR"))
         value = localdata.getVar(var) or ""
         if value != "":
             if need_split:
-- 
2.17.1


