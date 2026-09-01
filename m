Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A07EC624D3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 16:43:20 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.934.1788280992342873848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 09:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=t3Oyp897;
 dkim=pass header.i=@valla.it header.s=default header.b=kXZevv04;
 spf=pass (domain: valla.it, ip: 185.56.87.13, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-kvlb.prod.antispam.mailspamprotection.com; s=arckey; t=1788280992;
	 b=lBuTbfTnfF1ytjMvL4jP5PaD0zae0G4I6PQ1sfuk5ueVqwJm01ZQ5svmy+zBHASLJVMgZvwUMH
	  Kjzf2BxVTyMTwOYOHKKPYsUluQjpGsnKBbwjNp/JqH7MEX8KGeK64GVKgcg6RENn2MGqH6qn0I
	  zIfo0n0mLQeqzaCr9pE8uGSRI0vz9cScZHlHLfcVpukN9cPdDLiGluwZfGkuwSOAvluqHiv+oB
	  57wGUlTrny3y1fmtBYHRFmDpLyFtAHoDBi0zqllYZd1yF8Lt78La4854aOs7aKsVkj5hZg9ujN
	  eKoOBMObsQ2qUjinU9nsQ2qu6f9XqyUrJrbcvOOOtAfhFg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-kvlb.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-kvlb.prod.antispam.mailspamprotection.com; s=arckey; t=1788280992;
	bh=a5KS5vVeYfQACydvr/Cvz1HW/5es/jFmT9jBrVBCS4o=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=C/MfmAadieV+k+9c70Kru1iziNkObtVAucl6KXR9vtM17sCJasSAO6PpOaYzS7IykZzaZ/BOYx
	  7/nwmfHoDIrw5cLjeQzrrLEYKhyz5P4WS14zZvCDPs6YgiydgvMqDUgUc9I7nxNFyM/UCKBci3
	  MXMhRDU2mESmd0sdKjo4krKMlwhuNPM8UWh6r+r1kZCQ+amiposveInYQmhUbdXiT66+xMwAhK
	  OtPCR/YjJcZ/du1rUeK15rcbTBe1v7hZQ1d0124YcO2v+X4Q9dVkZnl9iL9Z7x6fYXsJKoAwlW
	  FOallMxfbTo3GKYKyIGsewvbidtQ1z+yEg7obI6wjwtpzg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=JdpgUQVQNxV7LuvSJ0B30c/1nrhQH5txav1s82YVdIA=; b=t3Oyp897TPVntUVf8HLH4UIatS
	XuZqDGCBhJ/ojBpu5nNCPtIjROArnGKhBF7wQVjsqOJ25Z6FSl7OALyNWBr+Uaop8ghJQsHANYCcb
	FLEdaYg1pLtAZFE07WFkSX3f22glXmw3ZT4GXatdjPnZo/3mNAgiv5SfZmiOuHIxVe/c=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-kvlb.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x1RZk-00000000rNo-00LL
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Sep 2026 16:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=JdpgUQVQNxV7LuvSJ0B30c/1nrhQH5txav1s82YVdIA=; b=kXZevv04NwLSIRr7DWEs9mBGFs
	lFPLcFoZbW/+/vXrdSezxjm9R5hAhrnqCXHSV70zkLWN1RYbEa6z3bEdoywXDUo785OwL0L/HUEKt
	JQwyfsfBdtFaGX16cnEz2Nppvko6kZlWzs2SyIK6BKw0KXG6/P2HxjaBw2ORLkaSPfSY=;
Received: from [87.5.139.196] (port=64545 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x1RZe-00000000NKz-3ZIr;
	Tue, 01 Sep 2026 16:43:02 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH 0/2] Update comments on FIT image generation
Date: Tue, 01 Sep 2026 18:42:41 +0200
Message-Id: <20260901-kernel-fitimage-cleanup-v1-0-0bbcacf4099c@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPhuIUpV6FfFhm4y6VqMkWgri3
 U3r48cw/0EBXhCoTg7y+EiQxUVkaUJmYNdDiY2mXOelfupMveEdJtXJJjPH2Uxgt6/K8qPSBkV
 luaT4Xj06+f7LTXs77K8RZvvl6Dwvnp6bCnsAAAA=
X-Change-ID: 20260901-kernel-fitimage-cleanup-da470ce57da6
To: openembedded-core@lists.openembedded.org
Cc: Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=768; i=francesco@valla.it;
 h=from:subject:message-id; bh=a5KS5vVeYfQACydvr/Cvz1HW/5es/jFmT9jBrVBCS4o=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnTGSbaen99tzMjWOjWhId7tBIM1jt+zP744JisuZpox
 2K1BRKdHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEujsZGV7axN98fPVPaz9z
 xZpuVvMFWtktbD/PM4Rt0WB/Y6WeFMTwP/Gm7pKo+Fuf725KCqyf5CSj/Gyaf5Qpg5XUIR+7mpM
 eLAA=
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 33559aa50384db6a2a5d68bd82b349da
X-AntiAbuse: ID - 33559aa50384db6a2a5d68bd82b349da
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x1RZk-00000000rNo-00LL-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-kvlb.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 16:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244836

Hello,

these patches only update comments that became outdated with the recent
changes in FIT image generation. No functional changes are introduced.

Regards,
Francesco

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (2):
      classes-recipe: uboot: update comments on kernel-fitimage
      oe-selftest: fitimage: update comments

 meta/classes-recipe/uboot-config.bbclass |  2 +-
 meta/classes-recipe/uboot-sign.bbclass   |  3 +--
 meta/lib/oeqa/selftest/cases/fitimage.py | 12 +++++-------
 3 files changed, 7 insertions(+), 10 deletions(-)
---
base-commit: db81c1a42a0f552d9a8ec124f004ae2063d58c33
change-id: 20260901-kernel-fitimage-cleanup-da470ce57da6

Best regards,
--  
Francesco Valla <francesco@valla.it>


