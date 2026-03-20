Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585E01093176
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2633.1773966517320123835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oQqEVP+U;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so777625e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966515; x=1774571315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vE6UzhuFaqo0M9AHbypRvBWP6GNRmPkD+nUMNnzcWhE=;
        b=oQqEVP+Ut9rbMO973OLiuJdbIUFrSe8G5rfRA4gM9ycY0Tgc7ZnUSq6TQ+yB+jkMMs
         vmXEfOcLxGlll3gBeluwK94J9Zy2tn/ti+li/f/b/nPlGMeuIDVs5oAdV62cpoiCugPF
         c6oufb/qL+clmLc54RffGdVBANzarXrehBBLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966515; x=1774571315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vE6UzhuFaqo0M9AHbypRvBWP6GNRmPkD+nUMNnzcWhE=;
        b=DvKMhjhK9QUPGe4djw+XA8iYLyJy/tOEg4729ugb7TMSUMAgjLiiHECC1rSCukPWYv
         So864nEfp7122l2BNLO4SYupGE8jFneTzSvC/C+YTKUwag2d4xoDHrseiU8ONhIB4Ojj
         tytn5v7Eeuyn0uuJ27y68jIemcataMZTJ4rQj3HigmtHRF5LcKCmQa93quEHqWebb4eU
         AARfeRKQcYIhFx9JAya/DYdWokAP6BGConHEXaBehxxOKi1isjj1Xam3RAbvqgMnz+un
         Pd/dM1TuiS1FH8RvSxb4P59T3fDuCaI3frZJi8VZWHfxTGnLsAxkQmSaIMIu26p5PC6A
         IciA==
X-Gm-Message-State: AOJu0YzAxMYumJ6Dl79zIe/zKHoGqC43+MEXObB8RAlCU3cSnTbkWa+t
	HOtWw34nIeOO8OuK6a9UNy0rMbT33EGq34YVYXanGA8T2MCTlNYAFLNIi7HXsZffACFhY82aY1F
	a00yW
X-Gm-Gg: ATEYQzxoRzBiKX4Eg0pIrrLJPuXrrPD1+TFLFJzJzKB8QenhnL1Gud0JJ6aB/KL6udJ
	7wIrxdb1cdiZskWNQ4StUhYKXsGH7H3wAr9dXcxLyGSJc2UOYkUKLfdtmJ09/syYIgYBFIpkBD9
	oh/FyRixHS0LkVbSX+eaVxuJMC1mJFwwSiFvgguowoLG5LnXg4r+6wg4OpbR/xEXh3FpPetvT/k
	RZvVbDRcEbY+wsewp3G2x+Y9+uwVOZlL+dX2GQZLpHXssDX7D5fK/u2SijxgOZ/7a0IxLpuwS1L
	0VV8c3IJfHT0EMduBGvcV3WIqNM6yikPHRWkftsXTXgPEo4RGvjjYzhlxnzXbFFmD2VdHEWYhrI
	VagzCBvBuF7Dmg2a1O40R0Dbf7PmXWoYhG2G+eTLkzzeBgKmJroLrxR4qgglqSQ9wTwuB0sLgar
	KYowS4Zj1Iu0rp5AA6u3gaBm6D7itboc9oZN26EaTqUyFMkz/6XPyXfv1oyuonzlaecL+cJEmfG
	7guZ2Q0dTvLJH+71x+k7lsn59Q=
X-Received: by 2002:a05:600c:3b07:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-486febbc445mr14598025e9.7.1773966515389;
        Thu, 19 Mar 2026 17:28:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/15] python3-pip: drop unused Windows distlib launcher templates
Date: Fri, 20 Mar 2026 01:28:22 +0100
Message-ID: <a6eecf76e21469a96979cf426f54de08d39118dc.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233576

From: Krupal Ka Patel <krkapate@cisco.com>

pip vendors distlib which ships Windows launcher template binaries
(*.exe) under pip/_vendor/distlib. These files are only used on
Windows systems but are installed and packaged for target, native,
and nativesdk builds.

Remove the distlib *.exe templates when not building for a mingw
(mingw32/mingw64) host to avoid shipping unused Windows binaries and
reduce package noise.

Signed-off-by: Krupal Ka Patel <krkapate@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90d208fbb06b6e6b5aaddb0048fd6e2e1d46c8bd)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pip_24.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index 12a5e1cc3cf..cf123a5d230 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -41,6 +41,15 @@ do_install:append() {
     rm -f ${D}/${bindir}/pip
 }
 
+do_install:append(){
+	# pip vendors distlib which ships Windows launcher templates (*.exe).
+	# Keep them only when building for a Windows (mingw) host.
+	case "${HOST_OS}" in
+		mingw32|mingw64) ;;
+		*) rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/pip/_vendor/distlib/*.exe ;;
+	esac
+}
+
 RDEPENDS:${PN} = "\
   python3-compile \
   python3-io \

