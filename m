Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A44A27FBBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 08:26:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46ZRd85CVtz4q
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 10:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568967980;
	bh=lNlZ1Ti24otqA/DiJNqEcTlXjNG3XaucMDZR87FqOos=;
	h=From:To:Subject:Date:From;
	b=eCQp6ZZUMW5gMbmBSSmS+Vawj8xN5RHnkJ90R0h2Oxcha8yiATfvD3hCB4U5oSfE6
	jNUrOCoHKikDAcJ2Q956kA9aH3uhXA328bQ10C8b5tdIOBPnIl96/+1Rlwb4+4p0Ef
	mGjH3ngC+n4PgPaRHOIFlf9oMcjokzlvt5xHhhGobMjiQOBeknZWqeuCfAOaOv4zlK
	dglZjvL7LHMASerAfbe5XMdJ2cFnPnaV+VKwHMEHwoqVz+LHzfdAbek/MIiUO3C5XH
	G2QqjeVoiU3SKE5deERZYpbIAEPLieNarR/yB93RE1FKf9kUh11i+QLVTov4pdMag4
	s/Va9AOpZiwLAq1msaRs38M530g+YlQfzgulWK9M9fXAjVS9eOvDLNUomxi7BWf8Xn
	s/OOadYGvUyefOKUJmWsFrcYAvTbuj3wddgzP6FJEcIeVlnBchUbyb+kWeLNEncjDt
	1NJUqobvFAJVW/Y+pHkeXILJDlhRXg76igmFupqo+N4P8A4Nj/GJdtph7hDUHqO5PQ
	8kZ1iGqhMFmqUVcm7fGRcu5Rr8A/ocJ3VRdMzrtDOjDyBSqvAZLi4O3RK3NB1+fA+l
	5lbb14xGyXLQn/HHIUOb8YBmgKvZ+Fc9CwO11vWaUmLg8FtoeNZpmG7GIu0OR/lyFZ
	DjRnNevvy6/BywVENRko/wuY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 11:26:19 +0300
Message-Id: <20190920082619.14011-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] json-c: Don't --enable-rdrand
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
X-List-Received-Date: Fri, 20 Sep 2019 08:26:22 -0000

In recent years AMD CPUs have had various problems with RDRAND
giving either non-random data or no result at all, which is
problematic if either build or target machine has a CPU with
this problem.

The fallback is /dev/urandom, and I'd trust the kernel here.

--enable-rdrand was added in an upgrade to a new upstream
version without mentioning any reason.

[YOCTO #13534]

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 9d8f2e7870..9654e60a3d 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -23,7 +23,6 @@ RPROVIDES_${PN} = "libjson"
 inherit autotools
 
 EXTRA_OECONF = "--disable-werror \
-                --enable-rdrand \
                 "
 
 do_configure_prepend() {
-- 
2.17.1


