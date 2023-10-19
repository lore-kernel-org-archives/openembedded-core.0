Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BD5CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:46:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.26753.1697719560352842474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lrOHEP9A;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507adc3381cso6514668e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 05:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697719558; x=1698324358; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2Au/Iq7EM9NrRhrUkliouZxNGONvjcLPP3yDAL+JM0=;
        b=lrOHEP9AJSiQKXEuQp52ZXWFheUQFRDLZi6jawKVOY4tVX1jshT2uD/LyDWpLeP1cc
         QqKfDgt6JNj8YRUFeDwk1PXPbLjzaVcQj9rZY4vmHbX+xIS1JFoqg2JJxqrbm6kKKxBY
         o/xpvuZMr3cdwW+DmXEw24L+jOtgICw2NoJrz0akbm9SG3zdbNFVN9qG/Uz8X0zFeR8O
         LIBZP5zTOlY1QPtJq2h9WP+d7oieEDoH5CthWUd/QjiGJL2QA9tUaDMZezEg7vz88XZP
         K3w+iL8upr2Q9BrMytVBB0PDc6lBbn+QlM5theZDfj57uV0MSz0sSy4g0DK3Kv8dZGNc
         Pz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719558; x=1698324358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2Au/Iq7EM9NrRhrUkliouZxNGONvjcLPP3yDAL+JM0=;
        b=gxQjpp25DvDBodD41Ajgm3yyaUqbFixf7dH9MKNQtLmAjfXyxhtoVD1qBzfK/zhbOH
         w3RhjYMGe8Ev0kxpCyveao5QwdgmI7N82XeV0JFKtS0OjJ0MHmFsfvjGzgEDy4/75XuA
         Zuf77FOdZGeh0ljq7ra/ge7Dhr074RREsJvaRyxkrlu20qu4CqNPmv0SbmjzMfw1uy+m
         xdo3XJyRrEKl/iWosrggQTophkOViZ5UCYlAqP89hXUOQZvcC2wB90xDbsHUX83jGpOl
         A6oeq/4yccbRuWTaSesezwWyeOgjd3oOC1OhGStC38EXCONuJDfLI1TVY3sjB8YUAzki
         Z80Q==
X-Gm-Message-State: AOJu0YykPAhzoTUvG383PV8w6CMzoGLV2e/gPl387mAfKimyITr8jmC7
	Bfht9sv2iJHTjSS14puh2g7SWg==
X-Google-Smtp-Source: AGHT+IHx6C5QgGDkpUvmqPn3ibZGOUmZso0JRVJ2vFfHbrEIwg1heh3T3L+riph9DHKp1JGfH13MCQ==
X-Received: by 2002:a05:6512:70b:b0:507:9f69:e8d9 with SMTP id b11-20020a056512070b00b005079f69e8d9mr1246130lfs.49.1697719558260;
        Thu, 19 Oct 2023 05:45:58 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id c17-20020ac25f71000000b004ff8e79bc75sm1082610lfc.285.2023.10.19.05.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:45:57 -0700 (PDT)
Date: Thu, 19 Oct 2023 15:45:55 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	Marta Rybczynska <rybczynska@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: support embedded SW
 components with different version number
Message-ID: <ZTElA8Z1bwg4uRwm@nuoska>
References: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
 <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com>
 <ZTDzOs9PFGJUmIRG@nuoska>
 <CANPvuRn1q0a63ZWyYer8LP0htmo7cBwyX6LTv_=ipZFcJq3j9Q@mail.gmail.com>
 <178F819D833CF586.20272@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178F819D833CF586.20272@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189455

Hi,

Could something like this work?

--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -140,15 +140,14 @@ def get_patched_cves(d):
     return patched_cves
 
 
-def get_cpe_ids(cve_product, version):
+def get_cpe_ids(cve_product, cve_version):
     """
     Get list of CPE identifiers for the given product and version
     """
 
-    version = version.split("+git")[0]
-
     cpe_ids = []
     for product in cve_product.split():
+        version = (d.getVar("CVE_VERSION_%s" % product) or cve_version).split("+git")[0]
         # CVE_PRODUCT in recipes may include vendor information for CPE identifiers. If not,
         # use wildcard for vendor.
         if ":" in product:

Cheers,

-Mikko

