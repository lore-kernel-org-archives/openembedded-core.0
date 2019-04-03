Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id BCDA07D3CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id k11so22432015wro.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hzk/tjZzMRWxORB0IPs3e8O4nBV0dNJE4eN2RNOKBCI=;
	b=KYHXTnpSStRLHEdAJbcxcEVGpVIv4kikOEzpJ70tVQ6ErNz8h09hVsYldSv6QhGmi/
	EqqRZan5EUtX7qhIIlpLyzdd+NRKBWJ4ClKkpEKYFl6SCeP8MMQjMPYyxOYc0NJtGNpt
	DJhMaMAwoYM6YNrKYoVJSWAbHZfCYc7dH9bSHApkZEN9nzFcPbv7mI6e7YPZsY5Kmjdg
	XhZa0WtxiEh4Ecg7rLvf9HNV3QuRYCkCRkiH6hoOaL7CwSUysMkDOw1jHJs2xufx2l8k
	8VOLuXyetuJs2EeloUSuieSzECv4F9cK3PIFZycSJ+KMFIJfh7LNEyKSgC6E+sALfwK9
	tcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hzk/tjZzMRWxORB0IPs3e8O4nBV0dNJE4eN2RNOKBCI=;
	b=nZTW1fNJyGabgTLLz2UPAJ03Pa67TlmGIlGx0rQLOp6jTI+Fwsb0QqkqGiIgjCeFJm
	c2Dh+ialBUBlKt8JhZGO8dpLsvqh8elPJ4TIJSk9ExfwS5+wcH/8x70hiou75kQI8iyp
	RdISaxdqFXPkoBzdYMl+5+AHlu1qzxMkxwWmvnQq6zLe7pcFKmiPJq5qLvyno62vauIf
	xHmAiCkNGKhKaytc9oSAwVjG5+TG9bCmN83yiLYGRPI4ErarfxjbjjH6ZQlewDn/4uiR
	cRkqJJ4ltq0JJtDvKQTwee0dQp3yvBYuWEeEoC62E4dSlnaGuMxRbpakpCDAov768XOq
	NnUQ==
X-Gm-Message-State: APjAAAVVrpFdMp9nvebY4yfb69NavIeYfk4ru5d3QP9Ni02MI/b30tpu
	4rrLmQdWwIdWfqyHUoZ+GfMzpSpy6xs=
X-Google-Smtp-Source: APXvYqzYE2gwzU+mf9725gta/k25PCfzZmytJv4T0qpJs31hXbQx/csTm0c3Y6tsTFpiWjnfsFgQhA==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr496902wru.130.1554311064292;
	Wed, 03 Apr 2019 10:04:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o17sm17362170wrw.73.2019.04.03.10.04.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:11 +0100
Message-Id: <20190403170412.23568-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190403170412.23568-1-ross.burton@intel.com>
References: <20190403170412.23568-1-ross.burton@intel.com>
Subject: [PATCH 8/9] xmlto: clean up RDEPENDS
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:24 -0000

Because of differences in how RDEPENDS works for native/target, add libxml2 and
libxslt to RDEPENDS (so that native dependencies work), but also add
libxml2-utils (for xmllint) and libxslt-bin (for xsltproc) to target RDEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 06dc002083d..b17c11f5464 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -12,16 +12,16 @@ SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
 SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
 
 inherit autotools
-RDEPENDS_class-native = "libxslt-native"
 
-# xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
 RDEPENDS_${PN} = "docbook-xml-dtd4 \
                   docbook-xsl-stylesheets \
                   util-linux \
                   libxml2 \
+                  libxslt \
                   bash \
 "
 RDEPENDS_${PN}_append_class-target = " \
+                  libxml2-utils \
                   libxslt-bin \
                   coreutils \
 "
-- 
2.11.0


