Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507D5C61DDC
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2992.1787945909579901223
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XjxX4gez;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so10536795e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945908; x=1788550708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rjq9ra/tL8fSIg8zS3DjxMEnB173V1/0UmbfmYXXHN8=;
        b=XjxX4gezAGwfGsQIN2zNLyx82ecBy8gffAk4TF9Ew7FKWnf33WkU/aiIGbnA9TG77Q
         zS2xnnFJeV76d9wBo9Q5rbMQdIkNTg9E5dpN9h/WcG81A5VqS8b3mcy8dfQS/XjfzYdD
         O2ajPQj8hhWiB94lzWzfX2LK3mgfovBIlKMes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945908; x=1788550708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rjq9ra/tL8fSIg8zS3DjxMEnB173V1/0UmbfmYXXHN8=;
        b=B1d5VzOinz23X42x+ZqaJycBT4cxLizoxqEodwLdOLkFKaO7C0e8oiFmVzQdGNHGtZ
         RFwZzfZ86qHQAsBFdGPZUpMcAo1litxKM7op/J0kXZPYo/482+g/1dGJgSyv/kZC0dtn
         18vhfmCyBvi/3gMFjH6U9/EdenQ/SMqKcYX6pZs/PybLAlUhq6MGQK6kg9/mlsDnGGH2
         BCN1NgJ5ICxEUvOl76/ZR7DFbgvykvJiHM2UPIMsAMyOgH7rznBr60xalqPg03gTeuji
         HhGKAfvBm4jUUM9AgqFHgQ1tkfkoiVa1d9aKh49y4eml64k7TTd35Bw3AtVgLRJrfZsn
         OUwg==
X-Gm-Message-State: AFuF++lk4KIvNhKsbzmZpHPsZ0WJcRY7CXEk0i4tsxEpdQeKO8DUWIPD
	uZl4gz6U8g8xoQtyWNhx6jcyZYoWHnPZ+ui5gd4reXT1mo9MwOI69nGcGZqRLKMVdUi0Vzp/uzL
	o4QBp0I4=
X-Gm-Gg: AR+sD10kGN5xtSATV7ohOUUdeWW4syfPp2Jv6BbsnEKKMGmD1qhNcLTZ4JaaXHmuYqJ
	B1KykcwZeqQCBrxpsEnpNt6F/gHSVxTQmxeEuF+f3VyRbdnAKIe17NpGOXq7AoavEeZF5Ti2vYk
	+88I4/OSN0H3/Lu+nSTCfFBw5rAN1XM4zjDkLvrAX9wOrxy+098YKT1rctzz7iGEYcRdphf/Xjo
	S1kdnoWnbdRDtCXLNH9XjZdFXZ0k8+arNxv+ga3dGItEFev4tLS9VRuUcYruQ3u5FU0dk/T+9EJ
	fVMZGgCIwPuZ9CEHYOfAKCfFIjTMpVuLdhIL025Wp3/cgVHsAKQyJtCWH5n4Mr0AbjAs+5anmQs
	Ge/aXytuhfbIGgZre7JKRNuifk96c/FW+8Zice5h3iPUx1arZPdbLjU1IHPGVxT2oLctEQgHWli
	ZhCyfkvrObbk4vt/HAbCLhZMSWg1ExCgGlIbVrvFxxx/LLQcVoGAheOp4zynG+x9etx0vkzvz4u
	xgzl8POUFIWwPETemxoz6KGSGbcfhElmRzcVspDHo9MHFRpsNGjgcOCnrRT64oS
X-Received: by 2002:a05:600c:c493:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49b91c20914mr140000615e9.3.1787945907844;
        Fri, 28 Aug 2026 12:38:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 41/56] xwayland: upgrade 24.1.12 -> 24.1.13
Date: Fri, 28 Aug 2026 21:35:51 +0200
Message-ID: <cce895645d642335b8f1ea92532a394c2af101e3.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244602

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: f93929ba6cae77b6e28dce24c63a7501bdbd4cda)

Release:
* https://lists.x.org/archives/xorg-announce/2026-July/003716.html
* https://lists.x.org/archives/xorg-announce/2026-July/003717.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xwayland/{xwayland_24.1.12.bb => xwayland_24.1.13.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.12.bb => xwayland_24.1.13.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
index 52572bfd21c..41bf1687a28 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND &
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21"
+SRC_URI[sha256sum] = "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 

