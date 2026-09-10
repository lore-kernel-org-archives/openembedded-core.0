Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D037CC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 10:34:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10807.1789036489001362218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 03:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hn6JLOVG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso66043235e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 03:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789036487; x=1789641287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+nngkhOYeWTprFvok76RTYFF7dHp3zCCDQHQnbyGHI=;
        b=Hn6JLOVGWJcvANQt/qi5zecDfmIA1f4yXkD1vONa7hF3/aAweVtTfqadhFDhL25mgm
         sieRj7bCiX9sDNBHupQAa1vE/r4P4ap6PR9dD5ktRldY6yzMwO3rqmm5UP8Tn8BR59gV
         7Cm832/5EU/xwn/s9IgzGtR+F5fIb07Z8qMWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036487; x=1789641287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y+nngkhOYeWTprFvok76RTYFF7dHp3zCCDQHQnbyGHI=;
        b=szxIkl8YntKLYoYIQ/HKA+Xow1UMUXMoZ8NsGwuo5qfRsgEzueoXcl61kKP+cRKl92
         h5VqJl8bPOrGlZx5LTK5cJNNRyWRRZu0fNKGYGO1Es9LIXcak3TKiXpqweQ4VlvMTcMn
         tr7p9Bo+E2PubMxcM+WeENNbc13KVWW/P2FJvsuQe2rsTzR8wxvHCK7NrN75sUtYk2Li
         VKRUOJVp6epX89oXGeCvF0WftJb3E7RxA1DsXsNbA4mYz8Vvmd20b4hE8UG5g997H92Q
         jk+lOLoP+BDcdHDRGSULApSB0zZTR46hL0FUwYsJjnzvF+u9bZ7TAxPYZkg68DUeFcZr
         azcw==
X-Gm-Message-State: AFuF++nbgRKENiXzjrQdfV9gSWfk+8xlbIngKJEwItFr6cnPK11GugPl
	z0DQpFKjpK2FkQleSnol/7a2EeZ4uK0eftZDuBzMdf1BFOUadHsgSr49CeIZYvObaKrXdYGHLiP
	7XO877k8=
X-Gm-Gg: AYBFou1UQ1ZpahlnR8lOXmSYjxufLJcKyrwc1Zr9CcUH+rlXKQMrzgjgAsjyhbwUeYm
	wlcYxFTtsa6KUPKsCWenTjRSYfWZppO7iUd/9fgM78Vx8eX8np3k7LQZXdVexYYIvgyAmImhnof
	/NcIUsnZIPxd1NJ56UK/V6s8GYpwe5HdQ/a0d5t9u+3fK/Fpq6QD2tNNBcL0QlRd4ZSxQtbiBoV
	XmNylw3fQYZPmZMAHX+DQ90qwxcqwkUXYRREkL2WI1THrGJmbhj16DBGr52HoVpIajx6l3V08+7
	ZKDUVEfWOBQmN6HPy9jaPmzMj1CSNww0AUM4QKL7RDRk4omHRPZNqnpkQ15cLckqJU3WwgAizQh
	zw7rCwHQUp/KRQ6hzmlB0dpPV//XhC+0Un/G2YU2BSBA63ZCGjcH8GV0w5LYjtDNgBzaNqJv4w5
	RSfu2g68fAB70pPitoyNTf+wrB8Q9AD6h2YbTU8h18ft8dMA/G8VliRJyhr084ykfNS1x0l/wqj
	mgG0K74NBHtsm5k+DLx8DFy5vsj
X-Received: by 2002:a05:600c:358d:b0:49d:797:8488 with SMTP id 5b1f17b1804b1-49d0797853emr306071045e9.1.1789036486811;
        Thu, 10 Sep 2026 03:34:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm57395075e9.9.2026.09.10.03.34.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:34:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] libcap-ng,libcap-ng-python: upgrade 0.9.5 -> 0.9.6
Date: Thu, 10 Sep 2026 11:34:40 +0100
Message-ID: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 10:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245544

0.9.6
- Fix supplementary group changes in capng_change_id
- Reduce cap-audit size and memory use; builds now require llvm-strip
- Preserve capability evidence during cap-audit shutdown
- In cap-audit, fix optional SETPCAP false positives w/o hiding required caps
- Fix ambient capabilities and capability list handling in cap-audit --service
- In cap-audit, reject unsupported systemd unit syntax
- Fix tree branch drawing for repeated socket owners in netcap --advanced
- Fix utility builds with musl libc
- Ensure capng_change_id is multi-thread safe

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libcap-ng-python_0.9.5.bb => libcap-ng-python_0.9.6.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.5.bb => libcap-ng_0.9.6.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.5.bb => libcap-ng-python_0.9.6.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.5.bb => libcap-ng_0.9.6.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.6.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.6.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 2a31be6f4dd..0f3179f59f9 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "9ae44402f4c405f08b9dd5ec070127d0d92afee4"
+SRCREV = "c382c641ca5730442289c09d3c3d30cc2c8635a9"
 
 inherit lib_package autotools pkgconfig bash-completion
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb

