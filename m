Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 704A57841C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:16 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id p139so4463997itb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GHSKvNvVsU1Q11cFIWZ8n5mBhsJblScd3e1TjaORh5U=;
	b=IFZ/epgOU9xwHUAISJSSGpDH3NySeeIP9b89I9AQE1dC+PoAnBITu3Vvw9mgAWv017
	wK2s90QBkmNklMm7GIRYPj4eFwtDpSFx0ZhrGFv/HM7l7GDRPpfyTyHdQ6LG23u8u/Tl
	E4YeM1V5Lg8v8/i9+hcy3BynNW23Yzolso4BaTra0iCInsQeyaohb5ojnxhv6V2yPGML
	qFhs4BR34yzlIVqAGR/TFt4rziWExClQRGnT97blA5d4p5aW3rb7aqvMmGs6c1RDFwhe
	MD/bg972fJt9bV8GCY69cMSe+lWaimMnR3V95uVZsrA7wRNvaeBK9oivUEipuO4n+e1k
	ophA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GHSKvNvVsU1Q11cFIWZ8n5mBhsJblScd3e1TjaORh5U=;
	b=GVgllfnwx1CTzWQMSLYmRDVU24AXYAUxOonzy0rn1iJ7mwOC2uLpPJEqWx1xp26ebP
	1vabDZNZe9Eah8Ru3ZXfID4fVwiBLE9YwiNyk1fU7gufXWgK3ZgVeWqD1eK+IaJGDMcJ
	ze6jWonIBI+UbEFT5k11+hlXXVqcF5/40Aul83h3arwMCiWIsyDIddG8UE7+L2vFgofg
	rCcVPQOMijJxAFrTh+pNLacTxWYV41cCwEgTXymqr/2jPHHLgCCz7kXsgpA8SJiC2cLU
	m89wC8Naw2LSmFk1kj5Lx3+Q+3P8mHOYlH5HOt7V2cGoGZhBbaakiRN7MF5e2CPJtuFa
	DTpQ==
X-Gm-Message-State: APf1xPDNTG6N4b5rHFDyEXMyh/Z8H6S6cqTYoGwpQqhybakcpvM8LE1C
	t9lvru/+YO/yg9TQxqMLRxWH6cHm
X-Google-Smtp-Source: AH8x226SHIIucgl+o/hpNQ1Sf4oBYRYWdH7KEtXmFRQI9pG1tgObb7XiSf0EUM8xVLYXh8RcouCReg==
X-Received: by 10.36.47.78 with SMTP id j75mr5070029itj.129.1517954597515;
	Tue, 06 Feb 2018 14:03:17 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:16 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:22 -0600
Message-Id: <787d0274e3686b24474f81120c99a6fcb7d0db87.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 03/14] icecc.bbclass: Skip canadian-cross compiles
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:16 -0000

icecc.bbclass will no longer attempt to distribute cross-canadian
compiles. While technically possible to generate a toolchain that runs
on the build system and generates executables for the host system, this
is not the normal way that icecc operates and there are so few of these
recipes that it is probably not worth maintaining.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 35a1aaef86f..9d5eaed57ce 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -101,6 +101,9 @@ def use_icecc(bb,d):
     if icecc_is_allarch(bb, d):
         return "no"
 
+    if icecc_is_cross_canadian(bb, d):
+        return "no"
+
     pn = d.getVar('PN')
 
     system_class_blacklist = []
@@ -151,6 +154,9 @@ def icecc_is_native(bb, d):
         bb.data.inherits_class("cross", d) or \
         bb.data.inherits_class("native", d);
 
+def icecc_is_cross_canadian(bb, d):
+    return bb.data.inherits_class("cross-canadian", d)
+
 def icecc_dir(bb, d):
     return d.expand('${TMPDIR}/work-shared/ice')
 
-- 
2.14.3


