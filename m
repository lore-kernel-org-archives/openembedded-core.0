Return-Path: <dl9pf@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3942EEB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:03:50 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web10.21597.1688648627201377298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=dl9pf@gmx.de header.s=s31663417 header.b=PG55pU2W;
 spf=pass (domain: gmx.de, ip: 212.227.17.21, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688648624; x=1689253424; i=dl9pf@gmx.de;
 bh=F9/45RjE4RJhI7cZxM/Gu9Q0u/X7Mm4xdA1GeDue6Zc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PG55pU2WOuncJzDllzPAy3C9xgT9qBa4hY4iSp1lkaB3e/lRv1kkmkXcJDi0e0yZdLnqgem
 UqMrbxuxMK7Q1BHXZ3KsMejEf6TOpJLvkQPaSgNFSksLYzPWSLfaR5P2YxmGh54EqqUir4eep
 35l1SlfWNaA1RQPAcejbfKfkuze9M1Uoi/w8oKqYw33rfudy6Swd+tHD0JlBTl1Q4oZj5aKEg
 w6vFozXKPNm/kOBmq+HrM8qSXsH1vo43Dud7jWC/l2F0FfwB7RHJpx8KtEs35RRMuYLC2dcNA
 xEH1CtbGJkTCMOV3fsg+icJibvAwjsX0iGf/8KLl0fdMDtG6tXgQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from gmx.de ([77.23.145.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCsQ4-1q8YwS3GjI-008vqD; Thu, 06
 Jul 2023 15:03:44 +0200
From: dl9pf@gmx.de
To: openembedded-core@lists.openembedded.org
Cc: dl9pf@gmx.de,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [kirkstone][PATCH 1/2] selftest reproducible.py: support different build targets
Date: Thu,  6 Jul 2023 15:01:04 +0200
Message-ID: <20230706130338.7144-2-dl9pf@gmx.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706130338.7144-1-dl9pf@gmx.de>
References: <20230706130338.7144-1-dl9pf@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VoYMRZG0tVIUnakpzLLe8NU8UshCITFK9alWSQAia0J4mlJMk3i
 aswcA79HFb744Ivf3Z75is86uarZSShvomnkcLNJB5dNi7upF22ACg99n3jl0142W6lIcov
 ikaJ6VTFpVJSS9GV7Uc8t+/BCWefGee86IwHkzv/sWu0b56TxM4tcYhWm1hf+z2zGIpi451
 X43FOBoyLAzxRAXEc7uCQ==
UI-OutboundReport: notjunk:1;M01:P0:dGhGAfR3Cow=;VejvZW5cvV1tsIeXFtjxjyMYWAe
 Df58pQ9U9d6+1/0KJxyII12y4WoTRVWlsc4uWCTuatH7OlCNtKqO1rRi0uZDXXqOWIlzxq+2C
 3bAkIFZ69WYr6zYLg5CaSZXWXr+SOeidcxhy/EvTyFKdJwkIKAK0FHFeRZyUfa5duSNMLNhmn
 MFpLJe03I3maO0vRzrv0nwoYKwBWVXkx6g0FTefqGriC4wJcWKCOi98IQp45JZKsMJJ/MAzIz
 b5IBVdUa1e2Uy8zsMa2tS3S6C6aBo1+pvU6WyDItS8Rjira0SBoVNuQjwBo5lpu6wEwgElx0X
 rYCqP3y0LSaw/EGxCEGh3WQlGnNYhQj5yuypgHT6/qFQhd1vSFwKp3cTH2Qzt8IiFBfFdv12G
 5HC90bsk/ziXdrzmurtn50WaI969CLBYOYRUvP88Ndkq45GfzoBJRJlHNuRMD+KkeEaZvQIvS
 MmI/wU0ywp1hpAJPKE8ka5BXC7mVC6ma5tqsewBRPt3MYCetLO3cHtmwd0RByqZz9HmLLadsX
 w0Gk6oLhZSp0mOuscHcN6j29Ftc7BULrwDkdC87v1zoQ0bx2TxpX8L3cz+DMbb/cylQs+nDyY
 hGCGQR6EphGL+rJOnYKAwZ1Fg3QG+YjKZErZNldydaylqu0cuM+zRM4oH5iCmXEgZPsP+alZI
 D0Q/bEiBPbBcR2uGn43ChA9l58k8x0OLeCeSbvHmU4HP4ShKgNWVcVVMUTdQBhgcqL0NjZAGw
 vqOQMQXLAMjiENQFQUjC+4drqMMnWtr770qdWv0/1h/KaXB9g9bvv2dZQZb+jFeE0+k4CXWCv
 m3Bztzs5K9ntelCNCXJyjp2WZwbIJpzRPw8bstGobVSuMdcR50zFsNvXuwNoMEBFY9ECElJoc
 kJig8Ed2Joqlz/vFLBOMcmE7qZBHJ3z9W7+IcDKTx26fn7qw38dYOuulfoyDDRpQCLlFI0t3k
 Ud8mc9138Cm29IZyiDyQcm32giA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183941

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Allow users to set different build reproducibility targets than
the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.

Fixing all issues from "world" builds is not possible in some
complex build environments with lots of layers. Limiting the focus to
a smaller subset allows using this test to detect and fix build
reproduction issues incrementally.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c66bebbce5995e386a1a4d055a914a39b6ee518d)
=2D--
 meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/=
selftest/cases/reproducible.py
index 2c9bc0bf90..98259ae515 100644
=2D-- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -132,9 +132,13 @@ class ReproducibleTests(OESelftestTestCase):
     max_report_size =3D 250 * 1024 * 1024

     # targets are the things we want to test the reproducibility of
-    targets =3D ['core-image-minimal', 'core-image-sato', 'core-image-ful=
l-cmdline', 'core-image-weston', 'world']
+    targets =3D get_bb_var("OEQA_REPRODUCIBLE_TEST_TARGET")
+    if targets:
+        targets =3D targets.split()
+    else:
+        targets =3D ['core-image-minimal', 'core-image-sato', 'core-image=
-full-cmdline', 'core-image-weston', 'world']
     # sstate targets are things to pull from sstate to potentially cut bu=
ild/debugging time
-    sstate_targets =3D []
+    sstate_targets =3D (get_bb_var("OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS=
") or "").split()
     save_results =3D False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results =3D os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
=2D-
2.41.0


