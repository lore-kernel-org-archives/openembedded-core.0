Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 383F9780F3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 09:53:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x17so6226459wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C76FOL+IF5NveD3ld8xDin/GNPyVF8Lj4cO2WlAsNN8=;
	b=QUpgIr+MSdqBBb/2jukS9hHOomvyeKHeS8OFR2B+TCdKqnm+sjctFyYQ7c0PGpWnLH
	JkQB6XKIdOliNztj4f79/Pyj23+WOQbUfaMTSkuZKZ9ChFo66mNr+2lpSsXcRs9TeMM0
	bCc+YI7Sm1rrXrzm5LcQEEVHqYx+55zqAhy9wLf6+FRh9THfz4fQiM75GLa4jB2cQgHm
	f2k0myXim9OdZkjwNfFCYgT4I2S8H0gKBLqXfjKLIiQ4MyWzSxKOOlNfFpb2+iXRLAdO
	2HO2sAZkGVOPhfhxVB66Od58kqGqAZbhCROClxXxsL8x51qkvNwYFtIDXOKmiFrRuVqc
	Nyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C76FOL+IF5NveD3ld8xDin/GNPyVF8Lj4cO2WlAsNN8=;
	b=f6SKjzTkH0Xn4FbZQ56XXyBCoXZb4Uf3Odv8VRNPiE9t0293s5yLl+zLda9SzFtZ3P
	dJQnttDITmW5jj3JFJ/1UqLVNTxfnQOf//b2DJSWDLz8BK6j96u9xMUVtet0qPUElkDy
	AphMatRrzXevszl0+T2+NAJUdInQ1nQbV2xrc1wBV81VFXSwVLagGqD1jSOmyrEME9KG
	21L4E/VlJqoKbtqwNppwEeeLCLmFySqHCnIkjcTdQbdc2xcLAM2XILM6AwzpYpcKnODZ
	vtvurCHmX4qqUIwl7x7xiu4uPDHj9Ing8YWNQbPUcvBGlMAXuX/hkUKZe9K7X/ABqqtc
	3FRw==
X-Gm-Message-State: AHPjjUhUvgzXp+qXI8f56mgP3tzFUaOYikYncWjKawRYZ0WRHr+N5/uI
	+o7VrvNzdE2VtnyU1pzMXw==
X-Google-Smtp-Source: AOwi7QADpnD3Sel0JQogmo7QpRgD+WubZp+1k5Nfw3kSEaqgPToAh1jErC+JEshInEzWUTF54CiFgA==
X-Received: by 10.80.186.172 with SMTP id x41mr9012974ede.68.1505642040851;
	Sun, 17 Sep 2017 02:54:00 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id d2sm3164397ede.50.2017.09.17.02.53.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 02:54:00 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Sep 2017 11:53:43 +0200
Message-Id: <1505642023-19357-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] cross-canadian.bbclass: drop TARGET_* flags overrides
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
X-List-Received-Date: Sun, 17 Sep 2017 09:54:00 -0000

From: Ming Liu <liu.ming50@gmail.com>

A regression was introduced by me in commit 767335c9:
[ cross-canadian.bbclass: override TARGET_* flags ]

it causes BUILDSDK_C/CXXFLAGS being exported in environment-setup
script built from meta-environment recipe, which is wrong, restore to
TARGET_C/CXXFLAGS.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/cross-canadian.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 69cbe90..1928455 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -113,11 +113,6 @@ HOST_CC_ARCH = "${SDK_CC_ARCH}"
 HOST_LD_ARCH = "${SDK_LD_ARCH}"
 HOST_AS_ARCH = "${SDK_AS_ARCH}"
 
-TARGET_CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
-TARGET_CFLAGS = "${BUILDSDK_CFLAGS}"
-TARGET_CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
-TARGET_LDFLAGS = "${BUILDSDK_LDFLAGS}"
-
 #assign DPKG_ARCH
 DPKG_ARCH = "${@debian_arch_map(d.getVar('SDK_ARCH'), '')}"
 
-- 
2.7.4


