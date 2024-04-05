Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3002CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:20:16 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web11.7658.1712312410386963212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 03:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=VWoNO5AY;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=851; q=dns/txt; s=iport;
  t=1712312410; x=1713522010;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VO0xMjT9VaA7LjHzxnUBgfY9WvADdAB0tQqdDdiVr7I=;
  b=VWoNO5AY0UxgVxof1F+79XNq/wzgtkMuuFb9YrQfFZuOMaGzZZufKAfY
   QYkh70Eh1qEYeTfQoXixVyhJHcIB/wh5xFi/3sCMPjBn27VjfiODUhfTs
   PplbYTCHFmTZEGzSxzv5qW+2P++i8JgyDdWLbWyaXnL0/jaihJ45S/CWs
   E=;
X-CSE-ConnectionGUID: 4sxUo5VSSk+U+orecvqHFA==
X-CSE-MsgGUID: WJPPzTKXT0GOC6YntGrSBw==
X-IPAS-Result: =?us-ascii?q?A0CJAQALzw9mmIMNJK1agliEFkFIlBqOFZIXgSUDVg8BA?=
 =?us-ascii?q?QEPRAQBAY0XAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEGAQEFAQEBAgEHBRQBA?=
 =?us-ascii?q?QEBAQEBAR4ZBQ4QJ4V6hxIBghaDAIJgAgGvVoIsgQGEeNk2gWqBSIx7hWEnG?=
 =?us-ascii?q?4FJRIQHdoQKgQaFdgSfSkqBIwNZIREBVRUyGRgJPA8MGgIbFA0kIwIsPgMJC?=
 =?us-ascii?q?hACFgMdFAQwEQkLJgMqBjYCEgwGBgZbIBYJBCMDCAQDUAMgcBEDBBoECwd2g?=
 =?us-ascii?q?z0EE0QDEIEyihaDP4IggRGDI06DPwMJAwcFSUADCxgNSBEsNRQbBiIfbweeb?=
 =?us-ascii?q?IEOgUdixjOEHaErGjOqM5hipCKEY4FlATiBW00jFYMiUhkPjjmdHEM1OwIHC?=
 =?us-ascii?q?wEBAwmIboF6AQE?=
IronPort-Data: A9a23:zh7gY6rdh2BoYZcCuFB0/trzlu5eBmIXZRIvgKrLsJaIsI4StFCzt
 garIBnQa/bcZmPyfNlwOoXnpkwAvceAzIU2HVBr/is9Fi1AouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7wdOCn9T8ljf3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYADNNwJcaDpOt/rf8E435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum1hK6b5Ofbi1q/UTe5EqU2M00Mi+7gx3R9zx4J
 U4kWZaYEW/FNYWU8AgRvoUx/yxWZcV7FLH7zXeX7deD8kqbTUDXwLZTT0YsMIYG48ZZKDQbn
 RAYAGhlghGrjuayxvewTfNhw51lJ8jwN4RZsXZlpd3bJa95GtaYHeOTvpkBh25YasNmRZ4yY
 +IebDNzbQnbYzVEO0wcD9Q1m+LAanzXKWEF8AnO/PJmi4TV5DNT6ID/DPnlRoSlYu4Lr0CEi
 Xj91XusV3n2M/TElGLaqSjz7gPVpgv8QI8UGbiy+/JmjVHWzWsJBTUSVECnur++kkO4VtdVJ
 kAY9yZoqrI9nHFHVfH0Wxm+5XWDpBNZApxbEvYx70eGza+8Dxul6nYsEiVRVdt7ivQNRn8Xl
 ViTktj3HBxBmejAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+UPRqlt13ojqf49ScaIYs3JJN3m/
 9ydQMEDa1g7hMoP0eCw+krKxmvqrZnSRQlz7QLSNo5E0u+bTND4D2BLwQGHhRqlEGp/ZgLY1
 JTjs5PBhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkPuWskeRo1bZ1ZJmGBj
 KrvVeV5uc870JyCMP4fXm5NI5VCIVXITI26Bq6OMrKinLAoJFLblM2RWaJg9zuwyBd3y/5X1
 Wazese3BnFSErV80DezXK8c17Rtrh3SNkuNLa0XOy+PiOLEDFbMEO9tGALXMogRsvjeyC2Lq
 Ik3Cid/40gFOAEISnOJodd7wJFjBSVTOK0aXOQOK77TfVY9Rz55YxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:yO6Tga6HVZRYccWPSgPXwNvXdLJyesId70hD6qkXc203TiX2ra
 +TdZggvyMc6wxwZJhfo7690cC7KBu2yXcf2+Us1NmZMTUOwFHIEGmnhrGSpgEJ3EbFh4xg6Z
 s=
X-Talos-CUID: 9a23:bQBLY27cQ86VMVp+BNssqFUEJ8d4TEbmzzTtYEiiBG13UZ27YArF
X-Talos-MUID: 9a23:x1YuHgbVRkLXG+BTiB3UvCNeF/dUu4uJIx48l4kpofKuKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.07,181,1708387200"; 
   d="scan'208";a="245033109"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:20:09 +0000
Received: from sjc-ads-4348.cisco.com (sjc-ads-4348.cisco.com [171.70.55.119])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 435AK9gn028146
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Apr 2024 10:20:09 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] bash: improve reproducibility
Date: Fri,  5 Apr 2024 10:20:09 +0000
Message-Id: <20240405102009.3295400-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.55.119, sjc-ads-4348.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 10:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197981

nativesdk-bash package contains host references in output packages.
remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
v2
 - moved common code to separate function 
v3
 - absolute path cleanup for all classes
---
---
 meta/recipes-extended/bash/bash.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 7832ad052b..42a187bc11 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -74,7 +74,8 @@ do_install:append () {
 		mv ${D}${bindir}/bash ${D}${base_bindir}
 	fi
 }
-do_install:append:class-target () {
+
+do_install:append () {
 	# Clean buildhost references in bashbug
 	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
 		-e "s,-I${WORKDIR}/\S* ,,g" \
-- 
2.33.0


