Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D88C982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 16:26:09 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15221.1789835166495918985
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 09:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iWIPu5Ky;
 spf=pass (domain: konsulko.com, ip: 74.125.227.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1356125a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 09:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789835166; x=1790439966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJEu0O4aaeBToPI0J4sHEuLYgAEDQjcCIhru29xGZ70=;
        b=iWIPu5Kyd3lWGSYN9My8JT0sSKRWUdHSM3T0hTwpmzfSBUkdmzeZf2WbnOet1hqt6T
         Hy7kmQ++E7jMpnrefxmp2j/grmogaV76bRI1yNWFoNEjtAi6u0XEH+AyIgbzXctZkqkh
         KcueKgFVE9aJW3SW76DAfXVY1j0oFBzR16gE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835166; x=1790439966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WJEu0O4aaeBToPI0J4sHEuLYgAEDQjcCIhru29xGZ70=;
        b=FqXSoAwnqnKfuSJjemKVaRZhRhV8LDgCNF4iz3M2KEHC64oR6sOmhp0V95wo9sfZ70
         WJt7CLh3B2cE/0lpitBP4mZ7F8OaaEBWHKQby34Udhb2jQ25IDLGP8RbFKNHBjs8tSDt
         WnPZuzBWJIHK1GQtYZXk+Y22SPRnK/fL+R/gdLE0Glrc4ibhAsVeeIQRCxu40Kp3nWTy
         m0csuVlvcvXhkKvCt5RaASEnFHnIZhx09k9F0DBbBGTisWdUl4zvpnCeBhsh3RSM2NnQ
         sYQY9zXM4RBiHGiW/TJwYtjlFTf1r0V0jKKRO2Zbb/3CfL2Xoncfx1F/HOlm/f4WVVbe
         pLLA==
X-Gm-Message-State: AFuF++kpxYiw1huWWzSeEO84Y0bv3CK2pDxhIZMTVn5LfleXnkzRenyX
	yUhC+R7MJqtVpdj/Dxy4PzhfpbatLX8yOZLf9ICrQw+W+akDcbBq77ct1RxNXXim9n0GAfFqip0
	jz60S
X-Gm-Gg: AYBFou3FacFERn/gkF9mFrJoLzQkuePYBDq8SrY3tH6wbc1bojRhQfWL1BegDGVBSy3
	MAFim4GVEdQr+6Gp7Mr0Is5qgsmkPeejyCtGOAh6hjw4BjctvB06uGD0XidDu17xcKud2s3kJBS
	sicmEi4u4KSznC7ZJb2dxIWgy/ArcH00tUZJxovPosrrrT392Zo92ouYX+lxxdeUCU1lNYy3irC
	bu4mU2eX6CBcvtEg7aPtp4oB1K40xt5Z1li8gTuLoFMfTvnghD33AfMNl9M52YXd5VpWIPnl0y8
	FbQI87JKEgZAqnZsUrMsNdbamNBvjjm9vpsgdCQbvdHvsSU4E1LE9BM8eJeUm6MRFGBCx1HYMl7
	fAHm/WpzzhiAKaL9GE1KoNwX/yzdF9sUc3E6EQYzPYYqmeiXyqR3Tx1tAQYruklQur0YMUwDrPc
	rDB6ZLOsHjHvRu6okaSlbdWDP5VS4YSRXHzE6qMfRDceDbNdzuni6liZ9iELS3WlF7x/0EJtcjn
	OQKY9IrRBl4XTEG
X-Received: by 2002:a17:90b:4c4c:b0:39e:6c68:1555 with SMTP id 98e67ed59e1d1-39e6c6832camr5485388a91.29.1789835165791;
        Sat, 19 Sep 2026 09:26:05 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6254:c727:61b4:dbb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb3284asm5242632a91.14.2026.09.19.09.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:26:05 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/3] at-spi2-core: upgrade 2.60.6 -> 2.62.0.1
Date: Sat, 19 Sep 2026 09:23:26 -0700
Message-ID: <20260919162323.3862788-6-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919162323.3862788-2-tim.orling@konsulko.com>
References: <20260919162323.3862788-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 16:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246240

From: Tim Orling <tim.orling@konsulko.com>

What's new in at-spi2-core 2.62.0:

* atk-bridge: Release disconnected direct connections.

What's new in at-spi2-core 2.61.90:

* libatspi: Fix transfer annotation on atspi_document_get_text_selections
* Add a Ready signal to org.a11y.atspi.Cache.
* Add ATSPI_STATE_DEFAULT as an alias for ATSPI_STATE_IS_DEFAULT, so that
  StateChanged signals for the equivalent atk state are handled.

What's new in at-spi2-core 2.61.1:

* atk-bridge: Attempt to fix a crash in get_registered_event_listeners
* AtspiDevice: Avoid assigning 0 as a grab id
* Remove G_GNUC_CONST from *_get_type_declarations

What's new in at-spi2-core 2.61.0:

* Add atspi_set_g_main_loop_reentrancy. If this is enabled, then
  libatspi will use a GMainLoop when waiting for replies from DBus calls.
  This is off by default but can be enabled in cases where reentrancy is
  needed.
* at-spi-bus-launcher: Rework the way org.a11y.Status.IsEnabled is
  handled. At-spi-bus-launcher now listens for ATs registering events and
  assumes that accessibility is enabled if events are registered, rather
  than relying on the value of a gsettings key.
* meson: Build dbind with -DG_LOG_DOMAIN=atspi.
* libatspi: Disable direct DBus connections if ATSPI_DISABLE_P2P is set.
* Do not call GetItems if ATSPI_NO_CACHE is set.

Upstream release notes:
https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/main/NEWS

For a full comparison of changes, see:
https://github.com/GNOME/at-spi2-core/compare/2.60.6...2.62.0.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

NOTE: this depends on https://lore.kernel.org/openembedded-core/20260917074956.22252-2-jaipaul.cheernam@est.tech/

 .../atk/{at-spi2-core_2.60.6.bb => at-spi2-core_2.62.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.60.6.bb => at-spi2-core_2.62.0.1.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.6.bb b/meta/recipes-support/atk/at-spi2-core_2.62.0.1.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.60.6.bb
rename to meta/recipes-support/atk/at-spi2-core_2.62.0.1.bb
index 5c676d639f..0274c2de75 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.62.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "a89b64a8b217a8042bdf0e35cbfab629ceee35640dba75df578afde9aa789d57"
+SRC_URI[archive.sha256sum] = "fa462f1834bae569c5944c34608872f9447e5a2889ba2aa4d5ff9f2d6ff8a395"
 
 DEPENDS = " \
 	dbus \
-- 
2.47.3


