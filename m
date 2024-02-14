Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83382C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 19:11:59 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.1445.1707937909896952809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 11:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=X31ja4Vv;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 2F216240027
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 20:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707937908; bh=KFTBF37fpAHKZBRswVYFTd0Wp4SiOWDxbuG3huEZ11Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=X31ja4Vve1BsLX9iSHO81ECHKYth1na1sc94tEJuH9PZEVJX9kw3Hzi9MerrjH58y
	 Dz2Dfb4CPfWnqIHp+AJbjZEp/LSaI0YAIpypZCUVwODBBhpgGPnCrqiw5pYnm+BHI0
	 Yn8mdChUZbmHOYLmUiTZAd+O7p5Se73orADU/+V8YJ+/AOgXRCYFrcxOkZrkQpgR5G
	 Ig91N5TLgMS5HjidnI3MVfOFbLNs+1x/jNaKP7nTwXHC4PaRF+SSI9SKjfU+AoOhCz
	 JF+Jg7l7qGxvqVfVNqxZ7esrgAgo3wX1oqs97gnRXdOWu8TO582+0UXhU7Nk7xi746
	 7FCC0B0UFAI5g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TZnqk4zvhz9rxX;
	Wed, 14 Feb 2024 20:11:46 +0100 (CET)
From: simone.p.weiss@posteo.com
To: tgammblin@baylibre.org,
	openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] patchtest: log errors and failures at end
Date: Wed, 14 Feb 2024 19:03:02 +0000
Message-Id: <20240214190302.8994-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 19:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195494

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

At the moment, running patchtest locally will only print failures and err=
ors
to the log when the not passing test case is executed. This might lead to
people overlooking issues with their patches, so print a log line at the
end if testcases showed issues. This should make it more easy to spot the=
n
before.

Fixes [YOCTO #15389]

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---

Changes in v2:
- Adapt error message to not contail FAIL/PASS as this string is used to
  check for individual failed testcases.

 scripts/patchtest | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index a1c824f7b7..8c9a73e1db 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -142,6 +142,8 @@ def _runner(resultklass, prefix=3DNone):
         logger.error(traceback.print_exc())
         logger.error('patchtest: something went wrong')
         return 1
+    if result.test_failure or result.test_error:
+        return 1=20
=20
     return 0
=20
@@ -158,9 +160,14 @@ def run(patch, logfile=3DNone):
     postmerge_resultklass =3D getResult(patch, True, logfile)
     postmerge_result =3D _runner(postmerge_resultklass, 'test')
=20
+    print('-------------------------------------------------------------=
---------\n')
     if premerge_result =3D=3D 2 and postmerge_result =3D=3D 2:
-        logger.error('patchtest: any test cases found - did you specify =
the correct suite directory?')
-
+        logger.error('patchtest: Not any test cases found - did you spec=
ify the correct suite directory?')
+    if premerge_result =3D=3D 1 or postmerge_result =3D=3D 1:
+        logger.error('patchtest: At least one patchtest caused a failure=
 or an error - please check')
+    else:
+        logger.error('patchtest: All patchtests passed')
+    print('-------------------------------------------------------------=
---------\n')
     return premerge_result or postmerge_result
=20
 def main():
--=20
2.39.2


