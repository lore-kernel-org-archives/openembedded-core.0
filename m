Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA2FCA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 11:25:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17471.1755689125319917090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 04:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 847DC1D31;
	Wed, 20 Aug 2025 04:25:16 -0700 (PDT)
Received: from e131068.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 238CD3F58B;
	Wed, 20 Aug 2025 04:25:24 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] wic: Fix --overhead-factor and --extra-space checks
Date: Wed, 20 Aug 2025 12:24:55 +0100
Message-Id: <0b54ffe7ba798793a48ff1a78678505893ab247e.1755689095.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 11:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222175

If --overhead-factor and --extra-space are passed with =3DFOO the
check fails. Fix this by checking parsed.overhead_factor and
parsed.extra_space instead.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 scripts/lib/wic/ksparser.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7ef3dc83dd..596b6e8e7e 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -275,9 +275,9 @@ class KickStart():
                             # --fixed-size iff given option was not used
                             # (again, one cannot tell if option was pass=
ed but
                             # with value equal to 0)
-                            if '--overhead-factor' not in line_args:
+                            if not parsed.overhead_factor:
                                 parsed.overhead_factor =3D self.DEFAULT_=
OVERHEAD_FACTOR
-                            if '--extra-space' not in line_args:
+                            if not parsed.extra_space:
                                 parsed.extra_space =3D self.DEFAULT_EXTR=
A_SPACE
=20
                         self.partnum +=3D 1
--=20
2.34.1


