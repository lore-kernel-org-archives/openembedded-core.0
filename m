Return-Path: <aleksey.smirnov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2419D44D7F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:17:37 +0000 (UTC)
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
 by mx.groups.io with SMTP id smtpd.web10.48277.1730906254770863185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 07:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=rAMSsY1W;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=SGfMPx9Z;
 spf=pass (domain: yadro.com, ip: 89.207.88.253, mailfrom: aleksey.smirnov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com D8983E000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1730906250; bh=52ROg/TDkBCrwNrABRGaXFhV36nvR+khbnNTbhdWe/c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=rAMSsY1WFNwXVPkuXQnNeULh5+DbZ1Q8q7f5AfbeE/GQiPr9yuNLXcn/jOXvRYBhD
	 hWXbrI5BlXFpSXsLZE2KKSPZ4m6d93TuCXsVRsJ+77yxslaUjO+5t2xfgHqCGYUJbS
	 pATkQnAE718L89stDca6IQ1AbTZJHJVhnQxev4VGJHWvfSOvKrMkeooWvmZC/qe2es
	 72XGgg9LTFCbiUoGEKXDlaNpu7LwQQJkAYuxSUbha5TZrYMCXEg80dr7Cho6uwyZgl
	 y1nZWqgzj4AhBmZl8Yes4ldbjLIUU5dt3I04n2ZVm8ToPfwcIox8+E1H/pTmA+g2jY
	 vOSQiWY1d3j2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1730906250; bh=52ROg/TDkBCrwNrABRGaXFhV36nvR+khbnNTbhdWe/c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=SGfMPx9Z/wlgIiVTxvCZ+FOU/tBkA89WIYMgzi935fHb7j80Gp7NLjqYhB5oi/hqb
	 F+MEeBLFp27qmejgFe5xpUNV/6+Aoh0MzKWvlO6Sp6eEPvVEIcrFa3qSBzTCXoAath
	 zCI6EoSXmRs060hQFcWQFpLjVMcsugo83AGHpc5Bkfc3gT+nJhR3ruvXQXKuMYu3Gk
	 raWnRUTge3XMQnQcYBxll+p+Ceo19Z11DgMniear8uu+nuHYO9MGEiIePtQjJqab36
	 mUC+ZBuqBBOOeGk+pn/F1vcxEVpeCg4CeF1mvYqA3KySkoMJfdz1D6YOccbH/Qk8/f
	 9Kl4kFs6XVhCA==
From: Aleksey Smirnov <aleksey.smirnov@yadro.com>
To: <openembedded-core@lists.openembedded.org>
CC: Aleksey Smirnov <aleksey.smirnov@yadro.com>
Subject: [PATCH] grub-efi: add extra parameters to grub-mkimage
Date: Wed, 6 Nov 2024 18:16:47 +0300
Message-ID: <20241106151647.1846508-1-aleksey.smirnov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-07.corp.yadro.com (172.17.11.57) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 15:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206789

Sometimes it is reasonable to add extra params to grub-mkimage,
for example: "--disable-shim-lock --pubkey <pubkey>". For that purposes
variable GRUB_MKIMAGE_EXTRA is implemented.

Signed-off-by: Aleksey Smirnov <aleksey.smirnov@yadro.com>
---
 meta/recipes-bsp/grub/grub-efi_2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.12.bb
index 7df77deca3..4a73ec5034 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -58,7 +58,7 @@ do_mkimage() {
=20
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/ \
+	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/ ${GRUB=
_MKIMAGE_EXTRA} \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IM=
AGE} \
 	               ${GRUB_MKIMAGE_MODULES}
 }
--=20
2.30.2


