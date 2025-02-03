Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF18C02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:37:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.93970.1738604224383129769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OzCOD9rS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4363ae65100so55734645e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738604222; x=1739209022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYSuURtrdJ7ToAJ60icmy/iciDkc899hIuplIyFQa/0=;
        b=OzCOD9rSUHh9LkKshdZKUoJY3m3bgLrQKOMpJWgQmvIzVSffrvQfGiczYPsayUzaHQ
         QptTcysVISTvjdQ8W2a/kSMtkywCVFaaE4vjrhZYrNbxXrg7E3V6XrKE3vahPldOWV1Z
         9c71GlH6FCMRwhzbgLSAXWNAWaI5RdP6hriBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604222; x=1739209022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYSuURtrdJ7ToAJ60icmy/iciDkc899hIuplIyFQa/0=;
        b=sNgNLLMQ4sMyYRt2i+7ku42IycQ9RG0R99jwTCEWw/vmLhmXDccQz8Z0874iix0pXT
         aX5Sc2K0Q26n00exu62rtx9rwLicpGK6qACtF0wYln7KjF71WuYAasL0F9lFpv02iR7E
         eb+b4Zx4qQhkklIIv2Dkmsbqi9kBgPL8HGRxuf+RlwROm0MfZdERD8YexeP6h8/cwl2A
         9PpOqyghpp+q3rd8A/zZaOOCG/83AB10KK89GpJE8AL3SYZJjJ1TbDkLdISnDcLZzTJN
         q2IqDTWcb8Xy7VTZF+K/D0B8pAWG+GXv47GuKJGz2NhevwyD8BKL0qRFZYKU9MZK6XE/
         vQnw==
X-Gm-Message-State: AOJu0Yylf4UcAXroz+6IMTXgs684lnP0pJCEmDti7tfU7QmElm/iWLcj
	elFqP4xCIwgfiM13ztwd6ljQ81/lv5HXHihYQNucUaHN/rdRSQiv+GctwewIpGOy/PzfM9uaXKZ
	g
X-Gm-Gg: ASbGnctad6xKv2zfliBNODbThl7ph+cuBRk9M/hv6nINN7wtUQuZQHTa06XraxuRzzO
	oBO8cbTe4VLBFiiluo06aMkPBjg0kp/dj/ntXyLgCKdBzj36w0UXtzvbH2SrODuWrVfaXezAzOo
	cGUZnB3ufzuhECltsvc5dYkNfhm4Yj+04WZLADwgkGC9GWL8+qFwnnAOgYLkOWgVEI6V3UCxAdN
	wjwwno+gmnHJcuN6TEmk3fjJCrQ2JNT3ufHJ0y11ailM9ynRT3Tcfe3Q8SbPIrl25RfEWvJLUn2
	PrHZjSKeu81Iz4nYk90qU8C2Rrk+WfSZ1Tl3PE00T6ve
X-Google-Smtp-Source: AGHT+IHR3e9eGlb9K3HSEM5XFlPy/wHJt7yXtfnPtg1AI5V/7RB7w9bvogQzTOlQXjShJ9n+r9m81A==
X-Received: by 2002:a05:600c:1f0d:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-438dc4213f0mr200999955e9.27.1738604222379;
        Mon, 03 Feb 2025 09:37:02 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244f403sm161056515e9.25.2025.02.03.09.37.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:37:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3-rdflib: upgrade 7.1.1 -> 7.1.3
Date: Mon,  3 Feb 2025 17:36:56 +0000
Message-ID: <20250203173656.3412275-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
References: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210724

License-Update: copyright years updated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-rdflib_7.1.1.bb => python3-rdflib_7.1.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.1.1.bb => python3-rdflib_7.1.3.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb b/meta/recipes-devtools/python/python3-rdflib_7.1.3.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.1.3.bb
index da4b777ff54..50be6695a13 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.1.3.bb
@@ -2,9 +2,9 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 HOMEPAGE = "https://github.com/RDFLib/rdflib"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e1efde25e459057a815649b18cbefa5e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c"
 
-SRC_URI[sha256sum] = "164de86bd3564558802ca983d84f6616a4a1a420c7a17a8152f5016076b2913e"
+SRC_URI[sha256sum] = "f3dcb4c106a8cd9e060d92f43d593d09ebc3d07adc244f4c7315856a12e383ee"
 
 inherit pypi python_poetry_core
 

