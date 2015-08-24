Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id B82C776B49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:41 +0000 (UTC)
Received: by igfj19 with SMTP id j19so64828594igf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WfQACsmXlx5/pyzeEadLChjgbMAXsqqE8edAt1f6vWw=;
	b=W8xQJ276R69bNBbyh+7Fhh5Mf8kvIY/LXcaRAilgKlH+0+ZUdqWNtJikEb6ov4Yc64
	ZegX+NkLQBL4NlDa1LHgymvsnbFS+N2Cqmq27nQIC2SARW1lAYrOwJ8hgqacZvjhIw69
	xEYzDwlHxAIjSnLB+3LJnCCeexzoILObDc0FjKgsZtYxlZvSNeCmB5ICeNG9R9VOvfOj
	xDMVtKYzIAjwhjiu0D5BZR5fec4oUn/GzrxknHZWarItyos/bWbCxTLjGsatobv1a+pF
	DdO0AC/XAmhAmQRj0bViwSFPkLf8cFMXyYbvVJ6AwV7N56qSE2j5XwiG9H4tUh2zMU93
	Pdrg==
X-Received: by 10.50.78.68 with SMTP id z4mr15462315igw.51.1440446621555;
	Mon, 24 Aug 2015 13:03:41 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:20 -0700
Message-Id: <73a94dddcc861acfd6ef0d80efd193d50c06ee94.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 02/17] core-image-minimal: Add 4M extra space when using systemd
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:42 -0000

qemu images fail to rebuild the hwdb due to no space letf on device

 systemd-hwdb-update.service - Rebuild Hardware Database
   Loaded: loaded (/lib/systemd/system/systemd-hwdb-update.service;
   static; vendor preset: enabled)
      Active: failed (Result: exit-code) since Sat 2015-08-15 21:39:28
      UTC; 28s ago
      Docs: man:hwdb(7)
            man:systemd-hwdb(8)
	        Process: 92 ExecStart=/bin/systemd-hwdb update
		(code=exited, status=1/FAILURE)
		 Main PID: 92 (code=exited, status=1/FAILURE)

	 Aug 15 21:39:28 qemux86 systemd-hwdb[92]:
		 Failure writing database //etc/udev/hwdb.bin:
		 No space left on device
		 Aug 15 21:39:28 qemux86 systemd[1]:
		 systemd-hwdb-update.service: Main process
		 exited, code=exited, status=1/FAILURE
		 Aug 15 21:39:28 qemux86 systemd[1]: Failed to
		 start Rebuild Hardware Database.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/images/core-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 9716274..8dd77b3 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -9,4 +9,4 @@ LICENSE = "MIT"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE ?= "8192"
-
+IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
-- 
2.1.4


