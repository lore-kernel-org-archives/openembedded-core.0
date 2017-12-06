Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 48CD27873C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 09:52:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a90so2051697pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=qCW10vTc4NQtA0tBe2FfVMvxi+ilOwixIxFCITpNfoc=;
	b=X0yZS0S0BUVDnn3xZa4b3Rc6cB3j71pl3K9vRHhuV6HMbJCG15bLDvVAJ9dt9ryZS4
	IC6GKFqh8T9xJ5g0alXGKGqYCVsIfo4Gy6wYy8UrrgG/14qDyIl/u9EUGi+Sb3bWfw5c
	qSOCygZwHO4Wm0SsQan5RAefvBuLNKyEIKhVmngC2KxvQ+cCUCON6uUHa179H2fhHsSK
	l8+e7lUJHtjv+lNL9dDC8K2l5ski62G2JnCqTcFlZMCTsb22YfSgEsJVoiwNeom8l3mT
	MlGExkIQGSR1SQ2EdUf585NaVeRhrGiyIPGJ1d26hXIBGqBmlYvQwVHBfkB2T+VeIgVr
	Q05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=qCW10vTc4NQtA0tBe2FfVMvxi+ilOwixIxFCITpNfoc=;
	b=EOQvnFww4tzAS4uxfLgsQKk9MqFxTY6JRLfgk9+P0IZQQquknV55nEYSh/bmu+P0FC
	ywTNHyRVidz34rJqkak6H321qL9DyE0GxthutIBOQYKoMIFvcoe1WORK889xWG5QfxE8
	BQhbL8NSlCjJLM06cyYlqE0mrvPvoD8jSOh1jo2rdKOrpX7Fh+vlrt+Kf2fjpX1pmO/r
	aJYltAuWmQ6SsUB0OTGa+jZyTgmq1ViZh6G+WHi9/bJdP9pscWEhGbmVbio7bWqag0sa
	oC0d8XKiJadrVkxYvvxi7mvefoyIgfJrIaB18J0Ebo3RUN9AuRU1/fJ8JEtc9UHfryxn
	kUCw==
X-Gm-Message-State: AJaThX7qNjzQuLRT7hK5B0RHEdJeXb8SobIoMPgsjw5AOZA/kKXCGnzJ
	H8OgiTOBnV9HSlf5hxLaZxhoV93fg0Q=
X-Google-Smtp-Source: AGs4zMbtGf8hf2L1s0OYUD0ix4wL6hAaHPi8a7S5QhUJs0cXE1P5J5w8Y7MiXN1JCEapsz6vu59vcg==
X-Received: by 10.99.112.1 with SMTP id l1mr19792643pgc.186.1512553922139;
	Wed, 06 Dec 2017 01:52:02 -0800 (PST)
Received: from [127.0.1.1] ([58.165.131.151]) by smtp.gmail.com with ESMTPSA id
	67sm3475866pfz.171.2017.12.06.01.52.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 01:52:01 -0800 (PST)
Date: Wed, 06 Dec 2017 19:51:57 +1000
Message-Id: <20171206095157.24011-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC PATCH] autoconf: Override config.guess/.sub in source tree
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
X-List-Received-Date: Wed, 06 Dec 2017 09:52:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

autoconf has not been released in a number of years. However many
changes have been made to the gnu-config config.guess/.sub since 2.69,
including new architectures, OS variants, etc. In order to enable these
targets without creating patches for the source itself populate the
gnu-config files from the sysroot as is done with autotools recipes.
Whilst it is not possible for the autoconf recipe to bootstrap its
configure task (using the autotools_do_configure), the files can be
manually copied into the target location.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index ea62df8fb6..df81bc6107 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -41,6 +41,10 @@ PERL_class-nativesdk = "/usr/bin/env perl"
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
 
 do_configure() {
+	# manually install a newer config.guess/.sub
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/build-aux
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/build-aux
+
 	oe_runconf
 }
 
-- 
2.15.0



