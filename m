Return-Path: <andrei@gherzan.ro>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 545D26B5CE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 15:08:34 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so2545583eaj.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 07:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=olAnai9tCOVdTD49iswiFpZFt2meagmQ8fZemhKAtrM=;
	b=hlgWnr4/Nq8UBRHHvU6SUQrbx/5O9h4fXq+N3jlvuT9tIab4+qCfuvZFor0+JicJcc
	FrLReU046NL/C7sIQDjzmMk2QNTpNBeaF5i+J53W6zfedC1Ge7kh9CTj/UyThRj+bd46
	0hbR19XHJoYIyFm6D802dreEf6HatTlKuIFtz/OEr0p2CY46Tmg9TppZRlF/U9NF/7GG
	LDX1vGGNi3xbUd462mkgpay4XBprj3yYgw1K7ZvGijqGjFaectAlrxSMeStlP/TX9jQu
	MUdTk+qpQkicRJc5ZqWsnMv4xkGclc+A6lRbzQMZwYPnmpqLIvs22i6gzdzL2axqYrPz
	k7qg==
X-Gm-Message-State: ALoCoQl4gfHi/euuLfboTeT+UL4a+gTZnw+nGnUDmjObOgYP3JZXZ9hL6Z3XOTF3jPPgIbAgnhAC
X-Received: by 10.14.209.129 with SMTP id s1mr16573734eeo.21.1389452914962;
	Sat, 11 Jan 2014 07:08:34 -0800 (PST)
Received: from localhost.localdomain (5-13-221-193.residential.rdsnet.ro.
	[5.13.221.193])
	by mx.google.com with ESMTPSA id v7sm23505814eel.2.2014.01.11.07.08.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Jan 2014 07:08:34 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2014 17:08:19 +0200
Message-Id: <1389452899-633-3-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
Subject: [PATCH 2/2] tune-cortexm3.inc: Cortex-M3 doesn't support ARM instructions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Jan 2014 15:08:35 -0000

Use thumb instructions for Cortex-M3 to avoid this gcc error:
'error: target CPU does not support ARM mode'.

Extracted from "Cortex-M3 Technical Reference Manual":
"The processor implements the ARM v7-M architecture. This includes the entire
16-bit Thumb instruction set and the base Thumb-2 32-bit instruction set
architecture. The processor cannot execute ARM instructions."

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/machine/include/tune-cortexm3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index cbc4c0d..780baf4 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -10,5 +10,5 @@ TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7m", " -march=armv7-m
 
 AVAILTUNES += "cortexm3"
 ARMPKGARCH_tune-cortexm3 = "armv7m"
-TUNE_FEATURES_tune-cortexm3 = "armv7m vfp cortexm3"
+TUNE_FEATURES_tune-cortexm3 = "armv7m vfp cortexm3 thumb"
 PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m-vfp"
-- 
1.8.1.4


