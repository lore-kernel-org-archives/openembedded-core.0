Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424AEC02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 12:50:25 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.40003.1738846223678361765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 04:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=eFwbtpTw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516BKUN2020693
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 12:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=QVtGvtMi3KKW9KrzttBO9AkdaOxSh/xtuJa7Vo1QNTM=; b=
	eFwbtpTwFgtgTmCg9y0G4xkQ6AtjHwhaB3M/mux/vGaDOJHYbj5DSjNBG95cGcwg
	9SgAuOj7WNH1SUSQpWkVhllixwiEo6j6f6ndVUHG+JiUVzs+g/fOy75sSbzd5Osb
	BYpGN0WeJYrf0O2P17/oq8XdSr0lsVjYnN+TAWL68/mv4v0J4+uCnFRmugqZIhEd
	2hzcZyzRr5d5+jabS9ZTnGMIRXZG1OP8KTDy28aiGjBWLVLlEQ5p1g8uV1OK7NAl
	ssOeg6ev9LKW1f89+7xnNu+QdxzswiulMcHq9fKM9c/Ess/5r59joaqQootU2LEf
	ZyzB2c3B9X0WsyXuKxa9yA==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mv18rkbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:50:21 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 13:50:21 +0100
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 13:50:21 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 13:50:21 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 1/2] bitbake.conf: Add weak default value for IMAGE_ROOTFS_MAXSIZE
Date: Thu, 6 Feb 2025 13:49:40 +0100
Message-ID: <20250206124941.342980-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206124941.342980-1-pascal.weisser.ext@karlstorz.com>
References: <20250206124941.342980-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zIIAjaZHwtoKBurU06y1MzDUEVqaY7hh
X-Proofpoint-ORIG-GUID: zIIAjaZHwtoKBurU06y1MzDUEVqaY7hh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210931

This would help the recipe linter oelint-adv from meta-sca layer to add
the variable IMAGE_ROOTFS_MAXSIZE to the list of known variables.

See https://github.com/priv-kweihmann/oelint-adv/issues/695By for details.

Setting the weak default value to the empty string actually imposes no
limit on the image size per default.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b607088c6..0a9e27a27f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -866,6 +866,10 @@ MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 # and no effect if less than it.
 IMAGE_ROOTFS_SIZE ??= "65536"
 
+# The maximum size in Kbytes for the generated image.
+# Per default no limit is imposed.
+IMAGE_ROOTFS_MAXSIZE ??= ""
+
 # Forcefully set CACHE now so future changes to things like
 # MACHINE don't change the path to the cache
 CACHE := "${CACHE}"
-- 
2.48.1


