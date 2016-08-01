Return-Path: <jpuhlman@mvista.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id F1BF860853
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:04:54 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id y134so56672411pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7POznu6VVh0in2P15+RSxMR/FkGZBO0d5WiEzzpSTdc=;
	b=FWnxJBxcGiX3lVLEFe1RAifYfAO9uWsIO3aOj7lVChvDdZD1OyNqlB8/LLJiueDgjX
	pkQuuLeArHzOW1bLgPBJCII09JttDJhsLuZB6HUBYpodIxLksmhzC5JeqxP5BlnN9/IC
	Uv05MVl60/9UCG0S+d7LUw1NocePFkuvrQ14R/zSiMj/ecTrZmBPrTskX838eoSWfc/T
	V9O8MFT9k/mi4DZk14VdUEQOQGrQ1srdAlz2TY+2FTbubshqtts2I0fwxA/5Uq7x4Q0C
	daJrP0RbkvpYT562eal1NBH+J8dgA472gehqjD2czpStQQbFzgiqhlvOKa2+jvJJUgr/
	AE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7POznu6VVh0in2P15+RSxMR/FkGZBO0d5WiEzzpSTdc=;
	b=ZMiT71EAMmoaKAYsx2/L0J47MvD6oBUBTZZM0xh/Cjzjn4nAehK2pUJDovMtBKVlqb
	iPjQmRElAaUcZ6qgb5mHivZSD7Y2C7OKuNpIqnrTu4YoGNih0DCv/Oguhc61W3msSuOA
	LeBFq8homGC8DuRRmcKS/2Xj4yXwpGffFau6NljrWLOjcvxGokisNhwRZtFr73ZKd9NG
	ujMoOJUxvlR16pFIH4PTQj3sVDksU+YSYKsRzzwb/X6GurwkkD8L/5Zj6qTX1f8aG0px
	50Tno7B05a2jAEGq7ldN6UGazpWY48nR4aCady2837LFmkMqFQ+FU3EZd0aT5EBJ+dBj
	U2qg==
X-Gm-Message-State: AEkooutomohyJnhfF0twucDNXaffL/wRDH6Av6CxQWRPW0H0Kx+uRuFsnyx1P2zXjDaOTvdv
X-Received: by 10.98.64.193 with SMTP id f62mr97537012pfd.141.1470067495033;
	Mon, 01 Aug 2016 09:04:55 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	h86sm46773385pfh.46.2016.08.01.09.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Aug 2016 09:04:51 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 09:04:44 -0700
Message-Id: <1470067484-24989-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [meta-oe][PATCH] mozjs: Fix incorrect usage of PN.
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
X-List-Received-Date: Mon, 01 Aug 2016 16:04:57 -0000

When building mutlilib, using ${PN} in the middle of the package name
creates incorrect package names:

lib32-liblib32-mozjs
lib32-liblib32-mozjs.shlibdeps

Which in turn breaks license.bbclass during image creation.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 02d5694..f147714 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -59,8 +59,8 @@ do_unpack() {
 }
 
 
-PACKAGES =+ "lib${PN}"
-FILES_lib${PN} += "${libdir}/lib*.so"
+PACKAGES =+ "lib${BPN}"
+FILES_lib${BPN} += "${libdir}/lib*.so"
 FILES_${PN}-dev += "${bindir}/js17-config"
 
 # Fails to build with thumb-1 (qemuarm)
-- 
2.6.2


