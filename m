Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD0FC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 12:29:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4442.1648211353602263136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 05:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB67512FC
	for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 05:29:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BB8A3F73B
	for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 05:29:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/context: remove duplicate sys.path entries when
 looking for modules
Date: Fri, 25 Mar 2022 12:29:10 +0000
Message-Id: <20220325122910.3063759-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 12:29:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163638

sys.path can contain duplicate entries for each layer, which means that
the search in add_controller_list() will find the same name twice and
abort.

As duplicate directories should be harmless, remove any duplicates before
iterating through the entries.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/context.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/con=
text.py
index d707ab263a8..8092dd0baee 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -153,7 +153,11 @@ class OERuntimeTestContextExecutor(OETestContextExec=
utor):
                 else:
                     raise RuntimeError("Duplicate controller module foun=
d for %s. Layers should create unique controller module names" % module)
=20
-        for p in sys.path:
+        # sys.path can contain duplicate paths, but because of the login=
 in
+        # add_controller_list this doesn't work and causes testimage to =
abort.
+        # Remove duplicates using an intermediate dictionary to ensure t=
his
+        # doesn't happen.
+        for p in list(dict.fromkeys(sys.path)):
             controllerpath =3D os.path.join(p, 'oeqa', 'controllers')
             if os.path.exists(controllerpath):
                 add_controller_list(controllerpath)
--=20
2.25.1


