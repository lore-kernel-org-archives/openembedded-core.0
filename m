Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7202D79DF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 13:26:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d10-v6so20091186wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ro7AevM5JXh+4sQiQkBAy9DISrwMEHrqxotmq0n58Js=;
	b=VduayHaSbqZ2TKfCZJVakNoH5jgbiuFO7o3awa1DPyyxOpKXwQHHojZ5zHNjxGjJV6
	o9CDfYdATS02/MxnUZXDYaXOhDGNs7GINKVP1Dn7iKHMvFvn+SiNhjnjNbS+moa6SPZZ
	edZj0tXQWuUF1vF3/EGqScjWinOkZX++ThHt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ro7AevM5JXh+4sQiQkBAy9DISrwMEHrqxotmq0n58Js=;
	b=iMNKq0Px/d1GYZUFaAy8avTNhgNSdeeS6k0b01bR419rsJfn96gZ40BO1c5gBmucZY
	Dsp5p5Bf1FUvYDP6uQ95lkKyvk3n/i/Viuvh9AVhFVnzEncuYSp1mtaImvWFXY8IEH8/
	qVVXhVKnY6VV8YK+5pm70ZldpkDQZtaLcl6SytDXOztA+OFjXYsh4UP9a4Cke3kAKXsp
	VdMpes1JO8vI6l2X/6NLLPXo8co+D8Q+RBV9qe+qn/diT/NwJf9zOashxOzaQk9ye1bR
	Ok665odYSjXgiblDnIJFDeGwLQQbzvSUUSZz1e+I+qU+6H0vkHtqKwi9rLm3mIaefXaI
	6ymg==
X-Gm-Message-State: AGRZ1gJSkpFC6kCL2xozCmF81xojHcxfTnaJPiXMdDw2+DEVIG8Ec63i
	v2LbpF+HS1u29r3tNuCIpw3pDCxkMys=
X-Google-Smtp-Source: AJdET5cMzOZcIeAIbgZqoYZ2ITGaAMLObA7HH/jkaM/Du8q4AEvYBIk9OhaM6B7kTVfRYi3XzxNs5w==
X-Received: by 2002:adf:a512:: with SMTP id
	i18-v6mr7084261wrb.220.1541078763663; 
	Thu, 01 Nov 2018 06:26:03 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c11-v6sm14431414wrw.94.2018.11.01.06.26.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 06:26:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2018 13:26:00 +0000
Message-Id: <20181101132600.10402-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181101132600.10402-1-richard.purdie@linuxfoundation.org>
References: <20181101132600.10402-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] crosssdk: Remove usage of host flags for cross-compilation
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
X-List-Received-Date: Thu, 01 Nov 2018 13:26:03 -0000

Similarlly to OE-Core rev 4b936cde58ca0a6f34092ce82640a02859110411 for
cross.sdk, BUILD_* flags can't be used as TARGET_* flags

gcc-crosssdk buils leaks config.log's through "gcc-stashed-builddir" and
TARGET_* flags to libgcc cross-build through "gcc/libgcc.mvars" file
on "gcc-stashed-builddir". This means that if BUILD_CFLAGS contains
host-specific flags like "-isystem/usr/include" libgcc build will
fail "do_qa_configure" and "do_package_qa" checks.

Remove host-related flags from TARGET_* flags for gcc-crosssdk builds.

[YOCTO #11874]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/crosssdk.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index ddb98d22bc1..03b0c602c36 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -21,10 +21,10 @@ TARGET_PREFIX = "${SDK_PREFIX}"
 TARGET_CC_ARCH = "${SDK_CC_ARCH}"
 TARGET_LD_ARCH = "${SDK_LD_ARCH}"
 TARGET_AS_ARCH = "${SDK_AS_ARCH}"
-TARGET_CPPFLAGS = "${BUILD_CPPFLAGS}"
-TARGET_CFLAGS = "${BUILD_CFLAGS}"
-TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
-TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
+TARGET_CPPFLAGS = ""
+TARGET_CFLAGS = ""
+TARGET_CXXFLAGS = ""
+TARGET_LDFLAGS = ""
 TARGET_FPU = ""
 
 
-- 
2.17.1


