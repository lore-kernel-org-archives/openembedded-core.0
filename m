Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F769C5CFEB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 20:45:02 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5009.1786567500588576454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 13:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jl/FLLO8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026081220445822b2edda0800020792-90h1tz@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026081220445822b2edda0800020792
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Aug 2026 22:44:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=djHmg31JvJFhWi+ifYqHL5l00cy3X7VNrXKtz3exyfE=;
 b=jl/FLLO8UQFkWihHOq3Dn1gTZ1ArYp/hl966VG5LpnIYO+vDOZSfoCEbCLprAkYbkuVGDP
 tJ3W1rU4XKTOMiKoCXvxU/CuHejkh646Uhm/ZJTu0PvzhyQnekOrmnCu+YU0HPDvHqHhJ365
 4IPEmZERA4FqPF1+Jr+xeMrCPOvqW72oh6friSegnZz+bp0fAWrYWDRQxvTnR7cEs7pqD2ew
 t0ZjQWAMnq+VRI+IhcE7YqJe+DFY/dUxy6sdbrYJybcqy/MgCafbNCLYeKb6gS6IqJQuNWCX
 cBCVk/rzBkiXahWuIaZfnVtPXCZi9Jgk6conEd0YbzZk0JH2V5MMijtw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/3] cpio: patch CVE-2026-66484
Date: Wed, 12 Aug 2026 22:44:31 +0200
Message-ID: <20260812204433.855482-2-peter.marko@siemens.com>
In-Reply-To: <20260812204433.855482-1-peter.marko@siemens.com>
References: <20260812204433.855482-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 20:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243305

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE description.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb       |  1 +
 .../cpio/files/CVE-2026-66484.patch           | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66484.patch

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index 324f5e9490..9b4ab52228 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://run-ptest \
            file://test.sh \
            file://CVE-2026-66485.patch \
+           file://CVE-2026-66484.patch \
            "
 
 SRC_URI[sha256sum] = "efa50ef983137eefc0a02fdb51509d624b5e3295c980aa127ceee4183455499e"
diff --git a/meta/recipes-extended/cpio/files/CVE-2026-66484.patch b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
new file mode 100644
index 0000000000..97ce9a785c
--- /dev/null
+++ b/meta/recipes-extended/cpio/files/CVE-2026-66484.patch
@@ -0,0 +1,28 @@
+From e2b9cbdd3354d2b1569b7390d1bc15c1930559ad Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Thu, 23 Jul 2026 15:55:46 +0300
+Subject: [PATCH] The --no-absolute-filenames option affects hard link targets
+ too.
+
+* src/tar.c (stash_tar_linkname): Apply cpio_safer_name_suffix.
+
+CVE: CVE-2026-66485
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=e2b9cbdd3354d2b1569b7390d1bc15c1930559ad]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/tar.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/tar.c b/src/tar.c
+index 493f299..a1fc60a 100644
+--- a/src/tar.c
++++ b/src/tar.c
+@@ -37,6 +37,8 @@ stash_tar_linkname (char *linkname)
+ 
+   strncpy (hold_tar_linkname, linkname, TARLINKNAMESIZE);
+   hold_tar_linkname[TARLINKNAMESIZE] = '\0';
++  cpio_safer_name_suffix (hold_tar_linkname, true, !no_abs_paths_flag,
++  			  false);
+   return hold_tar_linkname;
+ }
+ 

