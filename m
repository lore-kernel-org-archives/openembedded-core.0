Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDD2C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 15:32:14 +0000 (UTC)
Received: from 11.mo583.mail-out.ovh.net (11.mo583.mail-out.ovh.net [46.105.47.167])
 by mx.groups.io with SMTP id smtpd.web11.16064.1724340728479361271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 08:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@joggee.fr header.s=ovhmo4398017-selector1 header.b=FJEnWzlf;
 spf=softfail (domain: joggee.fr, ip: 46.105.47.167, mailfrom: jonathan@joggee.fr)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.2.78])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4WqRyZ3lK6z1TdR
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 15:32:06 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xmq94 (unknown [10.110.178.2])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2B9BD1FE1E
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 15:32:05 +0000 (UTC)
Received: from joggee.fr ([37.59.142.100])
	by ghost-submission-6684bf9d7b-xmq94 with ESMTPSA
	id gKYCIfVZx2ZHHQgAk/K72A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 15:32:05 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-100R00342bc9b2d-3d1b-46fc-9667-4892900a711b,
                    E68CC070B80D67A2A1EB405121A5D3A95EF27D50) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 84.14.185.34
Message-Id: <D3MJRT7JKQ5X.2E127IS21IYRY@joggee.fr>
To: <openembedded-core@lists.openembedded.org>
From: "Jonathan GUILLOT" <jonathan@joggee.fr>
Date: Thu, 22 Aug 2024 17:24:49 +0200
Subject: [PATCH] cronie: add inotify PACKAGECONFIG option
X-Ovh-Tracer-Id: 6482368714046639227
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddruddvtddgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkvffhfffusedttdertddttddtnecuhfhrohhmpedflfhonhgrthhhrghnucfifgfknffnqffvfdcuoehjohhnrghthhgrnhesjhhoghhgvggvrdhfrheqnecuggftrfgrthhtvghrnhepvdegudetgefhleeiledtheeltefgjefhgeefveehhfffiedutddvveetkeetkeffnecukfhppeduvdejrddtrddtrddupdekgedrudegrddukeehrdefgedpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhonhgrthhhrghnsehjohhgghgvvgdrfhhrpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=Rr/ZO0+dSVfQiupnzPHJAblPScitrAMjIrC29hV1cRY=;
 c=relaxed/relaxed; d=joggee.fr; h=From; s=ovhmo4398017-selector1;
 t=1724340726; v=1;
 b=FJEnWzlf8XUygbzFRE+l+2CGP+Rf/0JCW92J5L44T647fKBCmX+uUWsCjQrPtc3hMKko5yQ1
 pdZ4cMNavYzjDhQwatmGVRGCmzF1rthDqqEUUG4LPr6Iam5+iz2o6QNgjqV6rjkYnP4Wu6KPcv5
 UqFbw4TCnyAAJQeilf55tkzYQIIbYiYfCCGL3c/hTibItEbZRN2VxKb04utBQETrNwu8LgYOkf3
 hfF79Ja5auvQ6r8LP3MFkq5Vvtfyz5M8iRzZpi6FVreZuwLeK2LglzQSeY80ft193mZUaVPeAq3
 Qe27JV0opi5zQI7NV6zmu5rOGOlX0FHWU7zYaDu+JSmKA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 15:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203656

By default, cronie inspects crontab modtimes every minute to check for
modications avoiding server restart for them to be taken in account. The
inotify option allows the server to use this mechanism to be directly
notified when a crontab is modified.

Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
---
 meta/recipes-extended/cronie/cronie_1.7.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cronie/cronie_1.7.2.bb b/meta/recipes-extended/cronie/cronie_1.7.2.bb
index e4711fa31c..496ca39fd7 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -36,6 +36,7 @@ PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
 PACKAGECONFIG[anacron] = "--enable-anacron,--disable-anacron,anacron"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[inotify] = "--with-inotify,--without-inotify,"
 
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."

base-commit: 6d2938e53cad5d9bf2e78a5403e9f9fab1db77b4
-- 
2.46.0

