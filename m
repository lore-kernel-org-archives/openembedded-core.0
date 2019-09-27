Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 48BB47F352
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 13:54:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p7so6728123wmp.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 06:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A/6fbIqC6KDG3nIMH4hG1eGs/xoz3hHc4Va+1UIvCjw=;
	b=c3WRIQjKELtqwsxZ09xjivCAt5IO/3vJ4F9tbdsdVT8FxqpcBTTlJjryosrNlyN7aV
	vtKEEMmCZRhAcVKdfU479kF0PGem2S0/PxE70Gy8nm3TacsZ5MrC3vmx6p0BfSoB5OFs
	ht+byybYDk7Vn4PI2oLP5u843Ym+py8uUPewah7pjISuE8u7rc8ChhQmUlBQK3Dl9lZY
	VkWjuHaHnkLj4wu9jph88E0mfB/hjrwFyWGNIKh4Xc7iYPO7iCF458YmG5rq41uhNa6t
	GLabtoFDNXerYW3XOGiSIjvpNxO7x8M3F294diDC5G7s+LRsuUQ8fIHgDqn/7BM3v4/4
	lwgw==
X-Gm-Message-State: APjAAAUfk7dLYz0y54zOTPxGzJciqgk3OEeXwSb7qsoEVIT3wdQWIQQo
	XyJEw2qo7yKO1RvtP7wR3Lrl7DTL
X-Google-Smtp-Source: APXvYqzS6Q8UUYkTpTD2tbbQlgeFwyXsnrZEIrtl5tqDvVcYAGHyuarvBe8gkgKANA8J4xoKyEr41g==
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr6739521wmh.134.1569592487627; 
	Fri, 27 Sep 2019 06:54:47 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q19sm5051223wra.89.2019.09.27.06.54.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 06:54:46 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 14:54:43 +0100
Message-Id: <20190927135443.15407-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190927135443.15407-1-git@andred.net>
References: <20190927135443.15407-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2] ruby: fix non-IPv6 support
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
X-List-Received-Date: Fri, 27 Sep 2019 13:54:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

When IPv6 support is disabled, this recipe mis-configures
ruby so that it end up non-working:
--enable-wide-getaddrinfo instructs ruby to re-implement
the standard getaddinfo(), but IPv6 support is still
automatically detected via ext/socket/extconf.rb
independently of that flag.

To re-implement getaddrinfo(), ruby uses the obsolete
getipnodebyaddr() and getipnodebyname() functions - i.e.
according to the man-page, glibc provided those only in
glibc 2.1.91-95; and of course compilation fails. [1]

Switch to ruby's standard --enable-ipv6= configure
options to make the build work without warnings, and
ruby work at runtime as well.

[1] Compilation and linking actually succeed, albeit with
a warning regarding implicit declaration / unresolved
symbols. The error is only obvious at runtime due to the
unresolved symbols...

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-devtools/ruby/ruby_2.5.5.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
index fdd3852a78..49bc368889 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
@@ -9,17 +9,12 @@ SRC_URI += " \
 SRC_URI[md5sum] = "7e156fb526b8f4bb1b30a3dd8a7ce400"
 SRC_URI[sha256sum] = "28a945fdf340e6ba04fc890b98648342e3cccfd6d223a48f3810572f11b2514c"
 
-# it's unknown to configure script, but then passed to extconf.rb
-# maybe it's not really needed as we're hardcoding the result with
-# 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
-UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
 PACKAGECONFIG[gmp] = "--with-gmp=yes, --with-gmp=no, gmp"
-PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6=yes, --enable-ipv6=no,"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-- 
2.23.0.rc1


