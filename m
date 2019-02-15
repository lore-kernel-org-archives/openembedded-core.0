Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id AD5297C75E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 16:04:03 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x10so10865341wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 08:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=otrIVdxTEBUo8nNqpl8JG8vL/vJHxF+EzLch3ugNbHQ=;
	b=Mm0xiKGI/MfRpqAi+69QETJT26q+5RE8kGqz+JDu34BcYbY8rl4HtDx42wQ2WBnznq
	xRw17X/NMUM72clfqC/SK5Y5qqXFynEzwmqBZPDxHIU4f0dx99Ht+aYSn4GxLgCmGLN1
	+RP421gB9UUAizIBwjOeI79V5TW7OfNJOx+Sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=otrIVdxTEBUo8nNqpl8JG8vL/vJHxF+EzLch3ugNbHQ=;
	b=K23OW/AQHThRVrU0CUNzOAzuK7rxfsaGtHNHgQzFOP5IyYLjhajE0bf6ZH7vuhyp16
	+AaUty4xB+MBWKAJavaSFjOeghbwjPOmdkrO2stwRsSUUtxUskCJIjjMOksltb6vpmHT
	RlYFDm/B0jTCPKp1Zcs+yme2OtW15VCbxrm5lnNuMECEAl06L7DdHp3KHkK2rKdN5CZp
	kLg59rrqo8a/f+EDYzWUznsffrxCCTdJb/Zq66eIEde5Akua1ymrjcuE8HtHdhk1yxwh
	sG6Jow9PeIcHXu20KANo+X94aqhem6H6CgconCpZWoCc6/nL5CRLfe2KEQiibzipgIyJ
	sIwQ==
X-Gm-Message-State: AHQUAubZ/7xwBG1ZtxEGBic8sgXxovby0GVwnA9GtHOLqVuyUz4b+VAe
	GD5Y6FGwbfdKh+22oK3DT9sQolqeHCs=
X-Google-Smtp-Source: AHgI3IZUoWCCzlhiXOX4/qGPMKdFtCYV9aL63OwZRLusCmnjWoeQ5cbPwhGeyp8jyewEl3srGYedVQ==
X-Received: by 2002:adf:e603:: with SMTP id p3mr6624137wrm.104.1550246643947; 
	Fri, 15 Feb 2019 08:04:03 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e17sm3810424wrs.79.2019.02.15.08.04.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 08:04:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 16:03:52 +0000
Message-Id: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] target-sdk-provides-dummy: Extend to -dev and -src packages
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
X-List-Received-Date: Fri, 15 Feb 2019 16:04:04 -0000
Content-Transfer-Encoding: 8bit

This avoids errors when running populate_sdk under opkg:

 * Problem 1/1:
 *   - package busybox-dev-1.30.1-r0.core2-64 requires busybox = 1.30.1-r0, but none of the providers can be installed
 *
 * Solution 1:
 *   - allow deinstallation of target-sdk-provides-dummy-1.0-r0.sdk-provides-dummy-target

 * Solution 2:
 *   - do not ask to install a package providing busybox-dev

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 26716ace87b..60499f7b66a 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -2,9 +2,17 @@ DUMMYARCH = "sdk-provides-dummy-target"
 
 DUMMYPROVIDES = "\
     busybox \
+    busybox-dev \
+    busybox-src \
     coreutils \
+    coreutils-dev \
+    coreutils-src \
     bash \
+    bash-dev \
+    bash-src \
     perl \
+    perl-dev \
+    perl-src \
     perl-module-re \
     perl-module-strict \
     perl-module-vars \
@@ -36,6 +44,8 @@ DUMMYPROVIDES = "\
     /usr/bin/env \
     /usr/bin/perl \
     pkgconfig \
+    pkgconfig-dev \
+    pkgconfig-src \
 "
 
 require dummy-sdk-package.inc
-- 
2.20.1


