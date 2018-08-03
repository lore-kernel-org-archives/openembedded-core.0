Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 896B478DFF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 15:54:23 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i26-v6so3440585pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Gmxza9ERPg34olz8YRnntMt8+iyQnUBC+BIBHA/jf6k=;
	b=tIryKY9z/cwXAOe0VT//jKl/X7cg/m26zPsFFFRgomR1hjsrrrpIOmbh62L8kLbL25
	OWqg+OwfHmJsPqr5iGKc4rCLcAzIdkZa55JWWra0jYEz1ItN4jA5hAvls+tqekMqeKDa
	2BpcTEFloqtDX5Fezb9us7jir7JcGzIFnXYty57m3qsgYfCRen4K+p/kCBhHEFGzOUJs
	pIKCq05d2VWgbwxlAMVaT3KJM7iNZ7MYqXSja+uTS/vm60fBc+61mRqcoPKnaht2W87A
	AFDx0Re9GBJRGu+dqowJYoWPuviMg+gGZ49MnyAZ+149cAJyiCIPtKqTMudYwD8VbpNP
	EaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gmxza9ERPg34olz8YRnntMt8+iyQnUBC+BIBHA/jf6k=;
	b=VGv+aqTw1VdkiOJKV6zAMBWEDiOiGEECpGoqtkVEhrTHrzAbV0MSxsbRHgvr0jK6qY
	/ClVzjyQzOCiSvTllgeL5n/sf+bLocVKwIRN4/2wQ4K3+GCb2tQrao6rr5UHqOwDaIVY
	0qOQO2JXHOdqvMe83cG0epuydQWvIufK60nVwL+9klKay/7qP0BmBPiv/TCKfl6hlC0i
	pofgznMrOZX9l+kUsEyQpv1lyk1Z+KK+12M5QVkVCGs7Y5RPuYfysswmPo34IjRmFOgf
	npgtXwy+T8WFPfO8qu9KnNMYVLPicMB8u/6Q1e/ingPD1LUe0OeTHQ3bal6Ay9213SUU
	S+QQ==
X-Gm-Message-State: AOUpUlHiJT42ElHfvaQ96osxgiLJ7JGaG0MHevWYrgjWTQsrEbYdgEhW
	oMgnHisrtXhLTCJUHBeaXcw7d7uT
X-Google-Smtp-Source: AAOMgpe5V3dtdmQuyh1ru9IVfujl8TgfIw+ovXnKotk6m7bBKHw/dU+ThUtJgZj50QkzOCwWhYmycA==
X-Received: by 2002:a63:c80e:: with SMTP id
	z14-v6mr4289550pgg.77.1533311664115; 
	Fri, 03 Aug 2018 08:54:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	s14-v6sm13173064pfj.105.2018.08.03.08.54.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Aug 2018 08:54:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2018 08:54:15 -0700
Message-Id: <20180803155415.30086-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] Revert "gnutls: rationalise libunistring arguments"
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
X-List-Received-Date: Fri, 03 Aug 2018 15:54:23 -0000

This causes regression on build machines where libunistring is installed
on host. It is also because gnuts is using non standard AC macro called
AC_LIB_HAVE_LINKFLAGS to detect this library and it confusing cross builds.

This reverts commit 60fef4940de7f0440f1216eb2ea0ea683b3e8fdd.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Describe the rationale to revert it

 meta/recipes-support/gnutls/gnutls.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 876a3847b0..04c0fd2af8 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -39,6 +39,7 @@ EXTRA_OECONF = " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
+    --without-libunistring-prefix \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.18.0


