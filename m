Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3769A7F344
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 14:10:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n14so2890067wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 07:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PRaUKmM8gB+nS6sdfUkWsaQMdZ6TzY1lVBY6fqBb8cQ=;
	b=aDjAlMkMxi3gWL416ZstADBj2lTOyn99k6OGtG8SVcTtIaqSLcaC69LjX+HGv3B0oh
	TD2KAfxcF3JCjx56Td6lFqOfslINOV80WQiR5NT6MSF+UcpPgyRDPQdbUgY2cYTEIzME
	gua73dg9V7EM0xXKxKZUFe/nNfK1xsDIjl+RvXa8titrCOGMr47OKTY7j8jOawoawOs/
	XfrrJE5JyByW4Dab6r7/aFJcNO2LNwT47I/6siSW7lIs6V6gfEar6c3yLFr2xvlSlb2Z
	F7EUxzQFBSmTSTEctyijSfqsdQVKH0M64Xb2lyNIIknw6M6DxTsnm6i9osH0+pIXuK7A
	m2dg==
X-Gm-Message-State: APjAAAV3cihNQuCEOYjUntp7WmtZ9t1KVVx/7K9VnfhCvf7qtFTlZPH0
	o846hCk72Xy+CrgRYwQzFFCSgOZx
X-Google-Smtp-Source: APXvYqwDY4KJXd7VTljNW7fFtL1QM/N4Kt0+dcJW2fmNuMm/Wf4QjkFfxtICPeqj6dnkcmEuapNe4g==
X-Received: by 2002:a5d:5052:: with SMTP id h18mr3015637wrt.397.1569593407715; 
	Fri, 27 Sep 2019 07:10:07 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z142sm17596532wmc.24.2019.09.27.07.10.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 07:10:06 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 15:10:06 +0100
Message-Id: <20190927141006.31440-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190927135443.15407-2-git@andred.net>
References: <20190927135443.15407-2-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] ruby: fix non-IPv6 support
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
X-List-Received-Date: Fri, 27 Sep 2019 14:10:07 -0000
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
v2:
* switch to --enable-ipv6/--disable-ipv6 instead of
  --enable-ipv6=yes/no, as the latter is not actually
  recognised
---
 meta/recipes-devtools/ruby/ruby_2.5.5.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
index fdd3852a78..feb654cb6a 100644
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
+PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-- 
2.23.0.rc1


