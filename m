Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id F21CA7F45C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:47 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id q10so2319125pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AvEF5wq6Jhvl9r41JhLtgdokWcWRo0dfnujkQwAKRw0=;
	b=Giw+XGlKriUni6qqpthQ7qs8TjNFBKEjIzZ4+Z94GakEJL9bw0ShTAl9h87C0Jw37Y
	iw8o3MnHA6WV89pL4mGuoLnnEd/yAtGdED0xO+vwMbg9yuXpyfN8p0rqpTl8E/6CIUp9
	4xNhI7/+UhL93RYJs+BWATLQfuLQlA/NSkh2byofxA7qiZeAuPhIzRiKO3+tPm+eWwx2
	lGC/z6PZ9oD/Vy8BdG8037xiDFcnCdDLsUZHyLM3RzLk+J0gX8lXnxdrw2fr4vJFHx3Y
	9Weru51ZlpAF9jAhv5I3Zf2UGujGgejHeRQ6xORVddB5b4LeJsUGcOyoj/6wxPcyMmov
	TH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AvEF5wq6Jhvl9r41JhLtgdokWcWRo0dfnujkQwAKRw0=;
	b=WjhTPIKCwgVbPkbJYQwu66dycZ6P3ALAaCnBP7e3XRk6OIuS0TgSeKd980+RkUTFpn
	ydM0q/F2/9jcj7AobbIcEMqkdb5/sS8hs4Top4XjD2rciWvye0XwQfFOpH5192PtAiTL
	ixegEJrRa/spATQ0LSDZBznaBeHDZ+uSxcYCAxUlhvn8baYbcdXGr0yd4AWr9Xvrb71C
	vqhMpf/LNn2h12X4Rdd3o9ZH32s2E20FClHx8sZx5sRwJyl4TWlmKr/EObs6Ia2I3xcV
	SEW8IeAWHdiCPREUEOh99/ohOCrp2DwaleRMDBZJRbwo7qbH8M6qOcOhnM4gUfZN8ipd
	uYlw==
X-Gm-Message-State: APjAAAU9nLs0YNEJ7/G47bdRbJ8F50mgUnq+X/RoB3Wi3AIcqMsbx3wW
	QDlNUADjtXltNv0hxCHY8NQTSFTo
X-Google-Smtp-Source: APXvYqyCkqldHK3ZP8CXzj7nDc4rOxscV3tFc7CXiqUdmc093sAUzyXtwJ/BS94+T8DwJvEjPog9UA==
X-Received: by 2002:a17:90a:380a:: with SMTP id
	w10mr8472033pjb.138.1567348608950; 
	Sun, 01 Sep 2019 07:36:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:03 -0700
Message-Id: <e09f916e2b5ff8c7cef7cfd13b43a7f9d2463346.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 25/43] boost: Fix build and enable context and coroutines on aarch64
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:48 -0000

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


