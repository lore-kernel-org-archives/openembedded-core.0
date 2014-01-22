Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id B94F36CDF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:36:14 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so4448653eei.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=kLjW12pYqI9Ox2hD38fQSJgBupO7+sDxtL1J6G/1OyE=;
	b=qU6Rz+QWe4R0bFkZA1dRakC7wHIU00ZCxB+QisojQLeT+BFBsZ0qHkCTYpvJ287XSe
	Qeo6oyZC4kQvSBnsVGYVPZGG8OcSGgrDXb+TmpM1cSOqEfWZfotUxloZ61EspY6yighx
	Ha6FIPso7pLBuhkiOqp4jRjOoU8N42/sUKznJNrWARtZeEmP4itNtzYYdP1n9Nm/wxG5
	w3+vPaPgDiRdtW8jgkvMWjMRSDOJz2ZxGC7DsZUffkNokJ/OKwyVSglFDst/rasJDwSm
	wmV9zloPN04VaRnsCh6t6M8jn33jRqw2JTtP/M0j2AxGA9xPvHa5CwP8L5uVns1khOIO
	olzQ==
X-Received: by 10.14.99.66 with SMTP id w42mr13550622eef.63.1390350975162;
	Tue, 21 Jan 2014 16:36:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm20614547eeo.10.2014.01.21.16.36.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:36:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 01:36:06 +0100
Message-Id: <cb88d8fed87bf673db4290ab4ffdc46d0bc0d348.1390350823.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RFC][WIP 1/6] feature-arm-thumb.inc: Fix missing t2 suffix for armv7a MACHINEs
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
X-List-Received-Date: Wed, 22 Jan 2014 00:36:15 -0000

* unfortunatelly that note about armv7 matching also armv7a is no
  longer valid since armv7 include in armv7a was replaced with
  armv6+neon in this commit:

  commit 75b8adbc042e0f65fb1286bc550d02becd3b6aea
  Author: Khem Raj <raj.khem@gmail.com>
  Date:   Tue Mar 27 18:37:45 2012 -0700

    tune/armv7: Delete

  since then thumb and arm feeds had the same architecture
* be aware that this will rename lots of feeds

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index bd754be..fa3a4e5 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -9,11 +9,10 @@ ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True)
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", " ${ARM_THUMB_M_OPT}", "", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
 
-# Note armv7 will hit on armv7a as well
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "thumb" ], "t", "", d)}"
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv6", "thumb" ], "t", "", d)}"
-ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ], "t2", "", d)}"
+ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7a", "thumb" ], "t2", "", d)}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
-- 
1.8.5.3


