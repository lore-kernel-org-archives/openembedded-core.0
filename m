Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34E7E7F27B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 09:55:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i1so14692865wro.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 02:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yP8GDi6egWau18HpsqrbJD8BX17kc4wNXXrs/P+Yk3o=;
	b=VnPJBqdMv2O3yude/R2GfTJpw1td5lSr1FV0QMfznccKwTdYlsrQG/w0oLxB9SuJDA
	KYawKHcakFcXVGjfqfntwz+yN/yaB8fKQKGAyLObvtB8d+Jr6MPtHEjLsinq7IC5EHJz
	RxqTZZVfob4SCD4d5t9FU5NcfNK3RoZ8KUMrtHoGpnXyLd3usM6T9iAtxYdeQGgnj0I0
	aEdHBUVraIVKH4EthATuzL9I93Fq6v3SC5Zv+1ziNZmpKZH4ThpEy0kfmqJAJAKN7pKx
	dtrY7U32K7VdQ0cn3cuJ9GSlifYw2U5l8TBBBLvK3B6oTG2JPQiO73RjTjhpnZkfEtlB
	cR0g==
X-Gm-Message-State: APjAAAUciLa0Po/3stBxtpi+nfX2mVgHOLLFzgzZW4bUTZ8IfvnofX9/
	u5kpHqDBt5aT0fcolfLZcUTI46RF
X-Google-Smtp-Source: APXvYqw91/ADJDOyZQiyoFFUtkUJyw1gbwVKVKxAoH9iFjonlpfxhVGSFZUuR4qIhwa6uUB5HHNKPw==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr4794299wrv.315.1569923702740; 
	Tue, 01 Oct 2019 02:55:02 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g185sm3070875wme.10.2019.10.01.02.55.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 02:55:02 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 10:54:51 +0100
Message-Id: <20191001095452.37335-4-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191001095452.37335-1-git@andred.net>
References: <20191001095452.37335-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 3/4] ruby: fix non-IPv6 support
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
X-List-Received-Date: Tue, 01 Oct 2019 09:55:02 -0000
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
v3:
* rebased

v2:
* switch to --enable-ipv6/--disable-ipv6 instead of
  --enable-ipv6=yes/no, as the latter is not actually
  recognised
---
 meta/recipes-devtools/ruby/ruby_2.5.5.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
index 341329a6a1..223b0371eb 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
@@ -8,17 +8,12 @@ SRC_URI += " \
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
+PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-- 
2.23.0.rc1


