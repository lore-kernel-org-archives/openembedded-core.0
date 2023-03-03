Return-Path: <maanyagoenka@microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5986C6FA8E
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 00:35:52 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.11243.1677803752328274174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 16:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: maanyagoenka@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1157)
	id C070620B9C3D; Thu,  2 Mar 2023 16:35:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C070620B9C3D
From: maanyagoenka@microsoft.com
To: openembedded-core@lists.openembedded.org
Cc: Maanya Goenka <maanyagoenka@linux.microsoft.com>,
	Maanya Goenka <maanyagoenka@microsoft.com>,
	Paul Eggleton <paul.eggleton@microsoft.com>
Subject: [[PATCH][RESEND]] create-spdx: fix config build by adding dependency to enable reruns
Date: Thu,  2 Mar 2023 16:35:43 -0800
Message-Id: <1677803743-13273-1-git-send-email-maanyagoenka@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 00:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177972

From: Maanya Goenka <maanyagoenka@linux.microsoft.com>

The issue encountered is about local stos builds failing (when these builds are
preceded by a local SoC OS or MOS build). Essentially, the failure is seen when
building two different configs with shared state, one where gcc-cross-<arch> has a dependency
and one where it doesn't (specifically, one where the abicheck class in meta-binaryaudit
is inherited and one where it isn't). Hence, the task signatures change but a rerun of those said tasks
does not occur. The result is that when the config with the dependency is built and then the one without
is built, due to incorrect dependencies, the SPDX manifest creation stage errors out.

create-spdx relies on BB_TASKDEPDATA to get dependencies and then adds that variable to
vardepsexclude. A change in dependencies therefore, does not result in a
re-execution of the tasks. This commit adds an explicit dependency on DEPENDS which influences
BB_TASKDEPDATA and triggers reruns for new config builds having different dependencies.

Signed-off-by: Maanya Goenka <maanyagoenka@microsoft.com>
Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 454dd7a..13d13fe 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -381,7 +381,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     return dep_recipes
 
 collect_dep_recipes[vardepsexclude] += "BB_TASKDEPDATA"
-
+collect_dep_recipes[vardeps] += "DEPENDS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
-- 
1.8.3.1


