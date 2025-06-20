Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29EFC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:14:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2672.1750432476378470028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5804A176A;
	Fri, 20 Jun 2025 08:14:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A0983F673;
	Fri, 20 Jun 2025 08:14:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: christian.lindeberg@axis.com
Subject: [PATCH 02/12] lib/oe/go: document map_arch, and raise an error on unknown architecture
Date: Fri, 20 Jun 2025 16:14:19 +0100
Message-ID: <20250620151429.3210879-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620151429.3210879-1-ross.burton@arm.com>
References: <20250620151429.3210879-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 15:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219129

Add a comment explaining what this function does and where the values
come from.

If the architecture isn't know, instead of returning an empty string
which could fail mysteriously, raise a KeyError so it fails quickly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/go.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
index dfd957d157a..4559dc63b28 100644
--- a/meta/lib/oe/go.py
+++ b/meta/lib/oe/go.py
@@ -7,6 +7,10 @@
 import re
=20
 def map_arch(a):
+    """
+    Map our architecture names to Go's GOARCH names.
+    See https://github.com/golang/go/blob/master/src/internal/syslist/sy=
slist.go for the complete list.
+    """
     if re.match('i.86', a):
         return '386'
     elif a =3D=3D 'x86_64':
@@ -31,4 +35,4 @@ def map_arch(a):
         return 'riscv64'
     elif a =3D=3D 'loongarch64':
         return 'loong64'
-    return ''
+    raise KeyError(f"Cannot map architecture {a}")
--=20
2.43.0


