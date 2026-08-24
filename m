Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A6BC61CE3
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:55 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16156.1787576447049323935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QQqY7fzr;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f6609c657so1431075f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576445; x=1788181245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HCfIWH4nLGBbcmgxc9e6wvnxK+RFxYqslpSY+De/l+I=;
        b=QQqY7fzrwkk9EmMdTOJb9eDyqFVlzBXfHUIiihLlRJ66eL6E0IYv//n5oyhtBhQKSd
         RkQMvx4quI+J0Amtt1rXf0Gt7TW+xnfNc7dtlKnAzTvxvZeQGTxXbGLXfTyv4nwMVpzX
         oHRKOxIRFW1Eip1z8YhDq5cJuDvynBzzf3aMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576445; x=1788181245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HCfIWH4nLGBbcmgxc9e6wvnxK+RFxYqslpSY+De/l+I=;
        b=phCbreGNIpueOehot5rvZU9eRUVKkE2s4GlBukhT0V0z9AH5ibsDc3cn95i5PSkF9G
         7FQUXgiN2/xYp2GIN/TMIJSDduqV2qBH7lBHDT9Ij87Ew5xi/I1Zm4pUHe1+cXpQ8bWp
         28hZxaoNKB6x7a7MxMS+JojU6l+ceLVPJbyy5aZ7XxodMTZSwiYW6aMiJPOVpOnrWuxU
         UrL3zCaTi/UQP/zHZxcwz/cR5OAsgBeIKDiegJt+Anz77YzpmaA95y59MivPJeup2l92
         X51/o312kYwZTJRNOfvGq4j+2S3wDAqGPEDUVrd4FZdn7BUj0m5b3fcpdfwZ5OLW212k
         lJ8A==
X-Gm-Message-State: AFuF++nm47NHFLS8O3iYr28V9+/V8f40RK7uo1Y/SBM8Emv8lr7FHWYm
	ydqCbbvUtlrkhyvYL7PWX56ZD6TOq3ns8ubWXFpBN6JU13oDsvsSfOUuZIcUCTeIc4vjeahK3y1
	gIFW/TaM=
X-Gm-Gg: AR+sD11RRjnSSjLUnTL6dC1BUEX3edTl7qiy96JODvMCaFlXbmpyY+Gajn9rMVuNVVS
	Aku+Nu+DHKd3dd/CtSul9mJqa1e7iuApkuMoWLXv6vRYNjzOLa+qOK4Rw/ZIlrC91gTks75vFLZ
	C2pPIIQGdF24OsAZrTMNesXCXbI/xNdp28f8DlS6YYWYcH6KPrm7yQ8mrbNta2Xzz6mua5QtHyy
	Hon5zI0qGhoGO3DZswXoJU9NUOD4QNdLliEordkzEzrg+26cWNmXLt0t98cn0tMsKcNDD2XNuUM
	DvB5a91iOxbDSo8mgE3gBFE0O63sOwT9cV9voyfQpILxLWRAs0vQB2C7UIhm5LXl1Zhroffr0Tf
	dmKIufm0mUYo1pzezIcGNG0HUxsCrRTvjeSnaZjKuIzvsrSMB0K3YWgfAEg9hqsMATG7kmqryDl
	KwLbY07gTjbPH7izXTzrE7n8Mn6E0WpGoYUzj0QYyDwgDSb48zqyyKuA3vUtV+OGYLDqjiR+EfI
	1960HdXp7sh9bewRAC4DaLubm4x86zLrHvdiBUBnxd3KKNwsu83h5rsVG1FoRiZcKDZXP4=
X-Received: by 2002:a05:600c:1384:b0:499:afe2:e4d0 with SMTP id 5b1f17b1804b1-499b83395d7mr279560305e9.8.1787576445014;
        Mon, 24 Aug 2026 06:00:45 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/19] nghttp2: set status for CVE-2026-58055
Date: Mon, 24 Aug 2026 14:59:50 +0200
Message-ID: <3124fe207e927b7bf40bef1d723a77a707935b80.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244103

From: Deepak Rathore <deeratho@cisco.com>

CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1
Upgrade requests with a Content-Length header and body.

The default recipe does not build nghttpx. Add a conditional
CVE_STATUS entry so the CVE remains unpatched if app support is
enabled, while default builds are marked not-applicable-config.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-58055

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-support/nghttp2/nghttp2_1.68.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
index 71d5eef8d6b..29a7d26819c 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
@@ -17,4 +17,6 @@ PACKAGECONFIG[manpages] = "-DENABLE_DOC=ON,-DENABLE_DOC=OFF"
 
 EXTRA_OECMAKE = "-DENABLE_LIB_ONLY=ON -DENABLE_PYTHON_BINDINGS=OFF"
 
+CVE_STATUS[CVE-2026-58055] = "${@bb.utils.contains('EXTRA_OECMAKE', '-DENABLE_LIB_ONLY=ON', 'not-applicable-config: nghttpx proxy is not built in the default nghttp2 configuration', 'unpatched', d)}"
+
 BBCLASSEXTEND = "native nativesdk"

