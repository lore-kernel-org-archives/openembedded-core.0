Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E18C79FA2
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2597.1788641130604695354
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mj/u1gpe;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4858be8b509so856357f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641129; x=1789245929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GzSu0jJ5tpDrT7/M/mmNM1x/Pl6+dpq00Efm5Zzz2GA=;
        b=mj/u1gpeVpJ4Bc4iOwjVAVomGEf/73hK7TrTqweW3EYYoSBx03S4cuMuiP9GRzEoW1
         npvIFhXW7u3WyGm1zG3OmdY83GZd56fGRsCkevl4yFIoJCW15/a/ha1wFNn89fJNPbrQ
         yPVe8Ae40xqrlA4fObKezJbZ9Qmlf9Ve/eZTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641129; x=1789245929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GzSu0jJ5tpDrT7/M/mmNM1x/Pl6+dpq00Efm5Zzz2GA=;
        b=Bq9Bki62Zt/6/lbHQjEhtKZeh6wzV39naSacyDhhLexY4OK17DxxgAD/PlaZgNZC1E
         dMpwKzldTQ8XlyZtOM/ovnTyV4w11UHqQrda2WC61C9O1dwU4L8EZ2/zCskhXqYjrieU
         lw97Fg3CGUA81O11UYYGi8ROc084cQ5KVGpeaXJHqHFfCKNL2guVi4Gb/UM5VX/e2qpk
         ZsFHd5WEGmF6vXyQOBT7ltbklsxxK088+FzKnNNEbk6lM4IMLLZ622X9DjzHjJ36MhZZ
         A/bmFcHGSCGUuET7uCp4mNn8GIrlSxM2M0P/2PWrvXnBeaW8QmKN3toXzq8/KwyfLBLO
         0QuQ==
X-Gm-Message-State: AFuF++nO47ol6fMXD8vdJmQleV47CI/9d49eeaX+L7WPHvslkwOQNeKj
	dXImg8VQaJSAJLu+RLHLVOrIzTqgskT3iOrRA0n1TwOP6rj5086kGIVsqTiTyUjNm61OODluH+i
	VxdT2mEo=
X-Gm-Gg: AYBFou1pOmm5pj3HXorpZ1fG6TWYOvyJCVjVPq8MwFe+xdO2qfb7xd4goox0FDcjiWD
	BVcmASSUKUUdZQkwa6dLKOqCPrSz/tKzxGze2f1C/nbjgYZOOcrDC+6FQOWz73xupEFX/DOvhIq
	mqfuTjKvO6ZHaHpEenHl9+G40GDXHw0Uh+E4WIkAxyuM1UE0sBqTi3R3Pbj4yW8jja9Tb5vhoMU
	QlcAnOv5Kh3eKtfWVmG8rd1VleBPpnYTgiJc5cYrW4FmY4cFs1EGBbqcyp5EQa1eqOnGLBdFOOn
	IxzLj9io2vKKSnrL4KTzf8reQzgnOjVWPibzY8sRWutlrftWl/ILBABy3G/lL8tKBpMYaxFNvJ+
	XKTd++XRVo6MmcR2gnq/AXj6ZJZcd0lh/kWBJmNHbMBC7Du4wdVli/cWZ/i6ItkHReHI4RnmXCq
	UvGsTIFGZ0N/0IxOAihROy2m/DXfoNQJ2lFeiFlARz3oc3ub2bPuWejZuX2EFRfvaWkBs4DfSlG
	tENFEUf/9Y97dRg+bZDOwu2zu8+gqDvXXXDU/tF3uBi64j/1VHG2pF4gdd6W7FgjA==
X-Received: by 2002:a05:6000:98a:b0:484:3311:af37 with SMTP id ffacd0b85a97d-48587298f26mr17138004f8f.26.1788641128767;
        Sat, 05 Sep 2026 13:45:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/40] python3-click: upgrade 8.3.1 -> 8.3.3
Date: Sat,  5 Sep 2026 22:44:33 +0200
Message-ID: <1ec888a66235821af9cc0b087953af7d58bdc78f.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245184

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upgrade Click to 8.3.3, the first upstream release
containing the fix for CVE-2026-7246. The fix avoids
constructing an editor shell command and passes the editor
and filename as separate argv elements.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 002ede0d89b43cfbe15651ea6c3d504626be24df)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: Changelog: https://click.palletsprojects.com/en/stable/changes/#version-8-3-3 ]
---
 .../python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.3.1.bb
rename to meta/recipes-devtools/python/python3-click_8.3.3.bb
index 49204e96e1f..9e80f8aff0f 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
+SRC_URI[sha256sum] = "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
 
 inherit pypi python_flit_core ptest-python-pytest
 

