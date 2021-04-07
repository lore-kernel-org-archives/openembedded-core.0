Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.5565.1617794537473542094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 04:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=njNWeV8c;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from anbelski-lsg-linux-yocto-1.irsgb21fvobu5fvmalxug44hib.xx.internal.cloudapp.net (unknown [52.247.218.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id BDF2120B5680
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Apr 2021 04:22:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BDF2120B5680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1617794536;
	bh=ADfOX55O1mkLqDKeXVd08wuH70LBV/qSvjgv5Q7W4ww=;
	h=From:To:Subject:Date:From;
	b=njNWeV8cSiNNjBTtEYUbbeAv53WhCRa2kFMoD12lZdgP9xEC3QvU4ZJzTDdtlPelI
	 XUDoiJcVOdAdf35ipwXH+xSjkQUM7aWTaG2MzukbTeFtz3IsRbweVClnBBjGx7XTwT
	 vwMxTMuNF7MuE7GQetnBtuEOJvbvy+oLTCUGuA3I=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cross-canadian: Whitelist "mingw32" as TARGET_OS
Date: Wed,  7 Apr 2021 11:22:06 +0000
Message-Id: <20210407112206.17357-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

If a recipe inherits cross-canadian and contains "nativesdk" in
BBCLASSEXTEND and meta-mingw is included and multiconfig is enabled,
bitbake will generate the correspending recipe. As meta-mingw sets
SDK_OS to "mingw32", that's what TARGET_OS will be set to as well.
Thus, currently such a recipe won't pass the check and fail with
a message:

Building cross-candian for an unknown TARGET_SYS
(x86_64-mysdk-mingw32), please update cross-canadian.bbclass

Even when building an SDK targeting Linux, but the mentioned conditions
are met, bitbake will try to generate the corresponding recipe and fail.

As the described combination seems valid, including "mingw32" into the
whitelist unconditionally as a fix is suggested.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index f5c9f61595..1e54035084 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -36,7 +36,7 @@ python () {
         return
 
     tos = d.getVar("TARGET_OS")
-    whitelist = []
+    whitelist = ["mingw32"]
     extralibcs = [""]
     if "musl" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("musl")
-- 
2.17.1

