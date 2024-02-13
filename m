Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B098C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 20:52:57 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.24737.1707857576240264657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 12:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=CLCE6loY;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 77187240101
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:52:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707857574; bh=csnjufDyNCOKd6hGgoPUJHyyQ6xv5GqZ/GTglCK3Cb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=CLCE6loYnsHpOSCUGPolTx5LJ2Dskjs2rgFNV+3rldAXRaxkURZfHnIK8mFd6fMLm
	 78y1iJdezfb7LY/agEF1O8BWroUom5X3DsTRy8fSJNPkvYQBEa7a/AFN5hX/xzE8nf
	 yQFvu4inz07bYfpiDDzm86i0EE8Cy5MxmOvcwvHIAlXx7GgjhzZgiq15h0XyEkedhm
	 FRY+I6D1l0RmVbnMymi6OfiGHOQq0t/dFdMPw2pLgjC+n4jzgoPsNKMTjUavkomsmi
	 oblhPIGxTWx9uDhiCr1wRsqv1/R9LU6XAX5CF3j8Ky2Q1Aq6DdX1nLvbDgiKtn/b5r
	 mB5PpnYamV/Og==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TZD6s5gyyz6twS;
	Tue, 13 Feb 2024 21:52:53 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] patchtest: log errors and failures at end
Date: Tue, 13 Feb 2024 20:52:47 +0000
Message-Id: <20240213205247.49342-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 20:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195428

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
 scripts/patchtest | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index a1c824f7b7..7d4d4f51d3 100755
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
+        logger.error('FAIL: patchtest: At least one patchtest caused a f=
ailure or an error - please check')
+    else:
+        logger.error('PASS: patchtest: All patchtests passed')
+    print('-------------------------------------------------------------=
---------\n')
     return premerge_result or postmerge_result
=20
 def main():
--=20
2.39.2


