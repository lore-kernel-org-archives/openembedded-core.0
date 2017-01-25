Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 522CA71E4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 16:21:11 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c85so33437735wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=K89oywB+QjivdLmcSab6ZtdGC5NgJX0gI+O2JhO30iY=;
	b=N3pLOVwIfw9430YLwT0dxN0t7+uKv7fDi+msalsiBuniPv3I/GuNT1OFS+2WnWPkcb
	35AF1h2XJ+2Vte8oy6KPWATJDguxyumLt+Dyk8ogca/DKGjZ9TK56YhhcsRsaxytQqlB
	Zo5ElyaTp/gYWX4IjG9859gyX1bD0z5eknFOJnbLuVfdvze3wCCPKyFPMHxSkTw0/PUu
	mOw+rUmsYWzOHp6rGErLj68GD40ZHbgtNbV2Qbnqj7yl4YomdT14zmBAovU8HNJJYFlo
	DKUstOIldZ4d8mrEQbXWlv/zh4sO3KdgiJaGlvsap6o+28b/kJ7Txb5OOyj4ZHxjIh5o
	VkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K89oywB+QjivdLmcSab6ZtdGC5NgJX0gI+O2JhO30iY=;
	b=Mf9BjYpQZrdBKQlX3b3K5R4uRr8Ag4GutqN5nqcwslmCP/bjiaAcUJUkVBlsVxh65y
	b324mS9nme5Z1tgQr77GVWLHE0D7uuISG53jzKjpHFeo2VcTz3bKk7sr3X871YJtuKIu
	eRmftU/6wA6J5iDwtdpxw5YhvKmq3J/VWE86u9qSMkvacOWvqpEfUYRW9gzMPDAuCM4r
	4piyYjX5OXIEG8atrO2f7uj71TSIpzL/QMAtBGfZyFmmy+mRvGLc45522hdEehppeDE6
	1Xg5c/VcVTxdH9cYREQeKsdadwetzXdQuq1MOf9UGcp6UiLFamwlFGcbnXUfy0vMbnAF
	8tLQ==
X-Gm-Message-State: AIkVDXKpBznJZIwQwvjsdFbSdIwS8G5m9vXWsx17Ig4MLwJzTbzO0Zb+RwRA1qInwwRcMLX2
X-Received: by 10.28.13.16 with SMTP id 16mr22334007wmn.101.1485361271671;
	Wed, 25 Jan 2017 08:21:11 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	w17sm25826760wra.28.2017.01.25.08.21.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 08:21:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 16:21:08 +0000
Message-Id: <1485361268-28358-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] distrodata: add DATETIME to vardepsexclude for do_distro_check.
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
X-List-Received-Date: Wed, 25 Jan 2017 16:21:12 -0000

This task uses DATETIME so add it to vardepsexclude so bitbake doesn't refuse to
execute the task when the time changes between the controller and the worker
calculating the hash.

[ YOCTO #10960 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/distrodata.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 5b3a3e0..9587ba0 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -392,6 +392,7 @@ python distro_check_eventhandler() {
 
 addtask distro_check
 do_distro_check[nostamp] = "1"
+do_distro_check[vardepsexclude] += "DATETIME"
 python do_distro_check() {
     """checks if the package is present in other public Linux distros"""
     import oe.distro_check as dc
@@ -475,5 +476,3 @@ do_checklicenseall[nostamp] = "1"
 do_checklicenseall() {
         :
 }
-
-
-- 
2.8.1


