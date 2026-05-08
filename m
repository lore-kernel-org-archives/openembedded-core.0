Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C02CD37B0
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8232.1778224344419685496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tE6k/2ot;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a044cb827so1304418f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224342; x=1778829142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjqzCjQ5Uyjfr1eDAm5ln3Rfged/aPaw46opIqmR4Vc=;
        b=tE6k/2otav7KRRXNSAntAk7+ZFtdw8qmtdfzPn42SQdvVMjMruH3UKCu3c6jtkt4qW
         GwettkADVHFKwphCuGYHAkOaZUvyqrpJ3aEoe959Yr/N3KvEblhDBFnBQvNo2q/GVYXX
         kmEfOjBqRdhAz7lhDssD8hL8zqpecO4GeX1RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224342; x=1778829142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IjqzCjQ5Uyjfr1eDAm5ln3Rfged/aPaw46opIqmR4Vc=;
        b=rmmzdgzTgA3Q7bSyUrO2PuZ1J1AYifhppQpVjMLJlYlg5LQR7Sj1v08zQauLgBbS8i
         Q0PlNC4RZneivUeA3am0FOWMhVkiL83LdP8cCDAQozCvmfSRBKp848ksOyLwJzXxtR5R
         UG0hxkO3SICORpqXtUJnhYjktk+0XCy983mCcVTUI349/RVdHAz5lbJvniY8WShBgBGf
         D6yF2WtUCQRAe//CW0UIxGLwckIqxOM/A5mtjlkEffJ9sFS77DB+0sNqRwcg0JznkNNN
         9GGP9sET68utsFkz7D/AkFv5a7DVJCZKzpUoEW1HowE1i5JfgYXuJN18YcqT2if2uoVH
         MC9g==
X-Gm-Message-State: AOJu0YwARnST07EnUR/5PIkbkauFR2z8m3IP/EKaOdrxz0Ht+8I0ISLu
	ZTVOLn0CcXd7xlnhtWAwnYA8pRTYSCK6/aSu4Ceb+wBIlkDCMA1J5NgFJWRminQW3rgBtHAuEVe
	0iS2v3zk=
X-Gm-Gg: Acq92OGdg69RTOrLEI0kWdkXv+34MI8I/ckBhgvMfejpe58zEvqEMv+PkCb85pcLQV5
	YLA8/g6+KHfby64Kd82imE1B2J6Vra84sQxK1DbY06usmYlXsS8uNioMwB+navUA1d1afEn3sS1
	SgT9RDpMc6RJy6bZLEbMiqSAeASuw9DTqCeZp/J3+KnUmvT+BZTCEaNWDWJ7JuhLwIxNUPu4LIV
	ELMeMXgj+drCa2+CXukOaz+n4E6fIGEBauSEeTrp6/mbcV1doDMg85Jm0TQmlnvC0BYJFDcDYMP
	KXIWRdqQ7N5UTUb5z+sh4uo3+E1HOy3u1538bYQlvH3bZOw6hEV0g7fLOC0jfeMCjp11VZZB1ND
	aIK8CYxPIQ6J3K+V1wKAYvqPySeZhA/Yor7BkuXEKjs09I9+VaERs959fapn5fXUuZgt0Ktyh8d
	wpfwpn+ivmCe8GTJaOSKu1VL4jvAuWMHXHvOp3MdcJ3OgX8Hi61DR+yIcrUe5p+VAGv+12WYlhy
	2Ic9b9Lms4gXnFzU3rCHhC7HsY=
X-Received: by 2002:a05:6000:200c:b0:441:36b7:725f with SMTP id ffacd0b85a97d-4515b056aa0mr17933259f8f.5.1778224342300;
        Fri, 08 May 2026 00:12:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/52] ovmf: set status for 7 CVEs
Date: Fri,  8 May 2026 09:11:10 +0200
Message-ID: <620bfc832a46bc4525e194e989ef4177460757ea.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236659

From: Peter Marko <peter.marko@siemens.com>

These reappeared after last update of sbom-cve-check tooling.
"fixed-in" release was determined by following links in Debian CVE
reports except CVE-2025-2295 which was taken from Yocto master CVE
patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8cdfceff6606e00230551f6817289d751a414f0b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index d731bca7f25..19bcc4a96fa 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -48,6 +48,13 @@ CVE_STATUS[CVE-2019-14575] = "fixed-version: The CPE in the NVD database doesn't
 CVE_STATUS[CVE-2019-14586] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14587] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2024-1298] = "fixed-version: fixed since edk2-stable202405"
+CVE_STATUS[CVE-2024-38796] = "fixed-version: fixed since edk2-stable202411"
+CVE_STATUS[CVE-2024-38797] = "fixed-version: fixed since edk2-stable202502"
+CVE_STATUS[CVE-2024-38798] = "fixed-version: fixed since edk2-stable202511"
+CVE_STATUS[CVE-2024-38805] = "fixed-version: fixed since edk2-stabe202508"
+CVE_STATUS[CVE-2025-2295] = "fixed-version: fixed since edk2-stable202505"
+CVE_STATUS[CVE-2025-2296] = "fixed-version: fixed since edk2-stable202505"
+CVE_STATUS[CVE-2025-3770] = "fixed-version: fixed since edk2-stable202508"
 
 inherit deploy
 

