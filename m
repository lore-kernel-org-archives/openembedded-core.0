Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4FC6DC26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:36:19 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id q10so3053174ead.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=HAC2dIvdhU7BXpg3bGeqFQUisVPlZR3L4uxnQswoYME=;
	b=i3hGqN65dSwtEUB4NLpEMhVdeQQdsmufSZ+IJPFZPvVNfL2U0N/NfwFl+s21SzppQd
	Pgt09S5vKP6sCAk9MzRtOyTAxhgZ5hFIXZrWQZR5tYGVSsVjH1X51cKQbozz9hBBKgeN
	geV0yIQ1/068YXhvH7UXdq5SHDuyz534LagE0W1zKEnLO1eEi+eVqkjK9mYEL8XCHXjW
	ua62NPpvLT4ovMe8hts6yItA49rzFdeUmOib/wdsG03cc+yU+a3jCm5OD1MDz+sEAmul
	45a12T/RZVu2zctWnv7EAcNRLIV4A5t6q7NcHr9GXoEOpWjYyGSTaeBGff8T18xQxtRP
	IKAQ==
X-Received: by 10.14.194.131 with SMTP id m3mr27050725een.2.1390350980318;
	Tue, 21 Jan 2014 16:36:20 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm20617445eel.2.2014.01.21.16.36.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:36:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 01:36:11 +0100
Message-Id: <73f7c49db979e9429b53b057df6186ab01293b6d.1390350823.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RFC][WIP 6/6] tune-cortexm3.inc: Cortex-M3 doesn't support ARM instructions
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
X-List-Received-Date: Wed, 22 Jan 2014 00:36:20 -0000

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
1.8.5.3


