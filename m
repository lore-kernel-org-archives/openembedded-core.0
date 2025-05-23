Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B2FC54F2E
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 12:21:10 +0000 (UTC)
Received: from smarthost01b.ixn.mail.zen.net.uk (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by mx.groups.io with SMTP id smtpd.web11.47041.1748002861509363183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 05:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=hrporT8z;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.21, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01b.ixn.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1uIROV-005xfy-5k;
	Fri, 23 May 2025 12:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=6XzLQGPgAQZ5G4fEsxyCDk1VFMw0pV0ifik/BuzGk7c=; b=hr
	porT8z5PS/O8BBArTAHdb2Q8n4qB2FhQYGjloRAPdD24M1pipLESXttRZoMEiPGBRQzx76OIckT4i
	nJ6vDEmSr/2/L9ph7eztSXUDRW8EoOg0JVHQjlx9k5TsfrrPY8BRRHGQKruDPzjqgnXj3t6oLuMPm
	CCHK0V8oGcOOPLPfr4o+gTvZHbwgd5s1euBnr/1sH5k41wg30FRnRtbaSlwwywRSnSuIFAuWEIx96
	8HDDFmxhM5uERWspq9THxiAAA274fuN61tPhZIE4HNU/rnDUto1IVyy4epjjfD8tvJhDz4YrAYfkw
	wKillFdDOtI6g78/XqStRgLGTz7DA5bQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1uIROT-00DVPu-2F;
	Fri, 23 May 2025 13:20:57 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>,
	Jack Mitchell <jack@embed.me.uk>
Subject: [PATCH] kernel-fitimage: Cope with FIT_CONF_DEFAULT_DTB being empty
Date: Fri, 23 May 2025 13:20:45 +0100
Message-Id: <20250523122045.3097055-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01b-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 12:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217206

From: Mike Crowe <mac@mcrowe.com>

Quote both sides of the comparison of ${FIT_CONF_DEFAULT_DTB} and $DTB
consistently to avoid parse errors if either side is empty.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Reviewed-by: Jack Mitchell <jack@embed.me.uk>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 07786647e1..c81c00f777 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -593,7 +593,7 @@ fitimage_assemble() {
 		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf '%P\n' | sort) \
 		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | sort); do
 			# Set the default dtb image if it exists in the devicetree.
-			if [ ${FIT_CONF_DEFAULT_DTB} = $DTB ];then
+			if [ "${FIT_CONF_DEFAULT_DTB}" = "$DTB" ];then
 				default_dtb_image=$(echo "$DTB" | tr '/' '_')
 			fi
 
-- 
2.39.5


