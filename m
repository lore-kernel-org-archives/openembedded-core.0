Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D27C0018C
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:48:15 +0000 (UTC)
Received: from 16.mo583.mail-out.ovh.net (16.mo583.mail-out.ovh.net [87.98.174.144])
 by mx.groups.io with SMTP id smtpd.web11.9580.1698792490511241575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.174.144, mailfrom: louis.rannou@syslinbit.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.20.107])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id A946C28730
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:08 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nzml2 (unknown [10.110.208.94])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1E95E1FD81;
	Tue, 31 Oct 2023 22:48:08 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-nzml2 with ESMTPSA
	id yIoDBCiEQWUYnR8APQBgzw
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 31 Oct 2023 22:48:08 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S00220134b0d-ba9a-4ace-98fe-641576a378b2,
                    E382B8EC8DEDBA5F41C2577A0B4F295D8A9180D4) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jpewhacker@gmail.com,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [OE-core][RFC v2 12/12] oeqa/selftest/cases/spdx: change test for spdx3
Date: Tue, 31 Oct 2023 23:47:33 +0100
Message-ID: <20231031224733.367227-13-louis.rannou@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031224733.367227-1-louis.rannou@syslinbit.com>
References: <20231031224733.367227-1-louis.rannou@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9522861416245747165
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtfedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefnohhuihhsucftrghnnhhouhcuoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqnecuggftrfgrthhtvghrnhepgeejgfefieevieefkeevfeeuleekgeeuiedttedtvefgheehveelhfevveehvddunecukfhppeduvdejrddtrddtrddupdeghedrkedurdeivddrledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189888

fix issue in selftest due to spdx bump

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index 05fc4e390b..215c3c5365 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -41,11 +41,17 @@ INHERIT +=3D "create-spdx"
             with open(filename) as f:
                 report =3D json.load(f)
                 self.assertNotEqual(report, None)
-                self.assertNotEqual(report["SPDXID"], None)
-
-            python =3D os.path.join(get_bb_var('STAGING_BINDIR', 'python=
3-spdx-tools-native'), 'nativepython3')
-            validator =3D os.path.join(get_bb_var('STAGING_BINDIR', 'pyt=
hon3-spdx-tools-native'), 'pyspdxtools')
-            result =3D runCmd("{} {} -i {}".format(python, validator, fi=
lename))
+                self.assertNotEqual(report["@graph"], None)
+                for e in report["@graph"]:
+                    if e["type"] =3D=3D "SpdxDocument":
+                        self.assertNotEqual(e["spdxId"], None)
+                        break
+                else:
+                    self.assertFalse("SpdxDocument not found")
+
+            # python =3D os.path.join(get_bb_var('STAGING_BINDIR', 'pyth=
on3-spdx-tools-native'), 'nativepython3')
+            # validator =3D os.path.join(get_bb_var('STAGING_BINDIR', 'p=
ython3-spdx-tools-native'), 'pyspdxtools')
+            # result =3D runCmd("{} {} -i {}".format(python, validator, =
filename))
=20
         self.assertExists(full_file_path)
         result =3D check_spdx_json(full_file_path)
--=20
2.42.0


