Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DF8C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14935.1785846227241798970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WnoK1OM8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso6479585e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846225; x=1786451025; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovyFoAMUpHqaH1I7F5Ai40vpKgPTzr61D+kKBK89zFk=;
        b=WnoK1OM8ynOz7CVLQhBJVjYoiHcQq+mQJv/JsprGD5Dx5dNfmNCvIRv3Zbj3SeOkhm
         kwXeMjeA77pPDdT3Wgoftw+k0h1L3y7tYy6MWsB4sFaBi8hmVO6AFOQzMtldW4o7kzNm
         +EWx1hSQT5yho7P+9FB8B/8NubCvcKzQGWlZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846225; x=1786451025;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovyFoAMUpHqaH1I7F5Ai40vpKgPTzr61D+kKBK89zFk=;
        b=rZsD71LvRxkRaADmcql2iWhhUhjw2s61y+Zk31wV5p931ogmNIMAaNISt+Jl7kMx2u
         TAFcs7yXsgI0/MqdxEngOZbSJOsdwzkB6tMTQ7o0Nyb9envKxVE1CwX94nC82gSby9TC
         JkU65d7nn8FJMlFJFpJBbf+6V81zGOwkaD/pgYPGDRrI0KW2FYeMoKhvxOeggjTqKHJz
         4oTjeSsOrlCUN8GYP70v3lowMWbBvaszYEAVQtTjgxarTvM1ktecfd5z8vtgm6cz09bb
         9opvRpqdqVU3yMvRpx9dQl4/JviHSaSPrgYFOKzkI6VuXzyz0YfGiNWpdv/LzpKDsq/y
         cJ+g==
X-Gm-Message-State: AOJu0YzTIpJffnQDdCw0hBLXbR50OieaTdIyNyPUn3tzhAagcxEAq+vo
	9b6scDRAn3rxMBD/jmjl+yMb6n7nTeP7b3pUWilznZZ2lOAmP9X0ncHTRF3R152qzdlz9t/ASIz
	JS/2UUNc=
X-Gm-Gg: AR+sD12Tagph2eq80fbvd71qVmwEX2x+TG4VM8r4r02BS8/1FFpUyKYkJWESI56JKop
	mLadQp6vVs3PO1PgSHuRDv/ZVSQZQ+x7UTqNOO4jXsDaRrp054But6qLnFa9sb2N0EB07ECCJwm
	Fg/MI9RaZwa2bjJUEKke/ZaM834mcynzO6qjqyFpChhi8vDjhFhYCSI1C80JvtH8uY2Gjm5T+HJ
	SxnN/x2o54xilRSplqQ17GEf9UzBFd+6UPL2Uk2m6yZsYpplaW+5i4ptROIyK36mGBuxJxLRdgd
	dcOCSgo4z6bzlTkWJX9Xlgn2xqkQ+zLvM8cBOPzLbIXINk4DHE55wWwt8oKSluAQ4pRXIyzjjkX
	mA5Xb0hpzyNd2q8GJgG+ACrwbHuQvb/sLnt5idVP2/pRsrJCXWqXSShvp/iK7lLiEdwjsHvdU5V
	qRNLIg1l5BwMe60N8Mkt4eqGofQEZcUNzMVlIYEAv5ajOzoJyGbiyRcHWZJ9JZYmzF8eqylj3Dk
	3GvhAn8I84yokxuPA==
X-Received: by 2002:a7b:ce08:0:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49949f89850mr70897645e9.0.1785846225477;
        Tue, 04 Aug 2026 05:23:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] libadwaita: upgrade 1.9.2 -> 1.9.3
Date: Tue,  4 Aug 2026 13:23:33 +0100
Message-ID: <20260804122335.3094065-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242745

=============
Version 1.9.3
=============

- AdwAboutDialog
  - Fix a bug with deselecting text in the legal section
- AdwSidebar
  - Fix item suffixes ending up after the arrow in page mode
- AdwTabOverview
  - Make sure we don't round corners in adaptive preview
- AdwWindow/AdwApplicationWindow
  - Fix false minimum size warnings in adaptive preview
- Translation updates
  - Norwegian Bokmål

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libadwaita/{libadwaita_1.9.2.bb => libadwaita_1.9.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.9.2.bb => libadwaita_1.9.3.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb
index 9a40c2e4153..47521474020 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.9.2.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.9.3.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "6920f813a76c4856591ca56ee842e94efbbe736e8ca2f445c9e9fc3b4e7076f0"
+SRC_URI[archive.sha256sum] = "fc59b37028fe0126308e7b805d2f6e4e80227080a1797715e5e6286b8111e723"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"

