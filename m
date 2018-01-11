Return-Path: <sstncr@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9066671951
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 16:07:32 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 100so2644545wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 08:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hix9/qtMRR6dVTgvhwOudQpQnlGRmkclA3D6+QamMSI=;
	b=nQu4FFgwZciAFDiI0RStzt/07yIwtpYRYDNct8EMwqoAjlYVzBm1JlutyLKsESVLFy
	u4t4fZZ+rAZ80Z03+7qO9dSp1ru+ndluT5x4wDaribpDRFfiIkAdAFAeRMM5wR9s/j0y
	1iACCxAd5F3rsrID3dzgSiqyruy2DwwbrBma9clZgpUt0NHC8EjFEj8hPY+03XjklSlB
	yMA95pdm+jujuC7AT9r0VA0KkLr/e2dRRtvAszvfCTYGpVTRmJMI/+Rs/ZqP9gdIybEr
	BfpYo2zJMHj4o5HI+2RWPU1kjA8HhXFQ0owgAxzmK9TCvaDfzA9Q7qciBJyhqyzz1WhA
	cH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hix9/qtMRR6dVTgvhwOudQpQnlGRmkclA3D6+QamMSI=;
	b=I8pDZ3BP/5J7vLduaMbCOWRuQBgTnMBGxLM0J9HQxBb0gwYDW0blB9r7dHkDXFZCJ3
	uJlo+BoyTsYThTeXU5kC/5hBemmJwWK2s65KYmBtFFyRfVwik8vxjkoBQqnnW3AigRzT
	bahfZpVHr5mQWxiz+Kw/o0VstfSRzqjEOhtCIf/eIiLmqL/sgPlwBplSqN89tUfPR+rm
	xVTpyxuPE4DoDLgSSdbZ3B9mlS4Jy0o0b2bZXEAgOXNAOKe6FDzGfpRTO1iLFImOk894
	IOnNtIIVCp/8R9rkBT9Gttbscrn47PldqmPYLLmpLtuMYgVlFl9jv/e35JU/6yljpnia
	s/hw==
X-Gm-Message-State: AKGB3mK8y0DZAve3FHXsaL86TVzG6EYQspa4Epw9rUxXqpJewonn38OQ
	el9yJpvvrWDgXvSx/fUTJD5Fh9Ra
X-Google-Smtp-Source: ACJfBotAr4SQRqpZpi0XOrfUJiJam21R2wPLG8yoLEdyWoXSNdJF2o57L2HMRJFfVUa5ds6+SF8OEw==
X-Received: by 10.223.151.146 with SMTP id s18mr21425971wrb.258.1515686853831; 
	Thu, 11 Jan 2018 08:07:33 -0800 (PST)
Received: from ubuntu-xenial.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	p32sm13192986wrc.9.2018.01.11.08.07.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Jan 2018 08:07:33 -0800 (PST)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 16:07:20 +0000
Message-Id: <1515686841-28097-1-git-send-email-sstncr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] kernelsrc/perf: fix dependency on non existant task when using externalsrc
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
X-List-Received-Date: Thu, 11 Jan 2018 16:07:34 -0000

When externalsrc is enabled for kernel, do_patch doesn't exist since is in
SRCTREECOVEREDTASKS, so make these depend on a real task.

Fixes:
    ERROR: Task do_unpack in /data/yocto/poky/meta/recipes-kernel/perf/perf.bb
    depends upon non-existent task do_patch in /data/yocto/poky/meta/recipes-kernel/linux/linux-yocto_4.8.bb

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/classes/kernelsrc.bbclass   | 2 +-
 meta/recipes-kernel/perf/perf.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index 9efd46a..ce6c999 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -1,6 +1,6 @@
 S = "${STAGING_KERNEL_DIR}"
 do_fetch[noexec] = "1"
-do_unpack[depends] += "virtual/kernel:do_patch"
+do_unpack[depends] += "virtual/kernel:do_configure"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 03ae446..145774b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -47,7 +47,7 @@ export PYTHON_SITEPACKAGES_DIR
 #kernel 3.1+ supports WERROR to disable warnings as errors
 export WERROR = "0"
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_configure"
 
 # needed for building the tools/perf Perl binding
 inherit perlnative cpan-base
-- 
2.7.4


