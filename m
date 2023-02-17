Return-Path: <jochemstevense@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED02C636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 19:15:38 +0000 (UTC)
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
 by mx.groups.io with SMTP id smtpd.web10.3445.1676661330995029546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Feb 2023 11:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@protonmail.com header.s=protonmail3 header.b=iFV7+t4f;
 spf=pass (domain: protonmail.com, ip: 185.70.40.130, mailfrom: jochemstevense@protonmail.com)
Date: Fri, 17 Feb 2023 19:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1676661328; x=1676920528;
	bh=M/ebvrJnsidfgQJqqECjd7TX+Ityzu//gkKGFyBYw5o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iFV7+t4foW3yXSUQ/tIuwbLnC91cXLjr7mGrm5TIs6urK5UIOhI52YSRxsJKqiObr
	 QAVQYO0k3da5ffyOkkrOZhmw44Zo6CVKh00NJf0XNx8oXRqFW3dRcct6elverXlSYp
	 yLv4AI6wBHlVrm6As+3tX406usrmdiFybE/eNqKlYbebv4lfmhPCJLRQGfD7lRkZgR
	 VpXvOsDVl7qNH9pkcYfRSvVOWmmV6S3bIImZuB2XS6G4rCvX+ETnmzUiiYKhlYqqVL
	 cMVjpGqj1TNc6R6VSLHhxHdX5s81NF8ye0PG8nIeEPM0L1xuPwmnC+6s6XsmuI9lZo
	 jI+qFhF0pOPMQ==
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
From: Jochem Stevense <jochemstevense@protonmail.com>
Cc: "akuster808@gmail.com" <akuster808@gmail.com>
Subject: [rocko][PATCH] utils: Adjusted host GCC version detection regex for  current versions.
Message-ID: <mt-W_TsNhhdIF8g4ynATsd1nSvn7JUzRSItDZ9vmpck2lJ9M-DTYZ5JiSgg60hPhOiBkl5eev7Hp68O3WxO0-2HupCQ6R3IbAJOpuxH-PdA=@protonmail.com>
Feedback-ID: 26256541:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 19:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177313

utils: Adjusted host GCC version detection regex for
 current versions.

The regex only supported single digit version numbers, such as 9.0.1, I hav=
e adjusted this to be able to support versions such as 11.3.0

Signed-off-by: jochemste <jochemstevense@protonmail.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 643ab78df7..73b2f79e07 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -285,7 +285,7 @@ def host_gcc_version(d):
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.de=
code("utf-8")))
=20
-    match =3D re.match(".* (\d\.\d)\.\d.*", output.split('\n')[0])
+    match =3D re.match(".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
     if not match:
         bb.fatal("Can't get compiler version from %s --version output" % c=
ompiler)
=20
--=20
2.34.1



