Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8E57F87C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 03:07:27 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id q20so28869928qtp.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 19:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+gHBA0LCpaHkYdUzCQqGDhI+unIyo0IWvV+AR80dUBc=;
	b=OMjT1L5S5CVIeFoSajPqUNGkjpSofzqIzCPDLEkUquXCRtA359neXGdZTJCak7BscI
	UVZwrPR9AIh0T1o6n+j05HQD+fBRRu6EbL/mF9NoaXyKEO1Kpe2Ar9lLghAvGk6XegCH
	1Vkj11v8lVt0Ki3Eg6Tc3Lgf9IQppuQn0LvvA+09ucKfGD5s1HKyMA31rYgFOsbAth0Y
	wDvEQWT2oYngq55J9YOjd+grzkB3JuicrhoSXfHZN8WdrzWxNq1K6vrnhzmjrl+nctEA
	Y3zfG+wQGzuMPl02QpeckR922z2q0vqH/M/kMz00L7F4TBL7UDLY33pE69tQ4JiDxXzY
	/S4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+gHBA0LCpaHkYdUzCQqGDhI+unIyo0IWvV+AR80dUBc=;
	b=EqILcDwC8b0aAQ3HKEQw4ucmPcjFSEgDMY69wByoRmS+2HLfY7Q5nGH/KzD3RLRNqM
	Ymw0fwh2IlMB9Gmkb8NNFkHKIHQt1c5l2TQVOCzygS0IWhSCdKUWR2L6ucnYJBj59lbp
	43LkCrZXbYosj3rN9F802k+39LXki+FWR+9hGZ1SHfkRPtUZQsv7agVJQEx53MMfAnXb
	Wqq3TlA9n+JiatcoUR3YSchU6EUrSumJf1wmoV8bTDvDjm5GIXoSTzO99WfzHLsCAtAk
	mg9wdX2aXAW1QjzxpjWxDDQk6RkgSalHmM0/7v7JWSZBv8yoUVSDbl1ilJH5Ef71W/wG
	pH0w==
X-Gm-Message-State: APjAAAX+V+EExdX+zG47wSaV4YnogHDwEyKa9skO4/Z8bESPTtJ0VZNV
	bZhbj2VIT1BgSoaW/82lKC8=
X-Google-Smtp-Source: APXvYqzH8COYxsTRG5fi1LpmtvwZqgGc1sTShG3AoQY0ydvYuDZz9hF+oWnxrvtaWcuZJVnb3jy5Mw==
X-Received: by 2002:ac8:3108:: with SMTP id g8mr46453966qtb.30.1577675248054; 
	Sun, 29 Dec 2019 19:07:28 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	z141sm12036800qkb.63.2019.12.29.19.07.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 19:07:27 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 29 Dec 2019 22:07:21 -0500
Message-Id: <1daf2a43222f583d903f01b21097e392560616f9.1577674956.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1577674956.git.bruce.ashfield@gmail.com>
References: <cover.1577674956.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] kernel-yocto: allow external (aka non-integrated) BSPs to supply patches
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
X-List-Received-Date: Mon, 30 Dec 2019 03:07:27 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

By default, only explicitly specified .scc files or patches are applied
to a BSP as part of the patching phase. This allows the reference BSPs
to be integrated into a kernel tree, and use the same meta data for tree
generation and for runtime building. It also greatly simplies the
processing of kernel meta data.

That being said, if an external (and fully standalone) kmeta repository
is used, it very well may contain both patches and configuration. To
allow the BSP definition to supply patches and config, we introduce a
new kernel meta data definition:

  define KMETA_EXTERNAL_BSP t

This can be set in any .scc file that wants to specify both patches
and configuration.

If specifying this per-BSP is not desired, a secondary variable is
used:

  KMETA_EXTERNAL_BSPS

When that is set in a bbappend, any located BSP definitions will be used
for both patches and configuration.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ed9bcfa57c..87c681f1c3 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -182,6 +182,14 @@ do_kernel_metadata() {
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
 		fi
+
+		# if the bsp definition has "define KMETA_EXTERNAL_BSP t",
+		# then we need to set a flag that will instruct the next
+		# steps to use the BSP as both configuration and patches.
+		grep -q KMETA_EXTERNAL_BSP $bsp_definition
+		if [ $? -eq 0 ]; then
+		    KMETA_EXTERNAL_BSPS="t"
+		fi
 	fi
 	meta_dir=$(kgit --meta)
 
@@ -195,6 +203,13 @@ do_kernel_metadata() {
 		fi
 	fi
 
+	# if KMETA_EXTERNAL_BSPS has been set, or it has been detected from
+	# the bsp definition, then we inject the bsp_definition into the
+	# patch phase below.  we'll piggy back on the sccs variable.
+	if [ -n "${KMETA_EXTERNAL_BSPS}" ]; then
+		sccs="${bsp_definition} ${sccs}"
+	fi
+
 	# run2: only generate patches for elements that have been passed on the SRC_URI
 	elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
 	if [ -n "${elements}" ]; then
-- 
2.19.1


