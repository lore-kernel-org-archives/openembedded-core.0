Return-Path: <jpuhlman@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7F761996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:53:37 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t24so2237942pgj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W4gP93NYWHQHvqo1eFWonsh9RL2xgMDa1r4bDmN71cU=;
	b=LnwFZjxw4asYWXES5KzF1FzecvBa4ylMPJzmye1jp/izr6Z4iHsNs8kBpBxmfGp3bJ
	hZcfHQ4A0uiZby4LlZBISLnsc1bXZIRMFxHn54Rd9GPESgBWGADzIK3THT5jB2ozKOBE
	6oz+C3na0Htj3sS8FKivkX71FRgPjBRHW5oF2QZxe9u69+lkVBzopFGXvmkg7/XTZY/Z
	GPhrPyzQ0elgXyGtOzlEzQxK99pJ5QGKuK0jk8iS0hVVKGbv5ebKYzCLAbM+Lj9UQVCe
	FrZbzubnnWRHyiOyrkIt1htlUBjG1A5pWMivwIWYI6HtLWkheI8wIJLgfbFgyMLjUzw9
	0xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=W4gP93NYWHQHvqo1eFWonsh9RL2xgMDa1r4bDmN71cU=;
	b=Vs6/gio523b4u4v2a2KLF2c9UNgB3b72dAItDmZVPOn0tF8dThyk/4wVGT2uE5t64n
	EYPn3cKGf60JMF0Z/c/mmfjoLfCJhCUmE9np9TGjYvstBBb5ONJRuuk6YzwxsdEVdy1n
	gD7wuqUrl9/YQU1XLJXRBfgkvGSZM7Ty0clZ93oC37sUOMvS8xKzx1GpWIeibbPrWUek
	dRIuxD/dWmjYXb9Nmdo3IWMgE4o1c5v+gxE5APnXBvapCX6+Db6KgbqBWBSLxo+cDpc9
	HaY4s4hAuyEuKJwlnc0grDjdxEVbqi02tKD0qEuDP/zz7QTjouF4HdlYMwk43ue70O/D
	2cMw==
X-Gm-Message-State: APjAAAX8RS2nCFXoGEREj3/BE57NsYgtKcSM3Pvi58XvFGUBTRgvN80p
	IRcw4lDM38JpdsLab+btBV/Asq8M
X-Google-Smtp-Source: APXvYqwt1jL1R9Pqu99eibgL/g4zgyKzRh8v2PIbQ7NvPbUEEr1Yg536u6WZFKTXuXbIhuF2ezseZw==
X-Received: by 2002:a62:f210:: with SMTP id m16mr6540531pfh.66.1582930418285; 
	Fri, 28 Feb 2020 14:53:38 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	144sm12922917pfc.45.2020.02.28.14.53.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 14:53:37 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id CBF592A053D; Fri, 28 Feb 2020 14:53:36 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 14:53:33 -0800
Message-Id: <20200228225335.28139-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] apr: add mulitlib scripts apr-1-config, apr_rules.mk
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
X-List-Received-Date: Fri, 28 Feb 2020 22:53:37 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

apr_rules.mk encodes build options in to file
35c35
< CC=x86_64-montavista-linux-gcc  -m64 -march=nehalem -mtune=generic -mfpmath=sse -msse4.2 --sysroot=

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/apr/apr_1.7.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index eca9cdea48..8a9b780593 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
 SRC_URI[sha256sum] = "e2e148f0b2e99b8e5c6caa09f6d4fb4dd3e83f744aa72a952f94f5a14436f7ea"
 
-inherit autotools-brokensep lib_package binconfig multilib_header ptest
+inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
@@ -51,6 +51,9 @@ do_configure_prepend() {
 	./buildconf 2
 }
 
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/apr-1-config \
+                    ${PN}-dev:${datadir}/build-1/apr_rules.mk"
+
 FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
 RDEPENDS_${PN}-dev += "bash"
 
-- 
2.20.1


