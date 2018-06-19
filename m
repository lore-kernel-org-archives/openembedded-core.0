Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id EE4D875476
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 10:51:45 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id w10-v6so20053665wrk.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=aMG2PVvBo3M8A2daEIhiS5EsVgcQ6Bs0E/fZ69ZZMpM=;
	b=BXBG//oKNRe/4qrvG/XzzBLWFWgCbKPKAyspyN/kI9GB9JxBBw+mJbB8ryLJhraTp8
	qIfUoZnOspsErTy4YBllE05gxhlNgRlR9ERl5LRRhanAHWLElDHJ/kzwt2lgLdNfY/XI
	W5fotEhDAs9xiFdAoawkEcIei/Sycnvtz6Itw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aMG2PVvBo3M8A2daEIhiS5EsVgcQ6Bs0E/fZ69ZZMpM=;
	b=DzTkanxKC8ASnhZo5MMnilGNpgdG8G39OwhS0OFhagyGFMiw6fhDVwSvGGprPnTFgt
	i7d6LB4DRNEeV8inJYnaAWCYM7nJV2OOJol8NOrTACFC7bd7J4kJgl7/9G3wQP5ipvjQ
	h1tnmf3PrlqS3lIotLFSjSZS3UvXix+mk/GV74yStz6MsQuIL2t1qmyq33+B6KPsGWaf
	scgC9HOl8KdBZje/eQU6pcRNgN6CPVOMiuQXwm2p/40Ucgnx80YM9nH/zM8O/nclNjxf
	gPmMo1t+Kzt1L9JiOh21bzDBfx3SnLZ9fYCfLd6c1otq5mrzcmsBBsrSu+nSN7tPqFa5
	CDuQ==
X-Gm-Message-State: APt69E3BT1WnLwnxjN4wivhi1NEqM3UhFkbEwxLOWljgFXY7oacJzHYd
	glSD0+8yfPwyiwxXUNE9RTXzHQRKZxQ=
X-Google-Smtp-Source: ADUXVKLaXaT+sD9cYptq0Tb8BaP3vz948PsVm+Ee8u3NGGDoEAiMyvBSOQXw9CzqJwiUPO3JWcY66Q==
X-Received: by 2002:adf:9dc9:: with SMTP id
	q9-v6mr14159088wre.12.1529405506215; 
	Tue, 19 Jun 2018 03:51:46 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n12-v6sm15312083wrp.69.2018.06.19.03.51.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 03:51:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 11:51:40 +0100
Message-Id: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] Revert "rm_work: Stop appending _setscene to do_image_complete_setscene stamps"
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
X-List-Received-Date: Tue, 19 Jun 2018 10:51:46 -0000

Whilst this fixes the do_image_complete_setscene append problem, it creates a
new problem since the code can no longer reach the *do_package_setscene.*
code block below it. This breaks builds as per [YOCTO #12765]. Revert this
change in search of a better fix.

This reverts commit 5479654eeaaa0f81bfff54ca49369c87f1658705.
---
 meta/classes/rm_work.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 318d121d2b5..31d99e4554a 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -53,10 +53,6 @@ do_rm_work () {
             *do_setscene*)
                 break
                 ;;
-            *_setscene*)
-                i=dummy
-                break
-                ;;
             *sigdata*|*sigbasedata*)
                 i=dummy
                 break
@@ -93,6 +89,10 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            *_setscene*)
+                i=dummy
+                break
+                ;;
             *$j|*$j.*)
                 mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
                 i=dummy
-- 
2.17.1


