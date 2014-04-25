Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0323C65DD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:40:31 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so2976580eek.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ycawzWVhLBe8JvrzNJz0FW7IBStvDQsCSLR5KFgDBCU=;
	b=Fep9GiSeXOn49tnRkQ/yb0/L81wK6FjeJWcR8LVNLOcGYLx8mednfaa1KX+6Y2b4ps
	VSSzn3SdsNo1w/rqb0BcQlkNIG7pck6I+LgbC1QzW74FtjjFId/AA78fjsuLuZRjQS5S
	JuQLSsv/CcBbezq5dZ3BQhYRHr+cPwuWw+uQUZZT3chUcf+mAgAOhxbN9MD82gDzSO6t
	g2fjRcRttW8i+PilN7avjOuevYjeoT7yuXwQCzutlPho2LxnLVzEB67rGWxSrkW/I9Et
	tCnA8qLZ348tYir6EuxW573oXrFNWkv1XyszDt3l8sWz2N7evDnt/n4z5Slcl/ABSS6J
	vcrg==
X-Received: by 10.14.176.1 with SMTP id a1mr5821370eem.52.1398444032470;
	Fri, 25 Apr 2014 09:40:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cb5sm26106853eeb.18.2014.04.25.09.40.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 09:40:31 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 18:40:29 +0200
Message-Id: <3284a4ff6415bb88ec8aee87c5fc098a30156c51.1398443925.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1398443925.git.Martin.Jansa@gmail.com>
References: <cover.1398443925.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] tune-cortexm3.inc: Cortex-M3 doesn't support ARM instructions
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
X-List-Received-Date: Fri, 25 Apr 2014 16:40:32 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

Use thumb instructions for Cortex-M3 to avoid this gcc error:
'error: target CPU does not support ARM mode'.

Extracted from "Cortex-M3 Technical Reference Manual":
"The processor implements the ARM v7-M architecture. This includes the entire
16-bit Thumb instruction set and the base Thumb-2 32-bit instruction set
architecture. The processor cannot execute ARM instructions."

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
1.9.1


