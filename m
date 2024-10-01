Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819EECE7CF8
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 08:58:28 +0000 (UTC)
Received: from 17.mo581.mail-out.ovh.net (17.mo581.mail-out.ovh.net [188.165.35.227])
 by mx.groups.io with SMTP id smtpd.web11.76959.1727773106452233110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 01:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@syslinbit.com header.s=ovhmo4479509-selector1 header.b=CnzHHz/G;
 spf=softfail (domain: syslinbit.com, ip: 188.165.35.227, mailfrom: louis.rannou@syslinbit.com)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.17.39])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4XHsKr0kT6z1JbL
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Oct 2024 08:58:23 +0000 (UTC)
Received: from ghost-submission-55b549bf7b-jgpcj (unknown [10.110.168.168])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8A17D1FEA3;
	Tue,  1 Oct 2024 08:58:23 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.102])
	by ghost-submission-55b549bf7b-jgpcj with ESMTPSA
	id lcQpCK+5+2bbKgAAjiXYSA
	(envelope-from <louis.rannou@syslinbit.com>); Tue, 01 Oct 2024 08:58:23 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R00427cdc905-7b2e-42d2-bb35-541ab670edf6,
                    F4B1DDAC98288D2BF6F90CDA6A624277FECA3AFF) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: Louis Rannou <louis.rannou@syslinbit.com>
Date: Tue, 01 Oct 2024 10:58:14 +0200
Subject: [PATCH] qa_image: move image_qa to between image and
 image_complete
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-qa32-v1-1-fdbe8b9fe4f6@syslinbit.com>
X-B4-Tracking: v=1; b=H4sIAKW5+2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyMz3cJEYyPdxGTDRBMTYyNjMwNTJaDSgqLUtMwKsDHRsbW1AG0lB+5
 WAAAA
X-Change-ID: 20240926-qa32-ac1a44323605
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727773103; l=1445;
 i=louis.rannou@syslinbit.com; s=20230614; h=from:subject:message-id;
 bh=Hfw1BdwakClLl7kMdqAz+DZE8Eb0yk2ZxUkwnbHxwpE=;
 b=BsuWJLgx1gyziArJ9qotcGesVzEWvwX6k8ZoLESOcbC+ZnidPRyORnLJHX9PjkgfDkGTodEzo
 Qtq/a7rjuHCCaV16M84HNvcQ34dCqFvw5Wxk3cEdoLA9UKbh2EyNFQ1
X-Developer-Key: i=louis.rannou@syslinbit.com; a=ed25519;
 pk=QLSK64UNeqThVe2CiH917a68zTpexYuA7iXw6WQ0bbI=
X-Ovh-Tracer-Id: 13379913020896632129
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvddujedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpeehteekvdfgkefhkefhheehueekvdegffevtddtfffhhfejgeehgfekgedvkeekvdenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=euZlrTonqF6XTU/AYqQo0bxrDfxl1K3NugKYtoFxOdw=;
 c=relaxed/relaxed; d=syslinbit.com; h=From; s=ovhmo4479509-selector1;
 t=1727773104; v=1;
 b=CnzHHz/GTDdPNL4fNChmxh2YMxJuG2mDEiHsJmCuLp1Pizm1Bpjf4fALtjBiUifu7a5IeZm7
 usPjsdFDuyJXXUClR7N+2Zw9XL4WNY/C2yG1t0Dt+PzRuNUCntZIuYF7UHfamwvQ+6pRJ8z9P1z
 2ZaNUgLbAWz5zoJgF5XdtIhC/JcteesYnGtGNyAw/q60uAfwULlCmZ1s6tsPD8lZvQ6cKe6nMOL
 /QOk2lagsj4YYQAczhbC/kVtxwLYS5GI1t0cDRoZ/xQsnNROTO9LhfW5QZ+Sx1+SKNi+4NTuXGz
 VB8Q1mQDMa+6iQFrGcWxxkuHdBtPVlqGEvIkvJ80Bz//Q==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 08:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205146

Commit 62ce334e583ecdf1f93619f4131c0fa5d88d5b02 moved this after image as it was
noticed that do_image_qa is useless when rm_work is enabled as the rootfs
directory is deleted before image_qa is called.

However, this pactch made impossible the creation of a dependance from image_qa
to any image_* task where various types of images are generated. This disabled
the possibility to test a specific type of image (eg. a FIT image).

As rm_work is called as a postprocess of image_complete, qa_image can be done
after image as long as it is done before image_complete.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta/classes-recipe/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 00f1d58f23777d40da47d4932140be4779a62ec1..445080c94151e48b23c93530bb7e6e41bb5794c2 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -341,7 +341,7 @@ fakeroot python do_image_qa () {
 
     oe.qa.exit_if_errors(d)
 }
-addtask do_image_qa after do_rootfs before do_image
+addtask do_image_qa after do_image before do_image_complete
 
 SSTATETASKS += "do_image_qa"
 SSTATE_SKIP_CREATION:task-image-qa = '1'

---
base-commit: 64c06dd06d747d7b53fb6ae6cf0550e13d63d8f6
change-id: 20240926-qa32-ac1a44323605

Best regards,
-- 
Louis Rannou <louis.rannou@syslinbit.com>


