Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0973E6B7D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 15:16:15 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id k14so6961429wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 08:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zirIK5SOqzGbZmsEU1eQHKJrJOSvvvLGD4XWIt00fJM=;
	b=VIPaZdc45lcnmbdfrNwbl4zlOpoyci+5cg/zfY/9d3fckNhJtLdUQqFVKGbGQ1VjEQ
	SALvjGRSKpRbtxjKdJW1qmU8sriuVpnWBI1ToS1y4dPszz5aTEkykkcGB62aa7kv84nM
	Hu7ZSp8haU+JiZzioBL+Ecc1vld0y1C6bfBXlFLEKE42rHpDBTjHkMwlhOGclwPRLwPs
	N6W+/A9i1sEeQ8tYrvkxSRrDXauUdKDfGuLV/sBM9QiQgD5EHVpYkzdPPlY+rRk/CZlQ
	sLGaALpFlAOiyxYAQp0h3uFXfkMZfx8aESFpI9aEGjVdRu+7hcX4GO8jmiLi8KQvW0Zh
	ZAVg==
X-Gm-Message-State: ALoCoQkPrShkQsXVEzA2YoTE/eKVjZvtm4SDLQDIYuYFW6HnR0PT3K+eN+jWwxqCljc/gwu4hRVd
X-Received: by 10.194.62.176 with SMTP id z16mr62074127wjr.76.1401808575535;
	Tue, 03 Jun 2014 08:16:15 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id fh5sm42313148wic.9.2014.06.03.08.16.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jun 2014 08:16:14 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id D878B560496; Tue,  3 Jun 2014 16:16:16 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jun 2014 16:16:15 +0100
Message-Id: <1401808575-2417-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 01/13] toaster.bbclass: exclude variable dependency on toaster postfunc
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
X-List-Received-Date: Tue, 03 Jun 2014 15:16:23 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch fixes an issue where the toaster postfuncs were
added to the task signature, making impossible the reuse
of sstate caches from builds outside toaster control.

Now the signatures do not differ between toaster and toaster-less
builds.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 4244b2c..95499a5 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -326,6 +326,8 @@ toaster_collect_task_stats[eventmask] = "bb.event.BuildCompleted bb.build.TaskSu
 addhandler toaster_buildhistory_dump
 toaster_buildhistory_dump[eventmask] = "bb.event.BuildCompleted"
 do_package[postfuncs] += "toaster_package_dumpdata "
+do_package[vardepsexclude] += "toaster_package_dumpdata "
 
 do_rootfs[postfuncs] += "toaster_image_dumpdata "
 do_rootfs[postfuncs] += "toaster_licensemanifest_dump "
+do_rootfs[vardepsexclude] += "toaster_image_dumpdata toaster_licensemanifest_dump"
-- 
1.9.1


