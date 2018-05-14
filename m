Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 703F275561
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 12:02:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a8-v6so12983524wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wT/JxYobXuZjX0SW5jUFGnvVwYUohyHoPluUWU3Lh54=;
	b=FsGEBKIujRgeh6akGK4ya0kbon0rk1uAsriqbShSMYgEJSfOG8ufZsghibZ9K9YaEs
	cbdea4kOggoLqqW8PtMsZ1KfjmV40htazZMsmOdhwDSfoqh3FSZi7TmL4kBfNc0iTAX9
	y0sTB7cBuXLio7qRa5nr7jZPxp/U3G5iXz3YDXesCJeAYJgu6zCqQm6/tSSG5yQNNn3T
	t8wHYnkSteBjU0LomNuT/iAon8h6oMr4j7Sv6XYi49ewVxgsJk41cT57aUqutK+/fTaB
	/AlUiB8IFcoeunLNXui5Rzx+tNX2aMGGCRHmYT5PO4aP3DMSgoTVREucQ0osm1KoWcOi
	Hkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wT/JxYobXuZjX0SW5jUFGnvVwYUohyHoPluUWU3Lh54=;
	b=BlODlNAqHQc6mS1BvXtG0mBDJ2nsm3jJNkO7r7u5Vvu3QIPFqW9FaCYuJVI+a1aU9r
	OQPn++rakOW6m/ApDf1MW3KTiNzC0zEGum0oTh4VWhf5ViYuqQx0QrVGkmH1lQhJX3Ub
	k1qXC8W8w1xxLuf7pzhrNVlLEBdPZ4SXN6wRpxVOYYBFle1PbaPLWpejlcHrIOXSeiPH
	Wfm/r7+wII8q3PjRDzpoqT7+2zQEIC+juRitdF72u4RRcyL6sDPgURHDmQUBc+gY6fN0
	q/kRKh/sSJq+ZCAfbWkRcnf5BqT8gpOsYNYMmeir1+XhSJWoIt+0o7dJ/fmHePo/v0PJ
	LS7w==
X-Gm-Message-State: ALKqPwc/DhKbtIj95xG+lZS3FuKgLcvcZ4seLBdnVNNRPrHRQzz7EnVp
	Kxx5sIonbuaYjQGeOmF5GNXnZbqO
X-Google-Smtp-Source: AB8JxZpU5IhhNB09YFVDAZFup5O8zLGK6vvf0D07DIt2bdYM8vP2aldvUE/1ZxlUKpUGgdyiM1bhUA==
X-Received: by 2002:a1c:6741:: with SMTP id b62-v6mr4959408wmc.0.1526299334201;
	Mon, 14 May 2018 05:02:14 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d8-v6sm12416384wrb.52.2018.05.14.05.02.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 May 2018 05:02:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 13:02:11 +0100
Message-Id: <20180514120211.8169-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] security_flags: disable static PIE in glibc
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
X-List-Received-Date: Mon, 14 May 2018 12:02:14 -0000

Static PIE doesn't work entirely right in GCC 7, for example ldconfig on ARM
with the flags enabled will something segfault during initialisation.

To mitigate this until we have GCC 8 integrated, don't enable static PIE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e6eb8114a24..6245e89ada4 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -6,7 +6,7 @@
 # in the DISTRO="poky-lsb" configuration.
 
 GCCPIE ?= "--enable-default-pie"
-GLIBCPIE ?= "--enable-static-pie"
+# If static PIE is known to work well, GLIBCPIE="--enable-static-pie" can be set
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
-- 
2.11.0


