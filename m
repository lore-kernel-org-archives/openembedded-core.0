Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2969CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 11:52:20 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.15439.1756036337326380012
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 04:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AylDOzYW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250824115212dc8bf947b1c6682226-vtoa8y@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250824115212dc8bf947b1c6682226
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 13:52:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2YR9uXVafRkLIsMp7qRGBET22WhQWEvIw3WrAUZhpPo=;
 b=AylDOzYWBtZrnqj4A3YbkThsvYRGfRnqJvE/ARfu77U6z+LbFcIhT9lFlj5tUF/PRtBb3O
 IaLTJJQ5LxlHkMxrqQSqmk6wjuQZXGdNjD7kBCiTVgnHuTW40nDvg0DtborKgmvHdZXrPmOE
 /Imqa3+XNOs6VeTsp6oWWl4Tnr9kWe3C3RGt66vkHJoF/xTvoo0oI5Q60UzXVxGnZCCpsoJw
 9YtDfCyrLG4ZlInsDIJykbyR7NHZmTitVH5xdZ+UkOjaZjiHnFNteycwqBDVN3K8hTt4iKXE
 0Kq9cZ9mOxr9Tx3vdXMTo1QwLkwaEXBkEgnNejoo27t28xpZ8JKDq/Og==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] binutils: set status for CVE-2025-7545 and CVE-2025-7546
Date: Sun, 24 Aug 2025 13:51:26 +0200
Message-Id: <20250824115126.12570-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 11:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222369

From: Peter Marko <peter.marko@siemens.com>

The patches linked in NVD reports are present in binutils-2_45-branch.
Technically the NVD is wrong (=2.45 should be <2.45), but fixing it in
the recipe is not problematic as all cpe-stable-backport will be
automatically removed in next upgrade so will not be "kept forever".

CVE-2025-7545
* https://nvd.nist.gov/vuln/detail/CVE-2025-7545
* https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944

CVE-2025-7546
* https://nvd.nist.gov/vuln/detail/CVE-2025-7546
* https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/binutils/binutils-2.45.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 00bb181172..c69b4298c8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -18,6 +18,9 @@ SRCBRANCH ?= "binutils-2_45-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
+CVE_STATUS[CVE-2025-7545] = "cpe-stable-backport: fix available in used git hash"
+CVE_STATUS[CVE-2025-7546] = "cpe-stable-backport: fix available in used git hash"
+
 SRCREV ?= "2bc7af1ff7732451b6a7b09462a815c3284f9613"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\

