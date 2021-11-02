Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2ACC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 12:26:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.36.1635856008721000862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 05:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79CBAD6E
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 05:26:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21C4E3F70D
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 05:26:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patch.bbclass: don't repr() the exception, use str()
Date: Tue,  2 Nov 2021 12:26:39 +0000
Message-Id: <20211102122639.2422915-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 12:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157775

repr() results in formatting characters such as extra quotation marks
which are pointless.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/patch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 8de7025491..079ee33e3c 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -155,7 +155,7 @@ python patch_do_patch() {
             resolver.Resolve()
         except bb.BBHandledException as e:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" =
% (parm['patchname'], patchdir, repr(e).replace("\\n", "\n")))
+            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" =
% (parm['patchname'], patchdir, str(e).replace("\\n", "\n")))
=20
     bb.utils.remove(process_tmpdir, True)
     del os.environ['TMPDIR']
--=20
2.25.1


