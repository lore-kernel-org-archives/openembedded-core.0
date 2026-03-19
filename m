Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483221090254
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:13 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14710.1773936307104339816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=IjGwn0MU;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=bZ6TJjX1;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 77FEA14000CF;
	Thu, 19 Mar 2026 12:05:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 19 Mar 2026 12:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773936306;
	 x=1774022706; bh=CBqAMhqEgWUx1URSCNrTh1IBWzXHe0JEIQ8g/WsQemI=; b=
	IjGwn0MUZYk35qGrqQcr4DfK50wbH0LupXIncT7u1aLpR0KDEFrfxHviQGHnTAuq
	C8FO6KD4b9CK5dQr6EBFs0tu5MC5diLcWorpBthErBdMCQQG7o8TwSJ1SkezLZ9D
	YYXrHrF741jSgtyCEHogx2koSQB9Rg8Cu3Pm+DK6Ts3+drIcspkAOFMlRRxoyZ/f
	Mbb0PuO8ofg7fGt6l2jD13RtuCoQ/PfPo6e/IQL60RkNo3r2/mGWBzT6HVPEFM+M
	uU+SV89iMuGh2UZKRxumhvdQ6cG28z8Q5K0iIyVDJSy8xSrz0TgyVuLmu3vEkwap
	dnNlwmGh7CHOux+LnBOg4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773936306; x=
	1774022706; bh=CBqAMhqEgWUx1URSCNrTh1IBWzXHe0JEIQ8g/WsQemI=; b=b
	Z6TJjX162FCn/t1PQX3C6W7A5BV8BVow90Ud6ofudmL+ExIAtstCI//wipQ7oBiG
	1lSrMWwPzUDG8CNWosT61u7T0x2jJwxwrTla9w2EORGzfpS+IQovoowZM1qX3SPW
	wJGPkM/m6kNcsrnqP+Vws3Vq/diqGwAobrk/vVkZAR72f1nexVCpw3t0dFGjg8D6
	zsZ5ErzXL3P7NKaJGGKd2dKr+j62qSgDS5MSc+mcibaJg5jnTezs7V+KWdx8JiEs
	2wqFu0yBlWhANXNsCUcMjs+ne8PtrYBJ7p47/DnWnQiPmb3iUxBTs/hnVIgw+pIx
	peDEsdR30vlQ6khM2h14w==
X-ME-Sender: <xms:sh68aT6BHraOp2hzIkbWlW8Yza5jvk3vKI8GXjJsuxTIjXlS-0dlhA>
    <xme:sh68ae5a1rRsG7n2wKEhPjm5r7cWF1GZWjT6w13xQfMhp0OOyNlTB6xtAto55_3yX
    nAfst54iDOcFfAvknJh-gXonsEjqJjWSkyRFVYgBrTzQLns6P_N0ozx>
X-ME-Received: <xmr:sh68aYGBpwB7RZIK3ph7Gk8ux_P9t86IraeBkjvD5d_ZmGnuRqOrUT8zRqjsSISYek1HJm1LOaml-cbJ_BMYbQh4F1we1ks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnhepteekjefguedvueeihfeiveejfeekhfdthe
    eghfeugefhgefhuefgjeevgeetgedunecuffhomhgrihhnpeduvddrsggsnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrh
    hkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmh
    gsvgguuggvugdrohhrghdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:sh68afRSci6kOg0BUgsJY2hNRUgr8ylPHsKaZjGNjX7vKDnJBg5FWA>
    <xmx:sh68aZsH63f3-uTSIo7xa9r9Mx6uzEO6DbHU6JdqKutwVDnNao9Cfw>
    <xmx:sh68aWxqY0LSs65WcsGWNchIUdaklyR2BhL8rWRcAgF9yCbLVwQKrA>
    <xmx:sh68ab4KFjW6wndrqeVy8b0L6FkEB4f_G5ToL2mRh2IYp0m55fjZJQ>
    <xmx:sh68aWc5nEOFAHSZjQALFn5ZuYzkSSHMnHzuwbf6jW_J2TMDHqCUbiY6>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:05:05 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 19 Mar 2026 16:04:45 +0000
Subject: [PATCH v2 7/8] gnutls: Use arch independent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fix-checklayer-2-v2-7-38ffe8df4c28@pbarker.dev>
References: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
In-Reply-To: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=QxngJBc5/b5LbEuRAiqckpABB5RCtqNbFq/kn1hL83E=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVv5rPv0cpO38ucv5SvPXLtg267KN4IvF/oftWM6K
 Ha+Nzr8SEcpC4MYF4OsmCLL5p6v95/2OvJmhNxSgJnDygQyhIGLUwAmkryd4X/IzsrYVVMWToyP
 EknONjobvt9tRcx+493nDtuvKHbg0OBn+B9a9b/xV8KCb0bpfFF5W6fM3peqF7OQiyN9S8D3xBX
 7LZkA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233541

The value of STAGING_LIBDIR depends on baselib, which may be "lib" or
"lib64" depending on the target architecture. To avoid making
PACKAGECONFIG unnecessarily arch-dependent, we can use STAGING_DIR_HOST
as the search prefix for libseccomp & libdl instead.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-support/gnutls/gnutls_3.8.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index c601d34069e4..92156c277c94 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -34,12 +34,12 @@ PACKAGECONFIG ??= "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES', 'seccom
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-PACKAGECONFIG[seccomp] = "--with-libseccomp-prefix=${STAGING_EXECPREFIXDIR},ac_cv_libseccomp=no,libseccomp"
+PACKAGECONFIG[seccomp] = "--with-libseccomp-prefix=${STAGING_DIR_HOST},ac_cv_libseccomp=no,libseccomp"
 PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--without-included-libtasn1,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
-PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR}"
+PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_DIR_HOST}"
 PACKAGECONFIG[dane] = "--enable-libdane,--disable-libdane,unbound"
 # Certificate compression
 PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"

-- 
2.43.0


