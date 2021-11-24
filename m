Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD49C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:15:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.928.1637774132431514926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0836611FB
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A693B3F66F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:15:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] sstate: explicitly name the checkhashes thread pool
Date: Wed, 24 Nov 2021 17:15:28 +0000
Message-Id: <20211124171529.4107434-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124171529.4107434-1-ross.burton@arm.com>
References: <20211124171529.4107434-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:15:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158730

Give this thread pool a name for clarity.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/sstate.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0a78a2fb69..0326d27c74 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1014,7 +1014,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,=
 currentcount=3D0, summary=3DTrue,
=20
             bb.event.enable_threadlock()
             pool =3D oe.utils.ThreadedPool(nproc, len(tasklist),
-                    worker_init=3Dcheckstatus_init, worker_end=3Dcheckst=
atus_end)
+                    worker_init=3Dcheckstatus_init, worker_end=3Dcheckst=
atus_end,
+                    name=3D"sstate_checkhashes-")
             for t in tasklist:
                 pool.add_task(checkstatus, t)
             pool.start()
--=20
2.25.1


