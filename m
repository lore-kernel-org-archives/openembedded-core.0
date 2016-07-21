Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 193286FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 03:19:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so826853wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 20:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0WK/khP2TkQPQZi0BlQnfkF1WBhoCQfDpUPYqmNhn0E=;
	b=RheIip8M/hou+lHn0Werf8sIIxGVNq6eSZeWYGKPp6rSjbpZLDEqfvGrzpmx6T6gO5
	WI2NokRmtelT8F67gd65eR95hAgp/1b1rml6wWL/HUkrzTSHb9UnWdUZ41nhmrqV1gQ0
	5SNpc2KeuxiGhD0XOaA8zK651D37RNWxPNtasl1zHfK78DU+btOGBoRWRPPK387CkRYy
	TKRGGNOYX29rXE2KdfYQs4p+2zWXHtcbBD+MES8AXRbYjBr9CWTyfvdYMwWaNHJ7u1Vs
	XoBkvSuNdxAPiYhwnPP/RzGgoLWck0xX0fu8gAUFBgZg7GbBsuJWcca7khIR1owUcPDq
	GfXQ==
X-Gm-Message-State: ALyK8tKuMQob9u0NvU0E1jzwvq+b69Ti54MxEu1TuxZm9FtNXFywJ5yAiOO6mPOLZ4os/w==
X-Received: by 10.194.178.137 with SMTP id cy9mr4427218wjc.50.1469071190483;
	Wed, 20 Jul 2016 20:19:50 -0700 (PDT)
Received: from tfsielt31850.tycofs.com (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27])
	by smtp.gmail.com with ESMTPSA id p23sm1036271wme.8.2016.07.20.20.19.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 20:19:49 -0700 (PDT)
From: git@andred.net
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 04:19:48 +0100
Message-Id: <1469071188-26218-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] musl: don't compile in mips16e mode
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
X-List-Received-Date: Thu, 21 Jul 2016 03:19:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

musl contains hand-written assembly which is not compatible with
the MIPS16e mode.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/musl/musl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 5e6cd01..276b00f 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -24,3 +24,6 @@ FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/lib*${SOLIBSDEV}"
 INSANE_SKIP_${PN} = "dev-so"
 
+# Doesn't compile in MIPS16e mode due to use of hand-written
+# assembly
+MIPS_INSTRUCTION_SET = "mips"
-- 
2.8.1


