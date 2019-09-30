Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 53D807F314
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:17 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i30so6694097pgl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AvEF5wq6Jhvl9r41JhLtgdokWcWRo0dfnujkQwAKRw0=;
	b=ZyGBBhBvrKeYDAJ0Q7eqJUcPyuTOCHXd6MMtRSt1oWy7bGDXwaABR5bs5RgHGH3cNp
	3HCUBX3U+mTM9Eh1TcaANpiFAfb5mgUVY+mtxZ3vJrkSl07zN/mZbfx+5kKOkit+lYCc
	IKtPVUVKhWHIIuWzy1ggWaIpldEpBeaiAGGjZJj/tJfqk5Nz86kj7Xg2mAG6+5brHumi
	IDTY2mwZAdwgDXkXV6tcFTg4id4KR7PfKe8cwpNJ5JhJlmDLf9uUBhr/rADgcvACucl+
	tsAQYsLVnInLDEEfLIWF9j4UZ/hSr6gdjlKG0oDh+DxjA73UgnjUGePDnwbVh1nAPbqk
	dz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AvEF5wq6Jhvl9r41JhLtgdokWcWRo0dfnujkQwAKRw0=;
	b=OvH+cpAjyCl5YWr7q4CY9nbdAR0dMmvCnXB+JM/MjD9yIGo0r0tRToHpbIL+Dtf+IH
	c5rAK3Iky8FMV8Sm1AiN8sc6acagsn5eEPmfG3+vB5RIQ+67cvy7WK7r7ojiLE4F7l14
	ofp9B3bDt8nXHne+7oZ0gpgwr06NVioBCUFzWKNT8X1xRjag76Gi4ACQcLkyB849CtlL
	HSl3bVuxuOnmLxZyOalPZJ5IKs8Un2RP+cMPayiWvgW0nw4gmqfS0GQgL8VC3IzGCU40
	2t/DQEoDU5WTUVQBBEKgUDvMfJb9NHnExC/POYK6awxIii6JQspf1LI6QfKq6j9MCz9U
	7ong==
X-Gm-Message-State: APjAAAX5BCUhLO6eKSAOhSUSUVLr6Va8qOmG5jpkprlsqdVib7SK/lQm
	NSEBHJoZ1dY789wlHMA0xyAlwLSByMs=
X-Google-Smtp-Source: APXvYqx1BU5SSBl/YsSVbvk9hyo/sOCHNrtd4YNEI6iSJZ8tmCrWVGrE7OBwsH/YXPe6C4sHq8/G5A==
X-Received: by 2002:a65:6799:: with SMTP id e25mr23254665pgr.271.1569818898046;
	Sun, 29 Sep 2019 21:48:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:19 -0700
Message-Id: <219befc2dad0c6df171f46725c995ce0038fa4f8.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 24/54] boost: Fix build and enable context and coroutines on aarch64
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:17 -0000

From: "Bedel, Alban" <alban.bedel@aerq.com>

Like for ARM bjam need some hints about the ABI to properly build on
aarch64. While at it also enable context and coroutine as these are
supported on aarch64.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 9be3717..c2e2cbb 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -33,6 +33,7 @@ BOOST_LIBS_append_x86 = " context coroutine"
 BOOST_LIBS_append_x86-64 = " context coroutine"
 BOOST_LIBS_append_powerpc = " context coroutine"
 BOOST_LIBS_append_arm = " context coroutine"
+BOOST_LIBS_append_aarch64 = " context coroutine"
 # need consistent settings for native builds (x86 override not applied for native)
 BOOST_LIBS_remove_class-native = " context coroutine"
 # does not compile
@@ -151,6 +152,7 @@ BJAM_OPTS_append_x86-x32 = " abi=x32 address-model=64"
 
 # cross compiling for arm fails to detect abi, so provide some help
 BJAM_OPTS_append_arm = " abi=aapcs architecture=arm"
+BJAM_OPTS_append_aarch64 = " abi=aapcs address-model=64 architecture=arm"
 
 do_configure() {
 	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
-- 
2.7.4


