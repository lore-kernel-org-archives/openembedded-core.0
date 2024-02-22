Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E55EC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 15:22:08 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.15350.1708615323182678248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 07:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=vJ4AieSU;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 194FB9C4789;
	Thu, 22 Feb 2024 10:22:02 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id n1XB0opKAwe8; Thu, 22 Feb 2024 10:22:01 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4E4C39C460D;
	Thu, 22 Feb 2024 10:22:01 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 4E4C39C460D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708615321; bh=SilSXEc+1Twac2IhFMSkAgZJDROwdgCMoKJEPD/S+V8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=vJ4AieSUKWdUDUN+vS0YdxCaWO9pVN39JnOG1CeSrWgOyN10RyvgKNXF+6I0iU3O1
	 TWtWKxrhAV0ecuG4A4Ww4f8HLTv1gt3IU5MTNv185fuXJ0pg8sqAdImgOn2UZtPrCv
	 1NsKCe5UZlcGVEZFiBcCP7t8qlQGmB1wrmwcAaG/kjyhspaJuhgYifomGGeXSWvRvw
	 MmtoICB6vLmilS0F/k7NuUUvOZ0z5wpAj7WKGaJhbEOPbZG/2Fcvfmh6aMxjCRRGrF
	 aJShq0DrlAeW/+c/X69rVoL12SygBqKIHN1Yf5ZIeTvTWW48BNapvlecxbNQFw7KXv
	 kOEmd9k9o/PDg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id lU0-emqmZTjz; Thu, 22 Feb 2024 10:22:01 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 89B2D9C4232;
	Thu, 22 Feb 2024 10:22:00 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: mohammed.raza@savoirfairelinux.com,
	richard.purdie@linuxfoundation.org,
	paul.eggleton@linux.intel.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH] bitbake: progressbar: accept value over initial maxval
Date: Thu, 22 Feb 2024 16:21:53 +0100
Message-Id: <20240222152153.769675-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 15:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196036

There is a very rare case where the maxval is improperly computed
initially for cache loading progress, and the value will go over.

Explanation from bitbake/lib/bb/cache.py:736 in MulticonfigCache:__init__=
:progress()
    # we might have calculated incorrect total size because a file
    # might've been written out just after we checked its size

In that case, progressbar will receive a value over the initial maxval.
This results in a ValueError stack trace as well as bitbake returning 1.
    Traceback (most recent call last):
    File ".../poky/bitbake/lib/bb/ui/knotty.py", line 736, in main
        cacheprogress.update(event.current)
    File ".../poky/bitbake/lib/progressbar/progressbar.py", line 256, in =
update
        raise ValueError('Value out of range')
    ValueError: Value out of range

This fix mirrors the behavior of MulticonfigCache and accepts the new
value as the new maxval. This is also what the percentage printout
is doing in bitbake/lib/progressbar/progressbar.py:191 in ProgressBar:per=
centage()

I encountered this issue randomly while working on a project with
VSCode saving files while commands where fired.

Note: This file is a fork from python-progressbar. It hasn't been
refreshed in 8 years. We did only two commits, 5 years ago with minor
modifications. This new change is also not how the upstream project is
behaving.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
---
 bitbake/lib/progressbar/progressbar.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/progressbar/progressbar.py b/bitbake/lib/progres=
sbar/progressbar.py
index e2b6ba10836..d4da10ab755 100644
--- a/bitbake/lib/progressbar/progressbar.py
+++ b/bitbake/lib/progressbar/progressbar.py
@@ -253,7 +253,7 @@ class ProgressBar(object):
             if (self.maxval is not UnknownLength
                 and not 0 <=3D value <=3D self.maxval):
=20
-                raise ValueError('Value out of range')
+                self.maxval =3D value
=20
             self.currval =3D value
=20
--=20
2.34.1


