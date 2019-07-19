Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 04F3F7F1E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 22:58:44 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f17so30319229wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 15:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Oi0S9DLOk6TKmyJOGP48sBm8RYd9Q06YVNbh8eSsuYk=;
	b=Kah0RbiYbZ+zgU25v4FG6FJqUANSK2XBXIyTiqOlW0aez9tcMd0uK5JfztpXdMzHeg
	0WFOqTscmNGdRcLmu5Z4cARhsfLTtY30bwkRWlTjjHB7bmJT91tiLpVwbVC5oZPOwoDg
	4MnfrUcNjyf7W0wgRfT+yRnx3nrDTS8LPlEaMmDPudSQsJicAUA/kjEMr5OaQxsuw9Yf
	cABX0aCHEdiB6IS8l5WhmTS5dtHexo7b1tuYIDR2m3eG3eJw3F45HM7104KdoPkF61LX
	RmUm55YeZY0IAbzL5PGIYklwGcwv6e4dcFE4BLnMlegx1AXreZjKQMGwr6UsQyqyMRV2
	mGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Oi0S9DLOk6TKmyJOGP48sBm8RYd9Q06YVNbh8eSsuYk=;
	b=MxrTuwQsW/sfbRP3pYXE6tUf7pXCi8F9avDmdw0k7EBq2dKTwr3KjP7T6Tkm9HwoSC
	JCZq3FWkH5buRvGbQW25q4vrd54cxLZp0PGFTX8BSBBxTzizirQfJDjqDY225qyTwQx4
	vLzmZZTvAZy92GtjJTt+kTiY5pSCEm7pUWQ2yilwjG/eC6mTR8gHG2Tx+VzVs2MrRjFp
	ZXmdX8PjE+QIz2k5WelgN+B6YuPjxZLfva/xBUB3/isSXEnGSRyMRivHMCn99wgTZf20
	dtDkIXwZjKOlj7Wg+U3n2ExZKvDSR1yoMUCaCA+NWiS/kLHBYWY/Nlnphyb1ACyUr0No
	nk+Q==
X-Gm-Message-State: APjAAAWb56EST/1DMiOVj/YMmYY89WyvheZIwW5xcc6ZgXUAmM+RudWl
	pqlE6YSyrI5GR0z/yig1gTaAmIq04Gg=
X-Google-Smtp-Source: APXvYqwZrUht4S7tOoPl7eZTueEHDwLfjqeXwa5M5/j35OVzPLcMGNge6gMbyOuWQOSN3U+5MiS0Hw==
X-Received: by 2002:a7b:c383:: with SMTP id s3mr44187749wmj.44.1563577125511; 
	Fri, 19 Jul 2019 15:58:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d16sm24912535wrv.55.2019.07.19.15.58.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 15:58:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 23:58:41 +0100
Message-Id: <20190719225841.18977-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] meson.bbclass: export STRIP=${BUILD_STRIP}
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
X-List-Received-Date: Fri, 19 Jul 2019 22:58:45 -0000
Content-Transfer-Encoding: 8bit

In Meson the environment variables are always the native tools, so export
STRIP=${BUILD_STRIP} along with CC et al to silence this Meson warning:

WARNING: Env var STRIP seems to point to the cross compiler.
This is probably wrong, it should always point to the native compiler.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 893853142c7..7267e58b101 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -130,6 +130,7 @@ override_native_tools() {
     export CXX="${BUILD_CXX}"
     export LD="${BUILD_LD}"
     export AR="${BUILD_AR}"
+    export STRIP="${BUILD_STRIP}"
     # These contain *target* flags but will be used as *native* flags.  The
     # correct native flags will be passed via -Dc_args and so on, unset them so
     # they don't interfere with tools invoked by Meson (such as g-ir-scanner)
-- 
2.20.1


