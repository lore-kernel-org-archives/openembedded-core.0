Return-Path: <j@n-garcia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC53EC04FF7
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 19:52:10 +0000 (UTC)
Received: from mail.n-garcia.com (mail.n-garcia.com [168.119.117.94])
 by mx.groups.io with SMTP id smtpd.web11.5640.1695239521244159737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 12:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@n-garcia.com header.s=mail header.b=nsYPEoRn;
 spf=pass (domain: n-garcia.com, ip: 168.119.117.94, mailfrom: j@n-garcia.com)
From: Jan Garcia <j@n-garcia.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n-garcia.com;
	s=mail; t=1695239518;
	bh=34v2DQAWOpXaIQnrVVB5PeStxwzmwX3wZFvZobyqgWQ=;
	h=From:To:Cc:Subject:Date;
	b=nsYPEoRn3+5spC9LfotbMoShQf0np6UDz9vWpE5e7wzk/ULAoG5L4J+aQjINLk36l
	 +vvBGl1gVgWO+Aivp8Goqe6PGJcffsC6md532l36IxIopHwRCcfLHXcAH/LKRrfaeQ
	 62F5eB11KQbsBzVWdrdW9da4784hllo4N1euahR8=
To: openembedded-core@lists.openembedded.org
Cc: Jan Garcia <j@n-garcia.com>
Subject: [PATCH] insane.bbclass: Count raw bytes in shebang-size
Date: Wed, 20 Sep 2023 21:51:56 +0200
Message-ID: <20230920195156.9805-1-j@n-garcia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 19:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187941

Operating systems limit the shebang to a maximum number of bytes.
This patch makes the shebang-size check count raw bytes instead of UTF-8 =
characters.

Signed-off-by: Jan Garcia <j@n-garcia.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index 2e53778934..5743d91240 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -97,9 +97,8 @@ def package_qa_check_shebang_size(path, name, d, elf, m=
essages):
         return
=20
     if stanza.startswith(b'#!'):
-        #Shebang not found
         try:
-            stanza =3D stanza.decode("utf-8")
+            stanza.decode("utf-8")
         except UnicodeDecodeError:
             #If it is not a text file, it is not a script
             return
--=20
2.41.0


