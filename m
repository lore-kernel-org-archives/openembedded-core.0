Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A154E6FE54
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:19 +0000 (UTC)
Received: from 13.mo583.mail-out.ovh.net (13.mo583.mail-out.ovh.net [87.98.182.191])
 by mx.groups.io with SMTP id smtpd.web10.23278.1695394095289470888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 87.98.182.191, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.138.246])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 58AD726CD8
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1BFC21FE65;
	Fri, 22 Sep 2023 14:48:13 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id oL6qBS2pDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:13 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001395e2d40-71c9-4c27-9cb2-26424ade98a5,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 14/17] ptest-packagelists.inc: add python test xmltodict
Date: Fri, 22 Sep 2023 14:46:26 +0000
Message-Id: <20230922144628.2495839-15-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12190399768667293961
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeetleffjeffvdejvdfgueelvdfgheejieetheevteehleeljeduuedtteekgfeuffenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188117

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Adding test to slow, as it comes as dependency of SDK packages.

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 35efdc319d..23fc4f14c7 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -109,6 +109,7 @@ PTESTS_SLOW =3D "\
     python3-cryptography \
     python3 \
     python3-click \
+    python3-xmltodict \
     strace \
     tcl \
     util-linux \
--=20
2.34.1


