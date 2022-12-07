Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C179C63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 16:37:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20391.1670431015583726182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 08:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FAFCD6E;
	Wed,  7 Dec 2022 08:37:01 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 727AC3F73B;
	Wed,  7 Dec 2022 08:36:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] combo-layer: dont use bb.utils.rename
Date: Wed,  7 Dec 2022 16:36:49 +0000
Message-Id: <20221207163650.3561591-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207163650.3561591-1-ross.burton@arm.com>
References: <20221207163650.3561591-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 16:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174362

Bitbake may not be configured, and bb isn't imported anyway.

Instead just use os.rename(), and take the filename from the file object
instead of duplicating logic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index c122f4b5e44..e467f390c1e 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -507,7 +507,7 @@ def check_patch(patchfile):
     f.close()
     if of:
         of.close()
-        bb.utils.rename(patchfile + '.tmp', patchfile)
+        os.rename(of.name, patchfile)
=20
 def drop_to_shell(workdir=3DNone):
     if not sys.stdin.isatty():
--=20
2.34.1


