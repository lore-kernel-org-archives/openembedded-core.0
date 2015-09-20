Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5C81875688
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Sep 2015 05:19:32 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so72994128wic.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 22:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dTcvvNgeehGqGi2QsXIRjcbtbFCyJinyoaXHnSlPENc=;
	b=QrHJphF6bHpemirsJMOd5N9bmh7oYhbNjSkrWqoyuA2UZx6dRhITaQRsf/sFYIx4KA
	uR+onCAaT41exRzwuP/B0dBAsQmVTL4VWQnNJ9sf4R2hgQPB/Gg0kFaMEWSKsw0YwOOM
	jKbIEzfbG+iFe5JVhZ4VQltS0vYQLamQOE/oHiVKZjKtDKVGg7/7HPyyB2e+vWv324k2
	cXFuXBIwYKCA6qr+l/cOfr5TxOWkXlN1uF7CMgeIq9A+IMDOPGXizcQY7FbfSRpnTuEB
	YqMOj2FmJTShI/BDlQp4/oO/aKB4YusAMSg3i1TSDYOCozoCKnM4LJrBVrV5K+RPhMRY
	vMOw==
X-Received: by 10.180.89.41 with SMTP id bl9mr6304468wib.85.1442726371947;
	Sat, 19 Sep 2015 22:19:31 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id x7sm6524781wia.5.2015.09.19.22.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Sep 2015 22:19:30 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Sep 2015 22:19:24 -0700
Message-Id: <1442726364-25467-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] autotools: fix traversal bug in aclocal copying
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
X-List-Received-Date: Sun, 20 Sep 2015 05:19:36 -0000

From: Christopher Larson <chris_larson@mentor.com>

The logic is supposed to avoid following dependencies when we depend on
a target recipe which depends on a native recipe. The problem is, we were
marking the dep (the native recipe) as already processed when we avoided
traversal, meaning that even when that recipe would be pulled in via
a different dependency, we skipped it there too, and whether it was skipped
entirely depended on the non-deterministic dep processing order. If the first
one to be encountered was via the indirect target dep, it wouldn't end up in
configuredeps, otherwise it would.

As we want to avoid traversing that particular dependency relationship, not
*every* dependency on the native, we should continue, but not add it to done,
so it can be traversed from other avenues.

This fixes an intermittent bug in some of my non-GPLv3 builds, where one
dependency upon gettext-minimal-native was skipped, but others should not have
been, resulting in it being removed from configuredeps entirely, and no
gettext macros being available.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 819045a..078f58f 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -168,9 +168,9 @@ python autotools_copy_aclocals () {
             for datadep in data[3]:
                 if datadep in done:
                     continue
-                done.append(datadep)
                 if (not data[0].endswith("-native")) and taskdepdata[datadep][0].endswith("-native") and dep != start:
                     continue
+                done.append(datadep)
                 new.append(datadep)
                 if taskdepdata[datadep][1] == "do_configure":
                     configuredeps.append(taskdepdata[datadep][0])
-- 
2.2.1


