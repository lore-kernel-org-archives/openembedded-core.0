Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3377A10775EA
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:15:07 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19684.1773854097295702607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=LFHa3O+f;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=LIUtTjRI;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 879E014001BD;
	Wed, 18 Mar 2026 13:14:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 13:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854096;
	 x=1773940496; bh=CBqAMhqEgWUx1URSCNrTh1IBWzXHe0JEIQ8g/WsQemI=; b=
	LFHa3O+fvJZcB/2HbbXZfKfACSC6JmubHbHzbJXcxk70w/cmbuPZPhAjOsnDh6p7
	268WLge2dU3NlOBkfBDzF68eEngkkP9PlrZb1+bLNZZYjW94/BszPLKRRVR710Q0
	RVcOE9DsXO4n1cUcIsN1T7Yhw3tGVAGufkXkiFtuUjFa2bnjYQcTJ7l4xQ99FYB+
	XRIQCRVmOOVTpsIHQ4cJ2HR2Of/gTfA+phSgnhVG6AO8kSWLtFh9oBDt3ZSsCKb2
	l/KCoLEeKI9Wvm7ayaoVfYrPRH3MHv8dG2J+6PgkNJ6OgcIGK07xbPcmWeDbClr6
	ECuIyRWZRrFbagN8xPeqZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854096; x=
	1773940496; bh=CBqAMhqEgWUx1URSCNrTh1IBWzXHe0JEIQ8g/WsQemI=; b=L
	IUtTjRI3Gys5C2GAkubyrBGvUT+mRoGXOvpdi+FThsNGPy3B8caLTJtG9yTO0ipT
	voZ/cIoS/B1mPjahcg4DnMRpnW+aeMiu7VKAkfXFDKo9IlpNBFrBDNhgIbl6rVUn
	ptIvY4YIwGDV+RJJZyaphTnTvM+f4YC+JU21ZbXg93l1/B6jQIh8M7VWahK695Zs
	JV1WYrS5KD+ZPa08UWDnAifwZ5TZasoG2maGHWV3hvo5ictfRFUxYf8o0jIc1wEn
	XcUjoOERNMONxIRskoTQwOkl9xL+CglxsCCFKbcZ8lnNsw1W/McuosQVhFX2lA6Z
	75caY9BpPZnLAlycCrLBg==
X-ME-Sender: <xms:kN26aW7HGaFwQ8o7mD4bMUZHkxVRQ8tUqYmiFkPHxNyT4klnkRrVhA>
    <xme:kN26aV5dItdD8vyfaMblsA3qrUfgHc99D0olHeCx204QJSKcdZ27zO5UXCrDuNs3m
    B3UWevIhBuJCj3Z3TJouxDA4m1saiw0yQXzH_1y2XZqs2ZAmMUSVwb9>
X-ME-Received: <xmr:kN26aTErdURyJNQf8hjRkviZpqfr8ieUnWsJk8mNccIJH77u0jEyfFYYYRJmf9MS31Dvek_RP1Z_-N156-Eco63_sw5101A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnhepteekjefguedvueeihfeiveejfeekhfdthe
    eghfeugefhgefhuefgjeevgeetgedunecuffhomhgrihhnpeduvddrsggsnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrh
    hkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmh
    gsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:kN26aeSyt-HawYWN6L4rejP-fSV714L8_WRKLPxqgGRMpwKR7SQrlg>
    <xmx:kN26acuA5rGmmlAItlTWSchLFwSsBdC3Mq1ke5af-4UfYTVPyLoLUg>
    <xmx:kN26adwjlzkkE_6Oqbvjoi3v_sCqoiKxjuJXjkxK7OJD_8P7p0RLsA>
    <xmx:kN26aW6f9gEjXiUzmvrdyPRvPauWh5dNpQoeC7A4X4phoZkgbRn2jA>
    <xmx:kN26aZcKPDLD0tihkxS7Vkbe9f-ATsvLsPsvceoGoLdr066kyNbzilgb>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:55 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:50 +0000
Subject: [PATCH 07/12] gnutls: Use arch independent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-7-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=QxngJBc5/b5LbEuRAiqckpABB5RCtqNbFq/kn1hL83E=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuutv5rWByQPEps9IPXkosDVNWe+QdvHlv9YI3aucX3
 opmvxXN01HKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJaKkw/I9e/p/ztSJb7sFv
 1vf+9rjb/Z318E/Dz3fb4t0MTLLaCucwMkxPaTPbsUB3W67/YhVfLebDPp/XZLpkHdzNHPp448c
 FL9gA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233424

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


