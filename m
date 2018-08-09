Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 44CE478E6A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 12:16:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c14-v6so6155625wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 05:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c+7OCArL5Fh+bM3VQC7ToFHoV6OwqtFfu6QYZyOr19g=;
	b=XqaKtKcvMSnceB3z8JQuuuJMcK0HqLLAHEMwfdjfP4FydVb0sW2sT3CJjKAp/EBCFd
	5pTzotg5dVYcg0sO+tcW7N1hGM5HO4Qkgd25YpCDwE+EMMgROZ7nUh2BGff+5e1aXeiC
	eP9NvNz2bsvuNUhIvjLbV6gvK3RFlLsn5no0h6uUXbWovGyZ0nOa37rhblWQ+4XAgBpG
	AZ8I7gf/6Tr52FvG4tSxwIGMUytTnPKERH74t7gmlWM95UdlNm0TKgkqjTOcDvOs3Z4t
	QyEmBjl0kBFba4N1eogdUs43/BfOeQFveFMwyUPfltL+31mTSjLel15ckfFKdMwkQCTf
	FDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c+7OCArL5Fh+bM3VQC7ToFHoV6OwqtFfu6QYZyOr19g=;
	b=NuydWMgG0x39IwiSlq3FvAKNKW1ddOv/ZTwl/81x1KDbHfo7URI+FGRCdzl4CNeQP6
	iDy6PH0UXzKEAQqIddOnSlYqkA2twLP7j72OtttaWgxwGN+CwjqjfTiJZq35OLSuE04c
	8DuKoQlPMDPNb5+Rdi/G+Mg7W4JVQcmFwxApTfooyykfCoGEjgT/3nr3bDqbAOm9uQXD
	K/4Y+/b491tMgJJobCCNl11lYYmeQ4H4cppo/97D1aiTiUCubsl6EHUqxpoupefR8kqd
	v5JFAyrqoMx7vMyxaCTyHlauxE5zZCX7mrVIIo6krygYb4XBc0rWeV68EH713zaCp0eY
	D+xA==
X-Gm-Message-State: AOUpUlEkwzmv/pWNPXNm1xkZsC6I1bgsnmuuc94nuZM/n5KHuXVTH/vN
	mYYCRuQZeLR1vwX8xV9w5jcdhA3o
X-Google-Smtp-Source: AA+uWPxFep2cFy2NR0bgxxqirjXzXY7OWxJD6BEZz5d0m3uf8oUhzC5qgAJ6sy84934T7qgKs6F1gg==
X-Received: by 2002:a1c:3663:: with SMTP id
	d96-v6mr1536551wma.92.1533817018977; 
	Thu, 09 Aug 2018 05:16:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b10-v6sm5047948wrr.88.2018.08.09.05.16.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 05:16:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 12:16:59 +0000
Message-Id: <20180809121659.7372-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] dropbear.inc: add dependency on virtual/crypt to fix build with glibc-2.28
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
X-List-Received-Date: Thu, 09 Aug 2018 12:16:58 -0000

configure tests crypt() existence with:

dnl We test for crypt() specially. On Linux (and others?) it resides in libcrypt
dnl but we don't want link all binaries to -lcrypt, just dropbear server.
dnl OS X doesn't need -lcrypt
AC_CHECK_FUNC(crypt, found_crypt_func=here)
AC_CHECK_LIB(crypt, crypt,
        [
        CRYPTLIB="-lcrypt"
        found_crypt_func=here
        ])
AC_SUBST(CRYPTLIB)
if test "t$found_crypt_func" = there; then
AC_DEFINE(HAVE_CRYPT, 1, [crypt() function])
fi

but that silently fails with glibc-2.28 and a bit later do_compile fails with;
http://errors.yoctoproject.org/Errors/Details/185895/

../dropbear-2018.76/sysoptions.h:237:3: error: #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
  #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
   ^~~~~

Add dependency on virtual/crypt so that do_configure detects it correctly.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 2e2fbc15af..b634e0e53e 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a5ec40cafba26fc4396d0b550f824e01"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib virtual/crypt"
 RPROVIDES_${PN} = "ssh sshd"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-- 
2.17.1


