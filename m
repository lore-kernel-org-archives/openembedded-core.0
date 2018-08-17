Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id CE2D878E6A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:43:49 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id w14-v6so3134896plp.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+midwnWfF/FV365id/V9kFaYD4MHDrZ9/e5wuVsNf7g=;
	b=Xz/QjXa1Iavp6JQ4Sg43BCHDZRx90xrMYW4w/YYB/jByHXSYWv4BR1sR2JqQGuwocd
	8rWYjeyinUBB7CfvpnoNSkkQ9gipR7wJuahHdnGeiM3bXg6T2kST25pvo6qAoWnWvbPP
	IcxVwUGX7cnD+ONBLfK0XnwNrIAkE3sD5tuK2ncQW9qrEymhpAupN8adP4wn65AVldje
	nXyVIqp/SMTLT3FThrFLwp66xuCm1J2qGuqVQdinY35IciRx9pnxXZGPRbueyXAM8f50
	DsDnyh+3ns3wzAbhKKfQNADeD+GrGEzJdxmNMb+etyqApolMK/XpOpdgblrTW82Vjhsf
	d6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+midwnWfF/FV365id/V9kFaYD4MHDrZ9/e5wuVsNf7g=;
	b=Pd43iy1bl11tIZBVQraT53Bdpn0OtJPneJqj41GxdeEyhKfMQA7b0KYgYZoD1u9TaL
	zk4NUciwpcYkY1GcWQ95HLnzTQr3z+QFARXMtlAdnJ8osP27rQ2owWaYScDn59caLrfm
	mQfgSwpoXeWPvszy01owImNA78tx/BczcQm1+o4afrSz7ynbhLK+2lK9zMhne9CHjmP9
	pF/5A85xHcXrhRed7m9HzmpOVm89eMuJYEeMXAAaYD/6uTrWsDR26/xz2DZf6VbDqnyf
	aBOGgzBjN3cAF6PTFQ6Ii2CR42i5R3RRyMgtWpDLXIHW40wJC4MgT9DE9uD8OEaS7Yeq
	g3/A==
X-Gm-Message-State: AOUpUlHkylkk6FlePyHuDjVC+ZsKMDuA5W8aPVt/D20tzpyKOzxmgZ+8
	FDGiXL7t08EEfv48KNO4orODJoTW
X-Google-Smtp-Source: AA+uWPx8PDMJGFXFtuo3Rx9JsLjhUrj0rVySudwD02VlhuusQLX6iid+8cTe/thFiWsP0NlN/vbDxA==
X-Received: by 2002:a17:902:7106:: with SMTP id
	a6-v6mr32476983pll.28.1534481031042; 
	Thu, 16 Aug 2018 21:43:51 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm1157526pfk.157.2018.08.16.21.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 21:43:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 21:43:35 -0700
Message-Id: <1534481017-17310-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
References: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/7] openssl: move the libdir openssl.cnf symlink into the openssl package
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
X-List-Received-Date: Fri, 17 Aug 2018 04:43:50 -0000

The openssl 1.0 recipe puts the libdir symlink to /etc/ssl/openssl.cnf
in the base openssl package (along with the libdir symlinks to
/etc/ssl/certs and /etc/ssl/private). Keep the openssl 1.1 recipe
aligned with that approach until there's a clear reason to do
something else. For more background, see comments in the following
thread:

  http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135176.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0i.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index d9c19eb..73e8ffa 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -153,7 +153,7 @@ PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
 
 FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl${SOLIBS}"
-FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf ${libdir}/ssl-1.1/openssl.cnf"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
-- 
1.9.1


