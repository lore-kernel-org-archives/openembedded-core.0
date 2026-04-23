Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16A1FDEE2F
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 17:13:04 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2816.1776964375198898598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 10:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=aagUDh6A;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ee9ec26edaso342386085a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776964373; x=1777569173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNX4J2py+gatkk1hYRc9eJdSM3+ZshoMBFPwLEUWo9Q=;
        b=aagUDh6AO3u5pDvhN+TNgLy07wWc3zJTDg+QhkM7NNCS1ruTXvUL2O6ZYBgE6aocA3
         mFIYPvDdN3abGUk57t8mt8Dyvlg90sg4JUwSiH3Abcwk+f899MZMrLj7SdV3NMk6OGP+
         v/SFQ++fdY+tlxSIu+R4KBB7GkOTNj1+QuyXIZg4XNVh2eMsa7o0zN9JJpGHteVOWHq1
         7bgp4mAk518lgZMjK/SBSemJrmCerCTjNw0FSh4aKpvWaEZtN76dK/vi63O7h86BQOYM
         9+9/DqzfP3VHIjxVcET3GCPPekqVWQj+NbFO76F6CF2QtPT3fzk6bz/2rFHz6GUUjC+J
         xGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776964373; x=1777569173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNX4J2py+gatkk1hYRc9eJdSM3+ZshoMBFPwLEUWo9Q=;
        b=oZLi/YFLnp6zA4c9QTCEQibXrFcvhFRZmFv9NuSogmhRzf34txe6Di1Sv53VOfrLmr
         umY9i5Ham3jFx/dasEoPzm7WnqByMrxjJqdA+b01OWclA1jrO72zIEkQgeYgVFQ6Uxix
         qXN4FvxtE82fl3QANDQZK0bIkr1HQ2yGAGLFzMnHtYZ9+0pdt5gWOAAx/5qYX7ejomKG
         XgvknW+02ZY5RN5ZPxXVpYhZUgSPrs3+JU1ppmUjy59HbVu/VkmI2rRcBCSBxvJru239
         eAaKGOz+VhWk/4kciP//dnNF2uwbNN419D9akP97wGX0k4CD00Hp2vc77+5GUIbATB5B
         vlhw==
X-Gm-Message-State: AOJu0YzyRjCSNO+3dtPqoNE71sFlIk8amuO5lgMgGq3+OF6wA2zMrySL
	a80GgswvEjY7rc+euC1via0TIkqm7HcfX+euxwsOmZITDnsyGxj+SG18KLppd5y/ALt+ROnUVty
	eY8us
X-Gm-Gg: AeBDietFrkGrRw6U21KaRG9Xcez+7QdnhSjV0ElWIAouH2ohNqKSr5ggxc7S9mmSkFr
	B1imkEVKrN4vbRuNFuF1aX8dfcl+CRXs6qZcqjMq10U+NWkjQ52SvYHmoANZNiR2pCW1kgF9Dki
	n+yKVdIORtELZbNFeHH9a95ZDpG8RRoWLOSjymWF9GH/H1a1u6c+mwBt+1Tk1Apu8T55F1yjmxG
	cnGumN1S18vrI5QU/4vS74YZd/iDKBs4Yz89HHbnI7bXOMth5FsfegDR1tUdFq96EGgegpfsvxY
	0kjmFVGcRrr8/pA9I9v2tmloOWK/li9jD6Iy1eg/qgs5EgwFYY781M5U7xa1a8LCmYAuDn9qwQc
	dHKjYHHCP0h7V3BNNdYrC5PcXVYH+Yd/32seoU0zO5O0lILlLR017Lp+fAFLXJh2o7nZOxBRPdz
	9mwzaNoXr/3hpM7iX9/FHkfvmEDLkLFplkUVYh5Q==
X-Received: by 2002:a05:620a:3727:b0:8e7:756c:f089 with SMTP id af79cd13be357-8e791d8a36emr4105310385a.51.1776964373317;
        Thu, 23 Apr 2026 10:12:53 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d8edb7acsm1757709685a.28.2026.04.23.10.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:12:52 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] maintainers.inc: add self for python3-uv-build
Date: Thu, 23 Apr 2026 13:12:45 -0400
Message-ID: <20260423171246.309711-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423171246.309711-1-tgamblin@baylibre.com>
References: <20260423171246.309711-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 17:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235830

It's listed as unmaintained, so fix that.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9f4ae051da..f98305e930 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -749,7 +749,7 @@ RECIPE_MAINTAINER:pn-python3-typogrify = "Trevor Gamblin <tgamblin@baylibre.com>
 RECIPE_MAINTAINER:pn-python3-unittest-automake-output = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-uritools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-uv-build = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-uv-build = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-vcs-versioning = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.53.0


